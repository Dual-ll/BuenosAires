/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Controlador.Conexion;
import Modelo.Usuario;
import java.sql.PreparedStatement;

/**
 *
 * @author Brayan
 */
public class DAOusuario {
    private Conexion conectar;
            String mensaje;

    public DAOusuario() {
        conectar = new Conexion();
    }

    public Conexion getConectar() {
        return conectar;
    }

    public void setConectar(Conexion conectar) {
        this.conectar = conectar;
    }
    
    public String ingresarUsuario(Usuario us)
    {
        try
        {
            conectar.conectar();
            PreparedStatement ps=conectar.getConn().prepareStatement(
                    "INSERT INTO USUARIO(NOMBRE_USUARIO, CONTRASENA, TIPO) VALUES(?,?,?)");
            ps.setString(1, us.getNombre_usuario());
            ps.setString(2, us.getContrasena());
            ps.setString(3, us.getTipo_usuario());
            
           
            
            int resultado=ps.executeUpdate();
                
                if(resultado>0)
                {
                    mensaje="Cuenta creada correctamente.";
                    conectar.desconectar();
                } 
            }
        
        catch(Exception ex)
        {
            mensaje="Problemas al guardar el registro. "+ ex.getMessage();
        }
        
        return mensaje;
    }

            
}
