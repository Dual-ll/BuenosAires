<%-- 
    Document   : eliminarEmpleado
    Created on : 15-05-2019, 12:08:01
    Author     : duoc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Eliminar Empleado</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
        <!-- jQuery library -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
        <!-- Latest compiled JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
    </head>
    <body>
        <nav class="navbar navbar-inverse">
            <div class="container-fluid">
                <div class="navbar-header">
                    <a class="navbar-brand" href="#">RRHH</a>
                </div>
                <ul class="nav navbar-nav">
                    <li><a href="index.html">Inicio</a></li>
                    <li><a href="agregarEmpleado.jsp">Agregar</a></li>
                    <li><a href="modificarEmpleado.jsp">Modificar</a></li>
                    <li class="active"><a href="eliminarEmpleado.jsp">Eliminar</a></li>
                    <li><a href="Listar">Listar</a></li>
                </ul>
            </div>
        </nav>

        <div class="jumbotron text-center">
            <h1>Eliminar Empleado</h1>
            <p>La mejor empresa de recursos humanos</p>
        </div>

        <div class="container">
            <div class="row">
                <div class="col-sm-2">

                </div>
                <div class="col-sm-8">
                    <c:if test="${respuesta!=null}">
                        <c:if test="${respuesta==true}">
                            <div class="alert alert-success">Empleado Eliminado</div>
                        </c:if>
                        <c:if test="${respuesta==false}">
                            <div class="alert alert-danger">Empleado NO Eliminado</div> 
                        </c:if>
                    </c:if>
                    <form action="servletEliminar" method="POST">
                        <h1>Eliminar Empleado</h1>
                        <h3>Rut:</h3>
                        <input type="text" name="txtRut" class="form-control" placeholder="Ingrese rut" required>
                        <br>
                        <input type="submit" name="btnEliminar" value="Eliminar" class="btn btn-danger">
                        <br>
                    </form>
                </div>
                <div class="col-sm-2">

                </div>

            </div>
        </div>
    </body>
</html>