<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OutputTornei.aspx.cs" Inherits="test.OutputTornei" %>

<!DOCTYPE html>
<html>

<head runat="server">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Tornei</title>
    <link rel="stylesheet" href="Content/bootstrap.min.css">
    <link rel="stylesheet" href="Content/styles.css">
    <script src="https://kit.fontawesome.com/95609c6d0f.js" crossorigin="anonymous"></script>
    <script async defer crossorigin="anonymous" src="https://connect.facebook.net/it_IT/sdk.js#xfbml=1&version=v9.0" nonce="ekmMNXcv"></script>
    <script>
        function DivClicked() {
            var clickArea_Click = $('#<%= btnTorneo.ClientID %>');
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
                <div class="col-md-10 col-sm-12">
                    <ul class="nav navbar-nav ml-5" id="myNavUl">
                        <li class="nav-item" role="presentation"><a class="nav-link active" href="OutputTornei.aspx">Home</a></li>
                        <li class="nav-item" role="presentation">
                            <div class="dropdown show">
                                <a class="nav-link dropdown-toggle" href="#" role="button" id="dropdownMenuLink1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">AIBVC Tour</a>
                                <div class="dropdown-menu my-navbar" aria-labelledby="dropdownMenuLink">
                                    <a class="dropdown-item" href="#">Indizione AIBVC Tour</a>
                                    <a class="dropdown-item" href="#">Calendario L1</a>
                                    <a class="dropdown-item" href="#">Calendario L2</a>
                                    <a class="dropdown-item" href="#">Calendario L3</a>
                                    <a class="dropdown-item" href="#" onclick="LoadClassificaMaschile();">Classifica Maschile</a>
                                    <a class="dropdown-item" href="#" onclick="LoadClassificaFemminile();">Classifica Femminile</a>
                                </div>
                            </div>
                        </li>
                        <li class="nav-item" role="presentation"><a class="nav-link active" href="#">Formazione</a></li>
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
                        <asp:PlaceHolder runat="server" ID="dinamicload"></asp:PlaceHolder>
                    </ul>
                </div>
                <div class="col-2">
                    <asp:PlaceHolder runat="server" ID="AccediBtn"></asp:PlaceHolder>
                </div>
            </div>
        </div>
    </nav>
    <form id="form1" runat="server">
        <asp:Button runat="server" ID="btnTorneo" Style="display: none" OnClick="clickArea_Click" ClientIDMode="Static" />
        <asp:HiddenField ID="HiddenField1" runat="server" />
        <!--Banner-->
        <div class="page-title row">
            <h1 class=" col-12 text-center my-auto">Tornei</h1>
        </div>

        <div class="container">
            <!--CERCA-->
            <div class="searchBox mx-2 my-2">
                <input class="searchInput" type="text" name="" placeholder="Cerca">
                <button class="searchButton">
                    <i class=" fas fa-search"></i>
                </button>
            </div>
            <!--Tornei-->
            <div class="card-deck">
                <div class="row">
                    <asp:PlaceHolder runat="server" ID="torneilist"></asp:PlaceHolder>
                </div>
            </div>
        </div>
        <script src="Scripts/jquery-3.4.1.min.js "></script>
        <script src="Scripts/bootstrap.min.js "></script>
    </form>
</body>
</html>
