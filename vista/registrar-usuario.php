
<?php
$servername = "localhost";
$database = "aquashine";
$username = "root";
$password = "";

$conn = mysqli_connect($servername, $username, $password, $database);

if (!$conn){ 
        die("Conexion fallida:" .mysqli_connect_error());
    }
    echo "Conectado correctamente";
// Verificamos si se ha enviado el formulario
 
    $correo = $_POST["Correo"];
    $contrasenia = $_POST["contrasenia"];
    $nombre = $_POST["nombre"];
    $apellidom = $_POST["apellidom"];
    $apellidop = $_POST["apellidop"];
    $rol = $_POST["rol"];

    $sql = "INSERT INTO usuario(correo, contrasenia, nombre, apellido_materno, apellido_paterno, rol) 
    VALUES ('$correo', '$contrasenia','$nombre ','$apellidom' , '$apellidop', $rol)";
    if(mysqli_query($conn, $sql)){
        echo "La informacion a sido agregada correctamente";

        header("Location:index.html");
    }
    else {

    echo "ERROR";
         
     }

         mysqli_close($conn);


?>
 

