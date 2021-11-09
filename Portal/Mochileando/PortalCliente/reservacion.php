<!DOCTYPE html>
<?php
    include '../php/driver.php';
?>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel ="stylesheet" href="../assets/css/estilos5.css">
    <link href="..//assets/css/bootstrap.min.css" rel="stylesheet">
    <title>Mochileando</title>
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

    <div class="container">
    <?php

        if(isset($_GET['idHotel'])){
            $IdHotel = $_GET ['idHotel'];
            $consulta = "EXECUTE dbo.sp_ConsultaHospedajeHotel $IdHotel" ;
            $ejecutar = sqlsrv_query ($conn_sis, $consulta);
            $i = 0;
            
            while ($fila = sqlsrv_fetch_array($ejecutar)){
                ?>
                
                <div class="card">
                    <h3 class="title"><?php echo $fila['Nombre']?></h3>
                    <div class="bar">
                        <div class="emptybar"></div>
                        <div class="filledbar"></div>
                    </div>
                    <div class="card-body">
                        <h2 class=info2>Precio: <?php echo $fila['Precio']?>$</h2>
                        <a class=info3 href="formularioRes.php?IdHotel=<?php echo $IdHotel ?>&IdHospedaje=<?php echo $fila['Id'] ?>">Reservar<a>
                    </div>
                </div>
              
            <?php } } ?>
            

    </div>

    <script src="../assets/js/prueba.js"></script>
</body>
</html>