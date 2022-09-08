/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import DAL.ProductDAO;
import java.util.ArrayList;

/**
 *
 * @author Admin
 */
public class Transaction {
    private int id;
    private String userlogname;
    private int total;
    private String note ;
    private String status ;
    private String creatAt ;
    private ArrayList<Order> oList;

    public Transaction() {
    }

    public Transaction(int id, String userlogname, int total, String note, String status, String creatAt) {
        this.id = id;
        this.userlogname = userlogname;
        this.total = total;
        this.note = note;
        this.status = status;
        this.creatAt = creatAt;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUserlogname() {
        return userlogname;
    }

    public void setUserlogname(String userlogname) {
        this.userlogname = userlogname;
    }

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public String getStatus(ArrayList<Status> slist) {
        for (Status s : slist){
            if (s.getId().equals(status)){
                return s.getName();
            }
        }
        return null;
    }
    
    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getCreatAt() {
        return creatAt;
    }

    public void setCreatAt(String creatAt) {
        this.creatAt = creatAt;
    }

    public ArrayList<Order> getoList() {
        return oList;
    }

    public void setoList(ArrayList<Order> oList) {
        this.oList = oList;
    }
    
     public ArrayList<Product> getListProductOrder(ProductDAO pdb) {
         ArrayList<Product> plist = new ArrayList<>();
        for (Order o : oList){
            plist.add(pdb.getProduct(o.getPid()));
        }
        return plist;
    }
     
    public int getEntryOfTran(ProductDAO pdb){
        int total = 0;
        for (Order o : oList){
            total += o.getProduct(pdb).getEprice() * o.getQuantity();
        }
        return total;
    }
}
