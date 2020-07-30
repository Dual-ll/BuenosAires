<%-- 
    Document   : registroUsuario
    Created on : 30-05-2019, 0:02:52
    Author     : Brayan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Registro</title>
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
        <nav class="navbar navbar-inverse">
            <div class="container-fluid">
                <div class="navbar-header">
                    <a class="navbar-brand glyphicon glyphicon-cloud" href="#"></a>
                </div>
                <ul class="nav navbar-nav">
                    <li class=""><a href="index.jsp"><span class="glyphicon glyphicon-home"></span> Inicio</a></li>
                        <% //Si hay admin logueado mostrar esto
                            if ((request.getSession(true).getAttribute("Admin") != null)) {
                        %>
                    <li><a href="">Cosas de admin</a></li>
                        <%}%>

                    <% //Si hay tecnico logueado mostrar esto
                        if ((request.getSession(true).getAttribute("Tecnico") != null)) {
                    %>
                    <li><a href="">Cosas de tecnico</a></li>
                        <%}%>

                    <% //Si hay user logueado mostrar esto
                        if ((request.getSession(true).getAttribute("User") != null)) {
                    %>
                    <li><a href="">Cosas de user</a></li>
                        <%}%>
                </ul>
                <ul class="nav navbar-nav navbar-right">
                    <% //Si no hay nadie logueado mostrar esto
                        if ((request.getSession(false).getAttribute("Admin") == null) && (request.getSession(false).getAttribute("Tecnico") == null) && (request.getSession(false).getAttribute("User") == null)) {
                    %>
                    <li class="active"><a href="registroUsuario.jsp"><span class="glyphicon glyphicon-user"></span>   Registrarse</a></li>
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

        <div class="well text-center">
            <h1>Registro</h1>
            <p>Cree una cuenta para poder comprar con nosotros, o solicitar reparaciones o mantenciones.</p>
        </div>

        <div class="container">
            <div class="row">
                <div class="col-sm-2">

                </div>
                <div class="col-sm-8">
                    <c:if test="${respuesta!=null}">
                        <c:if test="${respuesta==true}">
                            <div class="alert alert-success">Registro realizado con exito</div>
                        </c:if>
                        <c:if test="${respuesta==false}">
                            <div class="alert alert-danger">El usuario ya existe. Intente con otro.</div>
                        </c:if>
                    </c:if>

                    <form action="servletRegistro" method="POST">

                        <h1>Formulario de registro</h1>

                        <h3>Nombre de usuario:</h3>
                        <input type="text" name="txtNombreUsuario" class="form-control" placeholder="Ingrese nombre de usuario" required>

                        <h3>Contraseña:</h3>
                        <input type="password" name="txtContrasena" class="form-control" placeholder="Ingrese contraseña" required>

                        <h3>Nombre completo:</h3>
                        <input type="text" name="txtNombreCompleto" class="form-control" placeholder="Ingrese su nombre completo" required>

                        <h3>Fecha nacimiento:</h3>
                        <input type="date" name="txtFechaNacimiento" class="form-control" placeholder="Ingrese su fecha de nacimiento" required>

                        <h3>Telefono:</h3>
                        <input type="tel" name="txtTelefono" class="form-control" placeholder="Ingrese su telefono" required>

                        <h3>Sexo:</h3>
                        <input type="text" name="txtSexo" class="form-control" placeholder="Ingrese sexo" required>

                        <h3>Correo:</h3>
                        <input type="email" name="txtCorreo" class="form-control" placeholder="Ingrese su correo" required>

                        <h3>Rol:</h3>
                        <input type="text" name="txtRol" class="form-control" placeholder="Ingrese rol" required>

                        <br>
                        <input type="submit" value="Crear cuenta" class="btn btn-success">
                        <br>
                    </form>
                </div>
                <div class="col-sm-2">

                </div>
            </div>
        </div>
    </body>
</html>
