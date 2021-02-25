<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OutputPartiteTorneo.aspx.cs" Inherits="test.OutputPartiteTorneo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Partite torneo</title>
    <link rel="stylesheet" href="Content/bootstrap.min.css">
    <link rel="stylesheet" href="Content/styles.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.23/css/jquery.dataTables.min.css">
    <script src="https://cdn.datatables.net/1.10.23/js/jquery.dataTables.min.js"></script>
    <script>
        $(document).ready(function () {
            var token = '<%= Session["Token"] %>';
            var parametri = new URLSearchParams(window.location.search);
            var id = parametri.get('id');
            var settings = {
                "url": "https://aibvcapi.azurewebsites.net/api/v1/tornei/GetPartiteTorneo/" + id,
                "method": "GET",
                "timeout": 0,
                "withCredentials": true,
                "headers": {
                    "Authorization": "Bearer " + token
                },
            };
            $.ajax(settings).done(function (response) {
                $('#tabella').empty();
                response.forEach(function (dati) {
                    $('#tabella').append("<tr id=" + dati.numPartita + "><td>" + (formatDate(dati.dataPartita)) + "</td><td>" + dati.fase + "</td><td>" + dati.nomeTeam +"-"+dati.nomeTeam1+"</td><td>" + dati.risultato + "</td></tr>");
                });
                $('#data-table').DataTable({
                    "search": {
                        "caseInsensitive": false
                    },
                    responsive: true,
                    "order": [
                        [0, "asc"]
                    ]
                });
            });
            $('#data-table tbody').on("click", "tr", function () {
                <%Session["IdTorneo"] = HiddenField1.Value; %>
                window.location = "InfoPartita.aspx?id=" + id + "&partita=" + $(this).attr("id");
            });
        });
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
            var clickArea_Click = $('#<%= btnTorneo.ClientID %>');
            form1.HiddenField1.value = arguments[0];
            clickArea_Click.click();
        }
        function LoadLogin() {
            var id = '<%= Session["IdUtente"] %>';
            if (id != "") window.location = "Login.aspx?change=1";
            else window.location = "Login.aspx";
        }
    </script>
</head>
<body>
    <nav class="navbar navbar-dark navbar-expand-md my-navbar" id="my-navbar">
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
                                    <a id="anagrafica" class="dropdown-item" href="AnagraficaDelegato.aspx">Anagrafica</a>
                                </div>
                            </div>
                        </li>
                        <asp:PlaceHolder runat="server" ID="dinamicload"></asp:PlaceHolder>
                    </ul>
                </div>
                <div class="col-1">
                    <button type="button" id="btnlogin" class="btn btn-light" onclick="LoadLogin();">Logout</button>
                </div>
            </div>
        </div>
    </nav>
    <form id="form1" runat="server">
        <asp:Button runat="server" ID="btnTorneo" Style="display: none" ClientIDMode="Static" />
        <asp:HiddenField ID="HiddenField1" runat="server" />
        <!--Banner-->
        <div class="row mt-3 mb-3">
            <h1 class=" col-12 text-center my-auto banner">Tornei</h1>
        </div>
<div class="card-container ml-5 mr-5 mx-auto" id="myContentOutputTornei">
            <div class="table-responsive">
                <table id="data-table" class="table table-striped table-hover">
                    <thead>
                        <tr class="table-primary">
                            <th>Data Partita</th>
                            <th>Fase</th>
                            <th>Gara</th>
                            <th>Risultato</th>
                        </tr>
                    </thead>
                    <tbody id="tabella" class="pointer">
                    </tbody>
                </table>
            </div>
            <br>
        </div>
        <script src="Scripts/bootstrap.min.js "></script>
    </form>
</body>
</html>
