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

    <script src="../assets/js/prueba.js"></script>
</body>
</html>