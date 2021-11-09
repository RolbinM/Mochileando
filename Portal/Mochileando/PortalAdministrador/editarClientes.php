<?php
        if(isset($_GET['editarClientes'])){
            $editarUsuario = $_GET ['editarClientes'];
            $consulta = "EXECUTE dbo.sp_ConsultaClienteEspecifico '$editarUsuario'" ;
            $ejecutar = sqlsrv_query ($conn_sis, $consulta);

            $fila = sqlsrv_fetch_array($ejecutar);
            $id = $fila ['Id'];
            $Nombre = $fila ['Nombre'];
            $identificacion = $fila ['Cedula'];
            $Nacimiento = $fila ['FechaNacimiento']->format('Y-m-d');
            $Correo = $fila ['Correo'];
            $Password = $fila ['Contraseña'];

        }
?>

<div class = "col-md-8 col-md-offset-2">

    <form method="POST" action="">
        <!-- <div class="form-group" >
            <label>Id:</label>
            <input type="number" name="ID" class="form-control" placeholder = "Escriba el ID del puesto a crear"required/><br/>
        </div> -->
        <div class="form-group">
            <label>Nombre:</label>
            <input type="text" name="Nombre" class="form-control" value="<?php echo $Nombre; ?>" required/><br/>
        </div>
        <br/><br/>
        <div class="form-group">
            <label>Identificación:</label>
            <input type="number" name="Identificacion" class="form-control" value="<?php echo $identificacion; ?>" readonly/><br/>
        </div>
        <br/><br/>
        <div class="form-group">
            <label>Nacimiento:</label>
            <input type="date" name="Nacimiento" class="form-control"  value="<?php echo $Nacimiento; ?>" required/><br/>
        </div>
        <br/><br/>
        <div class="form-group">
            <label>Correo:</label>
            <input type="text" name="Correo" class="form-control" value="<?php echo $Correo; ?>" required/><br/>
        </div>
        <br/><br/>
        <div class="form-group">
            <label>Contraseña:</label>
            <input type="text" name="Password" class="form-control" value="<?php echo $Password; ?>" required  title="La contraseña contener una mayuscula, una minuscula, un número, un caracter y debe ser de más de 8 caracteres" pattern="(?=(?:.*\d){1})(?=(?:.*[A-Z]){1})(?=(?:.*[a-z]){1})(?=(?:.*[@$+=`~?><#%&*!ยก\-_]){1})\S{6,}" /><br/>
        </div>
        <br/><br/>
        <div class="form-group">
            <input type="submit" name="actualizar" class="btn btn-warning" value = "ACTUALIZAR DATOS"><br/>
        </div>
    </form>
</div>

<?php
    if(isset($_POST['actualizar'])){

        $actualizar_nombre = $_POST ['Nombre'];
        $actualizar_identificacion = $_POST ['Identificacion'];
        $actualizar_Nacimiento = $_POST ['Nacimiento'];
        $actualizar_Correo = $_POST ['Correo'];
        $actualizar_Password = $_POST ['Password'];
        

        $consulta = "EXECUTE dbo.sp_ActualizarCliente '$actualizar_nombre', '$editarUsuario', '$actualizar_Password', 
                    $actualizar_identificacion, '$actualizar_Nacimiento', '$actualizar_Correo'" ;
        
        $ejecutar = sqlsrv_query ($conn_sis, $consulta);
    
        if($ejecutar){
            echo $consulta;
            echo"<script>$actualizar_Nacimiento</script>";
            echo"<script>alert('Cliente Editado correctamente')</script>";
            echo"<script>window.open('clientes.php', '_self')</script>";
        }
        else{
            echo $consulta;
            echo 'hola';
            if( ($errors = sqlsrv_errors() ) != null) {
                foreach( $errors as $error ) {
                    echo "SQLSTATE: ".$error[ 'SQLSTATE']."<br />";
                    echo "code: ".$error[ 'code']."<br />";
                    echo "message: ".$error[ 'message']."<br />";
                }
            }
        }

    }

?>