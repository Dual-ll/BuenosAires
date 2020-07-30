<%-- 
    Document   : agregarEmpleado
    Created on : 15-05-2019, 12:07:32
    Author     : duoc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Agregar Empleado</title>
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
                    <li class="active"><a href="agregarEmpleado.jsp">Agregar</a></li>
                    <li><a href="modificarEmpleado.jsp">Modificar</a></li>
                    <li><a href="eliminarEmpleado.jsp">Eliminar</a></li>
                    <li><a href="Listar">Listar</a></li>
                </ul>
            </div>
        </nav>

        <div class="jumbotron text-center">
            <h1>Agregar Empleado</h1>
            <p>La mejor empresa de recursos humanos</p>
        </div>

        <div class="container">
            <div class="row">
                <div class="col-sm-2">

                </div>
                <div class="col-sm-8">
                    <c:if test="${respuesta!=null}">
                        <c:if test="${respuesta==true}">
                            <div class="alert alert-success">Empleado Guardado</div>
                        </c:if>
                        <c:if test="${respuesta==false}">
                            <div class="alert alert-danger">Empleado NO Guardado</div>
                        </c:if>
                    </c:if>

                    <form action="servletGuardar" method="POST">

                        <h1>Formulario de Empleado</h1>

                        <h3>Rut:</h3>
                        <input type="text" name="txtRut" class="form-control" placeholder="Ingrese rut" required>

                        <h3>Nombre:</h3>
                        <input type="text" name="txtNombre" class="form-control" placeholder="Ingrese Nombre" required>

                        <h3>Apellido:</h3>
                        <input type="text" name="txtApellido" class="form-control" placeholder="Ingrese Apellido" required>

                        <h3>Edad:</h3>
                        <input type="number" name="txtEdad" class="form-control" placeholder="Ingrese Edad" required>
                        <br>
                        <input type="submit" value="Guardar Empleado" class="btn btn-success">
                        <br>
                    </form>
                </div>
                <div class="col-sm-2">

                </div>

            </div>
        </div>
    </body>
</html>
