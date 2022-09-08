/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Model.Cart;
import Model.Item;
import Model.Order;
import Model.Product;
import Model.Status;
import Model.Transaction;
import Model.User;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.ZoneId;
import java.util.ArrayList;
import java.util.Date;

/**
 *
 * @author Admin
 */
public class TransactionDAO extends DBContext {

    ArrayList<Transaction> transList;
    ArrayList<Status> statusList;

    public TransactionDAO() {
    }

    public ArrayList<Transaction> getTransList() {
        return transList;
    }

    public void setTransList(ArrayList<Transaction> transList) {
        this.transList = transList;
    }

    public ArrayList<Status> getStatusList() {
        return statusList;
    }

    public void setStatusList(ArrayList<Status> statusList) {
        this.statusList = statusList;
    }

    public ArrayList<Transaction> getListTrans(String logname) {
        ArrayList<Transaction> tlist = new ArrayList<>();
        for (Transaction t : transList) {
            if (t.getUserlogname().equals(logname)) {
                tlist.add(t);
            }
        }
        return tlist;
    }

    public Transaction getTransById(int id) {
        for (Transaction t : transList) {
            if (t.getId() == id) {
                return t;
            }
        }
        return null;
    }

    public void loadTransList() {
        transList = new ArrayList<>();
        statusList = new ArrayList<>();
        String sql = "SELECT t.[id]\n"
                + "      ,[total]\n"
                + "      ,[note]\n"
                + "      ,[status]\n"
                + "      ,[created_at]\n"
                + "	  , u.logname\n"
                + "  FROM [dbo].[Transactions_HE163356] t\n"
                + "  left join Users_HE163356 u\n"
                + "  on t.user_id = u.id";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Transaction t = new Transaction(rs.getInt(1),
                        rs.getString(6),
                        rs.getInt(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5)
                );
                transList.add(t);

            }
        } catch (SQLException ex) {

        }
        if (transList != null) {

            for (Transaction t : transList) {
                ArrayList<Order> oList = new ArrayList<>();
                String sql1 = "SELECT [product_id]\n"
                        + "      ,[quantity]\n"
                        + "      ,[price]\n"
                        + "  FROM [dbo].[Orders_HE163356]\n"
                        + "  where [transaction_id] = ?";
                try {
                    PreparedStatement stm = connection.prepareStatement(sql1);
                    stm.setInt(1, t.getId());
                    ResultSet rs = stm.executeQuery();
                    while (rs.next()) {
                        Order o = new Order(t.getId(),
                                rs.getInt("product_id"),
                                rs.getInt("quantity"),
                                rs.getInt("price")
                        );
                        oList.add(o);

                    }
                    t.setoList(oList);
                } catch (SQLException ex) {

                }
            }

            String sql2 = "SELECT [id]\n"
                    + "      ,[name]\n"
                    + "  FROM [dbo].[Status_HE163356]";
            try {
                PreparedStatement stm = connection.prepareStatement(sql2);
                ResultSet rs = stm.executeQuery();
                while (rs.next()) {
                    Status st = new Status(rs.getString(1), rs.getString(2));
                    statusList.add(st);
                }
            } catch (SQLException ex) {

            }
        }
    }

    public int getMaxId() {
        if (transList != null) {
            return transList.get(transList.size() - 1).getId() + 1;
        }
        return 1;
    }

    public int getUserId(String logname) {
        String sql = "SELECT [id]\n"
                + "  FROM [dbo].[Users_HE163356]\n"
                + "  where logname = ?";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, logname);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }

        } catch (SQLException ex) {

        }
        return 0;
    }

    public void addTransaction(String logname, User u, Cart cart, String note) {
        LocalDate curDate = LocalDate.now();
        String date = curDate.toString();

        try {
            //add vao bang transaction
            String sql = "INSERT INTO [dbo].[Transactions_HE163356]\n"
                    + "           ([id]\n"
                    + "           ,[user_id]\n"
                    + "           ,[total]\n"
                    + "           ,[note]\n"
                    + "           ,[address]\n"
                    + "           ,[phone]\n"
                    + "           ,[status]\n"
                    + "           ,[created_at])\n"
                    + "     VALUES (?,?,?,?,?,?,?,?)";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, getMaxId());
            stm.setInt(2, getUserId(logname));
            stm.setInt(3, cart.getTotalMoney());
            stm.setString(4, note);
            stm.setString(5, u.getAddress());
            stm.setString(6, u.getPhone());
            stm.setString(7, "st1");
            stm.setString(8, date);
            stm.executeUpdate();

            //them du lieu vao bang order
            String sql2 = "INSERT INTO [dbo].[Orders_HE163356]\n"
                    + "           ([transaction_id]\n"
                    + "           ,[product_id]\n"
                    + "           ,[quantity]\n"
                    + "           ,[price])\n"
                    + "     VALUES\n"
                    + "           (?,?,?,?)";
            PreparedStatement stm2 = connection.prepareStatement(sql2);
            for (Item i : cart.getItems()) {
                stm2.setInt(1, getMaxId());
                stm2.setInt(2, i.getProduct().getId());
                stm2.setInt(3, i.getQuantity());
                stm2.setInt(4, i.getPrice());
                stm2.executeUpdate();
            }

            //cap nhat so luong san pham
            String sql3 = "UPDATE [dbo].[Products_HE163356]\n"
                    + "   SET [quantity] = ?\n"
                    + "      ,[buy] = ?\n"
                    + " WHERE id = ?";
            PreparedStatement stm3 = connection.prepareStatement(sql3);
            for (Item i : cart.getItems()) {
                stm3.setInt(1, i.getProduct().getQuantity() - i.getQuantity());
                stm3.setInt(3, i.getProduct().getId());
                stm3.setInt(2, i.getProduct().getBuy() + i.getQuantity());
                stm3.executeUpdate();
            }
        } catch (Exception e) {
        }
    }

    public void updateStatus(int id, String status) {
        for (Transaction t : transList) {
            if (t.getId() == id) {
                t.setStatus(status);
                break;
            }
        }

        LocalDate curDate = LocalDate.now();
        String date = curDate.toString();
        String sql = "UPDATE [dbo].[Transactions_HE163356]\n"
                + "   SET [status] = ?\n"
                + "      ,[update_at] = ?\n"
                + " WHERE id = ?";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, status);
            stm.setString(2, date);
            stm.setInt(3, id);
            ResultSet rs = stm.executeQuery();
        } catch (SQLException ex) {

        }
    }

    public int getTotalTran() {
        return transList.size();
    }

    public int getTotalTran(String statusID) {
        int count = 0;
        for (Transaction t : transList) {
            if (t.getStatus().equals(statusID)) {
                count++;
            }
        }
        return count;
    }
    
    public int getPercentTran(String statusID){
        return getTotalTran(statusID) * 100 / getTotalTran();
    }

    public int getTotal() {
        int total = 0;
        for (Transaction t : transList) {
            total += t.getTotal();
        }
        return total;
    }

    public int getTotalEntry(ProductDAO pdb) {
        int total = 0;
        for (Transaction t : transList) {
            total += t.getEntryOfTran(pdb);
        }
        return total;
    }
    
    public int totalMonthlyIncome() {
        Date date = new Date();
        LocalDate localDate = date.toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
        int month = localDate.getMonthValue();
        return geTotalMonthlyIncome(month);
    }
    

    public int geTotalMonthlyIncome(int month) {
        int total = 0;
        for (Transaction t : transList) {
            String[] s = t.getCreatAt().split("-");
            int m = Integer.parseInt(s[1]);
            if (m == month) {
                total += t.getTotal();
            }
        }
        return total;
    }

    public ArrayList<Integer> geTotalMonthlyIncome() {
        ArrayList<Integer> list = new ArrayList<>();
        for (int i = 1; i <= 12; i++) {
            list.add(geTotalMonthlyIncome(i));
        }
        return list;
    }

    public int getTotalPerDay(int day, int month) {
        int total = 0;
        for (Transaction t : transList) {
            String[] s = t.getCreatAt().split("-");
            int d = Integer.parseInt(s[2].substring(0, 2));
            int m = Integer.parseInt(s[1]);
            if (d == day && m == month) {
                total += t.getTotal();
            }
        }
        return total;
    }

    public ArrayList<Integer> getTotalDailyIncome() {
        Date date = new Date();
        LocalDate localDate = date.toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
        int month = localDate.getMonthValue();
        int day = localDate.getDayOfMonth();
        ArrayList<Integer> list = new ArrayList<>();
        for (int i = 1; i <= day; i++) {
            list.add(getTotalPerDay(i, month));
        }
        return list;
    }

}
