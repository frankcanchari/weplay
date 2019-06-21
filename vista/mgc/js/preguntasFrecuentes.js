$(document).ready(function () {
    mostrarPreguntasFrecuentes();
});
function mostrarPreguntasFrecuentes() {
    $.ajax({
        type: 'GET',
        dataType: "json",
        url: 'controlador/preguntasFrecuentesController.php?function=mostrarInformacionPreguntasFrecuentes',
    })
            .done(
                    function (data) {
                        console.log(data);
                        $("#contenidoPreguntasFrecuentes").html(data.listado);
                    }
            )
            .fail(
                    function (data) {
                        console.log(data);
                        alert("Hubo un error al buscar la informacion");
                    }
            );
}