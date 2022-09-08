/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Model.Admin;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Admin
 */
public class AdminDAO extends DBContext {

    private HashMap<String, Admin> adminHm;

    public AdminDAO() {
    }

    public Admin getAdmin(String logname, String pass) {
        if (adminHm.get(logname) != null && adminHm.get(logname).getPassword().equals(pass)) {
            return adminHm.get(logname);
        }
        return null;
    }

    public boolean lognameExisted(String logname) {
        return adminHm.get(logname) != null;
    }

    public ArrayList<String> lognameList() {
        ArrayList<String> lnlist = new ArrayList<>();
        for (Map.Entry<String, Admin> en : adminHm.entrySet()) {
            lnlist.add(en.getKey());
        }
        return lnlist;
    }

    public Admin getAdmin(String logname) {
        if (adminHm.get(logname) != null) {
            return adminHm.get(logname);
        }
        return null;
    }

    public void loadAdminList() {
        adminHm = new HashMap<>();
        String sql = "SELECT * FROM [dbo].[Admins_HE163356]\n";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                String ln = rs.getString("logname");
                Admin ad = new Admin(rs.getInt("role_id"),
                        rs.getString("name"),
                        rs.getString("password"),
                        rs.getString("email"),
                        rs.getString("phone"),
                        rs.getString("address"),
                        rs.getBoolean("active")
                );
                adminHm.put(ln, ad);
            }
        } catch (SQLException ex) {

        }

    }

    public HashMap<String, Admin> getAdminHm() {
        return adminHm;
    }

    public void setAdminHm(HashMap<String, Admin> adminHm) {
        this.adminHm = adminHm;
    }

    public int getIdMax() {
        String sql = "SELECT top(1) [id]\n"
                + "  FROM [dbo].[Admins_HE163356]\n"
                + "  order by id desc";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return 0;
    }

    public void Update(String name, String newlogname, String email, String phone, String add, String oldlogname) {
        String pass = adminHm.get(oldlogname).getPassword();
        int role = adminHm.get(oldlogname).getRoleID();
        adminHm.remove(oldlogname);
        adminHm.put(newlogname, new Admin(role, name, pass, email, phone, add, true));

        String sql = "UPDATE [dbo].[Admins_HE163356]\n"
                + "   SET [name] = ?\n"
                + "      ,[email] = ?\n"
                + "      ,[phone] = ?\n"
                + "      ,[address] = ?\n"
                + "      ,[logname] = ?\n"
                + " WHERE [logname] = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, name);
            ps.setString(5, newlogname);
            ps.setString(6, oldlogname);
            ps.setString(2, email);
            ps.setString(3, phone);
            ps.setString(4, add);
            ps.execute();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public void Insert(String name, String logname, String pass, String email, String phone, String add, boolean active) {

        String sql = "INSERT INTO [dbo].[Admins_HE163356]\n"
                + "           ([id]\n"
                + "           ,[name]\n"
                + "           ,[role_id]\n"
                + "           ,[logname]\n"
                + "           ,[password]\n"
                + "           ,[email]\n"
                + "           ,[phone]\n"
                + "           ,[address]\n"
                + "           ,[active])\n"
                + "     VALUES\n"
                + "           (?,?,?,?,?,?,?,?,?)";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, getIdMax() + 1);
            ps.setString(2, name);
            ps.setInt(3, 2);
            ps.setString(4, logname);
            ps.setString(5, pass);
            ps.setString(6, email);
            ps.setString(7, phone);
            ps.setString(8, add);
            ps.setBoolean(9, active);
            ps.execute();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public void setActive(String logname, boolean active) {
        adminHm.get(logname).setActive(active);
        String sql = "UPDATE [dbo].[Admins_HE163356]\n"
                + "   SET [active] = ?\n"
                + " WHERE logname = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setBoolean(1, active);
            ps.setString(2, logname);
            ps.execute();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

}

//class Using {
//
//    public static void main(String[] args) {
//        AdminDAO d = new AdminDAO();
//        d.loadAdminList();
//        for (Map.Entry<String, Admin> entry : d.getAdminHm().entrySet()) {
//            System.out.println(entry.getKey());
//            
//        }
//    }
//}
