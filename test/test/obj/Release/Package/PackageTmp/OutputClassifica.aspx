<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OutputClassifica.aspx.cs" Inherits="test.OutputClassifica" %>

<!DOCTYPE html>

<html>
<head>
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
        function LoadClassificaMaschile() {
            window.location = "OutputClassifica.aspx?genere=M";
        }
        function LoadClassificaFemminile() {
            window.location = "OutputClassifica.aspx?genere=F";
        }
        function LoadLogin() {
            window.location = "Login.aspx";
        }
        </script>
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
            var index = 0;
            $.ajax(settings).done(function (response) {
                response.forEach(function (dati) {
                    index++;
                    $('#tabella').append("<tr><td>"+index+"</td><td>" + (dati.nome) + "</td><td>" + (dati.cognome) + "</td><td>" + (dati.punteggi) + "</td></tr>");
                });
                $('#data-table').DataTable({
                    "order": [[3, "desc"]]
                });
            });
        });
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
        <!--Banner-->
        <div class="row mt-3 mb-3">
            <h1 class=" col-12 text-center my-auto banner">Classifica</h1>
        </div>
        <!--Tabella-->
        <div class="container">
            <div class="mr-3 ml-3 mt-3 card-container">
                <div>
                    <table id="data-table" class="table table-striped overflow-auto">
                        <thead>
                            <tr class="table-primary">
                                <th>#</th>
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
            </div>
        </div>
        <script src="Scripts/bootstrap.min.js "></script>
    </form>
</body>
</html>
