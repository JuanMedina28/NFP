<%
    /*
    Asigna un valor a la variable email en caso de que se haya iniciado sesion
    De lo contrario, deja la variable nula
    */
    HttpSession sesion = request.getSession();
    String email=(String)sesion.getAttribute("email");
    
    /*
    Valida si hay una sesion activa.
    En caso de que exista una sesion activa, se redirige al home
    */
    if(email!=null){
        response.sendRedirect("home.jsp");
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

        <title>Index</title>
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
                            <li class="nav-item active">
                                <a class="nav-link" href="index.jsp">Inicio</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="contacto.jsp">Contacto</a>
                            </li>
                            <li class="nav-item dropdown">
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

        <!-- DIV BIENVENIDA -->
        <div class="row-cols-1">
            <div class="col bg-warning">
                <div class="row">
                    <div class="col-4">
                        <img src="img/logo-1.png" class="img-fluid" style="width: 40%; margin-top: 3%; margin-left: 75%;">
                    </div>
                    <div class="col-8">
                        <blockquote class="blockquote text-center">
                            <p class="mb-0" style="text-align: center; margin-right: 30%; margin-top: 5%;">Bienvenido a Hersan Stock, cangea y gana grandes premios.</p>
                            <footer class="blockquote-footer" style="text-align: center; margin-right: 30%;">Siempre gana con <cite title="Source Title">HERSAN STOCK</cite></footer>
                        </blockquote>
                        <h2 style="text-align: center; margin-right: 10%; margin-top: 3%;"></h2>                           
                    </div>
                </div>                    
            </div>
        </div>
        <!-- // DIV BIENVENIDA -->

        <!-- CARRUSEL -->
        <div class="row">
            <div class="col">
                <div id="carouselExampleCaptions" class="carousel slide" data-ride="carousel">
                    <ol class="carousel-indicators">
                        <li data-target="#carouselExampleCaptions" data-slide-to="0" class="active"></li>
                        <li data-target="#carouselExampleCaptions" data-slide-to="1"></li>
                        <li data-target="#carouselExampleCaptions" data-slide-to="2"></li>
                    </ol>
                    <div class="carousel-inner">
                        <div class="carousel-item active">
                            <img src="img/slider-1.jpg" class="d-block w-100" style="height: 600px;">
                            <div class="carousel-caption d-none d-md-block">
                                <h5>¡No tires las taparoscas!</h5>
                                <p>Conservalas y cangea el código por grandes premios.</p>
                            </div>
                        </div>
                        <div class="carousel-item">
                            <img src="img/slider-2.jpg" class="d-block w-100" style="height: 600px;">
                            <div class="carousel-caption d-none d-md-block">
                                <h5>¡Obten nuestros productos!</h5>
                                <p>Puedes elegir entre una gran variedad de productos.</p>
                            </div>
                        </div>
                        <div class="carousel-item">
                            <img src="img/slider-3.jpg" class="d-block w-100" style="height: 600px;">
                        </div>
                    </div>
                    <a class="carousel-control-prev" href="#carouselExampleCaptions" role="button" data-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="sr-only">Previous</span>
                    </a>
                    <a class="carousel-control-next" href="#carouselExampleCaptions" role="button" data-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="sr-only">Next</span>
                    </a>
                </div>
            </div>
        </div>
        <!-- // CARRUSEL -->

        <!-- ITEMS INFORMATIVOS -->
        <div class="row1 bg-warning" style="display: flex; padding-left: 10%; padding-top: 5%; padding-bottom: 5%; text-align: center">
            <div class="col-4">
                <div class="card" style="width: 18rem;">
                    <img src="img/despensa-1.jpg" class="card-img-top" style="width: 286px; height: 242px">
                    <div class="card-body">
                        <p class="card-text">¡Entre más grande el producto, más puntos obtendras!</p>
                    </div>
                </div>
            </div>
            <div class="col-4">
                <div class="card" style="width: 18rem;">
                    <img src="img/despensa-2.png" class="card-img-top" style="width: 286px; height: 242px">
                    <div class="card-body">
                        <p class="card-text">Puedes elegir entre diferentes tamaños y todos tienen códigos.</p>
                    </div>
                </div>
            </div>
            <div class="col-4">
                <div class="card" style="width: 18rem;">
                    <img src="img/despensa-3.jpg" class="card-img-top" style="width: 286px; height: 242px">
                    <div class="card-body">
                        <p class="card-text">Registra los códigos en nuestro sitio oficial.</p>
                    </div>
                </div>
            </div>
        </div>
        <!-- // ITEMS INFORMATIVOS -->

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