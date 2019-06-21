<?php

//Estamos llamando al archivo crud.php para poder instanciar la clase crud
require '../core/crud.php';

class ModelPreguntasFrecuentes {

    function listarAreas() {
        $cCrud = new Crud();
        $fila = $cCrud->buscarQueryAll("CALL mgc_listarPregFrecAreas_SP()");
        return $fila;
    }

    function listarPregunta($idArea) {
        $cCrud = new Crud();
        $fila = $cCrud->buscarQueryAll("CALL mgc_listarpregunta_SP(" . $idArea . ")");
        return $fila;
    }

    function listarRespuesta($idRespuesta) {
        $cCrud = new Crud();
        $fila = $cCrud->buscarQueryAll("CALL mgc_listarRespuesta_SP(" . $idRespuesta . ")");
        return $fila;
    }
}