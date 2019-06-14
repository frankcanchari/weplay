$(document).ready(function () {
    mostrarReglamento();
});
function mostrarReglamento() {
    $.ajax({
        type: 'GET',
        dataType: "json",
        url: 'controlador/reglamentoController.php?function=mostrarInformacionReglamento',
    })
            .done(
                    function (data) {
                        console.log(data);
                        $("#listaReglamento").html(data.listado);
                    }
            )
            .fail(
                    function (data) {
                        console.log(data);
                        alert("Hubo un error al buscar la informacion");
                    }
            );
}