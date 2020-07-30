/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package test;

import java.sql.SQLException;
import java.util.List;
import modelo.DAO.EmpleadoDAO;
import modelo.entidades.Empleado;

/**
 *
 * @author PavelNicola
 */
public class TestListar {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) throws SQLException {
        EmpleadoDAO eDAO = new EmpleadoDAO();
        
        List<Empleado> lista = eDAO.listarEmpleado();
        
        for (Empleado empleado : lista) {
            System.out.println(empleado.toString());
        }
        
        
    }
    
}
