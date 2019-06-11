<?php

require '../core/crud.php';

class modelInstitucional {

    function buscarMision() {
        $cCrud = new Crud();
        $fila = $cCrud->buscarQuery("CALL mgc_mostrarMision_sp()");
        return $fila;
    }

    function buscarVision() {
        $cCrud = new Crud();
        $fila = $cCrud->buscarQuery("CALL mgc_mostrarVision_sp()");
        return $fila;
    }

    function buscarConocenos() {
        $cCrud = new Crud();
        $fila = $cCrud->buscarQuery("CALL mgc_mostrarConocenos_sp()");
        return $fila;
    }

    function buscarTrabajaConNosotros() {
        $cCrud = new Crud();
        $fila = $cCrud->buscarQuery("CALL mgc_mostrarTrabajaConNosotros_sp()");
        return $fila;
    }
}
?>

