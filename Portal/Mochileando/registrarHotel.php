<!doctype html>

<?php
    include 'php/driver.php';
?>


<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link rel="stylesheet" href="assets/css/styleRegistro.css">
    <title>Registrar Hotel</title>
  </head>
  <body>
    
    <div class="container">
        <div class="row">
            <div class="col-md-6 offset-md-3">
                <div class="signup-form">
                    <form  method="POST" class="mt-5 p-4 bg-light">
                        <h3 class="mb-5 text-secondary">Registro de Hotel</h3>
                        
                        <div class="mb-3">
                            <label>Nombre</label>
                            <input type="text" name="nombre" class="form-control" placeholder="Ingrese su nombre" required>
                        </div>

                        <div class="mb-3">
                            <label>Localidad</label>
                            <input type="tex" name="localidad" class="form-control" placeholder="ingrese su localidad" required>
                        </div>

                        <div class="mb-3">
                            <label>Correo Electronico</label>
                            <input type="email" name="correo" class="form-control" placeholder="Ingrese su correo electronico" required>
                        </div>

                        <div class="mb-3">
                            <label>Telefono</label>
                            <input type="text" name="telefono" class="form-control" placeholder="Ingrese su numero de telefono" required>
                        </div>

                        <div class="mb-3">
                            <label>Usuario</label>
                            <input type="text" name="usuario" class="form-control" placeholder="Ingrese su usuario" required>
                        </div>

                        <div class="mb-3">
                            <label>Contraseña</label>
                            <input type="text" name="contraseña" class="form-control" placeholder="Ingrese su contraseña" required>
                        </div>

                        <div class="mb-3">
                           <button class="btn btn-primary float-end" name="enviar">Crear Usuario</button>
                        </div>

                    </form>
                </div>
            </div>
        </div>
    </div>


    <!-- Functional code -->
    <?php
        if(isset($_POST['enviar'])){
            $nombre = $_POST ['nombre'];
            $localidad = $_POST ['localidad'];
            $correo = $_POST ['correo'];
            $telefono = $_POST ['telefono'];
            $usuario = $_POST ['usuario'];
            $contraseña  = $_POST ['contraseña'];

            $consulta = "EXECUTE dbo.sp_InsertarHotel '$nombre', '$usuario', 
                        '$contraseña', '$localidad', '$correo', $telefono";
            
            $ejecutar = sqlsrv_query ($conn_sis, $consulta);
            if($ejecutar){
                $fila = sqlsrv_fetch_object( $ejecutar);
                
                if($fila->Codigo == 0) {
                    echo"<script>alert('Se creo correctamente el usuario')</script>";
                    echo"<script>window.open('index.php', '_self')</script>";
                }else if($fila->Codigo == 1){
                    echo"<script>alert('El usuario ya existe, pruebe con otro')</script>";
                }else {
                    echo '
                    <script>
                        alert("Datos ingresados erroneamente");
                    </script>
                ';
                }

            }
            else{
                echo"<script>alert('Error, intentelo de nuevo mas tarde')</script>";
                echo"<script>window.open('index.php', '_self')</script>";
            }

        }
    ?>


    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
  </body>
</html>