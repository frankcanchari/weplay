$(document).ready(function () {
    $('#contenido').load('vista/mgc/institucional.php');
    $("#enlaceOrganigrama").on("click", function () {
        $('#contenido').load('vista/mgc/organigrama.php');
    });
    $('#enlaceInstitucional').on("click", function () {
        $('#contenido').load('vista/mgc/institucional.php');
    });
    $('#enlaceMedallero').on("click", function () {
        $('#contenido').load('vista/mgc/medallero.php');
    });
});


