/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAL;

import java.sql.Connection;
import java.sql.Driver;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Sap-lap
 */
public class DBContext {
    protected Connection connection;
    
    public DBContext()
    {
        try {
            String user = "sa";
            String pass = "ngoc1280";
            String url = "jdbc:sqlserver://localhost:1280;databaseName=PRJ301_SE1625";
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            connection = DriverManager.getConnection(url, user, pass);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
     public static void main(String[] args) {
        try {
            DBContext dBContext = new DBContext();
            if (dBContext.connection != null) {
                System.out.println("Connect DB successful");
            } else {
                System.out.println("Connect db false");
            }
        } catch (Exception ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    //code here
}
