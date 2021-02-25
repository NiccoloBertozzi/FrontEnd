<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InfoPartita.aspx.cs" Inherits="test.InfoPartita" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Informazioni partita</title>
    <link rel="stylesheet" href="Content/bootstrap.min.css">
    <link rel="stylesheet" href="Content/styles.css">
    <script src="https://kit.fontawesome.com/95609c6d0f.js" crossorigin="anonymous"></script>
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
        <!--Banner-->
        <div class="row mt-3 mb-3">
            <h1 class=" col-12 text-center my-auto banner">Informazioni partita</h1>
        </div>
        <div class="container-fluid mb-5">
            <div class="contentInfo m-3 p-2">
                <div class="row col-12 m-0 p-1 text-center" style="background-color: #edebeb;">
                    <div class="col-4 align-self-center">
                        <div class="row">
                            <div class="col-lg-6 align-self-center text-left">
                                <p runat="server" class="m-0 font-weight-bold" id="nomeT">
                                </p>
                            </div>
                        </div>
                    </div>
                    <div class="col-4 align-self-center text-center">
                        <p class="m-0 font-weight-bold" runat="server" id="tipoT">
                        </p>
                    </div>
                    <div class="col-4 align-self-center" style="text-align-last: end;">
                        <div class="row justify-content-end">
                            <div class="col-lg-6 align-self-center text-left" runat="server" id="dataT">
                            </div>
                            <div class="col-lg-6 align-self-center text-left" runat="server" id="oraT">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row col-12 m-0 mb-1 mt-1 mb-lg-5 mt-lg-5 text-center">
                    <div class="col-lg-4 align-self-center">
                        <h2 class="mb-4 mb-lg-0 mt-4 mt-lg-0 font-weight-bold" runat="server" id="team1"></h2>
                    </div>
                    <div class="col-lg-4">
                        <div class="row text-center">
                            <div class="col-12">
                                <h2 class="m-0 font-weight-bold punteggio" runat="server" id="punteggioT"></h2>
                            </div>
                        </div>
                        <div class="row text-center">
                            <div class="col-12">
                                <p class="m-2" runat="server" id="setT">
                                </p>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 align-self-center">
                        <h2 class="mb-4 mb-lg-0 mt-4 mt-lg-0 font-weight-bold" runat="server" id="team2"></h2>
                    </div>
                </div>
            </div>
            <div class="card-container mr-3 ml-3 mt-3">
                <div class="row m-0">
                    <div class="col-12 text-right">
                        <asp:Button ID="partite" runat="server" Text="Modifica partita" Visible="false" OnClick="partite_Click" CssClass="btn btn-primary mr-3" />
                        <a id="back" class="btn btn-secondary" href="javascript:history.go(-1)">Indietro</a>
                    </div>
                </div>
            </div>
        </div>
        <script src="Scripts/jquery-3.4.1.min.js "></script>
        <script src="Scripts/bootstrap.min.js "></script>
    </form>
</body>
</html>
