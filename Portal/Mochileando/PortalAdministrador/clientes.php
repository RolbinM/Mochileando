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
    <h1> <font color=#ffba00> Clientes</font></h1>
    <br> <br>

    <form method="POST" action="Clientes.php">

    <div class="form-group">
            <label>Nombre:</label>
            <input type="text" name="Nombre" class="form-control" placeholder = "Escriba el nombre del cliente nuevo" required/><br/>
        </div>
        <div class="form-group">
            <label>Identificacion:</label>
            <input type="number" name="Identificacion" class="form-control"  placeholder = "Escriba la identificacion" required/><br/>
        </div>
        <div class="form-group">
            <label>Nacimiento:</label>
            <input type="date" name="Nacimiento" class="form-control"  placeholder = "Escriba la fecha de Nacimiento del Cliente" required/><br/>
        </div>
         <div class="form-group">
            <label>Correo Electronico:</label>
            <input type="email" name="correo" class="form-control" placeholder="Ingrese su correo electronico" required><br/>
        </div>
        <div class="form-group">
            <label>Usuario:</label>
            <input type="text" name="usuario" class="form-control" placeholder="Ingrese su usuario" required><br/>
        </div>
        <div class="form-group">
            <label>Contraseña:</label>
            <input type="text" name="contraseña" class="form-control" placeholder="Ingrese su contraseña" required><br/>
        </div>
        <br/>
        <div class="form-group">
            <input type="submit" name="insert" class="btn btn-warning" value = "Insertar informacion" /><br/><br/>
        </div>
    </form>
    </div>
    <br /> <br /> <br />

        <?php
                if(isset($_POST['insert'])){
                    $cedula = $_POST ['Identificacion'];
                    $nombre = $_POST ['Nombre'];
                    $fechaNacimiento = $_POST ['Nacimiento'];
                    $correo = $_POST ['correo'];
                    $usuario = $_POST ['usuario'];
                    $contraseña  = $_POST ['contraseña'];

                    $consulta = "EXECUTE dbo.sp_InsertarCliente '$nombre', '$usuario', 
                                '$contraseña', $cedula, '$fechaNacimiento', '$correo'";
                    
                    $ejecutar = sqlsrv_query ($conn_sis, $consulta);
                    if($ejecutar){
                        $fila = sqlsrv_fetch_object( $ejecutar);
                        
                        if($fila->Codigo == 0) {
                            echo"<script>alert('Se creo correctamente el usuario')</script>";
                            echo"<script>window.open('clientes.php', '_self')</script>";
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
                        echo"<script>window.open('clientes.php', '_self')</script>";
                    }

                }
            ?>


        <div class = "col-md-8 col-md-offset-2" >
        <table class = "table table-bordered table-responsive" >
            <tr>
                <td align="center">Id</td>
                <td align="center">Nombre</td>
                <td align="center">Identificacion</td>
                <td align="center">Fecha de Nacimiento</td>
                <td align="center">Correo</td>
                <td align="center">Usuario</td>
                <td align="center">Contraseña</td>
                <td align="center">Edicion</td>
                <td align="center">Borrado</td>
            </tr>

            <?php
                
                //$consulta = "SELECT * FROM dbo.Puesto";
                $consulta = "EXECUTE dbo.sp_ConsultaClientes";
                $ejecutar = sqlsrv_query ($conn_sis, $consulta);

                $i = 0;
                while ($fila = sqlsrv_fetch_array($ejecutar)){
                        $id = $fila ['Id'];
                        $Nombre = $fila ['Nombre'];
                        $identificacion = $fila ['Cedula'];
                        $Nacimiento = $fila ['FechaNacimiento']->format('Y-m-d');
                        $Correo = $fila ['Correo'];
                        $Usuario = $fila ['Usuario'];
                        $Password= $fila ['Contraseña'];
                        $i++;
                
                
                ?>
            <tr align = "center">
            <td><?php echo $id; ?></td>
            <td><?php echo $Nombre; ?></td>
            <td><?php echo $identificacion; ?></td>
            <td><?php echo $Nacimiento; ?></td>
            <td><?php echo $Correo; ?></td>
            <td><?php echo $Usuario; ?></td>
            <td><?php echo $Password; ?></td>

            <td><a href="clientes.php?editarClientes=<?php echo $Usuario; ?>">Editar</a></td>
            <td><a href="clientes.php?borrarClientes=<?php echo $id; ?>">Eliminar</a></td>
            </tr>

                <?php } ?>
            
        </table>
        </div>


        <?php
            if(isset($_GET['editarClientes'])){
                include ("editarClientes.php");
            }

        ?>

        <?php
        if(isset($_GET['borrarClientes'])){

            $borrar_Id = $_GET['borrarClientes'];
            $borrar = "EXECUTE dbo.sp_EliminarCliente $borrar_Id";
            $ejecutar = sqlsrv_query ($conn_sis, $borrar);

            if($ejecutar){
                echo"<script>alert('Cliente Eliminado Correctamente')</script>";
                echo"<script>window.open('clientes.php', '_self')</script>";
            }
        }
        ?>
        </center>
<br><br>
    <script src="../assets/js/prueba.js"></script>
</body>
</html>