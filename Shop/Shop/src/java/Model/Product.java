/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author Admin
 */
public class Product {
    private int id;
    private String name ;
    private int cateId, eprice, price, quantity, discount;
    private String description ;
    private boolean active;
    private int buy;

    public Product() {
    }

    public Product(int id, String name, int cateId, int eprice, int price, int quantity, int discount, String description, boolean active, int buy) {
        this.id = id;
        this.name = name;
        this.cateId = cateId;
        this.eprice = eprice;
        this.price = price;
        this.quantity = quantity;
        this.discount = discount;
        this.description = description;
        this.active = active;
        this.buy = buy;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getCateId() {
        return cateId;
    }

    public void setCateId(int cateId) {
        this.cateId = cateId;
    }

    public int getEprice() {
        return eprice;
    }

    public void setEprice(int eprice) {
        this.eprice = eprice;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getDiscount() {
        return discount;
    }

    public void setDiscount(int discount) {
        this.discount = discount;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public boolean isActive() {
        return active;
    }

    public void setActive(boolean active) {
        this.active = active;
    }

    public int getBuy() {
        return buy;
    }

    public void setBuy(int buy) {
        this.buy = buy;
    }
    
    public String getTitle(){
        if (name.length()>=44){
                    return name.substring(0, 44);

        } else {
            return name;
        }
    }
    
}
