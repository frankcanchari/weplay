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

function mostrarInformacionReglamento() {
    $cReglamento = new ModelReglamento();
    $resultados = $cReglamento->listarSeccion();
    $string = '<div class="col-md-12">';


    foreach ($resultados as $filaResultados) {
        $codigoSeccion = $filaResultados['codigo'];
        $string .= '<div class="col-md-12"><h3>' . utf8_encode($filaResultados['seccion']) . '</h3></div>';
        $normaresultado = $cReglamento->listarNorma($codigoSeccion);
        $string .= '<div class="col-md-12">';
        foreach ($normaresultado as $filaNormaRes) {
            $codigoNorma = $filaNormaRes['codigo'];
            $string .= '<div class="col-md-12" >' . utf8_encode($filaNormaRes['contenido']) . '</div>';
            $subNorma = $cReglamento->listarSubNorma($codigoNorma);
            $string .= '<div class="col-md-12">';
            foreach ($subNorma as $filaSubNormaRes) {
                $string .= '<div class="col-md-12">' . utf8_encode($filaSubNormaRes['contenido']) . '</div>';
            }
            $string .= '</div>';
        }
        $string .= '</div>';
    }
    $string .= '</div>';
    $datos = [
        'listado' => $string
    ];
    return $datos;
}
