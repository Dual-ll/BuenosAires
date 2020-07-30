/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author Eliseo
 */
public class CL_Conexion {

    Connection conn = null;

    public CL_Conexion() {

        abrirConexion();
    }

    private void abrirConexion() {
        try {
            Class.forName("oracle.jdbc.OracleDriver");
            conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl", "TEST1", "123");
            if (conn != null) {
                System.out.println("Conexion exitosa a base de datos");
            }

        } catch (SQLException | ClassNotFoundException ex) {
            System.out.println("Error en la conexión de la base de datos");
        }
    }

    public Connection obtenerConexion() {
        return conn;
    }

}
