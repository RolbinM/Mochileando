<!DOCTYPE html>
<?php
    include '../php/driver.php';
?>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mochileando</title>

    <link rel ="stylesheet" href="../assets/css/estilos4.css">
    <link href="..//assets/css/bootstrap.min.css" rel="stylesheet">

    <script src="https://kit.fontawesome.com/41bcea2ae3.js" crossorigin="anonymous"></script>
</head>
<body id="body">
    
<div class="menu__side" id="menu_side">

<div class="name__page">
    <i class="fas fa-hiking" id="btn_open"></i>
    <h4>Mochileando</h4>
</div>

<div class="options__menu">	

    <a href="hoteles.php" style="text-decoration:none">
        <div class="option">
            <i class="fas fa-concierge-bell" title="Hoteles" ></i>
            <h4>Hoteles</h4>
        </div>
    </a>
    
    <a href="clientes.php" style="text-decoration:none">
        <div class="option">
        <i class="fas fa-users" title="Clientes" ></i>
            <h4>Clientes</h4>
        </div>
    </a>
    <a href="reservaciones.php" style="text-decoration:none">
        <div class="option">
        <i class="fas fa-file-invoice-dollar" title="Reservaciones" ></i>
            <h4>reservaciones</h4>
        </div>
    </a>
    <a href="bitacora.php" style="text-decoration:none">
        <div class="option">
            <i class="fas fa-book" title="Bitacora"></i>
            <h4>Bitácora de cambios</h4>
        </div>
    </a>

    <a href="../php/cerrar_sesion.php" style="text-decoration:none">
        <div class="option">
            <i class="fas fa-sign-out-alt" title="Salida"></i>
            <h4>Salida</h4>
        </div>
    </a>

</div>
</div>

<center>

<div class = "col-md-8 col-md-offset-2">
    <h1> <font color=#ffba00> Hoteles</font></h1>
    <br> <br>

    <form method="POST" enctype="multipart/form-data">

        <div class="form-group">
            <label>Nombre</label>
            <input type="text" name="nombre" class="form-control" placeholder="Ingrese su nombre" required><br/>
        </div>

        <div class="form-group">
            <label>Localidad</label>
            <input type="text" name="localidad" class="form-control" placeholder="ingrese su localidad" required><br/>
        </div>

        <div class="form-group">
            <label>Correo Electrónico</label>
            <input type="email" name="correo" class="form-control" placeholder="Ingrese su correo electrónico" required><br/>
        </div>

        <div class="form-group">
            <label>Teléfono</label>
            <input type="text" name="telefono" class="form-control" placeholder="Ingrese su número de teléfono" required><br/>
        </div>

        <div class="form-group">
            <label>Usuario</label>
            <input type="text" name="usuario" class="form-control" placeholder="Ingrese su usuario" required><br/>
        </div>

        <div class="form-group">
            <label>Contraseña</label>
            <input type="text" name="contraseña" class="form-control" placeholder="Ingrese su contraseña" required  title="La contraseña contener una mayuscula, una minuscula, un número, un caracter y debe ser de más de 8 caracteres" pattern="(?=(?:.*\d){1})(?=(?:.*[A-Z]){1})(?=(?:.*[a-z]){1})(?=(?:.*[@$+=`~?><#%&*!ยก\-_]){1})\S{6,}"><br/>
        </div>

        <div class="form-group">
            <label>Imagen</label>
            <input type="file" name="imagen" class="form-control" accept="image/*" placeholder="Ingrese una imagen" required><br/>
        </div>
        <br/>
        <div class="form-group">
            <button name="insert" class="btn btn-warning">Insertar información </button><br/><br/>
        </div>
    </form>
    </div>
    <br /> <br /> <br />

        <?php
                if(isset($_POST['insert'])){
                    $nombre = $_POST ['nombre'];
                    $localidad = $_POST ['localidad'];
                    $correo = $_POST ['correo'];
                    $telefono = $_POST ['telefono'];
                    $usuario = $_POST ['usuario'];
                    $contraseña  = $_POST ['contraseña'];
        
                    if($_FILES["imagen"]["error"] > 0){
                        echo"<script>alert('Error al cargar la imagen')</script>";
                    }
                    else{  
                        $ruta = 'imagenes/'.$_FILES["imagen"]['name'];
                        
                        $consulta = "EXECUTE dbo.sp_InsertarHotel '$nombre', '$usuario', 
                                    '$contraseña', '$localidad', '$correo', $telefono, '$ruta'";
                        
                        $ejecutar = sqlsrv_query ($conn_sis, $consulta);
                        if($ejecutar){
                            $fila = sqlsrv_fetch_object( $ejecutar);
                            
                            if($fila->Codigo == 0) {
                                move_uploaded_file($_FILES["imagen"]['tmp_name'],'../'.$ruta);
                                echo"<script>alert('Se creo correctamente el hotel')</script>";
                                echo"<script>window.open('hoteles.php', '_self')</script>";
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
        
        
                } 
            ?>


        <div class = "col-md-8 col-md-offset-2" >
        <table class = "table table-bordered table-responsive" >
            <tr>
                <td align="center">Id</td>
                <td align="center">Nombre</td>
                <td align="center">Localidad</td>
                <td align="center">Correo</td>
                <td align="center">Teléfono</td>
                <td align="center">Usuario</td>
                <td align="center">Contraseña</td>
                <td align="center">Imagen</td>
                <td align="center">Edición</td>
                <td align="center">Borrado</td>
            </tr>

            <?php
                $consulta = "EXECUTE dbo.sp_ConsultaHotel";
                $ejecutar = sqlsrv_query ($conn_sis, $consulta);

                $i = 0;
                while ($fila = sqlsrv_fetch_array($ejecutar)){
                        $id = $fila ['Id'];
                        $nombre = $fila ['Nombre'];
                        $localidad = $fila ['Localidad'];
                        $correo = $fila ['Correo'];
                        $telefono = $fila ['Telefono'];
                        $usuario = $fila ['Usuario'];
                        $contraseña= $fila ['Contraseña'];
                        $imagen= $fila ['Imagen'];
                        $i++;
                
                
                ?>
            <tr align = "center">
            <td><?php echo $id; ?></td>
            <td><?php echo $nombre; ?></td>
            <td><?php echo $localidad; ?></td>
            <td><?php echo $correo; ?></td>
            <td><?php echo $telefono; ?></td>
            <td><?php echo $usuario; ?></td>
            <td><?php echo $contraseña; ?></td>
            <td><?php echo $imagen; ?></td>

            <td><a href="hoteles.php?editarHotel=<?php echo $usuario; ?>">Editar</a></td>
            <td><a href="hoteles.php?borrarHotel=<?php echo $usuario; ?>">Eliminar</a></td>
            </tr>

                <?php } ?>
            
        </table>
        </div>


        <?php
            if(isset($_GET['editarHotel'])){
                include ("editarHotel.php");
            }

        ?>

        <?php
        if(isset($_GET['borrarHotel'])){
            $borrar_user = $_GET['borrarHotel'];
            $borrar = "EXECUTE dbo.sp_EliminarHotel $borrar_user";
            $ejecutar = sqlsrv_query ($conn_sis, $borrar);

            if($ejecutar){
                echo"<script>alert('Hotel Eliminado Correctamente')</script>";
                echo"<script>window.open('hoteles.php', '_self')</script>";
            }
        }
        ?>
        </center>
<br><br>
    <script src="../assets/js/prueba.js"></script>
</body>
</html>