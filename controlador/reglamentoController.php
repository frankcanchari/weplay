<?php

//require el archivo modelHojaInformativa.php para instanciar la clase modelHojainformativa()
require '../modelo/modelReglamento.php';
if (isset($_GET['function']) && $_GET['function'] != '') {
    if (isset($_GET['parametro'])) {
        $result = $_GET['function']($_GET['parametro']);
        //$result = insertarResultadosCompetencia("3-2"); 
    } else {
        $result = $_GET['function']();
        //$result = listarEventos();
    }
    echo json_encode($result);
}
