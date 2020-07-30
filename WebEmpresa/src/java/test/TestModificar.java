/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package test;

import java.sql.SQLException;
import modelo.DAO.EmpleadoDAO;
import modelo.entidades.Empleado;

/**
 *
 * @author PavelNicola
 */
public class TestModificar {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) throws SQLException {
        EmpleadoDAO eDAO = new EmpleadoDAO();
        Empleado emp = new Empleado("5512", "Chimuelax", "Campos2x", 69);
        
        if(eDAO.modificarEmpleado(emp)){
            System.out.println("EMPLEADO Modificado");
        } else {
            System.out.println("EMPLEADO NO Modificado");
        }
        
    }
    
}
