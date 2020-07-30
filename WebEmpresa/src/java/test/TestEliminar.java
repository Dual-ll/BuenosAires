package test;

import java.sql.SQLException;
import modelo.DAO.EmpleadoDAO;
import modelo.entidades.Empleado;

/**
 *
 * @author PavelNicola
 */
public class TestEliminar {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) throws SQLException {
        EmpleadoDAO eDAO = new EmpleadoDAO();
        Empleado emp = new Empleado("5512", "Chimuelo", "Campos", 45);
        
        if(eDAO.eliminarEmpleado("5512")){
            System.out.println("EMPLEADO ELIMINADO");
        } else {
            System.out.println("EMPLEADO NO ELIMINADO");
        }
        
    }
    
}
