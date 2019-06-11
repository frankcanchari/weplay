<?php

//require el archivo modelHojaInformativa.php para instanciar la clase modelHojainformativa()
require '../modelo/modelMedalleroHistorico.php';
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

function listarMedalleroHistorico() {
    $cMmedallero = new ModelMedalleroHistorico();
    $resultados = $cMmedallero->listarMedallasObtenidasPorPais();
    $html = '';
    foreach ($resultados AS $fila) {
        $html .= "<tr>"
                . "<td>" . $fila['codigo'] . "</td>"
                . "<td>" . $fila['puesto'] . "</td>"
                . "<td>" . utf8_encode($fila['pais']) . "</td>"
                . "<td>" . $fila['medallaOro'] . "</td>"
                . "<td>" . $fila['medallaPlata'] . "</td>"
                . "<td>" . $fila['medallaBronce'] . "</td>"
                . "<td>" . $fila['medallaTotal'] . "</td>"
                . "<td><button data-codigo='" . $fila['codigo'] . "' class='btnActualizarMedallero'>Actualizar</button></td>"
                . "<td><button data-codigo='" . $fila['codigo'] . "' class='btnEliminarMedallero'>Eliminar</button></td>"
                . "</tr>";
    }

    $datos = [
        'listado' => $html
    ];

    return $datos;
}

function obtenerDatosMedalleroPorID($id) {
    $cMmedallero = new ModelMedalleroHistorico();
    $resultado = $cMmedallero->mostrarMedalleroPorId($id);
    $resultadoPais = $cMmedallero->listarPaises();

    $html = '<div>EDITAR REGISTRO</div>
<div class="from-group">        
    <label>Puesto: </label>
    <input type="text" class="form-control" name="puesto" id="txtpuesto" placeholder="puesto" value="' . $resultado['puesto'] . '">      
</div>
<div class="form-group col-md-12">
    <label for="exampleFormControlSelect4">Pais: </label>
    <select class="form-control" id="exampleFormControlSelect">';
    foreach ($resultadoPais as $fila) {
        if ($resultado['pais'] === $fila['codigo']) {
            $html .= '<option  selected value="' . $fila['codigo'] . '">' . utf8_encode($fila['pais']) . '</option>';
        } else {
            $html .= '<option value="' . $fila['codigo'] . '">' . utf8_encode($fila['pais']) . '</option>';
        }
    }
    $html .= ' </select>
</div>
<div class="from-group">        
    <label>Oro: </label>
    <input type="text" class="form-control" name="oro" id="oro"  placeholder="" value="' . $resultado['oro'] . '">      
</div>
<div class="from-group">        
    <label>Plata: </label>
    <input type="text" class="form-control" name="plata" id="plata"  placeholder="" value="' . $resultado['plata'] . '">      
</div>
<div class="from-group">        
    <label>Bronce: </label>
    <input type="text" class="form-control" name="bronce" id="bronce" placeholder="" value="' . $resultado['bronce'] . '">      
</div>
<div class="from-group">        
    <label>Total: </label>
    <input type="text" class="form-control" name="total" id="total" placeholder="" value="' . $resultado['total'] . '">      
</div>
<div class="from-group">
    <button type="button" id="btnGuardar" data-codigo="' . $resultado['codigo'] . '" class=" btn btn-success">Guardar</button>
    <button type="button" id="btnCancelar" class="btn btn-danger">Cancelar</button>
</div>';

    $datos = [
        'formulario' => $html
    ];
    return $datos;
}

function actualizarInformacionMedallero($datos) {
    $idmed = $datos['idmed'];
    $puesto = $datos['puesto'];
    $pais = $datos['pais'];
    $oro = $datos['oro'];
    $plata = $datos['plata'];
    $bronce = $datos['bronce'];
    $total = $datos['total'];
    $cMmedallero = new ModelMedalleroHistorico();
    $cMmedallero->actualizarTotalMedallasPorPais($idmed, $puesto, $pais, $oro, $plata, $bronce, $total);
}

function insertarInformacionMedallero($datos) {
    $puesto = $datos['puesto'];
    $pais = $datos['pais'];
    $oro = $datos['oro'];
    $plata = $datos['plata'];
    $bronce = $datos['bronce'];
    $total = $datos['total'];
    $cMmedallero = new ModelMedalleroHistorico();
    $cMmedallero->insertarTotalMedallasPorPais($puesto, $pais, $oro, $plata, $bronce, $total);
}

function mostrarFormularioInsterMedallero() {
    $cMmedallero = new ModelMedalleroHistorico();
    $resultadoPais = $cMmedallero->listarPaises();
    $html = '
<div>INSERTAR NUEVO REGISTRO</div>
<div class="from-group">        
    <label>Puesto: </label>
    <input type="text" class="form-control" name="puesto" id="puesto"  placeholder="puesto">      
</div>
<div class="form-group col-md-12">
    <label for="exampleFormControlSelect4">Pais: </label>
    <select class="form-control" id="exampleFormControlSelect">';
    foreach ($resultadoPais as $fila) {
        $html .= '<option value="' . $fila['codigo'] . '">' . utf8_encode($fila['pais']) . '</option>';
    }
    $html .= ' </select>
</div>
<div class="from-group">        
    <label>Oro: </label>
    <input type="text" class="form-control" name="oro" id="oro"  placeholder="">      
</div>
<div class="from-group">        
    <label>Plata: </label>
    <input type="text" class="form-control" name="plata" id="plata" placeholder="">      
</div>
<div class="from-group">        
    <label>Bronce: </label>
    <input type="text" class="form-control" name="bronce" id="bronce" placeholder="">      
</div>
<div class="from-group">        
    <label>Total: </label>
    <input type="text" class="form-control" name="total" id="total" placeholder="">      
</div>
<div class="from-group">
    <button type="button" id="btnInsertarReg" class=" btn btn-success">Guardar</button>
    <button type="button" id="btnCancelarReg" class="btn btn-danger">Cancelar</button>
</div>
';
    $datos = [
        'formulario' => $html
    ];
    return $datos;
}

function eliminarMedalleroPorId($idMed) {
    $idMedallero = $idMed['idPaisMedallero'];
    $cMmedallero = new ModelMedalleroHistorico();
    $resultadoPais = $cMmedallero->eliminarMedalleroPorId($idMedallero);
}
function listaResultadoMedalleroHistorico() {
    $cMmedallero = new ModelMedalleroHistorico();
    $resultados = $cMmedallero->listarMedallasObtenidasPorPais();
    $html = '';
    foreach ($resultados AS $fila) {
        $html .= "<tr>"
//                . "<td>" . $fila['codigo'] . "</td>"
                . "<td>" . $fila['puesto'] . "</td>"
                . "<td>" . utf8_encode($fila['pais']) . "</td>"
                . "<td>" . $fila['medallaOro'] . "</td>"
                . "<td>" . $fila['medallaPlata'] . "</td>"
                . "<td>" . $fila['medallaBronce'] . "</td>"
                . "<td>" . $fila['medallaTotal'] . "</td>"
                
                . "</tr>";
    }

    $datos = [
        'listado' => $html
    ];

    return $datos;
}