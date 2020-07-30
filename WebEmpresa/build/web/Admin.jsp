<%-- 
    Document   : Admin.jsp
    Created on : 27-05-2019, 20:29:11
    Author     : Brayan
--%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
        <!-- jQuery library -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
        <!-- Latest compiled JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
        <title>Admin Page</title>
    </head>
    <% //In case, if Admin session is not set, redirect to Login page
        if ((request.getSession(false).getAttribute("Admin") == null)) {
    %>
    <jsp:forward page="/Login.jsp"></jsp:forward>
    <%}%>
    <body>


    <body>
    <nav class="navbar navbar-inverse">
        <div class="container-fluid">
            <div class="navbar-header">
                <a class="navbar-brand" href="#">B.A.</a>
            </div>
            <ul class="nav navbar-nav">
                <li class="active"><a href="#">Inicio</a></li>
                <li><a href="agregarEmpleado.jsp">Agregar</a></li>
                <li><a href="modificarEmpleado.jsp">Modificar</a></li>
                <li><a href="eliminarEmpleado.jsp">Eliminar</a></li>
                <li><a href="Listar">Listar</a></li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <% //Si hay admin logueado mostrar esto
                    if ((request.getSession(true).getAttribute("Admin") != null) || (request.getSession(true).getAttribute("Tecnico") != null) || (request.getSession(true).getAttribute("User") != null)) {
                %>
                <li><a href="#"><span class="glyphicon glyphicon-user"></span><%=request.getAttribute("userName")%></a></li>
                <li><a href="<%=request.getContextPath()%>/LogoutServlet"><span class="glyphicon glyphicon-log-in"></span> Logout</a></li>
                <%}%>
            </ul>
        </div>
    </nav>

    <div class="jumbotron text-center">
        <h1>Buenos Aires</h1>
        <p>La mejor empresa de aires acondicionados</p>
    </div>

    <div class="container">
        <div class="row">
            <div class="col-sm-2">

            </div>
            <div class="col-sm-8" style="background-color: red">

            </div>
            <div class="col-sm-2">

            </div>

        </div>
    </div>
</body>
</html>

</body>
</html>