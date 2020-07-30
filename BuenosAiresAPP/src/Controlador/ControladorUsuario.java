/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import DAO.DAOusuario;
import Modelo.Usuario;

/**
 *
 * @author Brayan
 */
public class ControladorUsuario {
    private Usuario nuevoUsuario;
    private DAO.DAOusuario DAOus;

    public ControladorUsuario() {
        nuevoUsuario = new Usuario();
        DAOus = new DAOusuario();
    }
    
    public String agregarUsuario(String nombre_usuario, String contrasena, String tipo_usuario) throws Exception
    {
        nuevoUsuario = new Usuario(nombre_usuario, contrasena, tipo_usuario);
        String mensaje=DAOus.ingresarUsuario(nuevoUsuario);
        return mensaje;
    }
    

    
}
