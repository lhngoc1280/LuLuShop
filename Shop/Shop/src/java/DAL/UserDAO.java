/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Model.User;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author Admin
 */
public class UserDAO extends DBContext {

    private static HashMap<String, User> userHm = null;

    public User getUser(String logname, String pass) {
        if (userHm.get(logname) != null && userHm.get(logname).getPassword().equals(pass)) {
            return userHm.get(logname);
        }
        return null;
        
    }

    public User getUser(String logname) {
        if (userHm.get(logname) != null) {
            return userHm.get(logname);
        }
        return null;
    }

    public boolean lognameExist(String logname) {
        if (userHm == null) {
            return false;
        }
        return userHm.get(logname) != null;
    }

    public String getLogname(User u) {
        for (Map.Entry<String, User> entry : userHm.entrySet()) {
            if (entry.getValue().equals(u)) {
                return entry.getKey();
            }

        }
        return null;
    }

    public void loadUserList() {
        userHm = new HashMap<>();
        String sql = "SELECT *  FROM [dbo].[Users_HE163356]\n";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                User u = new User(
                        rs.getString("name"),
                        rs.getString("password"),
                        rs.getString("email"),
                        rs.getString("phone"),
                        rs.getString("address"),
                        rs.getBoolean("active")
                );
                userHm.put(rs.getString("logname"), u);

            }
        } catch (SQLException ex) {

        }
    }

    public void setActiveUser(String logname, boolean active) {
        userHm.get(logname).setActive(active);
        String sql = "UPDATE [dbo].[Users_HE163356]\n"
                + "   SET [active] = ?\n"
                + " WHERE [logname] = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setBoolean(1, active);
            ps.setString(2, logname);
            ps.execute();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public void setNewPass(String newpass, String logname) {
        userHm.get(logname).setPassword(newpass);
        String sql = "UPDATE [dbo].[Users_HE163356]\n"
                + "   SET [password] = ?\n"
                + " WHERE [logname]=?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, newpass);
            ps.setString(2, logname);
            ps.execute();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public HashMap<String, User> getUserHm() {
        return userHm;
    }

    public void setUserHm(HashMap<String, User> userHm) {
        this.userHm = userHm;
    }

    public int getIdMax() {
        String sql = "SELECT top(1) [id]\n"
                + "  FROM [dbo].[Users_HE163356]\n"
                + "  order by id desc";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            if (rs.next()){
                return rs.getInt(1);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return 0;
    }

    public void Insert(String name, String logname, String password, String email, String phone, String add, boolean active) {
        int id = getIdMax()+1;
        String sql = "INSERT INTO [dbo].[Users_HE163356]\n"
                + "           ([id]\n"
                + "           ,[name]\n"
                + "           ,[logname]\n"
                + "           ,[password]\n"
                + "           ,[email]\n"
                + "           ,[phone]\n"
                + "           ,[address]\n"
                + "           ,[active]\n"
                + "           )\n"
                + "     VALUES\n"
                + "           (?,?,?,?,?,?,?,?)";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ps.setString(2, name);
            ps.setString(3, logname);
            ps.setString(4, password);
            ps.setString(5, email);
            ps.setString(6, phone);
            ps.setString(7, add);
            ps.setBoolean(8, active);
            ps.execute();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public void Update(String name, String newlogname, String email, String phone, String add, String oldlogname) {
        String pass = userHm.get(oldlogname).getPassword();
        userHm.remove(oldlogname);
        userHm.put(newlogname, new User(name, pass, email, phone, add, true));

        String sql = "UPDATE [dbo].[Users_HE163356]\n"
                + "   SET [name] = ?\n"
                + "      ,[email] = ?\n"
                + "      ,[phone] = ?\n"
                + "      ,[address] = ?\n"
                + "      ,[logname] = ?\n"
                + " WHERE [logname] = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, name);
            ps.setString(6, oldlogname);
            ps.setString(2, email);
            ps.setString(3, phone);
            ps.setString(4, add);
            ps.setString(5, newlogname);
            ps.execute();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public void Delete(String logname) {
        userHm.remove(logname);
        String sql = "DELETE FROM [dbo].[Users_HE163356]\n"
                + "      WHERE logname = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, logname);
            ps.execute();
        } catch (Exception e) {
            System.out.println(e);
        }
    }
    
    public ArrayList<String> lognameList(){
        ArrayList<String> lnlist = new ArrayList<>();
        for (Map.Entry<String, User> en : userHm.entrySet()) {
                lnlist.add(en.getKey());
        }
        return lnlist;
    }


}

//class Using {
//
//    public static void main(String[] args) {
//        UserDAO d = new UserDAO();
//        d.loadUserList();
//        if (d.getUserHm() == null) {
//            System.out.println("null");
//        } else {
//            for (Map.Entry<String, User> en : d.getUserHm().entrySet()) {
//                System.out.println(en.getKey());
//                System.out.println(en.getValue());
//
//            }
//        }
//    }
//}
