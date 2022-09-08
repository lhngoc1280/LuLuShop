/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author Admin
 */
public class AddressDAO extends DBContext {

    public ArrayList<String> getProvinceList() {
        ArrayList<String> pList = new ArrayList<>();
        String sql = "SELECT distinct [Tinh]\n"
                + "  FROM [dbo].[Address_HE163356]\n"
                + "  order by [Tinh]";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                pList.add(rs.getString(1));
            }
        } catch (SQLException ex) {

        }
        return pList;
    }

    public ArrayList<String> getDistrictList(String pname) {
        ArrayList<String> dList = new ArrayList<>();
        String sql = "SELECT distinct\n"
                + "      [Huyen]\n"
                + "  FROM [dbo].[Address_HE163356]\n"
                + "  where [Tinh] = ?";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, pname);
            ResultSet rs = stm.executeQuery();

            while (rs.next()) {
                dList.add(rs.getString(1));
//                System.out.println(rs.getString(1));
            }
        } catch (SQLException ex) {

        }
        return dList;
    }

    public ArrayList<String> getWardList(String pname, String dname) {
        ArrayList<String> wList = new ArrayList<>();
        String sql = "SELECT distinct\n"
                + "      [Xa]\n"
                + "  FROM [dbo].[Address_HE163356]\n"
                + "  where [Tinh] =? and [Huyen] = ?";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, pname);
            stm.setString(2, dname);
            ResultSet rs = stm.executeQuery();

            while (rs.next()) {
//                System.out.println(rs.getString(1));
                wList.add(rs.getString(1));
            }
        } catch (SQLException ex) {

        }
        return wList;
    }

}
