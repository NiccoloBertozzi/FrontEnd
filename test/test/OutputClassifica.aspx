<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OutputClassifica.aspx.cs" Inherits="test.OutputClassifica" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Classifica</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.23/css/jquery.dataTables.min.css">
    <script src="https://cdn.datatables.net/1.10.23/js/jquery.dataTables.min.js"></script>
    <script>
        $(document).ready(function () {
            var parametri = new URLSearchParams(window.location.search);
            var genere = parametri.get('genere');
            var settings = {
                "url": "https://aibvcapi.azurewebsites.net/api/v1/gestionale/GetClassifica/" + genere,
                "method": "GET",
                "timeout": 0,
                "withCredentials": true,
                "headers": {},
            };
            $.ajax(settings).done(function (response) {
                response.forEach(function (dati) {
                    $('#tabella').append("<tr><td>" + (dati.nome) + "</td><td>" + (dati.cognome) + "</td><td>" + (dati.punteggi) + "</td></tr>");
                });
                $('#data-table').DataTable({
                    "order": [[2, "desc"]]
                });
            });
        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table id="data-table">
                <thead>
                    <tr>
                        <th>Nome</th>
                        <th>Cognome</th>
                        <th>Punteggio</th>
                    </tr>
                </thead>
                <tbody id="tabella">
                </tbody>
            </table>
            <br />
            <asp:PlaceHolder runat="server" ID="classificaTable"></asp:PlaceHolder>
        </div>
    </form>
</body>
</html>
<!--
<!DOCTYPE html>

<html>
<head runat="server">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Classifica</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.23/css/jquery.dataTables.min.css">
    <script src="https://cdn.datatables.net/1.10.23/js/jquery.dataTables.min.js"></script>
    <link rel="stylesheet" href="Content/bootstrap.min.css">
    <link rel="stylesheet" href="Content/styles.css">
    <script src="https://kit.fontawesome.com/95609c6d0f.js" crossorigin="anonymous"></script>
    <script>
        $(document).ready(function () {
            var parametri = new URLSearchParams(window.location.search);
            var genere = parametri.get('genere');
            var settings = {
                "url": "https://aibvcapi.azurewebsites.net/api/v1/gestionale/GetClassifica/" + genere,
                "method": "GET",
                "timeout": 0,
                "withCredentials": true,
                "headers": {},
            };
            $.ajax(settings).done(function (response) {
                response.forEach(function (dati) {
                    $('#tabella').append("<tr><td>" + (dati.nome) + "</td><td>" + (dati.cognome) + "</td><td>" + (dati.punteggi) + "</td></tr>");
                });
                $('#data-table').DataTable({
                    "order": [[2, "desc"]]
                });
            });
        });
    </script>
</head>
<body>
    <body>
    <nav class="navbar navbar-dark navbar-expand-md my-navbar" id="my-navbar">
        <div class="container-fluid">
            <button data-toggle="collapse" class="navbar-toggler my-button" data-target="#navcol-1" id="my-navbar-items">
                <span class="sr-only">Toggle navigation</span>
                <i class="fas fa-bars" style="color: white;"></i>
            </button>
            <img src="Img/aibvc-logo.png" style="width: 94px;">
            <div class="collapse navbar-collapse row" id="navcol-1">
                <div class="col-12">
                    <ul class="mx-auto nav navbar-nav">
                        <li class="nav-item" role="presentation"><a class="nav-link active" href="#">Home</a></li>
                        <li class="nav-item" role="presentation">
                            <div class="dropdown show">
                                <a class="nav-link dropdown-toggle" href="#" role="button" id="dropdownMenuLink1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">AIBVC Tour</a>
                                <div class="dropdown-menu my-navbar" aria-labelledby="dropdownMenuLink">
                                    <a class="dropdown-item" href="#">Indizione AIBVC Tour</a>
                                    <a class="dropdown-item" href="#">Calendario L1</a>
                                    <a class="dropdown-item" href="#">Calendario L2</a>
                                    <a class="dropdown-item" href="#">Calendario L3</a>
                                    <a class="dropdown-item" href="#">Classifica Maschile</a>
                                    <a class="dropdown-item" href="#">Classifica Femminile</a>
                                </div>
                            </div>
                        </li>
                        <li class="nav-item" role="presentation"><a class="nav-link" href="#">Formazione</a></li>
                        <li class="nav-item" role="presentation">
                            <div class="dropdown show">
                                <a class="nav-link dropdown-toggle" href="#" role="button" id="dropdownMenuLink2" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Organizzazione</a>
                                <div class="dropdown-menu my-navbar" aria-labelledby="dropdownMenuLink">
                                    <a class="dropdown-item" href="#">Chi siamo</a>
                                    <a class="dropdown-item" href="#">Affiliati</a>
                                    <a class="dropdown-item" href="#">Attività</a>
                                    <a class="dropdown-item" href="#">Come operiamo</a>
                                    <a class="dropdown-item" href="#">Obiettivi</a>
                                </div>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </nav>
        <form id="form2" runat="server">
        <div class="page-title row">
            <h1 class=" col-12 text-center my-auto">Classifica</h1>
        </div>
        <div class="panel panel-default mt-3 ml-3 mr-3">
            <table class="table table-hover table-bordered data-table">
            <thead id="myTableHead">
                <tr>
                    <th scope="col">Nome</th>
                    <th scope="col">Cognome AIBVC</th>
                    <th scope="col">Punteggio</th>
                </tr>
            </thead>
            <tbody id="tabella">
            </tbody>
        </table>
             <br />
            <asp:PlaceHolder runat="server" ID="PlaceHolder1"></asp:PlaceHolder>
        </div>
        <script src="Scripts/jquery-3.4.1.min.js "></script>
        <script src="Scripts/bootstrap.min.js "></script>
    </form>
</body>
</html>!-->