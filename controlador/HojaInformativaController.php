<?php
//require el archivo modelHojaInformativa.php para instanciar la clase modelHojainformativa()
require '../modelo/modelHojaInformativa.php';
//variable    //valor
//$pepita    =  'cerda';

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

//class InstitucionalController {
//
function insertarResultadosCompetencia($parametro) {
    //$parametro = '3-2'
    $data = explode('-', $parametro);
    //$data  = [3,2]
    $cHojaInf = new modelHojainformativa();
    $cHojaInf->InsertarResultados($data[1], $data[0]);
    //$cHojaInf->InsertarResultados(2,3);
    $datos = [
        "mensaje" => "Se inserto correctamente"
    ];
    return $datos;
}

function listarEventos() {
    $cHojaInf = new modelHojainformativa();
    $resultados = $cHojaInf->listarEventos();
    $string = '';
    $string .= '<option>Seleccione una opcion</option>';
    foreach ($resultados AS $fila) {
        $string .= '<option value="' . $fila['codigo'] . '">' . utf8_encode($fila['evento']) . '</option>';
    }
    $datos = [
        "opciones" => $string
    ];
    return $datos;
}

function listarParticipantes($idEvento) {
    $cHojaInf = new modelHojainformativa();
    $resultados = $cHojaInf->listarParticipantes($idEvento);
    $string = '';
    foreach ($resultados AS $fila) {
        $string .= '<tr>';
        $string .= '<td>' . utf8_encode($fila['codigo']) . '</td>';
        $string .= '<td>' . utf8_encode($fila['nombreDeportista']) . '</td>';
        $string .= '<td>' . utf8_encode($fila['deporte']) . '</td>';
        $string .= '<td><button data-codigo="' . utf8_encode($fila['codigo']) . '" class="btnSeleccionar">Seleccionar</buttom></td>';
        $string .= '</tr>';
    }
    $datos = [
        "contenido" => $string
    ];
    return $datos;
}
