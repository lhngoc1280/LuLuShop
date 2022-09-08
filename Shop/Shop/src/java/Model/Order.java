/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import DAL.ProductDAO;

/**
 *
 * @author Admin
 */
public class Order {
    private int tid;
    private int pid;
    private int quantity;
    private int price;

    public Order() {
    }

    public Order(int tid, int pid, int quantity, int price) {
        this.tid = tid;
        this.pid = pid;
        this.quantity = quantity;
        this.price = price;
    }

    public int getTid() {
        return tid;
    }

    public void setTid(int tid) {
        this.tid = tid;
    }

    public int getPid() {
        return pid;
    }

    public void setPid(int pid) {
        this.pid = pid;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }
    
    public Product getProduct(ProductDAO pdb){
        return pdb.getProduct(pid);
    }
    
    
}
