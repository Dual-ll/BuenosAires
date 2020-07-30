/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo.DAO;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import modelo.conexion.Conexion;
import modelo.entidades.Empleado;
import modelo.entidades.Solicitud;
import oracle.jdbc.OracleTypes;

/**
 *
 * @author Brayan
 */
public class SolicitudDAO {

    private Connection conexion;

    public SolicitudDAO() {
    }

    public boolean agregarSolicitud(Solicitud sol) throws SQLException {
        boolean bandera = false;
        try {
            this.conexion = new Conexion().obtenerConexion();
            String llamadaProcedimiento = "{ call sp_agregar_solicitud(?,?,?,?,?,?) }";
            CallableStatement cstmt = this.conexion.prepareCall(llamadaProcedimiento);

            cstmt.setString(1, sol.getTipo());
            cstmt.setString(2, sol.getFecha());
            cstmt.setString(3, sol.getHora());
            cstmt.setString(4, sol.getProblema());
            cstmt.setString(5, sol.getEstado());
            cstmt.setString(6, sol.getNombre_usuario());

            if (cstmt.executeUpdate() > 0) {
                bandera = true;
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        } finally {
            this.conexion.close();
        }
        return bandera;
    }

    public List<Solicitud> listarHistorial(String user) throws SQLException {
        List<Solicitud> lista = new ArrayList<>();
        try {
            //paso1: obtener conexion
            this.conexion = new Conexion().obtenerConexion();

            //paso2: Crear una llamada
            PreparedStatement ps = conexion.prepareStatement("SELECT TIPO_SOLICITUD, FECHA, HORA, PROBLEMA, ESTADO, NOMBRE_USUARIO FROM SOLICITUD WHERE NOMBRE_USUARIO=?");
            ps.setString(1, user);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Solicitud s = new Solicitud();
                s.setTipo(rs.getString("tipo_solicitud"));
                s.setFecha(rs.getString("fecha"));
                s.setHora(rs.getString("hora"));
                s.setProblema(rs.getString("problema"));
                s.setEstado(rs.getString("estado"));
                s.setNombre_usuario(rs.getString("nombre_usuario"));
                lista.add(s);
            }

        } catch (Exception e) {
            System.out.println(e.getMessage());

        } finally {
            this.conexion.close();
        }
        return lista;
    }

    public List<Solicitud> listarSolicitudesTecnico() throws SQLException {
        List<Solicitud> lista = new ArrayList<>();
        try {
            this.conexion = new Conexion().obtenerConexion();

            PreparedStatement ps = conexion.prepareStatement("SELECT S.ID_SOLICITUD,S.TIPO_SOLICITUD, S.FECHA, S.HORA, S.PROBLEMA, S.ESTADO, S.NOMBRE_USUARIO, U.CORREO_ELECTRONICO FROM SOLICITUD S JOIN USUARIO U ON S.NOMBRE_USUARIO=U.NOMBRE_USUARIO WHERE ESTADO='En espera'");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Solicitud s = new Solicitud();
                s.setId(rs.getInt("id_solicitud"));
                s.setTipo(rs.getString("tipo_solicitud"));
                s.setFecha(rs.getString("fecha"));
                s.setHora(rs.getString("hora"));
                s.setProblema(rs.getString("problema"));
                s.setEstado(rs.getString("estado"));
                s.setNombre_usuario(rs.getString("nombre_usuario"));
                s.setCorreo(rs.getString("correo_electronico"));
                lista.add(s);
            }

        } catch (Exception e) {
            System.out.println(e.getMessage());

        } finally {
            this.conexion.close();
        }
        return lista;
    }

    public boolean modificarSolicitud(int id, String tecnico) throws SQLException {
        boolean bandera = false;
        try {
            this.conexion = new Conexion().obtenerConexion();
            PreparedStatement ps = conexion.prepareStatement("UPDATE SOLICITUD SET USUARIO=?, ESTADO='Aprobada' WHERE ID_SOLICITUD=?");
            ps.setString(1, tecnico);
            ps.setInt(2, id);

            if (ps.executeUpdate() == 1) {
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
