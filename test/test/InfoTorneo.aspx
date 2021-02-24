<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InfoTorneo.aspx.cs" Inherits="test.InfoTorneo" %>


<!DOCTYPE html>
<html>

<head runat="server">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Informazioni torneo</title>
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
        <div class="page-title row">
            <h1 class=" col-12 text-center my-auto">Informazioni torneo</h1>
        </div>
        <div class="container" id="infotorneo">
            <div class="card-container mr-3 ml-3 mt-3">
                <div class="row mt-4">
                    <div class="col-md-6 col-sm-12 contentInfo">
                        <asp:PlaceHolder runat="server" ID="torneiInfo"></asp:PlaceHolder>
                    </div>
                    <div class="col-md-5 col-sm-12 offset-md-1 mt-3 mt-md-0">
                        <div class="row">
                            <div class="col-12 contentInfo">
                                <h2>Localit&agrave</h2>
                                <asp:PlaceHolder runat="server" ID="torneiinfoluogo"></asp:PlaceHolder>
                            </div>
                        </div>
                        <div class="row my-3 justify-content-between">
                            <div class="col-3">
                                <asp:Button ID="autorizza" runat="server" Text="Autorizza torneo" Visible="false" OnClick="autorizza_Click" CssClass="btn btn-primary" />
                            </div>
                            <div class="col-3">
                                <asp:Button ID="partite" runat="server" Text="Visualizza partite" OnClick="partite_Click" CssClass="btn btn-primary" />
                            </div>
                            <div class="col-3">
                                <asp:Button ID="btnIscriviti" runat="server" Text="Iscrivi squadra" OnClick="btnIscriviti_Click" CssClass="btn btn-primary" />
                            </div>
                            <div class="col-3">
                                <a id="back" class="btn btn-secondary" href="javascript:history.go(-1)">Indietro</a>
                            </div>
                        </div>
                    </div>
                </div>
                <div>
                    <!--Placeholder squadre-->
                    <asp:PlaceHolder runat="server" ID="squadre"></asp:PlaceHolder>
                    <asp:Button runat="server" ID="btnTorneo" Style="display: none" OnClick="clickArea_Click" ClientIDMode="Static" />
                    <asp:HiddenField ID="HiddenField1" runat="server" />
                </div>
            </div>
        </div>
        <script src="Scripts/jquery-3.4.1.min.js "></script>
        <script src="Scripts/bootstrap.min.js "></script>
    </form>
</body>
</html>
