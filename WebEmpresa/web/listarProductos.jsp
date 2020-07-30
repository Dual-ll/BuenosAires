<%-- 
    Document   : listarProductos
    Created on : 01-06-2019, 18:59:53
    Author     : Brayan
--%>

<%@page import="javax.jms.Session"%>
<%@page import="java.util.Enumeration"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Inicio</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="css/estilo.css">
        <!-- jQuery library -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
        <!-- Latest compiled JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
    </head>

    <body>
        <jsp:include page="/servletUser" />
        <nav class="navbar navbar-inverse">
            <div class="container-fluid">
                <div class="navbar-header">
                    <a class="navbar-brand glyphicon glyphicon-cloud" href="#"></a>
                </div>
                <ul class="nav navbar-nav">
                    <li><a href="index.jsp"><span class="glyphicon glyphicon-home"></span> Inicio</a></li>
                        <% //Si hay admin logueado mostrar esto
                            if ((request.getSession(true).getAttribute("Admin") != null)) {
                        %>
                    <li class="dropdown">
                        <a class="dropdown-toggle" data-toggle="dropdown" href="#">Productos
                            <span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li><a href="agregarProducto.jsp">Agregar nuevo</a></li>
                            <li><a href="<%=request.getContextPath()%>/listarProductos.jsp">Listar productos</a></li>
                        </ul>
                    </li>
                    <%}%>

                    <% //Si hay tecnico logueado mostrar esto
                        if ((request.getSession(true).getAttribute("Tecnico") != null)) {
                    %>
                    <li><a href="#">Cosas de tecnico</a></li>
                        <%}%>

                    <% //Si hay user logueado mostrar esto
                        if ((request.getSession(true).getAttribute("User") != null)) {
                    %>
                    <li class="dropdown">
                        <a class="dropdown-toggle" data-toggle="dropdown" href="#">Ventas
                            <span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li><a href="#">Comprar equipos</a></li>
                            <li><a href="#">Seguimiento compra</a></li>
                        </ul>
                    </li>
                    <li class="dropdown">
                        <a class="dropdown-toggle" data-toggle="dropdown" href="#">Solicitudes
                            <span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li><a href="realizarSolicitud.jsp">Realizar solicitud</a></li>
                            <li><a href="<%=request.getContextPath()%>/servletHistorial">Historial de solicitudes</a></li>
                        </ul>
                    </li>
                    <%}%>
                    <!--
                    <li><a href="agregarEmpleado.jsp">Agregar</a></li>
                    <li><a href="modificarEmpleado.jsp">Modificar</a></li>
                    <li><a href="eliminarEmpleado.jsp">Eliminar</a></li>
                    <li><a href="Listar">Listar</a></li>-->
                </ul>
                <ul class="nav navbar-nav navbar-right">
                    <% //Si no hay nadie logueado mostrar esto
                        if ((request.getSession(false).getAttribute("Admin") == null) && (request.getSession(false).getAttribute("Tecnico") == null) && (request.getSession(false).getAttribute("User") == null)) {
                    %>
                    <li><a href="registroUsuario.jsp"><span class="glyphicon glyphicon-user"></span>   Registrarse</a></li>
                    <li><a href="Login.jsp"><span class="glyphicon glyphicon-log-in"></span>   Iniciar sesion</a></li>
                        <%}%>

                    <% //Si hay alguien logueado mostrar esto
                        if ((request.getSession(true).getAttribute("Admin") != null) || (request.getSession(true).getAttribute("Tecnico") != null) || (request.getSession(true).getAttribute("User") != null)) {
                    %>
                    <li><a href="#"><span class="glyphicon glyphicon-user"></span>${usuario}</a></li>
                    <li><a href="<%=request.getContextPath()%>/LogoutServlet"><span class="glyphicon glyphicon-log-in"></span>  Logout</a></li>
                        <%}%>
                </ul>
            </div>
        </nav>
        <div class="well text-center">
            <h1>Productos disponibles</h1>
            <p>Aqui puede ver todos los equipos disponibles, solo seleccione el producto que quiera comprar.</p>
        </div>
    </head>
    <div class="container">
        <div class="row">
            <div class="col-sm-1">
            </div>
            <div class="col-sm-12">
                <jsp:include page="/servletProductos" />
                <div class="clearfix"></div>

            </div>
            <div class="col-sm-1">

            </div>
        </div>
</html>
