<?php

$servername = "localhost";
$database = "angel";
$username = "root";
$password = "";

$conn = mysqli_connect($servername, $username, $password, $database);

if (!$conn) {
  die("Conexion fallida:" . mysqli_connect_error());
}


$consulta = mysqli_query($conn, "SELECT * FROM productos");
//nr es una variable para verificar el numero de filas que tengan coincidencia con la tabla de la BD
//mysqli_num_rows función para obtener el numero de filas
$nr = mysqli_num_rows($consulta);
//Estructura de control para verificar la coincidencia de los datos de la tabla

?>


<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8">
  <title>paquetes</title>

  <!--SE  DEBE DE DEFINIR DESPUES DEL NORMALIZE PERO ANTES DEL CODIGO
    CSS PUES DEBE ESTAR DEFINIDA ANTES PARA Q NO GENERE PROBLEMAS-->

  <link rel="stylesheet" href="css/galeria-paquetes.css">
</head>

<body >
  <header class="encabezado">
    <img src="imagenes/WhatsApp Image 2024-02-20 at 12.07.51.jpeg" alt="DIGITAL_TEAM">
    <H1>AQUA-SHINE</H1>
    <div class="clearfix"></div class>
    </div>
    <nav>
      <a href="index.html">
        <i class="fa-solid fa-house"></i> Inicio</a>
      <a href="galeria-pquetes.php">
        <i class="fa-solid fa-truck-fast"></i> Paquetes</a>
      <a href="">

        <i class="fa-brands fa-facebook"></i> Redes </a>
      <a href="Formulario_Sesion.html">
        <i class="fa-solid fa-user"></i> Iniciar Sesion</a>
      </a>


    </nav>
  </header>

  <?php
  $i = 1;
  ?>
    <div class="tabla">

      <div class="fila">
     
    
   

        <?php

 while ($nr = mysqli_fetch_assoc($consulta)) :
        ?>

          <div class="columna" >
            <form action="carrito.php" method="POST">
              <img src="<?= $nr['imagen']; ?>" id="PunteroAqui">
              <h1><?= $nr['nombre']; ?></h1>
              <p>$ <?= $nr['precio']; ?> </p>
              <input type="hidden" name="id_producto" value="<?= $nr['id'] ?>">
              <input type="hidden" name="nombre_prod" value="<?= $nr['nombre'] ?>">
              <input type="hidden" name="precio" value="<?= $nr['precio'] ?>">
              <input type="hidden" name="img" value="<?= $nr['imagen'] ?>">

              <div id="desc">
                <p> <?= $nr['descripcion']; ?> </p>
              </div>
              <button type="submit" name="agregar" id="BOT">Agregar al Carrito</button>
            </form>
          </div>



          <?php
          $i++;
          if ($i == 2) {
            echo "</div> ";
            $i = 1;
          }
          ?>


        <?php endwhile; ?>


        </div>

</body>

</html>