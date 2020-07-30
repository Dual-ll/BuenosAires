/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo.conexion;

/**
 *
 * @author PavelNicola
 */
import java.sql.Connection;
import java.sql.DriverManager;

public class Conexion {
    
    private static Connection conexion;
    
    private String usuario = "TEST1";
    private String pass = "123";
    private String url = "jdbc:oracle:thin:"+usuario+"/"+pass+"@localhost:1521:orcl";
    
    public Conexion() {
            
        try {
            
            //cargar la libreria jdbc para oracle
            Class.forName("oracle.jdbc.OracleDriver").newInstance();
            this.conexion = DriverManager.getConnection(url, usuario, pass);
            
        } catch(Exception ex) {
            System.out.println("Error de conexion " + ex.toString());
        }
    }
    

    public Connection obtenerConexion() {
        return conexion;
    }
    
    
}