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

    <link rel ="stylesheet" href="../assets/css/estilos3.css">



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
<h1 class="title">  Hoteles</h1>
</center>
<br><br>
    <div class="container">
    

    <?php
            
            $consulta = "EXECUTE dbo.sp_ConsultaHotel";
            $ejecutar = sqlsrv_query ($conn_sis, $consulta);

            $i = 0;
            while ($fila = sqlsrv_fetch_array($ejecutar)){

                ?>

                <div class="hotel">
                
                    <img src="../<?php echo ($fila['Imagen']) ?>">
                    <h2><?php echo $fila['Nombre'] ?></h2>
                    <br>
                    <p3>Localidad: <?php echo $fila['Localidad'] ?></p3>
                    <br><br>
                    <a href="reservacion.php?idHotel=<?php echo $fila['Id']; ?>">Reservar</a>
                    <br><br>

                </div>

                 
            <?php } ?>

            <?php
            if(isset($_GET['idHotel'])){
                include ("reservacion.php");
            }

        ?>

    </div>    

    <script src="../assets/js/prueba.js"></script>
</body>
</html>