<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="Modelo.Usuario" %>
<%
    Usuario usuario = new Usuario();
    String accion="", correo="", password="";
    
    if(request.getParameter("accion")!=null){
        accion = request.getParameter("accion");
    }
    if(request.getParameter("correo")!=null){
        correo = request.getParameter("correo");
    }
    if(request.getParameter("password")!=null){
        password = request.getParameter("password");
    }
    
    switch(accion){
        case "Iniciar Sesion":
            if(correo.equals("") & password.equals("")){
                out.print("<script>alert('Por favor llena los campos necesarios')</script>");
            }else{
                usuario.setCorreo_usuario(correo);
                usuario.setPassword_usuario(password);
                if(usuario.iniciarSesion()){
                    HttpSession sesion_act = request.getSession();
                    sesion_act.setAttribute("email",correo);
                
                    response.sendRedirect("home.jsp");
                }else{
                    out.print("<script>alert('Correo y/o contraseña incorrectos')</script>");
                }
            }
        break;
        case "Regresar":
            response.sendRedirect("index.jsp");
        break;
        default:
            
        break;
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
                    <div class="collapse navbar-collapse" id="navbarSupportedContent" style="margin-right: 2%;">
                        <ul class="navbar-nav ml-auto">
                            <li class="nav-item ">
                                <a class="nav-link" href="index.jsp">Inicio</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="contacto.jsp">Contacto</a>
                            </li>
                            <li class="nav-item dropdown active">
                                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    Mi cuenta
                                </a>
                                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                    <a class="dropdown-item" href="iniciarSesion.jsp">Iniciar sesión</a>
                                    <a class="dropdown-item" href="registrarse.jsp">Registrarse</a>
                                </div>
                            </li>
                        </ul>
                    </div>
                </nav>
            </div>
        </div>
        <!-- // BARRA DE NAVEGACION -->

        <!-- FORMULARIO INICIAR SESION -->
        <div class="row bg-warning" style="margin-left: 25%; margin-right: 25%; margin-top: 5%; margin-bottom: 5%; border-radius: 5%;">
            <div class="col">
                <div class="form-group row" style="padding-left: 39%; padding-top: 5%;">
                    <h1>Iniciar sesión.</h1>
                </div>
                <form action="iniciarSesion.jsp" method="POST" style="padding-top: 5%; padding-left: 20%;">
                    <div class="form-group row" style="font-size: 20px;">
                        <label for="inputPassword" class="col-sm-2 col-form-label">Correo:</label>
                        <div class="col-6">
                            <input type="email" class="form-control" name="correo" required pattern="[a-zA-Z0-9]+@+(gmail|hotmail)+\.+(com|mx|org)" title="EJ: correo@dominio.terminacion (DOMINIO: gmail | hotmail y TERMINACIÓN: com | mx | org)">
                        </div>
                    </div>
                    <div class="form-group row" style="font-size: 20px;">
                        <label for="inputPassword" class="col-sm-2 col-form-label">Password:</label>
                        <div class="col-6">
                            <input type="password" class="form-control" name="password" required>
                        </div>
                    </div>
                    <div class="form-group row" style="padding-left: 10%; padding-top: 5%">
                        <div class="col-4">
                            <input type="submit" class="btn btn-success" style="width: 100%; font-size: 20px;" name="accion" value="Iniciar Sesion"><!-- BOTON INICIAR SESION -->
                        </div>
                        <div class="col-4">
                            <a href="index.jsp" style="text-decoration: none"><button type="button" class="btn btn-danger" style="width: 100%; font-size: 20px;">Cancelar</button></a><!-- BOTON REGRESAR -->
                        </div>
                    </div>
                    <div class="form-group row" style="padding-top: 5%; font-size: 15px; padding-left: 3%; margin-bottom: 10%;">
                        <p style="margin-right: 2%; color: #343a40">¿No tienes una cuenta?</p>
                        <b><a href="registrarse.jsp" style="text-decoration: none; color: black">¡Registrate ahora!</a></b>
                    </div>
                </form>
            </div>
        </div>
        <!-- // FORMULARIO INICIAR SESION -->

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