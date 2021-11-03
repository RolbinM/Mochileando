<!DOCTYPE html>

<?php
    include '../php/driver.php';
    
    session_start();

    if(isset($_GET['Id'])){
        $editar_id = $_GET ['Id'];
        $consulta = "EXECUTE dbo.sp_ConsultarHospedaje $editar_id" ;
        $ejecutar = sqlsrv_query ($conn_sis, $consulta);

        $fila = sqlsrv_fetch_array($ejecutar);
            $nombre = $fila ['Nombre'];
            $espacios = $fila ['Espacios'];
            $precio = $fila ['Precio'];
            $descripcion = $fila ['Descripcion'];
    }
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
                        <h2 class="text-center font-weight-bold">Editar Hospedaje</h2>
                    </div>
                </div>
                <br>
                <div class="row justify-content-center">    
                    <div class="col-lg-7">
                        <form  method="POST" class="mt-1 pt-1" enctype="multipart/form-data">
                            <div class="form-group row">
                                <h4 class="col-lg-3">Nombre: </h4>
                                <div class="col-lg-8">
                                    <input type="text" name="nombre"  value=<?php echo $nombre ?> required class="form-control">
                                </div>
                            </div>
                            <br>
                            <div class="form-group row">
                                <h4 class="col-lg-3">Espacios: </h4>
                                <div class="col-lg-8">
                                    <input type="number" name="espacios"  value=<?php echo $espacios ?> required class="form-control">
                                </div>
                            </div>
                            <br>
                            <div class="form-group row">
                                <h4 class="col-lg-3">Precio: </h4>
                                <div class="col-lg-8">
                                    <input type="number" name="precio" value=<?php echo $precio ?> required class="form-control">
                                </div>
                            </div>
                            <br>
                            <div class="form-group row">
                                <h4 class="col-lg-3">Descripcion: </h4>
                                <div class="col-lg-8">
                                    <textarea name="descripcion" rows="10" cols="40" required class="form-control"><?php echo $descripcion ?></textarea>
                                </div>
                            </div>
                            <br><br>
                            <div class="mb-3">
                                <button class="btn btn-primary float-end" name="enviar">Guardar Cambios</button>
                            </div>
                            <br>
                        </form>
                    </div>
                </div>  
            </div>
        </section>

        <?php
            if(isset($_POST['enviar'])){
                $nombre = $_POST ['nombre'];
                $espacios = $_POST ['espacios'];
                $precio = $_POST ['precio'];
                $descripcion = $_POST ['descripcion'];
                
                $consulta = "EXECUTE dbo.sp_ModificarHospedaje $editar_id, '$nombre', '$descripcion', 
                            $espacios, $precio";
                
                $ejecutar = sqlsrv_query ($conn_sis, $consulta);
                if($ejecutar){
                    $fila = sqlsrv_fetch_object( $ejecutar);
                    
                    if($fila->Codigo == 0) {
                        echo"<script>alert('Se modifico exitosamente el hospedaje')</script>";
                        echo"<script>window.open('misHospedajes.php', '_self')</script>";

                    }else if($fila->Codigo == 1){
                        echo"<script>alert('El usuario no existe, pruebe con otro')</script>";
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