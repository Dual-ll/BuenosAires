/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.conexion.Conexion;

/**
 *
 * @author Brayan
 */
@WebServlet(name = "servletProductos", urlPatterns = {"/servletProductos"})
public class servletProductos extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            this.conexion = new Conexion().obtenerConexion();

            PreparedStatement ps = conexion.prepareStatement("select * from producto");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                out.println("<div class='responsive'>");
                out.println("<div class='gallery'>");
                out.println("<h3>" + rs.getString("nombre") + "</h3>");
                out.println("<img width='300' height='300' src=servletListarProductos?name=" + rs.getString("nombre") + "></img> <p/>");
                out.println("<div class='desc'>" + rs.getString("descripcion") + "</br> Disponibles: " + rs.getString("stock"));
                out.println("</div>");
                out.println("</div>");
                out.println("</div>");
            }
            conexion.close();
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        } finally {
            out.close();
        }

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
