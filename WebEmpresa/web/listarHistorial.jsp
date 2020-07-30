<%-- 
    Document   : listarHistorial
    Created on : 31-05-2019, 22:27:13
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
    <% //In case, if Admin session is not set, redirect to Login page
        if ((request.getSession(false).getAttribute("User") == null)) {
    %>
    <jsp:forward page="/Login.jsp"></jsp:forward>
    <%}%>
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
                    <li><a href="#">Cosas de admin</a></li>
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
                            <li><a href="listarHistorial.jsp">Historial de solicitudes</a></li>
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
                    <li><a href="#"><span class="glyphicon glyphicon-user"></span><%=request.getAttribute("userName")%></a></li>
                    <li><a href="<%=request.getContextPath()%>/LogoutServlet"><span class="glyphicon glyphicon-log-in"></span>  Logout</a></li>
                        <%}%>
                </ul>
            </div>
        </nav>
    <body>
        <div class="well text-center">
            <h1>Historial de solicitudes</h1>
            <p>Aqui podra ver las solicitudes que ha realizado en la pagina.</p>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-sm-1">

                </div>
                <div class="col-sm-10">
                    <table class="table table-hover">
                        <tr class="">
                            <th>Tipo de solicitud:</th>
                            <th>Fecha:</th>
                            <th>Hora:</th>
                            <th>Problema:</th>
                            <th>Estado:</th>
                        </tr>
                        <c:forEach var="solicitud" items="${listado}">
                            <tr class="active">
                                <td>${solicitud.getTipo()}</td>
                                <td>${solicitud.getFecha()}</td>
                                <td>${solicitud.getHora()}</td>
                                <td>${solicitud.getProblema()}</td>
                                <td>${solicitud.getEstado()}</td>
                            </tr>
                        </c:forEach>
                    </table>
                </div>
                <div class="col-sm-1">

                </div>

            </div>
        </div>
    </body>
</html>

