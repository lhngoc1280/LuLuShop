/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Model.Category;
import Model.Order;
import Model.Product;
import java.sql.PreparedStatement;
import java.util.ArrayList;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Collections;

/**
 *
 * @author Admin
 */
public class ProductDAO extends DBContext {

    private ArrayList<Product> pList;

    public ProductDAO() {
    }

    public ArrayList<Product> getpList() {

        return pList;
    }

    public void setpList(ArrayList<Product> pList) {
        this.pList = pList;
    }

    public Product getProduct(int id) {
        for (Product p : pList) {
            if (p.getId() == id) {
                return p;
            }
        }
        return null;
    }

    public Product getProduct(String pid) {
        if (pid == null) {
            return null;
        }
        int id = Integer.parseInt(pid);
        for (Product p : pList) {
            if (p.getId() == id) {
                return p;
            }
        }
        return null;
    }

    public ArrayList<Product> getProductByCate(String cid) {
        if (cid == null) {
            return pList;
        }
        int id = Integer.parseInt(cid);
        ArrayList<Product> list = new ArrayList<>();
        for (Product p : pList) {
            if (p.getCateId() == id) {
                list.add(p);
            }
        }
        return list;
    }

    public ArrayList<Product> getProductByCate(String cid, Object catelist) {
        if (cid == null) {
            return pList;
        }
        ArrayList<Category> clist = (ArrayList<Category>) catelist;
        int id = Integer.parseInt(cid);
        ArrayList<Product> productlist = new ArrayList<>();
        ArrayList<Category> chilCate = new ArrayList<>();
        for (Category cate : clist) {
            if (cate.getParent_id() == id) {
                chilCate.add(cate);
            }
        }
        if (!chilCate.isEmpty()) {
            for (Category c : chilCate) {
                for (Product p : pList) {
                    if (p.getCateId() == c.getId()) {
                        productlist.add(p);
                    }
                }
            }
        } else {
            for (Product p : pList) {

                if (p.getCateId() == id) {
                    productlist.add(p);
                }
            }
        }
        return productlist;
    }

    public ArrayList<Product> sortByPrice(ArrayList<Product> list) {
        for (int i = 0; i < list.size() - 1; i++) {
            for (int j = i + 1; j < list.size(); j++) {
                int p1 = list.get(i).getPrice() * (1 - list.get(i).getDiscount() / 100);
                int p2 = list.get(j).getPrice() * (1 - list.get(j).getDiscount() / 100);
                if (p1 > p2) {
                    Collections.swap(list, i, j);
                }
            }
        }
        return list;
    }

    public ArrayList<Product> sortByDiscount(ArrayList<Product> list) {
        for (int i = 0; i < list.size() - 1; i++) {
            for (int j = i + 1; j < list.size(); j++) {
                if (list.get(i).getDiscount() > list.get(j).getDiscount()) {
                    Collections.swap(list, i, j);
                }
            }
        }
        return list;
    }

    public ArrayList<Product> sortByName(ArrayList<Product> list) {
        for (int i = 0; i < list.size() - 1; i++) {
            for (int j = i + 1; j < list.size(); j++) {
                if (list.get(i).getName().compareTo(list.get(j).getName()) < 0) {
                    Collections.swap(list, i, j);
                }
            }
        }
        return list;
    }

    public ArrayList<Product> getProductBySearch(String keyword) {
        if (keyword == null) {
            return null;
        }
        ArrayList<Product> list = new ArrayList<>();
        String sql = "SELECT *"
                + "  FROM [dbo].[Products_HE163356]\n"
                + "  where name like N'%" + keyword + "%'";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Product p = new Product(
                        rs.getInt("id"),
                        rs.getString("name"),
                        rs.getInt("cate_id"),
                        rs.getInt("entry_price"),
                        rs.getInt("price"),
                        rs.getInt("quantity"),
                        rs.getInt("discount"),
                        rs.getString("description"),
                        rs.getBoolean("active"),
                        rs.getInt("buy")
                );
                list.add(p);

            }
        } catch (SQLException ex) {

        }
        return list;
    }

    public void loadProductList() {
        pList = new ArrayList<>();
        String sql = "SELECT *  FROM [dbo].[Products_HE163356]\n";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Product p = new Product(
                        rs.getInt("id"),
                        rs.getString("name"),
                        rs.getInt("cate_id"),
                        rs.getInt("entry_price"),
                        rs.getInt("price"),
                        rs.getInt("quantity"),
                        rs.getInt("discount"),
                        rs.getString("description"),
                        rs.getBoolean("active"),
                        rs.getInt("buy")
                );
                pList.add(p);

            }
        } catch (SQLException ex) {

        }
    }

    public void Insert(String name, int cateId, int eprice, int price, int quantity, int discount, String description, boolean active, int buy) {
        String sql = "INSERT INTO [dbo].[Products_HE163356]\n"
                + "           ([id]\n"
                + "           ,[name]\n"
                + "           ,[cate_id]\n"
                + "           ,[price]\n"
                + "           ,[entry_price]\n"
                + "           ,[quantity]\n"
                + "           ,[discount]\n"
                + "           ,[description]\n"
                + "           ,[active]\n"
                + "           ,[buy])\n"
                + "     VALUES\n"
                + "           (?,?,?,?,?,?,?,?,?,?)";
        try {
            int id = pList == null ? 1 : pList.size() + 1;
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ps.setString(2, name);
            ps.setInt(3, cateId);
            ps.setInt(4, price);
            ps.setInt(5, eprice);
            ps.setInt(6, quantity);
            ps.setInt(7, discount);
            ps.setString(8, description);
            ps.setBoolean(9, active);
            ps.setInt(10, buy);
            ps.execute();
            pList.add(new Product(id, name, cateId, eprice, price, quantity, discount, description, active, buy));
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public void Update(int id, String name, int cateId, int eprice, int price, int quantity, int discount, String description) {
        for (Product p : pList) {
            if (p.getId() == id) {
                p.setName(name);
                p.setCateId(cateId);
                p.setEprice(eprice);
                p.setPrice(price);
                p.setQuantity(quantity);
                p.setDiscount(discount);
                p.setDescription(description);
                break;
            }
        }

        String sql = "UPDATE [dbo].[Products_HE163356]\n"
                + "   SET [name] = ?\n"
                + "      ,[cate_id] = ?\n"
                + "      ,[price] = ?\n"
                + "      ,[entry_price] = ?\n"
                + "      ,[quantity] = ?\n"
                + "      ,[discount] = ?\n"
                + "      ,[description] = ?\n"
                + " WHERE [id] = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, name);
            ps.setInt(2, cateId);
            ps.setInt(3, price);
            ps.setInt(4, eprice);
            ps.setInt(5, quantity);
            ps.setInt(6, discount);
            ps.setString(7, description);
            ps.setInt(8, id);
            ps.execute();

        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public void Delete(int id) {
        String sql = "DELETE FROM [dbo].[Products_HE163356]\n"
                + "      WHERE id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ps.execute();
            pList.remove(pList.get(id));
        } catch (Exception e) {
            System.out.println(e);
        }
    }

}

//class Using {
//
//    public static void main(String[] args) {
//        ProductDAO d = new ProductDAO();
//        d.loadProductList();
//        ArrayList<Product> list = d.sortByPrice(1);
//        for(Product p : list){
//            System.out.println(p.getName());
//        }
//    }
//}
