/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import modelo.conexion.Conexion;
import modelo.entidades.Producto;
import modelo.entidades.Solicitud;

/**
 *
 * @author Brayan
 */
public class ProductoDAO {

    private Connection conexion;

    public ProductoDAO() {
    }
}