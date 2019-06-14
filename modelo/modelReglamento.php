<?php

//Estamos llamando al archivo crud.php para poder instanciar la clase crud
require '../core/crud.php';

class ModelReglamento {

    function listarSeccion() {
        $cCrud = new Crud();
        $fila = $cCrud->buscarQueryAll("CALL mgc_listarSeccion_SP()");
        return $fila;
    }

    function listarNorma($idSeccion) {
        $cCrud = new Crud();
        $fila = $cCrud->buscarQueryAll("CALL mgc_listarNorma_SP(".$idSeccion.")");
        return $fila;
    }

    function listarSubNorma($idNorma) {
        $cCrud = new Crud();
        $fila = $cCrud->buscarQueryAll("CALL mgc_listarSubnorma_SP(".$idNorma.")");
        return $fila;
    }

}
