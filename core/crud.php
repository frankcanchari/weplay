<?php
//Se incluye al archivo core/conexion.php el cual contiene a la clase Conexion
include 'conexion.php';

class Crud {
/**
 * ejecuta una cadena de texto que contiene SQL
 * @param String $query Es una cadena de texto SQL
 */
    function ejecutarQuery($query) {
        $cConn = new Conexion();
        $cConector = $cConn->conector();
        $cConector->query($query);
    }
/**
 * Ejecuta una cadena de texto que contiene una consulta SQL y devolvemos un solo resultado.
 * @param String $query Cadena de texto SQL
 * @return array $fila Devuelve un solo resultado
 */
    function buscarQuery($query) {
        $cConn = new Conexion();
        $cConector = $cConn->conector();
        $resultado = $cConector->query($query);
        $fila = $resultado->fetch_assoc();
        return $fila;
    }
/**
 * Ejecuta una cadena de texto que contiene una consulta SQl y devolvemos un grupo de resultados
 * @param String $query Cadena de texto SQL
 * @return array $fila Devuelve los resultados de la consulta SQL
 */
    function buscarQueryAll($query) {
        $cConn = new Conexion();
        $cConector = $cConn->conector();
        $resultado = $cConector->query($query);
        $fila = $resultado->fetch_all(MYSQLI_ASSOC);
        return $fila;
    }

}


