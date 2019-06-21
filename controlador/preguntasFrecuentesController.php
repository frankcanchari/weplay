<?php

//require el archivo modelHojaInformativa.php para instanciar la clase modelHojainformativa()
require '../modelo/modelPreguntasFrecuentes.php';
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

function mostrarInformacionPreguntasFrecuentes() {
    $cPreguntasFrecuentes = new ModelPreguntasFrecuentes();
    $resultadosAreas = $cPreguntasFrecuentes->listarAreas();
    $string = '<div class="col-md-12">';

    foreach ($resultadosAreas AS $filaResultadosAreas) {
        $codigoArea = $filaResultadosAreas['codigo'];
        $string .= '<div class="col-md-12"><h3>' . utf8_encode($filaResultadosAreas['area']) . '</h3></div>';
        $preguntaResultado = $cPreguntasFrecuentes->listarPregunta($codigoArea);

        foreach ($preguntaResultado AS $filaResultadoPreguntas) {
            $codigoPreguntas = $filaResultadoPreguntas['codigo'];
            $string .= '<div class="col-md-12" >' . utf8_encode($filaResultadoPreguntas['pregunta']) . '</div>';
            $respuestaResultado = $cPreguntasFrecuentes->listarRespuesta($codigoPreguntas);

            foreach ($respuestaResultado AS $filaREsultadoRespuesta) {
                $string .= '<div class="col-md-12">' . utf8_encode($filaREsultadoRespuesta['respuesta']) . '</div>';
            }
        }
    }
    $string .= '</div>';
    $datos = [
        'listado' => $string
    ];
    return $datos;
}
