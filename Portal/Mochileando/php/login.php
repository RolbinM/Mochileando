<?php

    session_start();
    include 'driver.php';


    $usuario =$_POST ['usuario'];
    $contrasena = $_POST ['contrasena'];
    //$contrasena = hash('sha512', $contrasena);

    $validar_login = "EXECUTE dbo.sp_ValidarUsuario $usuario, $contrasena";
    $ejecutar = sqlsrv_query ($conn_sis, $validar_login);
    $_SESSION ['usuario'] = $usuario;

    if($ejecutar) {
        
        $fila = sqlsrv_fetch_object( $ejecutar);
                
        if($fila->TipoUsuario == 1) {
            
            //header("location: ../driver.php");
            header("location: ../PortalAdministrador/hoteles.php");
            exit;
        }else if($fila->TipoUsuario == 2){

            header("location: ../PortalHotel/miHotel.php");
            exit;

        }else if($fila->TipoUsuario == 3){

            header("location: ../PortalCliente/hoteles.php");
            exit;

        }else {
            echo '
            <script>
                alert("Usuario inexistente, verificar datos ingresados");
                window.location = "../index.php";
            </script>
        ';
        }
    } else {
        echo "NO FUNCIONA.";
    }

?>
<!-- 
$row = sqlsrv_fetch_array($ejecutar) -->