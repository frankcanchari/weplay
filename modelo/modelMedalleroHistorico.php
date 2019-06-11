<?php

//Estamos llamando al archivo crud.php para poder instanciar la clase crud
require '../core/crud.php';

class ModelMedalleroHistorico {

    function listarMedallasObtenidasPorPais() {
        $cCrud = new Crud();
        $fila = $cCrud->buscarQueryAll("CALL mgc_mostrar_medalleroHistorico_SP()");
        return $fila;
    }

    function insertarTotalMedallasPorPais($puesto, $pais, $oro, $plata, $bronce, $total) {
        $cCrud = new Crud();
        $cCrud->ejecutarQuery("CALL mgc_insertar_medalleroHistorico_SP('" . $puesto . "','" . $pais . "','" . $oro . "','" . $plata . "','" . $bronce . "','" . $total . "')");
    }

    function actualizarTotalMedallasPorPais($idmed, $puesto, $pais, $oro, $plata, $bronce, $total) {
        $cCrud = new Crud();
        $cCrud->ejecutarQuery("CALL mgc_update_medalleroHistorico_SP('" . $idmed . "','" . $puesto . "','" . $pais . "','" . $oro . "','" . $plata . "','" . $bronce . "','" . $total . "')");
    }

    function borrarTotalMedallasPorPais($idmed) {
        $cCrud = new Crud();
        $cCrud->ejecutarQuery("CALL mgc_delete_medalleroHistorico_SP('" . $idmed . "')");
    }

    function mostrarMedalleroPorId($id) {
        $cCrud = new Crud();
        $resultado = $cCrud->buscarQuery("CALL mgc_mostrarMedalleroPorId_SP('" . $id . "')");
        return $resultado;
    }

    function listarPaises() {
        $cCrud = new Crud();
        $resultado = $cCrud->buscarQueryAll("CALL mgc_listarPais_SP()");
        return $resultado;
    }

    function eliminarMedalleroPorId($idMed) {
        $cCrud = new Crud();
        $cCrud->ejecutarQuery("CALL mgc_delete_medalleroHistorico_SP('" . $idMed . "')");
    }

}
