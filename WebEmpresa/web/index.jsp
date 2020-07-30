<%-- 
    Document   : index
    Created on : 27-05-2019, 21:54:25
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
                            <li><a href="#">Seguimiento compra ${userName}</a></li>
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
                    <li><a href="#"><span class="glyphicon glyphicon-user"></span>${usuario}</a></li>
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
        <div class="container well well-sm"> 
            <div id="myCarousel" class="carousel slide" data-ride="carousel">
                <!-- Indicators -->
                <ol class="carousel-indicators">
                    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                    <li data-target="#myCarousel" data-slide-to="1"></li>
                    <li data-target="#myCarousel" data-slide-to="2"></li>
                </ol>

                <!-- Wrapper for slides -->
                <div class="carousel-inner">
                    <div class="item active">
                        <img src="<%=request.getContextPath()%>/img/aire4.jpg" alt="Los Angeles">
                    </div>

                    <div class="item">
                        <img src="<%=request.getContextPath()%>/img/aire4.jpg" alt="Chicago">
                    </div>

                    <div class="item">
                        <img src="<%=request.getContextPath()%>/img/aire4.jpg" alt="New York">
                    </div>
                </div>

                <!-- Left and right controls -->
                <a class="left carousel-control" href="#myCarousel" data-slide="prev">
                    <span class="glyphicon glyphicon-chevron-left"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="right carousel-control" href="#myCarousel" data-slide="next">
                    <span class="glyphicon glyphicon-chevron-right"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div>
        </div>

        <div class="container">
            <div class="row">
                <div class="col-sm-2">

                </div>
                <div class="col-sm-8">

                </div>
            </div>
            <div class="col-sm-2">

            </div>
        </div>
        <div class="jumbotron">
            <h1>Buenos aires</h1>      
            <p>Obtenga los mejores productos en aires acondicionados.</p>
            <div class="container">
                <div class="row">
                    <div class="col-sm-4" id="col1">
                        <p>Empresa reconocida nacionalmente por su calidad y buen servicio.</p>
                        <img src="<%=request.getContextPath()%>/img/col1.png" alt="col1" id="imgcol1">
                    </div>
                    <div class="col-sm-4">

                    </div>
                    <div class="col-sm-4" id="col2">
                        <p>Precios convenientes y multiples opciones de pago y flexibilidad.</p>
                        <img src="<%=request.getContextPath()%>/img/col2.png" alt="col2" id="imgcol2">
                    </div>
                </div>
            </div>
        </div>
        <script src="js/bootstrap.js"></script>
    </body>
</html>
