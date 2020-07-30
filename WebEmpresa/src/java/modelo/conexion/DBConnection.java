/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo.conexion;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author Eliseo
 */
public class DBConnection {

    public static Connection createConnection() {
        Connection con = null;
        String url = "jdbc:oracle:thin:@localhost:1521:orcl";
        String username = "TEST1";
        String password = "123";

        try {
            try {
                Class.forName("oracle.jdbc.OracleDriver");
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            }
            con = DriverManager.getConnection(url, username, password);
            System.out.println("Post establishing a DB connection - " + con);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return con;
    }
}
