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
<br/><br/>
    <center>
                <?php   
                        session_start();
                        $editar_usuario = $_SESSION['usuario'];
                        $consulta = "SELECT Nombre From Usuario Where Usuario = '$editar_usuario'" ;
                        $ejecutar = sqlsrv_query ($conn_sis, $consulta);

                        $fila = sqlsrv_fetch_array($ejecutar);
                            $Nombre = $fila ['Nombre'];      
                      
            ?>

            <h1> <font color=#1783db> <?php echo $Nombre ?>, en esta sección ubicamos sus reservas anteriores y futuras</font></h1>


            <br /> <br />

            <div class = "col-md-8 col-md-offset-2" >
            <table class = "table table-bordered table-responsive" >
                <tr>
                    <td align="center">Id Reserva</td>
                    <td align="center">Fecha Inicio</td>
                    <td align="center">Fecha Final</td>
                    <td align="center">Precio Total</td>
                    <td align="center">Hotel</td>
                    <td align="center">Hospedaje</td>
                    <td align="center">Precio</td>
                </tr>

                <?php
                    
                    $consulta = "EXECUTE dbo.sp_ConsultarReservacionXCliente '$editar_usuario' ";
                    $ejecutar = sqlsrv_query ($conn_sis, $consulta);

                    $i = 0;
                    while ($fila = sqlsrv_fetch_array($ejecutar)){
                            $id = $fila ['IdReservacion'];
                            $FechaIni = $fila ['FechaInicio']->format('Y-m-d');
                            $FechaFin = $fila ['FechaFinal']->format('Y-m-d');
                            $PrecioT = $fila ['PrecioTotal'];
                            $Hotel = $fila ['NombreHotel'];
                            $Hospedaje = $fila ['NombreHospedaje'];
                            $PrecioH = $fila ['PrecioHospedaje'];
                            $i++;
                    
                    
                    ?>
                <tr align = "center">
                <td><?php echo $id; ?></td>
                <td><?php echo $FechaIni; ?></td>
                <td><?php echo $FechaFin; ?></td>
                <td><?php echo $PrecioT; ?></td>
                <td><?php echo $Hotel; ?></td>
                <td><?php echo $Hospedaje; ?></td>
                <td><?php echo $PrecioH; ?></td>

                </tr>

                    <?php } ?>
                
            </table>
            </div>
    </center>

    <script src="../assets/js/prueba.js"></script>
</body>
</html>