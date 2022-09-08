/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Model.Category;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author Admin
 */
public class CateDAO extends DBContext{
    private ArrayList<Category> cateList;

    public CateDAO() {
    }

    public ArrayList<Category> getCateList() {
        loadCateList();
        return cateList;
    }

    public void setCateList(ArrayList<Category> cateList) {
        this.cateList = cateList;
    }
    
    public String getCateName(int id){
        for (Category c : cateList){
            if (c.getId()==id){
                return c.getName();
            }
        }
        return null;
    }
    
    public String getCateName(String id_raw){
        int id = Integer.parseInt(id_raw);
        for (Category c : cateList){
            if (c.getId()==id){
                return c.getName();
            }
        }
        return null;
    }

    public void loadCateList(){
        cateList = new ArrayList<>();
        String sql = "SELECT * FROM [dbo].[Categories_HE163356]\n";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Category s = new Category(rs.getInt("id"), rs.getString("name"), rs.getInt("parent_id"));
                cateList.add(s);
                
            }
        } catch (SQLException ex) {

        }
        
    }
    
    public ArrayList getChildCate(int parent_id){
        ArrayList<Category> childList = new ArrayList<>();
        String sql = "SELECT * FROM [dbo].[Categories_HE163356]\n"
                + "where parent_id=?";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, parent_id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Category s = new Category(rs.getInt("id"), rs.getString("name"), rs.getInt("parent_id"));
                childList.add(s);
                
            }
        } catch (Exception e) {
        }
        return childList;
    }    
    
    
}
//class Using {
//
//    public static void main(String[] args) {
//        CateDAO d = new CateDAO();
//        d.loadCateList();
//        for (Category c : d.getCateList()) {
//            System.out.println(c.getParent_id());
//        }
//    }
//}