<?php
include 'conexion.php';
?>
<html>
    <head>
        <title>REGLAMENTO</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <div><h1>REGLAMENTO JUEGOS PANAMERICANOS</h1></div>
        <?php
        $sql = "CALL mgc_mostrar_Reglamento_SP()";
        ?>

        <table>
            <tr>
                <td><?php echo $sql['tituloSeccion'] ?></td>
            </tr>
            <tr>
                <td><?php echo $sql['contenidoNorma'] ?></td>
            </tr>
            <tr>
                <td><?php echo $sql['subContenidoNorma'] ?></td>
            </tr>
        </table>

    </body>
</html>