/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import java.sql.Connection;
import java.sql.DriverManager;
import javax.swing.JOptionPane;

/**
 *
 * @author duoc
 */
public class Conexion {
    
    
    private Connection conn;

    public Conexion() {
    }

    public Connection getConn() {
        return conn;
    }

    public void setConn(Connection conn) {
        this.conn = conn;
    }
    
    //customer que genera la conexion
    
    public void conectar()
    {
        try
        {
            Class.forName("oracle.jdbc.OracleDriver");
            conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl", "TEST1", "123");
            System.out.println("Conexion exitosa.");
            if(conn==null)
            {
                JOptionPane.showMessageDialog(null,"Conexion a la base de datos fallida.");
            }
        }
        catch(Exception ex)
        {
            JOptionPane.showMessageDialog(null,"Error en la base de datos: " + ex.getMessage());
        }
    }
    
    public void desconectar()
    {
        try
        {
            getConn().close();
            System.out.println("Desconexion exitosa.");
        }
        catch(Exception ex)
        {
            JOptionPane.showMessageDialog(null,"Error al cerrar la conexion a la base de datos." + ex.getMessage());
        }
    }    
    
}
