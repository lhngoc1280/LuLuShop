/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package newpackage;

import DAL.AddressDAO;
import DAL.AdminDAO;
import DAL.ProductDAO;
import DAL.TransactionDAO;
import DAL.UserDAO;
import Model.Admin;
import Model.Order;
import Model.Product;
import Model.Transaction;
import Model.User;
import java.util.ArrayList;
import java.util.Map;

/**
 *
 * @author Admin
 */
public class Using {
    
    public static void main(String[] args) {
        TransactionDAO trandb = new TransactionDAO();
        trandb.loadTransList();

//        System.out.println(trandb.getTransList().size());
//        for(Integer p : trandb.geTotalMonthlyIncome()){
//            System.out.println(p);
//        }
//        ArrayList<Integer> list = trandb.getTotalDailyIncome();
//        String list_raw = "";
//        for (Integer i : list){
//            list_raw = list_raw + i + "-";
//        }
//        list_raw = list_raw.substring(0, list_raw.length()-1);

//        System.out.println(list_raw);
//        for (int i = 1; i<=31; i++){
//            System.out.print(i+ ", ");
//        }
        System.out.println(trandb.getPercentTran("st1"));

//        AdminDAO udb = new AdminDAO();
//        udb.loadAdminList();
//        for (Map.Entry<String, Admin> en : udb.getAdminHm().entrySet()) {
//            System.out.println(en.getKey());
//            System.out.println(en.getValue());
//        }
//        AddressDAO d = new AddressDAO();
//        d.getWardList("Tỉnh Bắc Giang", "Huyện Lục Ngạn");
//        ArrayList<String> p = d.getDistrictList("Thành phố Hà Nội");
//        for (String s : p){
//            System.out.println(s);
//        }
//        for (String x : p) {
//            System.out.println(p);
////        }
    }
}
