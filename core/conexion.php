<?php

class Conexion {
 /**
  * Esta funcion utiliza un archivo ini para realizar la conexion a la base de datos 
  * @return \mysqli nos devuelve la conexion a la base de datos
  */ 
    function conector() {
        $datosConexion = parse_ini_file("../config/configuracion.ini");
        $mysqli = new mysqli($datosConexion["server"],$datosConexion["user"],$datosConexion["password"],$datosConexion["database"]);
        if ($mysqli->connect_errno) {
            echo "fallo al conectar a mysql: (" . $mysqli->connect_errno . ")";
        }
        return $mysqli;
    }

}
?>