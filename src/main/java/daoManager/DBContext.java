/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package daoManager;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBContext {

    protected Connection connection;

    public DBContext() {
        try {
            String url = "jdbc:sqlserver://DESKTOP-1H6OFHP:1433;databaseName=swpgr6;encrypt=false;trustServerCertificate=true;";
            String username = "sa";
            String password = "123456";
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            connection = DriverManager.getConnection(url, username, password);
            System.out.println("ok");
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println(e);
        }

    }
    
    public static void main(String[] args) {
        DBContext c = new DBContext();
    }
}
