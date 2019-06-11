<?php

require '../modelo/modelOrganigrama.php';


if (isset($_GET['function']) && $_GET['function'] != '') {
    $result = $_GET['function']();
    echo json_encode($result);
}

function mostrarInformacionOrganigrama() {
    $cOrganigrama = new modelOrganigrama();
    $resultados = $cOrganigrama->buscarOficinaOrganigrama();
    $string = '';
    $columnaSecretarias = '';
    $columnaDirecciones = '';

    foreach ($resultados as $fila) {
        $unidad = $cOrganigrama->buscarUnidadesOrganigrama($fila['codigo']);

        $stringUnidad = '';
        foreach ($unidad as $filaUnidad) {
            $stringUnidad .= '<div style="margin-bottom: 12px;">' . utf8_encode($filaUnidad['unidad']) . '</div>';
        }
        if ($fila['tipo'] == 1) {
            $columnaSecretarias .= '<div  style="margin-bottom: 20px;">';
            $columnaSecretarias .= utf8_encode($fila['oficina']);
            $columnaSecretarias .= '</div>';
            $columnaSecretarias .= '<div class="col-md-12" style="margin-bottom: 50px; padding-left: 50px">';
            $columnaSecretarias .= $stringUnidad;
            $columnaSecretarias .= '</div>';
        } elseif ($fila['tipo'] == 0) {
            $columnaDirecciones .= '<div class="col-md-12" style="margin-bottom: 20px;">';
            $columnaDirecciones .= utf8_encode($fila['oficina']);
            $columnaDirecciones .= '</div>';
            $columnaDirecciones .= '<div class="col-md-12" style="margin-bottom: 50px; padding-left: 50px">';
            $columnaDirecciones .= $stringUnidad;
            $columnaDirecciones .= '</div>';
     
        }
    }

    $datos = [
        "secretaria" => $columnaSecretarias,
        "direccion" => $columnaDirecciones
    ];
    return $datos;
}
