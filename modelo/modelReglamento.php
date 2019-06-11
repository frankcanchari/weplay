<?php

//Estamos llamando al archivo crud.php para poder instanciar la clase crud
require '../core/crud.php';

class ModelReglamento {

    function listarReglamento() {
        $cCrud = new Crud();
        $fila = $cCrud->buscarQueryAll("CALL mgc_mostrar_Reglamento_SP()");
        return $fila;
    }

}
