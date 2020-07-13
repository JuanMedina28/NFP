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
    int id_usuario = usuario.getId_usuario();
    
    /*
    Se toman los valores para la accion que quiere realizar el usuario.
    (Consultar cuenta, Modificar cuenta, Eliminar cuenta)
    En base a la accion, se modifica la interfaz gráfica
    */
    String accion="";
    if(request.getParameter("accion")!=null){
        accion = request.getParameter("accion");
    }
    
    /*
    Se toman los valores para la accion que quiere realizar el usuario y los datos si es que se necesitan.
    Esto es para modificar la cuenta.
    */
    String accionM="", nombreM="", appM="", correoM="", passwordM="";
    if(request.getParameter("accionM")!=null){
        accionM = request.getParameter("accionM");
    }
    if(request.getParameter("nombreM")!=null){
        nombreM = request.getParameter("nombreM");
    }
    if(request.getParameter("appM")!=null){
        appM = request.getParameter("appM");
    }
    if(request.getParameter("correoM")!=null){
        correoM = request.getParameter("correoM");
    }
    if(request.getParameter("passwordM")!=null){
        passwordM = request.getParameter("passwordM");
    }
    
    switch(accionM){
        case "Modificar":
                if(correoM.equals(email)){
                    usuario.setNombre_usuario(nombreM);
                    usuario.setApp_usuario(appM);
                    usuario.setCorreo_usuario(email);
                    usuario.setPassword_usuario(passwordM);
                    usuario.setId_usuario(id_usuario);
                    usuario.updateUsuario();
                    
                    response.sendRedirect("miCuenta.jsp");
                }else{
                    usuario.setCorreo_usuario(correoM);
                    if(usuario.validarCorreoRegistro()){
                        usuario.setNombre_usuario(nombreM);
                        usuario.setApp_usuario(appM);
                        usuario.setCorreo_usuario(correoM);
                        usuario.setPassword_usuario(passwordM);
                        usuario.setId_usuario(id_usuario);
                        usuario.updateUsuario();
                        
                        HttpSession sesion_act = request.getSession();
                        sesion_act.setAttribute("email",correoM);
                        
                        response.sendRedirect("miCuenta.jsp");
                
                    }else{
                        out.print("<script>alert('El correo electrónico ya está en uso')</script>");
                    }
                }                
        break;
        default:
            
        break;
    }
    
    /*
    Se toman los valores para la accion que quiere realizar el usuario y los datos si es que se necesitan.
    Esto es para elimibar la cuenta.
    */
    String accionE="", passwordE="";
    if(request.getParameter("accionE")!=null){
        accionE = request.getParameter("accionE");
    }
    if(request.getParameter("passwordE")!=null){
        passwordE = request.getParameter("passwordE");
    }
    
    switch(accionE){
        case "Eliminar":
                if(passwordE.equals(usuario.getPassword_usuario())){
                    usuario.setId_usuario(id_usuario);
                    usuario.deleteUsuario();
                    response.sendRedirect("cerrarSesion.jsp");
                }else{
                    out.print("<script>alert('Las contraseñas no coinciden')</script>");
                }                

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
                    <div class="col-8">
                        <h2 style="text-align: center; color: white">Bienvenido <% out.print(usuario.getNombre_usuario()+" "+usuario.getApp_usuario()); %></h2>
                    </div>
                    <div class="collapse navbar-collapse" id="navbarSupportedContent" style="margin-right: 2%;">
                        <ul class="navbar-nav ml-auto">
                            <li class="nav-item">
                                <a class="nav-link" href="home.jsp">Inicio</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="contacto.jsp">Contacto</a>
                            </li>
                            <li class="nav-item dropdown active">
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
        <%
        switch(accion){
            case "Modificar":
        %>
        <!-- CONTENIDO PARA MODIFICAR CUENTA -->
        <div class="row1 bg-warning" style="display: flex; padding-top: 5%;">
            <div class="col-4">
            </div>
            <div class="col-4">
                <p>
                    <a class="btn btn-dark" data-toggle="collapse" href="#collapse1" role="button" aria-expanded="false" aria-controls="collapseExample" style="font-size: 20px; width: 100%;">
                        Productos
                    </a>
                </p>
                <div class="collapse show" id="collapse1">
                    <div class="card card-body">
                        <div class="btn-group" role="group" aria-label="Basic example" style="padding-left: 20%;">
                            <form action="miCuenta.jsp" method="POST">
                                <input type="submit" class="btn btn-success" name="accion" value="Consultar">
                                <input type="submit" class="btn btn-warning" name="accion" value="Modificar">
                                <input type="submit" class="btn btn-danger" name="accion" value="Eliminar">
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row bg-warning" style="display: flex; padding-bottom: 5%; padding-top: 5%; min-height: 400px;">
            <div class="col-2">

            </div>
            <div class="col-8 bg-dark">
                <h2 style="color: white; text-align: center; padding-top: 5%;">Modifica tus datos</h2>
                <form action="miCuenta.jsp" method="POST" style="padding-top: 5%; padding-left: 20%; color: white">
                    <div class="form-group row" style="font-size: 20px;">
                        <label for="inputPassword" class="col-sm-2 col-form-label">Nombre(s):</label>
                        <div class="col-6">
                            <input type="text" class="form-control" name="nombreM" value="<% out.print(usuario.getNombre_usuario()); %>" required minlength="3" maxlength="15" title="Min. 3 caracteres, Max. 15 caracteres.">
                        </div>
                    </div>
                    <div class="form-group row" style="font-size: 20px;">
                        <label for="inputPassword" class="col-sm-2 col-form-label">Apellido(s):</label>
                        <div class="col-6">
                            <input type="text" class="form-control" name="appM" value="<% out.print(usuario.getApp_usuario()); %>" required minlength="3" maxlength="15" title="Min. 3 caracteres, Max. 15 caracteres.">
                        </div>
                    </div>
                    <div class="form-group row" style="font-size: 20px;">
                        <label for="inputPassword" class="col-sm-2 col-form-label">Correo:</label>
                        <div class="col-6">
                            <input type="text" class="form-control" name="correoM" value="<% out.print(usuario.getCorreo_usuario()); %>" required pattern="[a-zA-Z0-9]+@+(gmail|hotmail)+\.+(com|mx|org)" title="EJ: correo@dominio.terminacion (DOMINIO: gmail | hotmail y TERMINACIÓN: com | mx | org)">
                        </div>
                    </div>
                    <div class="form-group row" style="font-size: 20px;">
                        <label for="inputPassword" class="col-sm-2 col-form-label">Password:</label>
                        <div class="col-6">
                            <input type="password" class="form-control" name="passwordM" required pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,15}" title="Min. 3 caracteres, Max. 15 caracteres. Debe incluir al menos: 1-Mayuscula, 1-Minuscula y 1-Numero">
                        </div>
                    </div>
                    <div class="form-group row" style="padding-left: 10%; padding-top: 5%; padding-bottom: 5%;">
                        <div class="col-4">
                            <input type="submit" class="btn btn-success" style="width: 100%; font-size: 20px;" name="accionM" value="Modificar"><!-- BOTON INICIAR SESION -->
                        </div>
                        <div class="col-4">
                            <a href="miCuenta.jsp" style="text-decoration: none"><button type="button" class="btn btn-danger" style="width: 100%; font-size: 20px;">Cancelar</button></a> <!-- BOTON REGRESAR -->
                        </div>
                    </div>
                </form>
            </div>
        </div>
        <!-- // CONTENIDO PARA MODIFICAR CUENTA -->
        <%    
        break;
        case "Eliminar":
        %>
        <!-- CONTENIDO PARA ELIMINAR CUENTA -->
        <div class="row1 bg-warning" style="display: flex; padding-top: 5%;">
            <div class="col-4">
            </div>
            <div class="col-4">
                <p>
                    <a class="btn btn-dark" data-toggle="collapse" href="#collapse1" role="button" aria-expanded="false" aria-controls="collapseExample" style="font-size: 20px; width: 100%;">
                        Productos
                    </a>
                </p>
                <div class="collapse show" id="collapse1">
                    <div class="card card-body">
                        <div class="btn-group" role="group" aria-label="Basic example" style="padding-left: 20%;">
                            <form action="miCuenta.jsp" method="POST">
                                <input type="submit" class="btn btn-success" name="accion" value="Consultar">
                                <input type="submit" class="btn btn-warning" name="accion" value="Modificar">
                                <input type="submit" class="btn btn-danger" name="accion" value="Eliminar">
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row bg-warning" style="display: flex; padding-bottom: 5%; padding-top: 5%; min-height: 400px;">
            <div class="col-2">
            </div>
            <div class="col-8 bg-dark">
                <h2 style="color: white; text-align: center; padding-top: 5%;">Ingresa tu contraseña para confirmar.</h2>
                <form action="miCuenta.jsp" method="POST" style="padding-top: 5%; padding-left: 20%; color: white">
                    <div class="form-group row" style="font-size: 20px;">
                        <label for="inputPassword" class="col-sm-2 col-form-label">Password:</label>
                        <div class="col-6">
                            <input type="password" class="form-control" name="passwordE" required>
                        </div>
                    </div>
                    <div class="form-group row" style="padding-left: 10%; padding-top: 5%; padding-bottom: 5%;">
                        <div class="col-4">
                            <input type="submit" class="btn btn-success" style="width: 100%; font-size: 20px;" name="accionE" value="Eliminar"><!-- BOTON INICIAR SESION -->
                        </div>
                        <div class="col-4">
                            <a href="miCuenta.jsp" style="text-decoration: none"><button type="button" class="btn btn-danger" style="width: 100%; font-size: 20px;">Cancelar</button></a><!-- BOTON REGRESAR -->
                        </div>
                    </div>
                </form>
            </div>
        </div>
        <!-- // CONTENIDO PARA ELIMINAR CUENTA -->
        <%    
        break;
        default:
        %>
        <!-- CONTENIDO POR DEFAULT DE LA CUENTA -->
        <div class="row1 bg-warning" style="display: flex; padding-top: 5%;">
            <div class="col-4">
            </div>
            <div class="col-4">
                <p>
                    <a class="btn btn-dark" data-toggle="collapse" href="#collapse1" role="button" aria-expanded="false" aria-controls="collapseExample" style="font-size: 20px; width: 100%;">
                        Productos
                    </a>
                </p>
                <div class="collapse show" id="collapse1">
                    <div class="card card-body">
                        <div class="btn-group" role="group" aria-label="Basic example" style="padding-left: 20%;">
                            <form action="miCuenta.jsp" method="POST">
                                <input type="submit" class="btn btn-success" name="accion" value="Consultar">
                                <input type="submit" class="btn btn-warning" name="accion" value="Modificar">
                                <input type="submit" class="btn btn-danger" name="accion" value="Eliminar">
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row1 bg-warning" style="display: flex; padding-bottom: 5%; padding-top: 5%; min-height: 400px;">
            <div class="col-2">
            </div>
            <div class="col-8">
                <table class="table table-bordered">
                    <thead class="thead-dark">
                        <tr>
                            <th scope="col">Nombre(s)</th>
                            <th scope="col">Apellido(s)</th>
                            <th scope="col">Correo electrónico</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td><% out.print(usuario.getNombre_usuario()); %></td>
                            <td><% out.print(usuario.getApp_usuario()); %></td>
                            <th scope="row"><% out.print(email); %></th>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
        <!-- // CONTENIDO POR DEFAULT DE LA CUENTA -->
        <%
        break;
    }
        %>
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