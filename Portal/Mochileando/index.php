<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" href="assets/css/styleLogin.css">
    <title>Login Mochileando</title>

  </head>
  <body>
   
    <section class="Form my-4 mx-5">
        <div class="container">
            <div class="row no-gutters">
                <div class="col-lg-5">
                    <img src="assets/backgrounds/cab.jpg" class="img-fluid"alt="">
                </div>
                <div class="col-lg-7 px-5 pt-5">
                    <h1 class="font-weight-bold py-3">Mochileando</h1>
                    <h4>Login</h4>
                    <form action="php/login.php" method="POST">
                        <div class="form-row">
                            <div class="col-lg 7">
                                <input type="text" placeholder="Usuario" name="usuario" required class="form-control my-3 p-4">
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="col-lg 7">
                                <input type="password" placeholder="Contraseña" name="contrasena" required class="form-control my-3 p-4">
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="col-lg 7">
                               <button type="submit" class="btn1 mt-3 mb-5"> Iniciar Sesión </button>
                            </div>
                        </div>

                        <p>¿No tienes una cuenta? </p>
                        <br />
                        <p>Crea una cuenta de cliente <a href="registrarCliente.php">aquí</a></p>
                        <p>Crea una cuenta de hotel <a href="registrarHotel.php">aquí</a></p>
                    </form>
                </div>
            </div>
        </div>
    </section>

  </body>
</html>