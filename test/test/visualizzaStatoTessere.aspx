<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="visualizzaStatoTessere.aspx.cs" Inherits="test.visualizzaStatoTessere" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Stato Tessere</title>
    <link rel="stylesheet" href="Content/bootstrap.min.css">
    <link rel="stylesheet" href="Content/styles.css">
    <script src="https://kit.fontawesome.com/95609c6d0f.js" crossorigin="anonymous"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="Scripts/jquery-dateformat.min.js"></script>
    <link href="https://cdn.datatables.net/1.10.23/css/jquery.dataTables.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
     <script>
         $(document).ready(function () {
             var idutente = '<%= Session["idUtente"].ToString() %>';
             var ruolo = '<%= Session["ruolo"].ToString() %>';
             var token = '<%= Session["Token"].ToString() %>';
             var parametri = new URLSearchParams(window.location.search);
             var settings = {
                 "url": "https://aibvcapi.azurewebsites.net/api/v1/societa/TessereSocieta/" + idutente,
                 "method": "GET",
                 "timeout": 0,
                 "withCredentials": true,
                 "headers": {
                     "Authorization": "Bearer " + token
                 },
             };
             $.ajax(settings).done(function (response) {
                 response.forEach(function (dati) {
                     $('#tabella').append("<tr><td>" + (dati.atleta) + "</td><td>" + (dati.codiceTessera) + "</td><td>" + (dati.annoTesseramento) + "</td></tr>");
                 });
                 $('#data-table-allenatori').DataTable({
                     "search": {
                         "caseInsensitive": false
                     },
                     "order": [[0, "desc"]]
                 });
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
             else $("#btnlogin").text("Log in");
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
                                    <a class="dropdown-item" href="#" onclick="LoadClassificaMaschile();">Classifica Maschile</a>
                                    <a class="dropdown-item" href="#" onclick="LoadClassificaFemminile();">Classifica Femminile</a>
                                    <a class="dropdown-item" href="OutputTorneiCategoria?tipo=1">L1</a>
                                    <a class="dropdown-item" href="OutputTorneiCategoria?tipo=2">L2</a>
                                    <a class="dropdown-item" href="OutputTorneiCategoria?tipo=3">L3</a>
                                </div>
                            </div>
                        </li>
                        <li class="nav-item" role="presentation">
                            <div class="dropdown show">
                                <a class="nav-link dropdown-toggle" href="#" role="button" id="dropdownMenuLink2" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Organizzazione</a>
                                <div class="dropdown-menu my-navbar" aria-labelledby="dropdownMenuLink">
                                    <a class="dropdown-item" href="AnagraficaSocieta.aspx">Anagrafica</a>
                                    <a id="iscrittisocieta" class="dropdown-item" href="visualizzaComponentiSocieta.aspx">Elenco Iscritti</a>
                                    <a id="tesseratiSocieta" class="dropdown-item" href="visualizzaStatoTessere.aspx">Elenco tesserati</a>
                                </div>
                            </div>
                        </li>
                        <asp:PlaceHolder runat="server" ID="dinamicload"></asp:PlaceHolder>
                    </ul>
                </div>
                <div class="col-1">
                    <button type="button" id="btnlogin" class="btn btn-light" onclick="LoadLogin();"></button>
                </div>
            </div>
        </div>
    </nav>
        <!--Banner-->
        <div class="row mt-3 mb-3">
            <h1 class=" col-12 text-center my-auto banner">Stato Tessere</h1>
        </div>
    <form id="formComponentiSocieta" runat="server">
        <div class="container">
            <br />
            <div title="Tessere">
                <asp:Label runat="server" ID="lbltessere" Text="Visualizza Tessere: "></asp:Label><br />
                <asp:PlaceHolder runat="server" ID="visualizzaAllenatori"></asp:PlaceHolder>
                <table id="data-table" class="table table-striped overflow-auto">
                    <thead>
                        <tr>
                            <th>Atleta</th>
                            <th>Codice Tessera</th>
                            <th>Anno Tesseramento</th>
                        </tr>
                    </thead>
                    <tbody id="tabella">
                    </tbody>
                </table>
            </div>
        </div>
        <script src="Scripts/bootstrap.min.js "></script>
    </form>
</body>
</html>