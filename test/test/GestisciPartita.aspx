<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GestisciPartita.aspx.cs" Inherits="test.GestisciPartita" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Gestisci partita</title>
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
            <h1 class=" col-12 text-center my-auto banner">Gestisci partita</h1>
        </div>
        <div class="container">
            <div class="mr-3 ml-3 mt-3">
                <div class="row mt-4">
                    <div class="col-md-6 col-sm-12 contentInfo">
                        <h2>Informazioni Torneo</h2>
                        <h3>Nome squadra 1</h3>
                        <asp:Label runat="server" ID="NomeTeam1"></asp:Label>
                        <h3>Nome squadra 2</h3>
                        <asp:Label runat="server" ID="NomeTeam2"></asp:Label>
                        <h3>Arbitro</h3>
                        <asp:Label runat="server" ID="Arbitri"></asp:Label>
                        <h3>Fase</h3>
                        <asp:TextBox runat="server" ID="Fase"></asp:TextBox>
                        <h3>Campo</h3>
                        <asp:TextBox runat="server" ID="Campo"></asp:TextBox>
                        <h3>Data partita</h3>
                        <asp:Calendar runat="server" ID="Data"></asp:Calendar>
                        <h3>Ora partita</h3>
                        <asp:TextBox TextMode="Time" runat="server" ID="Ora"></asp:TextBox>
                        <h3>Risultato</h3>
                        <asp:TextBox runat="server" ID="Risultato"></asp:TextBox>
                        <h3>Durata</h3>
                        <asp:TextBox runat="server" ID="Durata"></asp:TextBox>
                    </div>
                    <div class="col-md-5 col-sm-12 offset-md-1 mt-3 mt-md-0">
                        <div class="row">
                            <div class="col-12 contentInfo">
                                <h2>Modifica punti set</h2>
                                <h3>T1S1</h3>
                                <asp:TextBox ID="T1S1" TextMode="Number" runat="server" min="0" step="1"></asp:TextBox>
                                <h3>T2S1</h3>
                                <asp:TextBox ID="T2S1" TextMode="Number" runat="server" min="0" step="1"></asp:TextBox>
                                <h3>T1S2</h3>
                                <asp:TextBox ID="T1S2" TextMode="Number" runat="server" min="0" step="1"></asp:TextBox>
                                <h3>T2S2</h3>
                                <asp:TextBox ID="T2S2" TextMode="Number" runat="server" min="0" step="1"></asp:TextBox>
                                <h3>T1S3</h3>
                                <asp:TextBox ID="T1S3" TextMode="Number" runat="server" min="0" step="1"></asp:TextBox>
                                <h3>T2S3</h3>
                                <asp:TextBox ID="T2S3" TextMode="Number" runat="server" min="0" step="1"></asp:TextBox>
                                <h3>SetQ1</h3>
                                <asp:TextBox ID="SetQ1" runat="server"></asp:TextBox>
                                <h3>SetQ2</h3>
                                <asp:TextBox ID="SetQ2" runat="server"></asp:TextBox>
                            </div>
                        </div>
                        <div class="row my-3 justify-content-between">
                            <div class="col-4">
                                <asp:Button ID="ModificaPartita" runat="server" Text="Modifica risultati partita" Visible="false" OnClick="ModificaPartita_Click" CssClass="btn btn-primary" />
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
