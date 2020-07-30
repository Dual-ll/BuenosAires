/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.DAO.SolicitudDAO;
import modelo.entidades.Solicitud;

/**
 *
 * @author Brayan
 */
@WebServlet(name = "servletSolicitud", urlPatterns = {"/servletSolicitud"})
public class servletSolicitud extends HttpServlet {

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
        int id=0;
        String tipo = request.getParameter("tipo");
        String fecha = request.getParameter("fecha");
        String hora = request.getParameter("hora");
        String problema = request.getParameter("problema");
        String estado = request.getParameter("estado");
        String username = request.getParameter("username");
        String correo = "";

        Solicitud sol = new Solicitud(id, tipo, fecha, hora, problema, estado, username, correo);

        SolicitudDAO dao = new SolicitudDAO();

        try {
            if (dao.agregarSolicitud(sol)) {
                bandera = true;
            } else {
                bandera = false;
            }
        } catch (Exception e) {
        }
        request.setAttribute("respuesta", bandera);
        request.getRequestDispatcher("realizarSolicitud.jsp").forward(request, response);
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
