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

            <a href="miHotel.php" class="selected" style="text-decoration:none">
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

            <a href="editarHotel.php" style="text-decoration:none">
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
                        <h2 class="text-center font-weight-bold">Mi Información</h2>
                    </div>
                </div>
                <br>
                <div class="row">
                    <div class="col-lg-5">
                        <img src="<?php echo $rutaImagen; ?>" class="img-thumbnail" alt="">
                    </div>
                    <div class="col-lg-7 px-5">
                        <div class="form-row">
                            <div class="form-group row">
                                <h4 class="col-lg-3">Usuario: </h4>
                                <div class="col-lg-8">
                                    <h5><?php echo $usuario; ?></h5>
                                </div>
                            </div>
                            <br>
                            <div class="form-group row">
                                <h4 class="col-lg-3">Nombre: </h4>
                                <div class="col-lg-8">
                                    <h5><?php echo $nombre; ?></h5>
                                </div>
                            </div>
                            <br>
                            <div class="form-group row">
                                <h4 class="col-lg-3">Localidad: </h4>
                                <div class="col-lg-8">
                                    <h5><?php echo $localidad; ?></h5>
                                </div>
                            </div>
                            <br>
                            <div class="form-group row">
                                <h4 class="col-lg-3">Calificación: </h4>
                                <div class="col-lg-8">
                                    <h5><?php echo $calificacion.' Estrellas'; ?></h5>
                                </div>
                            </div>
                            <br>
                            <div class="form-group row">
                                <h4 class="col-lg-3">Correo: </h4>
                                <div class="col-lg-8">
                                    <h5><?php echo $correo; ?></h5>
                                </div>
                            </div>
                            <br>
                            <div class="form-group row">
                                <h4 class="col-lg-3">Telefono: </h4>
                                <div class="col-lg-8">
                                    <h5><?php echo $telefono; ?></h5>
                                </div>
                            </div>

                        </div>

                    </div>
                </div>
            </div>
        </section>

    </main>

    
    <script src="../assets/js/prueba.js"></script>
</body>
</html>