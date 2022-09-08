/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package newpackage;

import java.util.HashMap;

/**
 *
 * @author Admin
 */
public class Url {

    private HashMap<String, Boolean> unknownUrl;
    private HashMap<String, Boolean> userUrl;
    private HashMap<String, Boolean> adminUrl;
    private boolean check;

    public Url() {
    }

    public Url(HashMap<String, Boolean> unknownUrl, HashMap<String, Boolean> userUrl, HashMap<String, Boolean> adminUrl, boolean check) {
        this.unknownUrl = unknownUrl;
        this.userUrl = userUrl;
        this.adminUrl = adminUrl;
        this.check = check;
    }

    public HashMap<String, Boolean> getUnknownUrl() {
        return unknownUrl;
    }

    public void setUnknownUrl(HashMap<String, Boolean> unknownUrl) {
        this.unknownUrl = unknownUrl;
    }

    public HashMap<String, Boolean> getUserUrl() {
        return userUrl;
    }

    public void setUserUrl(HashMap<String, Boolean> userUrl) {
        this.userUrl = userUrl;
    }

    public HashMap<String, Boolean> getAdminUrl() {
        return adminUrl;
    }

    public void setAdminUrl(HashMap<String, Boolean> adminUrl) {
        this.adminUrl = adminUrl;
    }

    public boolean isCheck() {
        return check;
    }

    public void setCheck(boolean check) {
        this.check = check;
    }

    public void loadUrl() {
        unknownUrl.put("home.jsp", true);
        unknownUrl.put("category.jsp", true);
        unknownUrl.put("search.jsp", true);
        unknownUrl.put("contact.jsp", true);
        unknownUrl.put("cart.jsp", true);
        unknownUrl.put("cart", true);
        unknownUrl.put("changecart", true);
        unknownUrl.put("transactionCheck.jsp", true);
        unknownUrl.put("home.jsp", true);

    }

}
