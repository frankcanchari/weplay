$(document).ready(function () {
    $(function () {
        $.ajax({
            type: 'GET',
            dataType: "json",
            url: 'controlador/HojaInformativaController.php?function=listarEventos',
        })
                .done(
                        function (data) {
                            console.log(data);
                            $("#listaEventos").html(data.opciones);
                        }
                )
                .fail(
                        function (data) {
                            console.log(data);
                            alert("Hubo un error al buscar la informacion");
                        }
                );
    });
    $(function () {
        $('#listaEventos').on('change', function () {
            var idEvento = $(this).val();
            $.ajax({
                type: 'GET',
                dataType: "json",
                url: 'controlador/HojaInformativaController.php?function=listarParticipantes&parametro=' + idEvento,
            })
                    .done(
                            function (data) {
                                console.log(data);
                                $("#participantes tbody").html(data.contenido);
                            }
                    )
                    .fail(
                            function (data) {
                                console.log(data);
                                alert("Hubo un error al buscar la informacion");
                            }
                    );
        })
    });
    $(function () {
        $('#participantes').on('click', '.btnSeleccionar', function () {
            var idParticipante = $(this).data('codigo');
            $('#idParticipante').val(idParticipante);
        })
    });
    $(function () {
        $('#btnRegistrarPuesto').on('click', function () {
            var puesto = $('#puesto').val();
            var idparticipante =  $('#idParticipante').val();
            $.ajax({
                type: 'GET',
                dataType: "json",
                url: 'controlador/HojaInformativaController.php?function=insertarResultadosCompetencia&parametro=' + puesto + '-' + idparticipante,
            })
                    .done(
                            function (data) {
                                console.log(data);
                               alert(data.mensaje);
                            }
                    )
                    .fail(
                            function (data) {
                                console.log(data);
                                alert("Hubo un error al buscar la informacion");
                            }
                    );
        })
    });
});


