<?php

    session_start();
    include 'driver.php';


    $usuario =$_POST ['usuario'];
    $contrasena = $_POST ['contrasena'];
    //$contrasena = hash('sha512', $contrasena);

    $validar_login = "EXECUTE dbo.sp_ValidarUsuario $usuario, $contrasena";
    $ejecutar = sqlsrv_query ($conn_sis, $validar_login);

    if($ejecutar) {
        
        $fila = sqlsrv_fetch_object( $ejecutar);
        echo"<script>alert('$fila->TipoUsuario')</script>";
                
        if($fila->TipoUsuario == 1) {
            $_SESSION ['usuario'] = $usuario;
            //header("location: ../driver.php");
            header("location: ../menuLateral.html");
            exit;
        }else if($fila->TipoUsuario == 2){

            echo "Hotel";

        }else if($fila->TipoUsuario == 3){

            echo "Cliente";

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