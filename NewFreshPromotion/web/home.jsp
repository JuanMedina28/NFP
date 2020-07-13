<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Modelo.Usuario" %>
<%
    /*
    Asigna un valor a la variable email en caso de que se haya iniciado sesion
    De lo contrario, deja la variable nula
    */
    HttpSession sesion = request.getSession();
    String email=(String)sesion.getAttribute("email");
    
    /*
    Asigna valores a las variables si existe una sesion.
    Retoma datos del usuario para poder utilizarlos más adelante
    */
    Usuario usuario = new Usuario(email);
    String nombre_usu = usuario.getNombre_usuario();
    String app_usu = usuario.getApp_usuario();
    int id_usu = usuario.getId_usuario();
    
    /*
    Valida si hay una sesion activa.
    En caso de que no exista una sesion activa, se redirige al index
    */
    if(email==null){
        response.sendRedirect("index.jsp");
    }

%>
<!doctype html>
<html lang="en">
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">

        <title>Hello, world!</title>
    </head>
    <body>
        <!-- BARRA DE NAVEGACION -->
        <div class="row">
            <div class="col">
                <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
                    <a class="navbar-brand" href="">HERSAN STOCK</a>
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="col-8">
                        <h2 style="text-align: center; color: white">Bienvenido <% out.print(nombre_usu+" "+app_usu); %></h2>
                    </div>
                    <div class="collapse navbar-collapse" id="navbarSupportedContent" style="margin-right: 2%;">
                        <ul class="navbar-nav ml-auto">
                            <li class="nav-item active">
                                <a class="nav-link" href="home.jsp">Inicio</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="contacto.jsp">Contacto</a>
                            </li>
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    Mi cuenta
                                </a>
                                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                    <a class="dropdown-item" href="miCuenta.jsp">Consultar</a>
                                    <a class="dropdown-item" href="cerrarSesion.jsp">Cerrar sesión</a>
                                </div>
                            </li>
                        </ul>
                    </div>
                </nav>
            </div>
        </div>
        <!-- // BARRA DE NAVEGACION -->

        <!-- CONTENIDO ACCIONES -->

        <div class="row1 bg-warning" style="display: flex; padding-top: 5%; padding-bottom: 5%; min-height: 500px;">
            <div class="col-4">

            </div>
            <div class="col-4">
                <p>
                    <a class="btn btn-dark" data-toggle="collapse" href="#collapse1" role="button" aria-expanded="false" aria-controls="collapseExample" style="font-size: 20px; width: 100%;">
                        Productos
                    </a>
                </p>
                <div class="collapse" id="collapse1">
                    <div class="card card-body">
                        <div class="btn-group" role="group" aria-label="Basic example">
                            <form action="productos.jsp" method="POST">
                                <input type="submit" class="btn btn-success" name="accionP" value="Cangear código" disabled data-toggle="tooltip" data-placement="right" title="Disponible proximamente">
                            </form>
                        </div>
                    </div>
                </div><br>
                <p>
                    <a class="btn btn-dark" data-toggle="collapse" href="#collapse2" role="button" aria-expanded="false" aria-controls="collapseExample" style="font-size: 20px; width: 100%;">
                        Premios
                    </a>
                </p>
                <div class="collapse" id="collapse2">
                    <div class="card card-body">
                        <div class="btn-group" role="group" aria-label="Basic example">
                            <form action="productos.jsp" method="POST">
                                <input type="submit" class="btn btn-success" name="accionP" value="Cangear premios" disabled data-toggle="tooltip" data-placement="right" title="Disponible proximamente">
                            </form>
                        </div>
                    </div>
                </div><br>
                <p>
                    <a class="btn btn-dark" data-toggle="collapse" href="#collapse3" role="button" aria-expanded="false" aria-controls="collapseExample" style="font-size: 20px; width: 100%;">
                        Consultar
                    </a>
                </p>
                <div class="collapse" id="collapse3">
                    <div class="card card-body">
                        <div class="btn-group" role="group" aria-label="Basic example">
                            <form action="productos.jsp" method="POST">
                                <input type="submit" class="btn btn-success" name="accionP" value="Consultar puntos" disabled data-toggle="tooltip" data-placement="right" title="Disponible proximamente">
                                <input type="submit" class="btn btn-success" name="accionP" value="Consultar bases" disabled data-toggle="tooltip" data-placement="right" title="Disponible proximamente">
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- // CONTENIDO ACCIONES -->

        <!-- FOOTER REDES -->
        <div class="row-cols-1">
            <div class="col bg-dark" style="height: 200px; padding-left: 2%;">
                <div class="row">
                    <div class="col-2" style="padding-top: 5%">
                        <img src="icon/facebook.png" class="img-fluid" style="width: 30%;">
                        <a href="" style="text-decoration: none; font-size: 25px;">FACEBOOK</a>
                    </div>
                    <div class="col-2"  style="padding-top: 5%">
                        <img src="icon/instagram.png" class="img-fluid" style="width: 30%;">
                        <a href="" style="text-decoration: none; font-size: 25px; color: #e83e8c">INSTAGRAM</a>
                    </div>
                    <div class="col-2"  style="padding-top: 5%">
                        <img src="icon/twitter.png" class="img-fluid" style="width: 30%;">
                        <a href="" style="text-decoration: none; font-size: 25px; color: lightskyblue">TWITTER</a>
                    </div>
                    <div class="col-2"  style="padding-top: 5%">
                        <img src="icon/youtube.png" class="img-fluid" style="width: 30%;">
                        <a href="" style="text-decoration: none; font-size: 25px; color: red">YOUTUBE</a>
                    </div>
                    <div class="col-4"  style="padding-top: 3%">
                        <div  style="color: #FFFF; text-align: justify; padding-right: 10%">
                            <h2>CONTACTANOS.</h2>
                            <p>Para más información o dudas, comunicate al correo: hersan_stock@enterprise.com</p>
                        </div>
                    </div>
                </div>                    
            </div>
        </div>
        <!-- //FOOTER REDES -->

        <!-- Optional JavaScript -->
        <!-- jQuery first, then Popper.js, then Bootstrap JS -->
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
    </body>
</html>
