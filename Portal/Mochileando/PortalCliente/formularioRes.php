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

    <link rel ="stylesheet" href="../assets/css/estilos2.css">
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
    
    <a href="reservas.php" style="text-decoration:none">
        <div class="option">
            <i class="fas fa-history" title="reservas" ></i>
            <h4>Historial Reservas </h4>
        </div>
    </a>
    <a href="infopersonal.php" style="text-decoration:none">
        <div class="option">
            <i class="far fa-id-badge" title="Info"></i>
            <h4>Información personal</h4>
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
<br>
<br>
    <?php
        if(isset($_GET['IdHotel']) && isset($_GET['IdHospedaje'])){
            $IdHotel = $_GET['IdHotel'];
            $IdHospedaje = $_GET['IdHospedaje'];
            $consulta = "EXECUTE dbo.sp_ConsultaHospedajeHotel $IdHotel" ;
            $ejecutar = sqlsrv_query ($conn_sis, $consulta);
            $fila = sqlsrv_fetch_array($ejecutar);
            $NombreHotel = $fila ['NombreHotel'];
            $NombreHospedaje = $fila ['Nombre'];
            $Localidad = $fila ['Localidad'];
            $Precio = $fila ['Precio'];

        }
    ?>

        
    <div class = "col-md-8 col-md-offset-2">

    <form method="POST" action="">
        <!-- <div class="form-group" >
            <label>Id:</label>
            <input type="number" name="ID" class="form-control" placeholder = "Escriba el ID del puesto a crear"required/><br/>
        </div> -->
        <div class="form-group">
            <label>Nombre Hotel:</label><br>
            <input type="text" name="Nombre" class="form-control" value="<?php echo $NombreHotel; ?>" readonly/><br/>
        </div>
        <br/><br/>
        <div class="form-group">
            <label>Nombre Hospedaje:</label><br>
            <input type="text" name="Nombre2" class="form-control" value="<?php echo $NombreHospedaje; ?>" readonly/><br/>
        </div>
        <br/><br/>
        <div class="form-group">
            <label>Lugar:</label><br>
            <input type="text" name="Lugar" class="form-control"  value="<?php echo $Localidad; ?>" readonly/><br/>
        </div>
        <br/><br/>
        <div class="form-group">
            <label>Precio Por Noche:</label><br>
            <input type="text" name="Correo" class="form-control" value="<?php echo $Precio; ?>" readonly/><br/>
        </div>
        <br/><br/>
        <div class="form-group">
            <label>Fecha Inicio:</label><br>
            <input type="date" name="FechaI" class="form-control"  required/><br/>
        </div>
        <br/><br/>
        <div class="form-group">
            <label>Fecha Fin:</label><br>
            <input type="date" name="FechaF" class="form-control"  required/><br/>
        </div>
        <br/><br/>
        <div class="form-group">
            <input type="submit" name="actualizar" class="btn btn-warning" value = "RESERVAR"><br/>
        </div>
    </form>
    </div>
    </center>

            
        <?php
            if(isset($_POST['actualizar'])){

                $FechaInicio = $_POST ['FechaI'];
                $FechaFin = $_POST ['FechaF'];
                session_start();
                $editar_usuario = $_SESSION['usuario'];
             

                $consulta = "EXECUTE dbo.sp_CrearReserva $IdHospedaje, '$editar_usuario', '$FechaInicio', 
                            '$FechaFin'" ;
                
                $ejecutar = sqlsrv_query ($conn_sis, $consulta);
                
            
                if($ejecutar){

                    echo"<script>alert('Reserva creada correctamente')</script>";
                    echo"<script>window.open('reservas.php', '_self')</script>";
                }
                else{
                    echo"<script>alert('No se pudo crear la reserva')</script>";
                    echo"<script>window.open('hoteles.php', '_self')</script>";
                }

            }

        ?>
    <script src="../assets/js/prueba.js"></script>
</body>
</html>