<?php
//Estamos llamando al archivo crud.php para poder instanciar la clase crud
require '../core/crud.php';

class modelHojainformativa {
/**
 * Inserta resultados mediante un procedimiento almacenado, instanciando una variable para la 
 * clase crud y se ejecuta con un parametro 
 * @param int $idParticipanteIndividual almacena el id del participante individual
 * @param int $puesto almacena el puesto del participante individual
 */
    function InsertarResultados($idParticipanteIndividual, $puesto) {
        $cCrud = new Crud();
        $cCrud->ejecutarQuery("CALL mgc_insertar_resultadoIndividual_SP('" . $idParticipanteIndividual . "','" . $puesto . "')");
    }
/**
 * Lista TODOS los eventos que tienen las sedes
 * @return array $fila con todos los resultados del evento
 */
    function listarEventos() {
        $cCrud = new Crud();
        $fila = $cCrud->buscarQueryAll("CALL mgc_mostrarSedeEvento_SP()");
        return $fila;
    }
    /**
     * Lista todos los participantes por evento
     * @param int $idEvento almacena los id para cada evento
     * @return array $fila con todos los resultados
     */
    function listarParticipantes($idEvento) {
        $cCrud = new Crud();
        $fila = $cCrud->buscarQueryAll("CALL mgc_mostrarParticipantesEvento_SP('".$idEvento."')");
        return $fila;
    }

}
