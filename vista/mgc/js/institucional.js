$(document).ready(function () {

    $(function () {
        $.ajax({
            type: 'GET',
            dataType: "json",
            url: 'controlador/institucionalController.php?function=mostrarInformacionMision',
        })
                .done(
                        function (data) {
                            $("#imagenMision").html('<img src="' + data.imagen + '" alt="" style="height: 300px; width: 400px;"/>');
                            $("#textMision").html(data.texto);
                        }
                )
                .fail(
                        function () {
                            alert("Hubo un error al buscar la informacion");
                        }
                );
    });

    $(function () {
        $.ajax({
            type: 'GET',
            dataType: "json",
            url: 'controlador/institucionalController.php?function=mostrarInformacionVision',
        })
                .done(
                        function (data) {
                            $("#imagenVision").html('<img src="' + data.imagen + '" alt="" style="height: 300px; width: 400px;"/>');
                            $("#textVision").html(data.texto);
                        }
                )
                .fail(
                        function () {
                            alert("Hubo un error al buscar la informacion");
                        }
                );
    });

    $(function () {
        $.ajax({
            type: 'GET',
            dataType: "json",
            url: 'controlador/institucionalController.php?function=mostrarInformacionConocenos',
        })
                .done(
                        function (data) {
                            $("#imagenConocenos").html('<img src="' + data.imagen + '" alt="" style="height: 300px; width: 400px;"/>');
                            $("#textConocenos").html(data.texto);
                        }
                )
                .fail(
                        function () {
                            alert("Hubo un error al buscar la informacion");
                        }
                );
    });

    $(function () {
        $.ajax({
            type: 'GET',
            dataType: "json",
            url: 'controlador/institucionalController.php?function=mostrarInformacionTrabajaConNosotros',
        })
                .done(
                        function (data) {
                            console.log(data);
                            $("#imagenTrabajaConNosotros").html('<img src="' + data.imagen + '" alt="" style="height: 300px; width: 400px;"/>');
                            $("#textTrabajaConNosotros").html(data.texto);
                        }
                )
                .fail(
                        function () {
                            alert("Hubo un error al buscar la informacion");
                        }
                );
    });
});


