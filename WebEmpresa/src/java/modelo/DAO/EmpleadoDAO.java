/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo.DAO;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import modelo.conexion.Conexion;
import modelo.entidades.Empleado;
import oracle.jdbc.OracleTypes;

/**
 *
 * @author PavelNicola
 */
public class EmpleadoDAO {
    
    private Connection conexion;

    public EmpleadoDAO() {
    }
    
    public List<Empleado> listarEmpleado() throws SQLException{
        List<Empleado> lista = new ArrayList<Empleado>();
        try {
            //paso1: obtener conexion
            this.conexion = new Conexion().obtenerConexion();
            
            //paso2: Crear una llamada
            String llamadaProcedimiento = " { call sp_listar_empleados(?) }";
            
            //paso3: crear el CallableStatement
            CallableStatement cstmt = conexion.prepareCall(llamadaProcedimiento);
            cstmt.registerOutParameter(1, OracleTypes.CURSOR);
            
            cstmt.execute();
            
            //Obtenemos el resultado en un ResultSet
            ResultSet rs = (ResultSet) cstmt.getObject(1);
            
            while (rs.next()) {                
                Empleado e = new Empleado();
                e.setRut(rs.getString("rut"));
                e.setNombre(rs.getString("nombre"));
                e.setApellido(rs.getString("apellido"));
                e.setEdad(rs.getInt("edad"));
                
                lista.add(e);
            }
              
        } catch (Exception e) {
            System.out.println(e.getMessage());      
        } finally {
            this.conexion.close();
        } 
        return lista;
    }
    
    public boolean agregarEmpleado(Empleado emp) throws SQLException{
        boolean bandera = false;
        try {
            this.conexion = new Conexion().obtenerConexion();
            String llamadaProcedimiento = "{ call sp_agregar_empleado(?,?,?,?) }";
            CallableStatement cstmt = this.conexion.prepareCall(llamadaProcedimiento);
            
            cstmt.setString(1, emp.getRut());
            cstmt.setString(2, emp.getNombre());
            cstmt.setString(3, emp.getApellido());
            cstmt.setInt(4, emp.getEdad());
            
            if(cstmt.executeUpdate()>0){
                bandera = true;
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        } finally {
            this.conexion.close();
        }
        return bandera;
    }
    
    public boolean eliminarEmpleado(String rut2) throws SQLException{
        boolean bandera = false;
        try {
            this.conexion = new Conexion().obtenerConexion();
            String llamadaProcedimiento = "delete from empleado where RUT = '" +rut2+"' ";
            CallableStatement cstmt = this.conexion.prepareCall(llamadaProcedimiento);
            
            //cstmt.setString(1, rut2);
            
            if(cstmt.executeUpdate()==1){
                bandera = true;
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        } finally {
            this.conexion.close();
        }
        return bandera;
    }
    
    public boolean modificarEmpleado(Empleado emp) throws SQLException{
        boolean bandera = false;
        try {
            this.conexion = new Conexion().obtenerConexion();
            String llamadaProcedimiento = "{ call sp_modificar_empleado(?,?,?,?) }";
            CallableStatement cstmt = this.conexion.prepareCall(llamadaProcedimiento);
            
            cstmt.setString(1, emp.getRut());
            cstmt.setString(2, emp.getNombre());
            cstmt.setString(3, emp.getApellido());
            cstmt.setInt(4, emp.getEdad());
            
            if(cstmt.executeUpdate()==1){
                bandera = true;
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        } finally {
            this.conexion.close();
        }
        return bandera;
    }
    
}
