﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OutputTorneiIscritti.aspx.cs" Inherits="test.OutputTorneiIscritti" %>

<!DOCTYPE html>
<html>

<head runat="server">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Tornei - atleta</title>
    <link rel="stylesheet" href="Content/bootstrap.min.css">
    <link rel="stylesheet" href="Content/styles.css">
    <script src="https://kit.fontawesome.com/95609c6d0f.js" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="Scripts/jquery-dateformat.min.js"></script>
    <link href="https://cdn.datatables.net/1.10.23/css/jquery.dataTables.min.css" rel="stylesheet">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
    <script>
        $(document).ready(function () {
            var ruolo = '<%= Session["ruolo"] %>';
            var idUtente = '<%= Session["idUtente"] %>';
            var token = '<%= Session["Token"] %>';
            var url1;
            if (ruolo == "Atleta") url1 = "https://aibvcapi.azurewebsites.net/api/v1/atleti/Iscrizioni/";
            else if (ruolo == "Allenatore") url1 = "https://aibvcapi.azurewebsites.net/api/v1/allenatori/TorneiIscritti/";
            var settings = {
                "url": "" + url1 + idUtente + "",
                "method": "GET",
                "timeout": 0,
                "withCredentials": true,
                "headers": {
                    "Authorization": "Bearer " + token
                },
            };
            $.ajax(settings).done(function (response) {
                $('#tabella-iscritti').empty();
                response.forEach(function (dati) {
                    $('#tabella-iscritti').append("<tr id=" + dati.idTorneo + "><td>" + (formatDate(dati.dataInizio)) + "</td><td>" + (dati.nomeImpianto) + "</td><td>" + (dati.nomeSocieta) + "</td><td>" + (dati.gender) + "</td><td>" + (dati.outdoor ? "indoor" : "outdoor") + "</td><td>" + (dati.montepremi) + "€</td><td>" + (dati.tipoTorneo) + "</td><td>" + (dati.formula) + "</td><td>" + (dati.oraInizio) + "</td><td>" + (dati.numMaxTeamMainDraw) + "</td><td>" + formatDate(dati.dataChiusuraIscrizioni) + "</td><td>" + (dati.oraInizio) + "</td></tr>");
                });
                $('#data-table-iscritti').DataTable({
                    "search": {
                        "caseInsensitive": false
                    },
                    responsive: true,
                    "order": [
                        [0, "asc"]
                    ]
                });
            });
            var sesso_status = false;
            $('input[name="gender"]').click(function () {
                if (!sesso_status) {
                    $('#data-table tbody tr').get().map(function (row) {
                        if (row.children[3].innerHTML != $('input[name="gender"]:checked').val()) {
                            var index = row.rowIndex;
                            $("#tabella tr:nth-of-type(" + index + ")").hide();
                            sesso_status = true;
                        }
                    });
                } else {
                    sesso_status = false;
                    $('#reset').click();
                }
            });
            $('#categoria').change(function () {
                if ($("#categoria").val() != "All") {
                    $('#data-table tbody tr').get().map(function (row) {
                        if (row.children[6].innerHTML != $("#categoria").val()) {
                            var index = row.rowIndex;
                            $("#tabella tr:nth-of-type(" + index + ")").hide();
                        } else {
                            var index = row.rowIndex;
                            $("#tabella tr:nth-of-type(" + index + ")").show();
                        }
                    });
                } else $('#reset').click();
            });
            $('#reset').click(function () {
                $("#Range").val(5000);
                $("#valuenb").val(5000);
                $('#data-table tbody tr').get().map(function (row) {
                    var index = row.rowIndex;
                    $("#tabella tr:nth-of-type(" + index + ")").show();
                });
            });
            $('#data-table tbody').on("click", "tr", function () {
                <%Session["IdTorneo"] = HiddenField1.Value; %>
                window.location = "InfoTorneo.aspx?id=" + $(this).attr("id");
            });

            $("#valuenb").change(function () {
                $("#Range").val($("#valuenb").val());
                $('#data-table tbody tr').get().map(function (row) {
                    var index = row.rowIndex;
                    var price = row.children[5].innerHTML;
                    price = price.replace("€", "");
                    if (parseFloat(price) < parseFloat($("#Range").val())) {
                        var index = row.rowIndex;
                        $("#data-table tbody tr:nth-of-type(" + index + ")").hide();
                    } else {
                        var index = row.rowIndex;
                        $("#data-table tbody tr:nth-of-type(" + index + ")").show();
                    }
                });
            });
            $("#Range").change(function () {
                $("#valuenb").val($("#Range").val());
                $('#data-table tbody tr').get().map(function (row) {
                    var index = row.rowIndex;
                    var price = row.children[5].innerHTML;
                    price = price.replace("€", "");
                    if (parseFloat(price) < parseFloat($("#Range").val())) {
                        $("#data-table tbody tr:nth-of-type(" + index + ")").hide();
                    } else {
                        $("#data-table tbody tr:nth-of-type(" + index + ")").show();
                    }
                });
            });
            $('.dropdown-menu').on('click', function (event) {
                event.stopPropagation();
            });
            $('body').on('click', function (event) {
                var target = $(event.target);
                if (target.parents('.bootstrap-select').length) {
                    event.stopPropagation();
                    $('.bootstrap-select.open').removeClass('open');
                }
            });
            if (ruolo == "Atleta") url1 = "https://aibvcapi.azurewebsites.net/api/v1/tornei/TorneInCorso/";
            else if (ruolo == "Allenatore") url1 = "https://aibvcapi.azurewebsites.net/api/v1/allenatori/TorneiInCorso/";
            var settings = {
                "url": "" + url1 + idUtente + "",
                "method": "GET",
                "timeout": 0,
                "withCredentials": true,
                "headers": {
                    "Authorization": "Bearer " + token
                },
            };
            $.ajax(settings).done(function (response) {
                $('#tabella-incorso').empty();
                response.forEach(function (dati) {
                    $('#tabella-incorso').append("<tr id=" + dati.idTorneo + "><td>" + (formatDate(dati.dataInizio)) + "</td><td>" + (dati.nomeImpianto) + "</td><td>" + (dati.nomeSocieta) + "</td><td>" + (dati.gender) + "</td><td>" + (dati.outdoor ? "indoor" : "outdoor") + "</td><td>" + (dati.montepremi) + "€</td><td>" + (dati.tipoTorneo) + "</td><td>" + (dati.formula) + "</td><td>" + (dati.oraInizio) + "</td><td>" + (dati.numMaxTeamMainDraw) + "</td><td>" + formatDate(dati.dataChiusuraIscrizioni) + "</td><td>" + (dati.oraInizio) + "</td></tr>");
                });
                $('#data-table-incorso').DataTable({
                    "search": {
                        "caseInsensitive": false
                    },
                    responsive: true,
                    "order": [
                        [0, "asc"]
                    ]
                });
            });
            var sesso_status = false;
            $('input[name="gender"]').click(function () {
                if (!sesso_status) {
                    $('#data-table tbody tr').get().map(function (row) {
                        if (row.children[3].innerHTML != $('input[name="gender"]:checked').val()) {
                            var index = row.rowIndex;
                            $("#tabella tr:nth-of-type(" + index + ")").hide();
                            sesso_status = true;
                        }
                    });
                } else {
                    sesso_status = false;
                    $('#reset').click();
                }
            });
            $('#categoria').change(function () {
                if ($("#categoria").val() != "All") {
                    $('#data-table tbody tr').get().map(function (row) {
                        if (row.children[6].innerHTML != $("#categoria").val()) {
                            var index = row.rowIndex;
                            $("#tabella tr:nth-of-type(" + index + ")").hide();
                        } else {
                            var index = row.rowIndex;
                            $("#tabella tr:nth-of-type(" + index + ")").show();
                        }
                    });
                } else $('#reset').click();
            });
            $('#reset').click(function () {
                $("#Range").val(5000);
                $("#valuenb").val(5000);
                $('#data-table tbody tr').get().map(function (row) {
                    var index = row.rowIndex;
                    $("#tabella tr:nth-of-type(" + index + ")").show();
                });
            });
            $('#data-table tbody').on("click", "tr", function () {
                <%Session["IdTorneo"] = HiddenField1.Value; %>
                window.location = "InfoTorneo.aspx?id=" + $(this).attr("id");
            });

            $("#valuenb").change(function () {
                $("#Range").val($("#valuenb").val());
                $('#data-table tbody tr').get().map(function (row) {
                    var index = row.rowIndex;
                    var price = row.children[5].innerHTML;
                    price = price.replace("€", "");
                    if (parseFloat(price) < parseFloat($("#Range").val())) {
                        var index = row.rowIndex;
                        $("#data-table tbody tr:nth-of-type(" + index + ")").hide();
                    } else {
                        var index = row.rowIndex;
                        $("#data-table tbody tr:nth-of-type(" + index + ")").show();
                    }
                });
            });
            $("#Range").change(function () {
                $("#valuenb").val($("#Range").val());
                $('#data-table tbody tr').get().map(function (row) {
                    var index = row.rowIndex;
                    var price = row.children[5].innerHTML;
                    price = price.replace("€", "");
                    if (parseFloat(price) < parseFloat($("#Range").val())) {
                        $("#data-table tbody tr:nth-of-type(" + index + ")").hide();
                    } else {
                        $("#data-table tbody tr:nth-of-type(" + index + ")").show();
                    }
                });
            });
            $('.dropdown-menu').on('click', function (event) {
                event.stopPropagation();
            });
            $('body').on('click', function (event) {
                var target = $(event.target);
                if (target.parents('.bootstrap-select').length) {
                    event.stopPropagation();
                    $('.bootstrap-select.open').removeClass('open');
                }
            });
            if (ruolo == "Atleta") url1 = "https://aibvcapi.azurewebsites.net/api/v1/tornei/ToreniFiniti/";
            else if (ruolo == "Allenatore") url1 = "https://aibvcapi.azurewebsites.net/api/v1/allenatori/TorneiFiniti/";
            var settings = {
                "url": "" + url1 + idUtente + "",
                "method": "GET",
                "timeout": 0,
                "withCredentials": true,
                "headers": {
                    "Authorization": "Bearer " + token
                },
            };
            $.ajax(settings).done(function (response) {
                $('#tabella-finiti').empty();
                response.forEach(function (dati) {
                    $('#tabella-finiti').append("<tr id=" + dati.idTorneo + "><td>" + (formatDate(dati.dataInizio)) + "</td><td>" + (dati.nomeImpianto) + "</td><td>" + (dati.nomeSocieta) + "</td><td>" + (dati.gender) + "</td><td>" + (dati.outdoor ? "indoor" : "outdoor") + "</td><td>" + (dati.montepremi) + "€</td><td>" + (dati.tipoTorneo) + "</td><td>" + (dati.formula) + "</td><td>" + (dati.oraInizio) + "</td><td>" + (dati.numMaxTeamMainDraw) + "</td><td>" + formatDate(dati.dataChiusuraIscrizioni) + "</td><td>" + (dati.oraInizio) + "</td></tr>");
                });
                $('#data-table-finiti').DataTable({
                    "search": {
                        "caseInsensitive": false
                    },
                    responsive: true,
                    "order": [
                        [0, "asc"]
                    ]
                });
            });
            var sesso_status = false;
            $('input[name="gender"]').click(function () {
                if (!sesso_status) {
                    $('#data-table tbody tr').get().map(function (row) {
                        if (row.children[3].innerHTML != $('input[name="gender"]:checked').val()) {
                            var index = row.rowIndex;
                            $("#tabella tr:nth-of-type(" + index + ")").hide();
                            sesso_status = true;
                        }
                    });
                } else {
                    sesso_status = false;
                    $('#reset').click();
                }
            });
            $('#categoria').change(function () {
                if ($("#categoria").val() != "All") {
                    $('#data-table tbody tr').get().map(function (row) {
                        if (row.children[6].innerHTML != $("#categoria").val()) {
                            var index = row.rowIndex;
                            $("#tabella tr:nth-of-type(" + index + ")").hide();
                        } else {
                            var index = row.rowIndex;
                            $("#tabella tr:nth-of-type(" + index + ")").show();
                        }
                    });
                } else $('#reset').click();
            });
            $('#reset').click(function () {
                $("#Range").val(5000);
                $("#valuenb").val(5000);
                $('#data-table tbody tr').get().map(function (row) {
                    var index = row.rowIndex;
                    $("#tabella tr:nth-of-type(" + index + ")").show();
                });
            });
            $('#data-table tbody').on("click", "tr", function () {
                <%Session["IdTorneo"] = HiddenField1.Value; %>
                window.location = "InfoTorneo.aspx?id=" + $(this).attr("id");
            });

            $("#valuenb").change(function () {
                $("#Range").val($("#valuenb").val());
                $('#data-table tbody tr').get().map(function (row) {
                    var index = row.rowIndex;
                    var price = row.children[5].innerHTML;
                    price = price.replace("€", "");
                    if (parseFloat(price) < parseFloat($("#Range").val())) {
                        var index = row.rowIndex;
                        $("#data-table tbody tr:nth-of-type(" + index + ")").hide();
                    } else {
                        var index = row.rowIndex;
                        $("#data-table tbody tr:nth-of-type(" + index + ")").show();
                    }
                });
            });
            $("#Range").change(function () {
                $("#valuenb").val($("#Range").val());
                $('#data-table tbody tr').get().map(function (row) {
                    var index = row.rowIndex;
                    var price = row.children[5].innerHTML;
                    price = price.replace("€", "");
                    if (parseFloat(price) < parseFloat($("#Range").val())) {
                        $("#data-table tbody tr:nth-of-type(" + index + ")").hide();
                    } else {
                        $("#data-table tbody tr:nth-of-type(" + index + ")").show();
                    }
                });
            });
            $('.dropdown-menu').on('click', function (event) {
                event.stopPropagation();
            });
            $('body').on('click', function (event) {
                var target = $(event.target);
                if (target.parents('.bootstrap-select').length) {
                    event.stopPropagation();
                    $('.bootstrap-select.open').removeClass('open');
                }
            });

            $("#iscritti").show();
            $("#incorso").hide();
            $("#finiti").hide();
            $('#iscrittibtn').click(function () {
                $("#iscritti").show();
                $("#incorso").hide();
                $("#finiti").hide();
            });
            $('#incorsobtn').click(function () {
                $("#iscritti").hide();
                $("#incorso").show();
                $("#finiti").hide();
            });
            $('#finitibtn').click(function () {
                $("#iscritti").hide();
                $("#incorso").hide();
                $("#finiti").show();
            });
            loginbtn();
            societaload();
        });
        function loginbtn() {
            var id = '<%= Session["IdUtente"] %>';
            if (id != "") {
                $("#tesseratisocieta").hide();
                $("#btnlogin").text("Log out");
            }
            else {
                $("#btnlogin").text("Log in");
                $("#organizzazione").hide();
            }
        }
        function societaload() {
            var id = '<%= Session["ruolo"] %>';
            if (id != "Societa" || id == "") {
                $("#tesseratiSocieta").hide();
                $("#iscrittisocieta").hide();
            }
            else {
                $("#tesseratiSocieta").show();
                $("#iscrittisocieta").show();
            }
        }
        function formatDate(date) {
            var d = new Date(date),
                month = '' + (d.getMonth() + 1),
                day = '' + d.getDate(),
                year = d.getFullYear();

            if (month.length < 2)
                month = '0' + month;
            if (day.length < 2)
                day = '0' + day;

            return [day, month, year].join('-');
        }
        function DivClicked() {
            form1.HiddenField1.value = arguments[0];
            clickArea_Click.click();
        }
        function LoadPage() {
            window.location = "OutputTorneiNonAutorrizati.aspx";
        }
        function LoadPageDelegati() {
            window.location = "OutputTorneiDelegato.aspx";
        }
        function LoadPageIscritti() {
            window.location = "OutputTorneiIscritti.aspx";
        }
        function LoadCreaTorneo() {
            window.location = "CreaTorneo.aspx";
        }
        function LoadLogin() {
            var id = '<%= Session["IdUtente"] %>';
            if (id != "") window.location = "Login.aspx?change=1";
            else window.location = "Login.aspx";
        }
    </script>
</head>
<body>
    <nav class="navbar navbar-dark navbar-expand-md my-navbar sticky-top" id="my-navbar">
        <div class="container-fluid">
            <button data-toggle="collapse" class="navbar-toggler my-button" data-target="#navcol-1" id="my-navbar-items">
                <span class="sr-only">Toggle navigation</span>
                <i class="fas fa-bars" style="color: white;"></i>
            </button>
            <img src="Img/aibvc-logo.png" style="width: 94px;">
            <div class="collapse navbar-collapse row" id="navcol-1">
                <div class="col-md-11 col-sm-12">
                    <ul class="nav navbar-nav ml-5" id="myNavUl">
                        <li class="nav-item" role="presentation"><a class="nav-link active" href="OutputTornei.aspx">Home</a></li>
                        <li class="nav-item" role="presentation">
                            <div class="dropdown show">
                                <a class="nav-link dropdown-toggle" href="#" role="button" id="dropdownMenuLink1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">AIBVC Tour</a>
                                <div class="dropdown-menu my-navbar" aria-labelledby="dropdownMenuLink">
                                    <a class="dropdown-item" href="OutputClassifica.aspx?genere=M">Classifica Maschile</a>
                                    <a class="dropdown-item" href="OutputClassifica.aspx?genere=F">Classifica Femminile</a>
                                    <a class="dropdown-item" href="OutputTorneiCategoria?tipo=1">L1</a>
                                    <a class="dropdown-item" href="OutputTorneiCategoria?tipo=2">L2</a>
                                    <a class="dropdown-item" href="OutputTorneiCategoria?tipo=3">L3</a>
                                </div>
                            </div>
                        </li>
                        <li class="nav-item" role="presentation">
                            <div class="dropdown show" id="organizzazione">
                                <a class="nav-link dropdown-toggle" href="#" role="button" id="dropdownMenuLink2" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Organizzazione</a>
                                <div class="dropdown-menu my-navbar" aria-labelledby="dropdownMenuLink">
                                    <a id="anagrafica" class="dropdown-item" href="AnagraficaSocieta.aspx">Anagrafica</a>
                                </div>
                            </div>
                        </li>
                        <asp:PlaceHolder runat="server" ID="dinamicload"></asp:PlaceHolder>
                    </ul>
                </div>
                <div class="col-1">
                    <asp:PlaceHolder runat="server" ID="AccediBtn"></asp:PlaceHolder>
                </div>
            </div>
        </div>
    </nav>
    <form id="form1" runat="server">
        <asp:Button runat="server" ID="btnTorneo" Style="display: none" OnClick="clickArea_Click" ClientIDMode="Static" />
        <asp:HiddenField ID="HiddenField1" runat="server" />
        <!--Banner-->
        <div class="row mt-3 mb-3">
            <h1 class=" col-12 text-center my-auto banner">Iscrizioni Effettuate</h1>
        </div>
        <div class="row py-2">
                        <div class="btn-toolbar mx-auto" role="toolbar">
                            <div class="btn-group" role="group">
                                <button type="button" id="iscrittibtn" class="btn btn-primary btnTorneiIscritti">Iscritti</button>
                                <button type="button" id="incorsobtn" class="btn btn-secondary btnTorneiIscritti">In Corso</button>
                                <button type="button" id="finitibtn" class="btn btn-secondary btnTorneiIscritti">Finiti</button>
                            </div>
                        </div>
                    </div>
        <div class="ml-5 mr-5 mx-auto mb-5" id="myContentOutputTornei">
            <div id="iscritti">
                <div class="row">
                    <h2 class=" col-12 text-center">Tornei iscritti</h2>
                    <div class="col-md-5 col-sm-12">
                        <div class="row justify-content-center">
                            <div class="col-3">
                                <label class="my-1">Montepremi:</label>
                            </div>
                            <div class="col-5">
                                <input type="range" class="form-range my-2" min="1000" max="5000" step="50" id="Range">
                            </div>
                            <div class="col-4">
                                <input type="number" min="1000" max="5000" step="50" class="form-control form-control-sm" id="valuenb" aria-describedby="value">
                            </div>
                        </div>
                    </div>
                    <div class="col-md-5 col-sm-9">
                        <div class="row">
                            <div class="col-3">
                                <label>Genere:</label>
                            </div>
                            <div class="col-9">
                                <div class="custom-control custom-switch">
                                    <div class="row">
                                        <div class="col-3">
                                            <input type="checkbox" class="custom-control-input" value="M" name="gender" id="m">
                                            <label class="custom-control-label" for="m">M</label>
                                        </div>
                                        <div class="col-3">
                                            <input type="checkbox" class="custom-control-input" value="F" name="gender" id="f">
                                            <label class="custom-control-label" for="f">F</label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-2 col-sm-3">
                        <button type="button" id="reset" class="btn btn-danger mb-2">Reset</button>
                    </div>
                </div>
                <div id="scrollable">
                    <table id="data-table-iscritti" class="table table-striped table-hover">
                        <thead>
                            <tr class="table-primary">
                                <th>DataInizio</th>
                                <th>Localita</th>
                                <th>Promoter</th>
                                <th>Genere</th>
                                <th>Tipo</th>
                                <th>Montepremi</th>
                                <th>Formula</th>
                                <th>Formula</th>
                                <th>Ora Inizio</th>
                                <th>N.Coppie</th>
                                <th>Scadenza Iscrizioni</th>
                                <th>Pubblicazione lista</th>
                            </tr>
                        </thead>
                        <tbody id="tabella-iscritti" class="pointer">
                        </tbody>
                    </table>
                </div>
                <br>
            </div>
            <div id="incorso">
                <div class="row">
                    <h2 class=" col-12 text-center">Tornei attualmente in corso</h2>
                    <div class="col-md-5 col-sm-12">
                        <div class="row justify-content-center">
                            <div class="col-3">
                                <label class="my-1">Montepremi:</label>
                            </div>
                            <div class="col-5">
                                <input type="range" class="form-range my-2" min="1000" max="5000" step="50" id="Range">
                            </div>
                            <div class="col-4">
                                <input type="number" min="1000" max="5000" step="50" class="form-control form-control-sm" id="valuenb" aria-describedby="value">
                            </div>
                        </div>
                    </div>
                    <div class="col-md-5 col-sm-9">
                        <div class="row">
                            <div class="col-3">
                                <label>Genere:</label>
                            </div>
                            <div class="col-9">
                                <div class="custom-control custom-switch">
                                    <div class="row">
                                        <div class="col-3">
                                            <input type="checkbox" class="custom-control-input" value="M" name="gender" id="m">
                                            <label class="custom-control-label" for="m">M</label>
                                        </div>
                                        <div class="col-3">
                                            <input type="checkbox" class="custom-control-input" value="F" name="gender" id="f">
                                            <label class="custom-control-label" for="f">F</label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-2 col-sm-3">
                        <button type="button" id="reset" class="btn btn-danger mb-2">Reset</button>
                    </div>
                </div>
                <div id="scrollable">
                    <table id="data-table-incorso" class="table table-striped table-hover">
                        <thead>
                            <tr class="table-primary">
                                <th>DataInizio</th>
                                <th>Localita</th>
                                <th>Promoter</th>
                                <th>Genere</th>
                                <th>Tipo</th>
                                <th>Montepremi</th>
                                <th>Formula</th>
                                <th>Formula</th>
                                <th>Ora Inizio</th>
                                <th>N.Coppie</th>
                                <th>Scadenza Iscrizioni</th>
                                <th>Pubblicazione lista</th>
                            </tr>
                        </thead>
                        <tbody id="tabella-incorso">
                        </tbody>
                    </table>
                </div>
                <br>
            </div>
            <div id="finiti">
                <div class="row">
                    <h2 class=" col-12 text-center">Tornei Finiti</h2>
                    <div class="col-md-5 col-sm-12">
                        <div class="row justify-content-center">
                            <div class="col-3">
                                <label class="my-1">Montepremi:</label>
                            </div>
                            <div class="col-5">
                                <input type="range" class="form-range my-2" min="1000" max="5000" step="50" id="Range">
                            </div>
                            <div class="col-4">
                                <input type="number" min="1000" max="5000" step="50" class="form-control form-control-sm" id="valuenb" aria-describedby="value">
                            </div>
                        </div>
                    </div>
                    <div class="col-md-5 col-sm-9">
                        <div class="row">
                            <div class="col-3">
                                <label>Genere:</label>
                            </div>
                            <div class="col-9">
                                <div class="custom-control custom-switch">
                                    <div class="row">
                                        <div class="col-3">
                                            <input type="checkbox" class="custom-control-input" value="M" name="gender" id="m">
                                            <label class="custom-control-label" for="m">M</label>
                                        </div>
                                        <div class="col-3">
                                            <input type="checkbox" class="custom-control-input" value="F" name="gender" id="f">
                                            <label class="custom-control-label" for="f">F</label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-2 col-sm-3">
                        <button type="button" id="reset" class="btn btn-danger mb-2">Reset</button>
                    </div>
                </div>
                <div id="scrollable">
                    <table id="data-table-finiti" class="table table-striped table-hover">
                        <thead>
                            <tr class="table-primary">
                                <th>DataInizio</th>
                                <th>Localita</th>
                                <th>Promoter</th>
                                <th>Genere</th>
                                <th>Tipo</th>
                                <th>Montepremi</th>
                                <th>Formula</th>
                                <th>Formula</th>
                                <th>Ora Inizio</th>
                                <th>N.Coppie</th>
                                <th>Scadenza Iscrizioni</th>
                                <th>Pubblicazione lista</th>
                            </tr>
                        </thead>
                        <tbody id="tabella-finiti">
                        </tbody>
                    </table>
                </div>
                <br>
            </div>
        </div>
        <script src="Scripts/bootstrap.min.js "></script>
        <script src="Scripts/main.js"></script>
    </form>
</body>
</html>
