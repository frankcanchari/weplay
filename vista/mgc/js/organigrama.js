$(document).ready(function () {

    $(function () {
        $.ajax({
            type: 'GET',
            dataType: "json",
            url: 'controlador/organigramaController.php?function=mostrarInformacionOrganigrama',
        })
                .done(
                        function (data) {
                            console.log(data);
                            $("#secretaria").html(data.secretaria);
                            $("#direcciones").html(data.direccion);
                        }
                )
                .fail(
                        function (data) {
                            console.log(data);
                            alert("Hubo un error al buscar la informacion");
                        }
                );
    });
    });