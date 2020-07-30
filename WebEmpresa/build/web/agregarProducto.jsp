<%-- 
    Document   : agregarProducto
    Created on : 02-06-2019, 20:06:58
    Author     : Brayan
--%>

<%@page import="javax.jms.Session"%>
<%@page import="java.util.Enumeration"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Agregar producto</title>
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
        if ((request.getSession(false).getAttribute("Admin") == null)) {
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
                    <li><a href="<%=request.getContextPath()%>/servletSolicitudesTecnico">Ver solicitudes</a></li>
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
                    <!--<li><form name="form" action="<%=request.getContextPath()%>/servletSolicitud" method="post" novalidate>-->
                    <!--<input type="submit" value="Realizar solicitud" class="btn btn-link">-->
                    <li class="dropdown">
                        <a class="dropdown-toggle" data-toggle="dropdown" href="#">Solicitudes
                            <span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li><a href="realizarSolicitud.jsp">Realizar solicitud</a></li>
                            <li><a href="<%=request.getContextPath()%>/servletHistorial">Historial de solicitudes</a></li>
                        </ul>
                    </li>
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
            <h1>Agregar nuevo producto</h1>
            <p>Llene el formulario para agregar un nuevo producto para vender.</p>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-sm-2">

                </div>
                <div class="col-sm-8">
                    <c:if test="${respuesta!=null}">
                        <c:if test="${respuesta==true}">
                            <div class="alert alert-success">Producto añadido con exito</div>
                        </c:if>
                        <c:if test="${respuesta==false}">
                            <div class="alert alert-danger">Producto no agregado.</div>
                        </c:if>
                    </c:if>

                    <form enctype="multipart/form-data" action="servletProductoNuevo" method="POST">

                        <h3>Nombre del producto:</h3>
                        <input type="text" name="txtNombre" class="form-control" placeholder="Ingrese nombre de usuario" required>

                        <h3>Descripcion:</h3>
                        <textarea name="txtDescripcion" class="form-control" placeholder="Ingrese contraseña" required></textarea>

                        <h3>Stock:</h3>
                        <input type="number" name="txtStock" class="form-control" placeholder="Ingrese su nombre completo" required>

                        <h3>Precio a venderse:</h3>
                        <input type="number" name="txtPrecio" class="form-control" placeholder="Ingrese su fecha de nacimiento" required>

                        <h3>Imagen:</h3>
                        <input type="file" name="txtImagen" class="form-control" required>

                        <br>
                        <input type="submit" value="Añadir producto" class="btn btn-success">
                        <br>
                    </form>
                </div>
                <div class="col-sm-2">

                </div>
            </div>
        </div>
    </body>
</html>