/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo.entidades;

import oracle.sql.BLOB;

/**
 *
 * @author Brayan
 */
public class Producto {
    private String nombre;
    private String descripcion;
    private int stock;
    private int precio;
    private BLOB imagen;

    public Producto() {
    }

    public Producto(String nombre, String descripcion, int stock, int precio, BLOB imagen) {
        this.nombre = nombre;
        this.descripcion = descripcion;
        this.stock = stock;
        this.precio = precio;
        this.imagen = imagen;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }

    public int getPrecio() {
        return precio;
    }

    public void setPrecio(int precio) {
        this.precio = precio;
    }

    public BLOB getImagen() {
        return imagen;
    }

    public void setImagen(BLOB imagen) {
        this.imagen = imagen;
    }
    
    
    
}
