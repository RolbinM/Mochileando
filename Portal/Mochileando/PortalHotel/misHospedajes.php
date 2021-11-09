<!DOCTYPE html>

<?php
    include '../php/driver.php';
    
    session_start();
    $usuario = $_SESSION['usuario'];  

    $consulta = "SELECT Id FROM dbo.Usuario WHERE Usuario = '$usuario'";
    $ejecutar = sqlsrv_query ($conn_sis, $consulta);
    $fila = sqlsrv_fetch_array($ejecutar);
    $idUsuario = $fila['Id'];
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

            <a href="misHospedajes.php" class="selected" style="text-decoration:none">
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
                        <h2 class="text-center font-weight-bold">Mis Hospedajes</h2>
                    </div>
                </div>
                <br>
                <div class="row">

                    <?php
                        $consulta = "EXECUTE dbo.sp_ConsultaHospedajeHotel $idUsuario ";
                        $ejecutar = sqlsrv_query ($conn_sis, $consulta);

                        while($fila = sqlsrv_fetch_array($ejecutar)){
                        ?>
                             <form method="post" class="col-12 p-3 justify-content-center">
                                <div class="card border-dark text-dark">
                                    <div class="card-header">
                                       <?php echo $fila['Nombre'] ?>
                                    </div>
                                    <div class="card-body">
                                        <p class="card-text">
                                            <dl class="row">
                                                <dt class="col-sm-2">Código:</dt>
                                                <dd class="col-sm-10" name='id'><?php echo $fila['Id'] ?></dd>
                                                <hr>
                                                <dt class="col-sm-2">Localidad:</dt>
                                                <dd class="col-sm-10" name='localidad'><?php echo $fila['Localidad'] ?></dd>
                                                <hr>
                                                <dt class="col-sm-2">Espacios:</dt>
                                                <dd class="col-sm-10" name='espacios'><?php echo $fila['Espacios'] ?></dd>
                                                <hr>
                                                <dt class="col-sm-2">Descripción:</dt>
                                                <dd class="col-sm-10" name='descripcion'><?php echo $fila['Descripcion'] ?></dd>
                                                <hr>
                                                <dt class="col-sm-2">Precio:</dt>
                                                <dd class="col-sm-10" name='precio'>₡ <?php echo $fila['Precio'] ?></dd>
                                                <hr>
                                            </dl>
                                        </p>
                                        <a href="editarHospedaje.php?Id=<?php echo $fila['Id'] ?>" class="btn btn-success">Editar Hospedaje</a>
                                    </div>
                                </div>
                            </form>

                    <?php } ?>
                </div>
            </div>
        </section>
    </main>

    
    <script src="../assets/js/prueba.js"></script>
</body>
</html>