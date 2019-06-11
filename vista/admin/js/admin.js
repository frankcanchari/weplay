$(document).ready(function () {
 
    $("#btnRegResultados").on("click", function () {
        $('#contenido').load('vista/mgc/registrarResultados.php');
    });
    
    $("#btnRegMedallero").on("click", function () {
        $('#contenido').load('vista/mgc/mantenimientoMedalleroHistorico.php');
    });

});


