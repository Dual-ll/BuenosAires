<%-- 
    Document   : listarSolicitudesTecnico
    Created on : 01-06-2019, 17:54:46
    Author     : Brayan
--%>
<%@page import="javax.jms.Session"%>
<%@page import="java.util.Enumeration"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Listado solicitudes</title>
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
        if ((request.getSession(false).getAttribute("Tecnico") == null)) {
    %>
    <jsp:forward page="/Login.jsp"></jsp:forward>
    <%}%>
    <body>
        <nav class="navbar navbar-inverse">
            <div class="container-fluid">
                <div class="navbar-header">
                    <a class="navbar-brand glyphicon glyphicon-cloud" href="#"></a>
                </div>
                <ul class="nav navbar-nav">
                    <li class="active"><a href="index.jsp"><span class="glyphicon glyphicon-home"></span> Inicio</a></li>
                        <% //Si hay tecnico logueado mostrar esto
                            if ((request.getSession(true).getAttribute("Tecnico") != null)) {
                        %>
                    <li><a href="<%=request.getContextPath()%>/servletSolicitudesTecnico">Ver solicitudes</a></li>
                        <%}%>
                </ul>
                <ul class="nav navbar-nav navbar-right">
                    <% //Si no hay nadie logueado mostrar esto
                        if ((request.getSession(false).getAttribute("Admin") == null) && (request.getSession(false).getAttribute("Tecnico") == null) && (request.getSession(false).getAttribute("User") == null)) {
                    %>
                    <li><a href="registroUsuario.jsp"><span class="glyphicon glyphicon-user"></span>   Registrarse</a></li>
                    <li><a href="Login.jsp"><span class="glyphicon glyphicon-log-in"></span>   Iniciar sesion</a></li>
                        <%}%>

                    <% //Si hay alguien logueado mostrar esto
                        if ((request.getSession(true).getAttribute("Admin") != null)) {
                    %>
                    <li><a href="#"><span class="glyphicon glyphicon-user"></span><%=request.getAttribute("userName")%></a></li>
                    <li><a href="<%=request.getContextPath()%>/LogoutServlet"><span class="glyphicon glyphicon-log-in"></span>  Logout</a></li>
                        <%}%>
                        <% //Si hay alguien logueado mostrar esto
                            if ((request.getSession(true).getAttribute("Tecnico") != null)) {
                        %>
                        <jsp:include page="/servletTecnico" />
                    <li><a href="#"><span class="glyphicon glyphicon-user"></span><%=request.getAttribute("userName")%></a></li>
                    <li><a href="<%=request.getContextPath()%>/LogoutServlet"><span class="glyphicon glyphicon-log-in"></span>  Logout</a></li>
                        <%}%>
                        <% //Si hay alguien logueado mostrar esto
                            if ((request.getSession(true).getAttribute("User") != null)) {
                        %>
                        <jsp:include page="/servletUser" />
                    <li><a href="#"><span class="glyphicon glyphicon-user"></span><%=request.getAttribute("userName")%></a></li>
                    <li><a href="<%=request.getContextPath()%>/LogoutServlet"><span class="glyphicon glyphicon-log-in"></span>  Logout</a></li>
                        <%}%>
                </ul>
            </div>
        </nav>
        <div class="well text-center">
            <h1>Listado de solicitudes</h1>
            <p>Aqui puede ver las solicitudes en espera de aprobacion de los clientes.</p>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-sm-1">

                </div>
                <div class="col-sm-12">
                    <table class="table table-hover">
                        <tr class="">
                            <th></th>
                            <th>Tipo de solicitud:</th>
                            <th>Fecha:</th>
                            <th>Hora:</th>
                            <th>Problema:</th>
                            <th>Estado:</th>
                            <th>Nombre usuario:</th>
                            <th>Correo usuario:</th>
                        </tr>
                        <c:forEach var="solicitud" items="${listado}">
                            <tr class="active">

                            <form name="form" action="<%=request.getContextPath()%>/servletAprobarSolicitud" method="post">
                                  <input type="hidden" class="form-control" name="id" value="${solicitud.getId()}" required>
                                  <input type="hidden" class="form-control" name="txtCorreo" value="${solicitud.getCorreo()}" required>
                                  <input type="hidden" class="form-control" name="txtFecha" value="${solicitud.getFecha()}" required>
                                  <input type="hidden" class="form-control" name="txtHora" value="${solicitud.getHora()}" required>
                                <td><input type="submit" value="Aprobar" class="btn btn-success"></td>
                            </form>
                            <td>${solicitud.getTipo()}</td>
                            <td>${solicitud.getFecha()}</td>
                            <td>${solicitud.getHora()}</td>
                            <td>${solicitud.getProblema()}</td>
                            <td>${solicitud.getEstado()}</td>
                            <td>${solicitud.getNombre_usuario()}</td>
                            <td>${solicitud.getCorreo()}</td>
                        </c:forEach>
                    </table>
                </div>
                <div class="col-sm-1">

                </div>

            </div>
        </div>
    </body>
</html>
