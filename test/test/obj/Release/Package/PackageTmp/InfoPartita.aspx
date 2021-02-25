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
                <h1 class=" col-12 text-center my-auto banner">Informazioni partita</h1>
            </div>
            <div class="container">
                <div class="card-container mr-3 ml-3 mt-3">
                    <div class="row mt-4">
                        <div class="col-md-6 col-sm-12 contentInfo">
                            <asp:PlaceHolder runat="server" ID="torneiInfo"></asp:PlaceHolder>
                        </div>
                        <div class="col-md-5 col-sm-12 offset-md-1 mt-3 mt-md-0">
                            <div class="row">
                                <div class="col-12 contentInfo">
                                    <h2>Punti set</h2>
                                    <asp:PlaceHolder runat="server" ID="torneiinfoset"></asp:PlaceHolder>
                                </div>
                            </div>
                            <div class="row my-3 justify-content-between">
                                <div class="col-4">
                                    <asp:Button ID="partite" runat="server" Text="Modifica partita" Visible="false" OnClick="partite_Click" CssClass="btn btn-primary" />
                                </div>
                                <div class="col-4">
                                    <a id="back" class="btn btn-secondary" href="javascript:history.go(-1)">Indietro</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <script src="Scripts/jquery-3.4.1.min.js "></script>
            <script src="Scripts/bootstrap.min.js "></script>
        </form>
    </body>
</html>
