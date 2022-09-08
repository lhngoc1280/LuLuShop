/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Admin
 */
public class Cart {

    private ArrayList<Item> items;
    private String logname;

    public Cart() {
        items = new ArrayList<>();
    }

    public Cart(ArrayList<Item> items, String logname) {
        this.items = items;
        this.logname = logname;
    }

    

    public ArrayList<Item> getItems() {
        return items;
    }

    public void setItems(ArrayList<Item> items) {
        this.items = items;
    }

    public int getQuantityById(int id) {
        return getItemById(id).getQuantity();
    }

    public Item getItemById(int id) {
        for (Item i : items) {
            if (i.getProduct().getId() == id) {
                return i;
            }
        }
        return null;
    }

    public void addItem(Item t) {
        if (getItemById(t.getProduct().getId()) != null) {
            Item m = getItemById(t.getProduct().getId());
            m.setQuantity(m.getQuantity() + t.getQuantity());
        } else {
            items.add(t);
        }
    }

    public void removeItem(int id) {
        if (getItemById(id) != null) {
            items.remove(getItemById(id));
        }
    }

    public int getTotalMoney() {
        int t = 0;
        for (Item i : items) {
            t += (i.getQuantity() * (i.getPrice()*(1- i.getProduct().getDiscount()/100)));
        }
        return t;
    }

    public Product getProductById(int id, List<Product> list) {
        for (Product p : list) {
            if (p.getId() == id) {
                return p;
            }
        }
        return null;
    }

    public Cart(String logname, String txt, List<Product> list) {
        items = new ArrayList<>();
        try {
            if (txt != null && txt.length() != 0) {
                String[] s = txt.split("\\|");
                for (String i : s) {
                    String[] n = i.split("-");
                    int id = Integer.parseInt(n[0]);
                    int quantity = Integer.parseInt(n[1]);
                    Product p = getProductById(id, list);
                    Item t = new Item(p, quantity, p.getPrice());
                    addItem(t);
                }
            }
        } catch (Exception e) {
        }
    }

    public String getLogname() {
        return logname;
    }

    public void setLogname(String logname) {
        this.logname = logname;
    }

    @Override
    public String toString() {
        String s = "";
        for (Item i : items){
            s= s+ i.getProduct().getId() +"-"+i.getQuantity()+"|";
        }
        s = s.substring(0, s.length()-1);
        return s;
    }

    
    
}
