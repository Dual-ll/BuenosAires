/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import modelo.conexion.Conexion;

/**
 *
 * @author Brayan
 */
@MultipartConfig
public class servletProductoNuevo extends HttpServlet {

    private Connection conexion;

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            boolean bandera = false;
            
            String nombre = request.getParameter("txtNombre");
            String descripcion = request.getParameter("txtDescripcion");
            int stock = Integer.parseInt(request.getParameter("txtStock"));
            int precio = Integer.parseInt(request.getParameter("txtPrecio"));
            Part photo = request.getPart("txtImagen");
            
            this.conexion = new Conexion().obtenerConexion();
            String llamadaProcedimiento = "{ call sp_agregar_producto(?,?,?,?,?) }";
            CallableStatement cstmt = this.conexion.prepareCall(llamadaProcedimiento);
            
            cstmt.setString(1, nombre);
            cstmt.setString(2, descripcion);
            cstmt.setInt(3, stock);
            cstmt.setInt(4, precio);
            // size must be converted to int otherwise it results in error
            cstmt.setBinaryStream(5, photo.getInputStream(), (int) photo.getSize());
            if (cstmt.executeUpdate() == 1) {
                bandera = true;
            }
            request.setAttribute("respuesta", bandera);
            request.getRequestDispatcher("agregarProducto.jsp").forward(request, response);
        } catch (Exception e) {
            System.out.println(e.getMessage());
        } finally {

        }
    }
}
