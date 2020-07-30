/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

/**
 *
 * @author Brayan
 */
public class Usuario {
    private String nombre_usuario;
    private String contrasena;
    private String tipo_usuario;

    public Usuario() {
    }

    public Usuario(String nombre_usuario, String contrasena, String tipo_usuario) {
        this.nombre_usuario = nombre_usuario;
        this.contrasena = contrasena;
        this.tipo_usuario = tipo_usuario;
    }

    public String getNombre_usuario() {
        return nombre_usuario;
    }

    public void setNombre_usuario(String nombre_usuario) {
        this.nombre_usuario = nombre_usuario;
    }

    public String getContrasena() {
        return contrasena;
    }

    public void setContrasena(String contrasena) {
        this.contrasena = contrasena;
    }

    public String getTipo_usuario() {
        return tipo_usuario;
    }

    public void setTipo_usuario(String tipo_usuario) {
        this.tipo_usuario = tipo_usuario;
    }

    @Override
    public String toString() {
        return "Usuario{" + "nombre_usuario=" + nombre_usuario + ", contrasena=" + contrasena + ", tipo_usuario=" + tipo_usuario + '}';
    }
    

    
}
