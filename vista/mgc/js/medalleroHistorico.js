$(document).ready(function () {
    listarMedalleroPorPais();
    listarResultadoMedalleroPorPais();
});

function listarMedalleroPorPais() {
    $.ajax({
        type: 'GET',
        dataType: "json",
        url: 'controlador/medalleroHistoricoController.php?function=listarMedalleroHistorico',
    })
            .done(
                    function (data) {
                        console.log(data);
                        $("#listaMedallero tbody").html(data.listado);
                    }
            )
            .fail(
                    function (data) {
                        console.log(data);
                        alert("Hubo un error al buscar la informacion");
                    }
            );
}

$('#listaMedallero tbody').on('click', '.btnActualizarMedallero', function () {
    var codigo = $(this).data('codigo');
    $.ajax({
        type: 'GET',
        dataType: "json",
        url: 'controlador/medalleroHistoricoController.php?function=obtenerDatosMedalleroPorID&parametro=' + codigo,
    })
            .done(
                    function (data) {
                        console.log(data);
                        $('#contenido').html(data.formulario);
                    }
            )
            .fail(
                    function (data) {
                        console.log(data);
                        alert("Hubo un error al buscar la informacion");
                    }
            );
});

$('#contenido').on('click', '#btnInsertar', function () {
    $.ajax({
        type: 'GET',
        dataType: "json",
        url: 'controlador/medalleroHistoricoController.php?function=mostrarFormularioInsterMedallero',
    })
            .done(
                    function (data) {
                        console.log(data);
                        $('#contenido').html(data.formulario);
                    }
            )
            .fail(
                    function (data) {
                        console.log(data);
                        alert("Hubo un error al buscar la informacion");
                    }
            );
});

$('#contenido').on('click', '#btnCancelar', function () {
    $('#contenido').load('vista/mgc/mantenimientoMedalleroHistorico.php');
});

$('#contenido').on('click', '#btnCancelarReg', function () {
    $('#contenido').load('vista/mgc/mantenimientoMedalleroHistorico.php');
});
$('#contenido').on('click', '#mostrarResultados', function () {
    alert("funciona");
});

$('#contenido').on('click', '#btnGuardar', function () {
    var codigo = $(this).data('codigo');
    var puesto = $('#txtpuesto').val();
    var pais = $('#exampleFormControlSelect').val();
    var oro = $('#oro').val();
    var plata = $('#plata').val();
    var bronce = $('#bronce').val();
    var total = $('#total').val();
    $.ajax({
        type: 'GET',
        dataType: "json",
        url: 'controlador/medalleroHistoricoController.php?function=actualizarInformacionMedallero',
        data: {'parametro': {'idmed': codigo, 'puesto': puesto, 'pais': pais, 'oro': oro, 'plata': plata, 'bronce': bronce, 'total': total}}
    })
            .done(
                    function (data) {
                        console.log(data);
                        $('#contenido').load('vista/mgc/mantenimientoMedalleroHistorico.php');
                    }
            )
            .fail(
                    function (data) {
                        console.log(data);
                        alert("Hubo un error al buscar la informacion");
                    }
            );

});

$('#contenido').on('click', '#btnInsertarReg', function () {
    var puesto = $('#puesto').val();
    var pais = $('#exampleFormControlSelect').val();
    var oro = $('#oro').val();
    var plata = $('#plata').val();
    var bronce = $('#bronce').val();
    var total = $('#total').val();
    $.ajax({
        type: 'GET',
        dataType: "json",
        url: 'controlador/medalleroHistoricoController.php?function=insertarInformacionMedallero',
        data: {'parametro': {'puesto': puesto, 'pais': pais, 'oro': oro, 'plata': plata, 'bronce': bronce, 'total': total}}
    })
            .done(
                    function (data) {
                        console.log(data);
                        $('#contenido').load('vista/mgc/mantenimientoMedalleroHistorico.php');
                    }
            )
            .fail(
                    function (data) {
                        console.log(data);
                        alert("Hubo un error al buscar la informacion");
                    }
            );

});
$('#contenido').on('click', '.btnEliminarMedallero', function () {
    eliminarMedalleroPorId(this);
})
function eliminarMedalleroPorId(elemento){
     var idPaisMedallero = $(elemento).data('codigo');
 $.ajax({
        type: 'GET',
        dataType: "json",
        url: 'controlador/medalleroHistoricoController.php?function=eliminarMedalleroPorId',
        data: {'parametro': {'idPaisMedallero':idPaisMedallero}}
    })
            .done(
                    function (data) {
                        console.log(data);
                        $('#contenido').load('vista/mgc/mantenimientoMedalleroHistorico.php');
                    }
            )
            .fail(
                    function (data) {
                        console.log(data);
                        alert("Hubo un error al buscar la informacion");
                    }
            );   
}

function listarResultadoMedalleroPorPais() {
    $.ajax({
        type: 'GET',
        dataType: "json",
        url: 'controlador/medalleroHistoricoController.php?function=listaResultadoMedalleroHistorico',
    })
            .done(
                    function (data) {
                        console.log(data);
                        $("#listaResultadoMedallero tbody").html(data.listado);
                    }
            )
            .fail(
                    function (data) {
                        console.log(data);
                        alert("Hubo un error al buscar la informacion");
                    }
            );
}