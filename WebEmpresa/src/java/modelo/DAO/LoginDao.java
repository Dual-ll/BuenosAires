/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo.DAO;

/**
 *
 * @author Brayan
 */
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import bean.LoginBean;
import modelo.conexion.DBConnection;

public class LoginDao {

    public String authenticateUser(LoginBean loginBean) {
        String userName = loginBean.getUserName();
        String password = loginBean.getPassword();

        Connection con = null;
        Statement statement = null;
        Statement statement2 = null;

        ResultSet resultSet = null;
        ResultSet resultSet2 = null;

        String userNameDB = "";
        String passwordDB = "";
        String roleDB = "";

        try {
            con = DBConnection.createConnection();
            statement = con.createStatement();
            statement2 = con.createStatement();

            resultSet = statement.executeQuery("select nombre_usuario,contrasena,rol from usuario");
            resultSet2 = statement2.executeQuery("select usuario,contrasena,rol from tecnico");

            while (resultSet2.next()) {
                userNameDB = resultSet2.getString("usuario");
                passwordDB = resultSet2.getString("contrasena");
                roleDB = resultSet2.getString("rol");

                if (userName.equals(userNameDB) && password.equals(passwordDB) && roleDB.equals("tecnico")) {
                    return "Tecnico_Role";
                }
            }

            while (resultSet.next()) {
                userNameDB = resultSet.getString("nombre_usuario");
                passwordDB = resultSet.getString("contrasena");
                roleDB = resultSet.getString("rol");

                if (userName.equals(userNameDB) && password.equals(passwordDB) && roleDB.equals("admin")) {
                    return "Admin_Role";
                } else if (userName.equals(userNameDB) && password.equals(passwordDB) && roleDB.equals("user")) {
                    return "User_Role";
                }
            }
        } catch (SQLException e) {
            System.out.println(e.toString());
        }
        return "Credenciales invalidas";
    }
}
