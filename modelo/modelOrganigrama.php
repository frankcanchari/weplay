<?php

require '../core/crud.php';

class modelOrganigrama {

    function buscarOficinaOrganigrama() {
        $cCrud = new Crud();
        $fila = $cCrud->buscarQueryAll("CALL mgc_mostrarOficinasOrganigrama_sp ()");
        return $fila;
    }
    function buscarUnidadesOrganigrama($codigoOficina) {
        $cCrud = new Crud();
        $fila = $cCrud->buscarQueryAll("CALL mgc_mostrarUnidadesOrganigrama_sp (".$codigoOficina.")");
        return $fila;
    }
}
?>

