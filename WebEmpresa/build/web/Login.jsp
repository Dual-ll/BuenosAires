<%-- 
    Document   : Login
    Created on : 27-05-2019, 17:42:47
    Author     : Brayan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
                    <li class="active"><a href="Login.jsp"><span class="glyphicon glyphicon-log-in"></span>   Iniciar sesion</a></li>
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
            <h1>Inicio de sesión</h1>
            <p> Ingrese sus datos para iniciar sesión</p>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-sm-2">

                </div>
                <div class="col-sm-8">
                    <div>
                        <form name="form" action="<%=request.getContextPath()%>/LoginServlet" method="post">
                            <div class="form-group">
                                <label for="usr">Usuario:</label>
                                <input type="text" class="form-control" name="username" id="usr" placeholder="Ingrese usuario" required>

                            </div>
                            <div class="form-group">
                                <label for="pwd">Contraseña:</label>
                                <input type="password" class="form-control" name="password" id="pwd" placeholder="Ingrese contraseña" required>
                            </div> 
                            <input type="submit" value="Iniciar sesion" class="btn btn-default">
                            <input type="reset" value="Limpiar" class="btn btn-info">
                        </form>
                        <br>
                        <div class="alert">
                            <strong><span><%=(request.getAttribute("errMessage") == null) ? "" : request.getAttribute("errMessage")%></span></strong>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-sm-2">

            </div>

        </div>

</body>
</html>