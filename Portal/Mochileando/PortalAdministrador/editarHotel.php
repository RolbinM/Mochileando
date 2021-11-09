<?php
    if(isset($_GET['editarHotel'])){
        $editarUsuario = $_GET ['editarHotel'];
        $consulta = "EXECUTE dbo.sp_ConsultaHotelEspecifica '$editarUsuario'" ;
        $ejecutar = sqlsrv_query ($conn_sis, $consulta);

        $fila = sqlsrv_fetch_array($ejecutar);


        $nombre = $fila ['Nombre'];
        $localidad = $fila ['Localidad'];
        $calificacion = $fila ['Calificación'];
        $correo = $fila ['Correo'];
        $telefono = $fila ['Telefono'];
        $urlImagen = $fila ['Imagen'];
        $contra = $fila ['Contraseña'];

        $rutaImagen = '../'.$urlImagen;

    }
?>

<div class = "col-md-8 col-md-offset-2">
    <br> <br>
    <h1> <font color=#ffba00> Editar Hotel</font></h1>
    <br> <br>
    <form method="POST" action="" enctype="multipart/form-data">
        <!-- <div class="form-group" >
            <label>Id:</label>
            <input type="number" name="ID" class="form-control" placeholder = "Escriba el ID del puesto a crear"required/><br/>
        </div> -->
        <div class="form-group">
            <label>Nombre:</label>
            <input type="text" name="nombre" class="form-control"  value="<?php echo $nombre; ?>" required/><br/>
        </div>
        <br/><br/>
        <div class="form-group">
            <label>Localidad:</label>
            <input type="text" name="localidad" class="form-control" value="<?php echo $localidad; ?>" required/><br/>
        </div>
        <br/><br/>
        <div class="form-group">
            <label>Correo:</label>
            <input type="text" name="correo" class="form-control" value="<?php echo $correo; ?>" required/><br/>
        </div>
        <br/><br/>
        <div class="form-group">
            <label>Teléfono:</label>
            <input type="text" name="telefono" class="form-control" value="<?php echo $telefono; ?>" required/><br/>
        </div>
        <br/><br/>
        <div class="form-group">
            <label>Usuario:</label>
            <input type="text" name="usuario" class="form-control" value="<?php echo $usuario; ?>" required/><br/>
        </div>
        <br/><br/>
        <div class="form-group">
            <label>Contraseña:</label>
            <input type="text" name="contraseña" class="form-control" value="<?php echo $contraseña; ?>" required  title="La contraseña contener una mayuscula, una minuscula, un número, un caracter y debe ser de más de 8 caracteres" pattern="(?=(?:.*\d){1})(?=(?:.*[A-Z]){1})(?=(?:.*[a-z]){1})(?=(?:.*[@$+=`~?><#%&*!ยก\-_]){1})\S{6,}"/><br/>
        </div>
        <br/><br/>
        <div class="form-group">
            <label>Imagen:</label>
            <input type="file" name="imagenNueva" class="form-control" accept="image/*">
        </div>
        <br/><br/>
        <div class="form-group">
            <input type="submit" name="actualizar" class="btn btn-warning" value = "ACTUALIZAR DATOS"><br/>
        </div>
    </form>
</div>

<?php
    if(isset($_POST['actualizar'])){
        $usuarioNuevo = $_POST ['usuario'];
        $contraseña = $_POST ['contraseña'];
        $nombre = $_POST ['nombre'];
        $localidad = $_POST ['localidad'];
        $correo = $_POST ['correo'];
        $telefono  = $_POST ['telefono'];

        if($_FILES["imagenNueva"]["name"] != null){
            $ruta = 'imagenes/'.$_FILES["imagenNueva"]['name'];
            echo"<script>alert('No encontro la imagen jaja')</script>";
        }
        else{
            $ruta = $urlImagen;
        }

        $consulta = "EXECUTE dbo.sp_ActualizarHotel '$usuario', '$nombre', '$usuarioNuevo', 
                    '$contraseña', '$localidad', '$correo', $telefono, '$ruta'";
        
        $ejecutar = sqlsrv_query ($conn_sis, $consulta);
        if($ejecutar){
            $fila = sqlsrv_fetch_object( $ejecutar);
            
            if($fila->Codigo == 0) {
                if($_FILES["imagenNueva"]["name"] != null){
                    $ruta = '../'.$ruta;
                    unlink($rutaImagen);
                    move_uploaded_file($_FILES["imagenNueva"]['tmp_name'],$ruta);
                }

                echo"<script>alert('Se modifico correctamente el hotel')</script>";
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
        }
    }
?>