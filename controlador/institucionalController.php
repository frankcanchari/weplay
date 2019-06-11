<?php

require '../modelo/modelInstitucional.php';


if (isset($_GET['function']) && $_GET['function'] != '') {
    $result = $_GET['function']();
    echo json_encode($result);
}

//class InstitucionalController {
//
function mostrarInformacionMision() {
    $cMinstitucional = new modelInstitucional();
    $resultados = $cMinstitucional->buscarMision();
    $datos = [
        "texto" => utf8_encode($resultados["descripcion"]),
        "imagen" => $resultados["rutaImagen"]
    ];
    return $datos;
}

function mostrarInformacionVision() {
    $cMinstitucional = new modelInstitucional();
    $resultados = $cMinstitucional->buscarVision();
    $datos = [
        "texto" => utf8_encode($resultados["descripcion"]),
        "imagen" => $resultados["rutaImagen"]
    ];
    return $datos;
}

function mostrarInformacionConocenos() {
    $cMinstitucional = new modelInstitucional();
    $resultados = $cMinstitucional->buscarConocenos();
    $datos = [
        "texto" => utf8_encode($resultados["descripcion"]),
        "imagen" => $resultados["rutaImagen"]
    ];
   return $datos;
}

function mostrarInformacionTrabajaConNosotros() {
    $cMinstitucional = new modelInstitucional();
    $resultados = $cMinstitucional->buscarTrabajaConNosotros();
    $datos = [
        "texto" => utf8_encode($resultados["descripcion"]),
        "imagen" => $resultados["rutaImagen"]
    ];
    return $datos;
}

//
//}


