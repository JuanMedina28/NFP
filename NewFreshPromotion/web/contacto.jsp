<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
        /*
    Asigna un valor a la variable email en caso de que se haya iniciado sesion
    De lo contrario, deja la variable nula
    */
    HttpSession sesion = request.getSession();
    String email=(String)sesion.getAttribute("email");
    
    /*
    Retoma los valores de los campos para enviar un correo.
    */
    
    String accion="", nombre="", correo="", mensaje="";
    
    if(request.getParameter("accion")!=null){
        accion = request.getParameter("accion");
    }
    if(request.getParameter("nombre")!=null){
        nombre = request.getParameter("nombre");
    }
    if(request.getParameter("correo")!=null){
        correo = request.getParameter("correo");
    }
    if(request.getParameter("mensaje")!=null){
        mensaje = request.getParameter("mensaje");
    }
    
    switch(accion){
        case "Enviar":
            if(nombre.equals("") & correo.equals("") & mensaje.equals("")){
                out.print("<script>alert('Por favor llena los campos necesarios')</script>");
            }else{
                response.sendRedirect("index.jsp");
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
    <!-- ALERTA DE ENVIO EXITOSO -->
    <script>
        function alertaConfirm() {
            alert("Envio exitoso");
        }
    </script>
    <!-- // ALERTA DE ENVIO EXITOSO -->
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
                            <li class="nav-item">
                                <a class="nav-link" href="index.jsp">Inicio</a>
                            </li>
                            <li class="nav-item active">
                                <a class="nav-link" href="contacto.jsp">Contacto</a>
                            </li>
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    Mi cuenta
                                </a>
                                <%
                                    if(email!=null){
                                %>
                                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                    <a class="dropdown-item" href="miCuenta.jsp">Consultar</a>
                                    <a class="dropdown-item" href="cerrarSesion.jsp">Cerrar sesión</a>
                                </div>
                                <%        
                                    }else{
                                %>
                                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                    <a class="dropdown-item" href="iniciarSesion.jsp">Iniciar sesión</a>
                                    <a class="dropdown-item" href="registrarse.jsp">Registrarse</a>
                                </div>
                                <%
                                    }
                                %>
                            </li>
                        </ul>
                    </div>
                </nav>
            </div>
        </div>
        <!-- // BARRA DE NAVEGACION -->

        <!-- FORMULARIO DE CONTACTO-->
        <div class="row">
            <div class="col-2">

            </div>
            <div class="col-8" style="padding: 5%;">
                <section class="mb-4">
                    <h2 class="h1-responsive font-weight-bold text-center my-4">Contactanos</h2>
                    <p class="text-center w-responsive mx-auto mb-5">¿Tienes alguna duda sobre nuestro sitio web?, ¿Tienes algún problema?, Por favor, escribenos y responderemos cuanto antes.</p>
                    <div class="row">
                        <div class="col-md-12 mb-md-0 mb-6">
                            <form action="contacto.jsp" method="POST">
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="md-form mb-0">
                                            <label for="name" class="">Nombre:</label>
                                            <input type="text" id="name" name="nombre" class="form-control" required minlength="3" maxlength="15" title="Min. 3 caracteres, Max. 15 caracteres.">
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="md-form mb-0">
                                            <label for="email" class="">Correo electrónico:</label>
                                            <input type="text" id="email" name="correo" class="form-control" required pattern="[a-zA-Z0-9]+@+(gmail|hotmail)+\.+(com|mx|org)" title="EJ: correo@dominio.terminacion (DOMINIO: gmail | hotmail y TERMINACIÓN: com | mx | org)">
                                        </div>
                                    </div>
                                </div><br>
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="md-form">
                                            <label for="message">Escribenos tus dudas:</label>
                                            <textarea type="text" id="message" name="mensaje" rows="6" class="form-control md-textarea" style="resize: none" minlength="10" maxlength="500"></textarea>
                                        </div>
                                    </div>
                                </div><br>
                                <div class="row">
                                    <div class="col-2">

                                    </div>
                                    <div class="col-4">
                                        <input type="submit" class="btn btn-success" style="width: 100%; font-size: 20px;" onclick="alertaConfirm()" name="accion" value="Enviar"><!-- BOTON ENVIAR -->
                                    </div>
                                    <div class="col-4">
                                        <input type="submit" class="btn btn-danger" style="width: 100%; font-size: 20px;" name="accion" value="Regresar"><!-- BOTON REGRESAR -->
                                    </div>
                                </div>
                            </form>
                            <div class="status"></div>
                        </div>
                    </div>
                </section>
            </div>
        </div>
        <!-- // FORMULARIO DE CONTACTO -->

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