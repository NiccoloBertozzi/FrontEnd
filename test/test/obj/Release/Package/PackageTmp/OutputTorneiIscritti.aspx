<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OutputTorneiIscritti.aspx.cs" Inherits="test.OutputTorneiIscritti" %>

<!DOCTYPE html>
<html>

<head runat="server">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Tornei - atleta</title>
    <link rel="stylesheet" href="Content/bootstrap.min.css">
    <link rel="stylesheet" href="Content/styles.css">
    <script src="https://kit.fontawesome.com/95609c6d0f.js" crossorigin="anonymous"></script>
    <script>
        function DivClicked() {
            var clickArea_Click = $('#<%= btnTorneo.ClientID %>');
            form1.HiddenField1.value = arguments[0];
            clickArea_Click.click();
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
                                </div>
                            </div>
                        </li>
                        <li class="nav-item" role="presentation">
                            <div class="dropdown show">
                                <a class="nav-link dropdown-toggle" href="#" role="button" id="dropdownMenuLink2" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Organizzazione</a>
                                <div class="dropdown-menu my-navbar" aria-labelledby="dropdownMenuLink">
                                    <a class="dropdown-item" href="AnagraficaSocieta.aspx">Anagrafica</a>
                                    <a class="dropdown-item" href="visualizzaComponentiSocieta.aspx">Elenco tesserati</a>
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
        <div class="page-title row">
            <h1 class=" col-12 text-center my-auto">Iscrizioni Effettuate</h1>
        </div>

        <div class="container">
            <!--CERCA-->
            <div class="searchBox mx-2 my-2">
                <input class="searchInput" type="text" name="" placeholder="Cerca">
                <button class="searchButton" href="#">
                    <i class=" fas fa-search"></i>
                </button>
            </div>
            <div class="card-container mr-3 ml-3 mt-3">
                <!--Tornei-->
                <h2 class=" col-12 text-center">Tornei iscritti</h2>

                <div class="card-deck">
                    <div class="row">
                        <asp:PlaceHolder runat="server" ID="torneilist"></asp:PlaceHolder>
                    </div>
                </div>

                <hr style="background: black; margin-bottom: 10px;" />

                <!--Tornei in corso-->
                <h2 class=" col-12 text-center">Tornei attualmente in corso</h2>
                <div class="card-deck">
                    <div class="row">
                        <asp:PlaceHolder runat="server" ID="inCorso"></asp:PlaceHolder>
                    </div>
                </div>

                <hr style="background: black; margin-bottom: 10px;" />

                <!--Finiti-->
                <h2 class=" col-12 text-center">Tornei finiti</h2>

                <div class="card-deck">
                    <div class="row">
                        <asp:PlaceHolder runat="server" ID="finiti"></asp:PlaceHolder>
                    </div>
                </div>
            </div>
        </div>
        <script src="Scripts/jquery-3.4.1.min.js "></script>
        <script src="Scripts/bootstrap.min.js "></script>
    </form>
</body>
</html>
