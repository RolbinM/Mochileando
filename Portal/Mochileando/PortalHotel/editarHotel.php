<!DOCTYPE html>

<?php
    include '../php/driver.php';
    
    session_start();
    $usuario = $_SESSION['usuario'];  
    
    $consulta = "EXECUTE dbo.sp_ConsultaHotelEspecifica '$usuario'";
    $ejecutar = sqlsrv_query ($conn_sis, $consulta);

    $fila = sqlsrv_fetch_array($ejecutar);

    $nombre = $fila ['Nombre'];
    $localidad = $fila ['Localidad'];
    $calificacion = $fila ['Calificación'];
    $correo = $fila ['Correo'];
    $telefono = $fila ['Telefono'];
    $urlImagen = $fila ['Imagen'];
    $contra = $fila ['Contraseña'];

    $rutaImagen = '../'.$urlImagen;
?>


<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mochileando</title>

    <!-- Bootstrap CSS -->
    <link rel ="stylesheet" href="../assets/css/estiloHotel.css">
    <link href="../assets/css/bootstrap.min.css" rel="stylesheet">

    <script src="https://kit.fontawesome.com/41bcea2ae3.js" crossorigin="anonymous"></script>
  </head>
<body id="body">
    <div class="menu__side" id="menu_side">

        <div class="name__page">
            <i class="fas fa-hiking" id="btn_open" style= "cursor: pointer"></i>
            <h4>Mochileando</h4>
        </div>

        <div class="options__menu">	

            <a href="miHotel.php" style="text-decoration:none">
                <div class="option">
                    <i class="far fa-address-card" title="Mi Hotel"></i>
                    <h4>Mi Hotel</h4>
                </div>
            </a>

            <a href="misHospedajes.php" style="text-decoration:none">
                <div class="option">
                    <i class="fas fa-hotel" title="Mis Hospedajes"></i>
                    <h4>Mis Hospedajes</h4>
                </div>
            </a>

            <a href="crearHospedaje.php" style="text-decoration:none">
                <div class="option">
                    <i class="fas fa-plus" title="Crear Hospedaje"></i>
                    <h4>Crear Hospedaje</h4>
                </div>
            </a>
            
            <a href="editarHotel.php" class="selected" style="text-decoration:none">
                <div class="option">
                    <i class="fas fa-pencil-alt" title="Editar Hotel"></i>
                    <h4>Editar Hotel</h4>
                </div>
            </a>

            <a href="../php/cerrar_sesion.php" style="text-decoration:none">
                <div class="option">
                    <i class="fas fa-sign-out-alt" title="Cerrar Sesión"></i>
                    <h4>Cerrar Sesión</h4>
                </div>
            </a>

        </div>

    </div>

    <main>
        <section class="Form my-4 mx-5">
            <div class="container">
                <br>
                <div class="row justify-content-center">
                    <div class="col-md-5 rounded shadow bg-dark">
                        <h2 class="text-center font-weight-bold">Editar mi información</h2>
                    </div>
                </div>
                <br>
                <div class="row">
                    <div class="col-lg-5">
                        <img src="<?php echo $rutaImagen; ?>" class="img-thumbnail" alt="">
                    </div>
                    <div class="col-lg-7 px-5">
                        <form  method="POST" class="mt-1 p-1" enctype="multipart/form-data">
                            <div class="form-group row">
                                <h4 class="col-lg-3">Usuario: </h4>
                                <div class="col-lg-8">
                                    <input type="text" value="<?php echo $usuario ?>" name="usuario" required class="form-control">
                                </div>
                            </div>
                            <br>
                            <div class="form-group row">
                                <h4 class="col-lg-3">Contraseña: </h4>
                                <div class="col-lg-8">
                                    <input type="text" value="<?php echo $contra ?>" name="contraseña" required class="form-control" title="La contraseña contener una mayuscula, una minuscula, un número, un caracter y debe ser de más de 8 caracteres" pattern="(?=(?:.*\d){1})(?=(?:.*[A-Z]){1})(?=(?:.*[a-z]){1})(?=(?:.*[@$+=`~?><#%&*!ยก\-_]){1})\S{6,}">
                                </div>
                            </div>
                            <br>
                            <div class="form-group row">
                                <h4 class="col-lg-3">Nombre: </h4>
                                <div class="col-lg-8">
                                    <input type="text" value="<?php echo $nombre ?>" name="nombre" required class="form-control">
                                </div>
                            </div>
                            <br>
                            <div class="form-group row">
                                <h4 class="col-lg-3">Localidad: </h4>
                                <div class="col-lg-8">
                                    <input type="text" value="<?php echo $localidad ?>" name="localidad" required class="form-control">
                                </div>
                            </div>
                            <br>
                            <div class="form-group row">
                                <h4 class="col-lg-3">Correo: </h4>
                                <div class="col-lg-8">
                                    <input type="text" value="<?php echo $correo ?>" name="correo" required class="form-control">
                                </div>
                            </div>
                            <br>
                            <div class="form-group row">
                                <h4 class="col-lg-3">Teléfono: </h4>
                                <div class="col-lg-8">
                                    <input type="text" value="<?php echo $telefono ?>" name="telefono" required class="form-control">
                                </div>
                            </div>
                            <br>
                            <div class="form-group row">
                                <h4 class="col-lg-3">Imagen: </h4>
                                <div class="col-lg-8">
                                <input type="file" name="imagen" class="form-control" accept="image/*">
                                </div>
                            </div>

                            <br><br>
                            <div class="mb-3">
                                <button class="btn btn-primary float-end" name="enviar">Guardar </button>
                            </div>
                            <br>

                        </form>

                    </div>
                </div>
            </div>
        </section>


        <?php
            if(isset($_POST['enviar'])){
                $usuarioNuevo = $_POST ['usuario'];
                $contraseña = $_POST ['contraseña'];
                $nombre = $_POST ['nombre'];
                $localidad = $_POST ['localidad'];
                $correo = $_POST ['correo'];
                $telefono  = $_POST ['telefono'];

                if($_FILES["imagen"]["name"] != null){
                    $ruta = 'imagenes/'.$_FILES["imagen"]['name'];
                }
                else{
                    $ruta = $urlImagen;
                }

                $consulta = "EXECUTE dbo.sp_ActualizarHotel '$usuario', '$nombre', '$usuarioNuevo', 
                            '$contraseña', '$localidad', '$correo', $telefono, '$ruta'";
                
                $ejecutar = sqlsrv_query ($conn_sis, $consulta);
                if($ejecutar){
                    $fila = sqlsrv_fetch_object( $ejecutar);
                    
                    if($fila->Codigo == 0) {
                        if($_FILES["imagen"]["name"] != null){
                            $_SESSION ['usuario'] = $usuarioNuevo;
                            $ruta = '../'.$ruta;
                            unlink($rutaImagen);
                            move_uploaded_file($_FILES["imagen"]['tmp_name'],$ruta);
                        }

                        echo"<script>alert('Se modifico correctamente el hotel')</script>";
                        echo"<script>window.open('editarHotel.php', '_self')</script>";
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
                }
            }
        ?>
    </main>

    
    <script src="../assets/js/prueba.js"></script>
</body>
</html>