/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.DAO.EmpleadoDAO;
import modelo.entidades.Empleado;
import ws.WS_Service;
import ws.WS;
/**
 *
 * @author duoc
 */
@WebServlet(name = "servletRegistro", urlPatterns = {"/servletRegistro"})
public class servletRegistro extends HttpServlet {

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
        boolean bandera = false;
        String nombre_usuario = request.getParameter("txtNombreUsuario");
        String contrasena = request.getParameter("txtContrasena");
        String nombre_completo = request.getParameter("txtNombreCompleto");
        String fecha_nacimiento = request.getParameter("txtFechaNacimiento");
        String telefono = request.getParameter("txtTelefono");
        String sexo = request.getParameter("txtSexo");
        String correo = request.getParameter("txtCorreo");
        String rol = request.getParameter("txtRol");
        
        WS_Service servicio = new WS_Service();
        WS cliente = servicio.getWSPort();
        
        try {
            if (cliente.agregarUsuario(nombre_usuario, contrasena, nombre_completo, fecha_nacimiento, telefono, sexo, correo, rol)) {
                bandera = true;
            } else {
            bandera = false;}
        } catch (Exception e) {
            throw e;
        }
                
        //Guardo la bandera para enviarla a la vista
        request.setAttribute("respuesta", bandera);
        request.getRequestDispatcher("registroUsuario.jsp").forward(request, response);
        
        
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
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
