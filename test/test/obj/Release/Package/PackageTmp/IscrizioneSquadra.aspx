﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="IscrizioneSquadra.aspx.cs" Inherits="test.IscrizioneSquadra" %>

<!DOCTYPE html>

<html>

<head runat="server">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Iscrizione squadra</title>
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
            <h1 class=" col-12 text-center my-auto banner">Iscrizione squadra al torneo</h1>
        </div>
        <div class="container">
            <div class="mr-3 ml-3 mt-3 mb-5">
                <!-- Nome Team -->
                <div class="form-group">
                    <label for="titoloTorneo" id="nometeam">Nome squadra</label>
                    <asp:TextBox ID="txtNomeTeam" runat="server" CssClass="form-control"></asp:TextBox></br>
                </div>
                <!-- Codice Secondo Atleta -->
                <div class="form-group">
                    <label for="titoloTorneo" id="lblSecondoAtleta">Codice secondo atleta</label>
                    <asp:TextBox AutoPostBack="true" required="true" ID="Atleta" CssClass="form-control" runat="server" OnTextChanged="Atleta_TextChanged"></asp:TextBox>
                    <asp:Label ID="nomeAtleta2" runat="server" Text=""></asp:Label></br>
                </div>
                <!-- Codice Secondo Atleta -->
                <div class="form-group">
                    <label for="titoloTorneo" id="lblAllenatore">Codice allenatore</label>
                    <asp:TextBox AutoPostBack="true" required="true" ID="Allenatore" CssClass="form-control" runat="server" OnTextChanged="Allenatore_TextChanged"></asp:TextBox>
                    <asp:Label ID="nomeAllenatore" runat="server" Text=""></asp:Label></br>
                </div>
                <asp:Button ID="btn_IscriviSquadra" runat="server" Text="Iscriviti al Torneo" OnClick="btn_IscriviSquadra_Click" CssClass="btn btn-primary" />
            </div>
        </div>
        <script src="Scripts/jquery-3.4.1.min.js "></script>
        <script src="Scripts/bootstrap.min.js "></script>
    </form>
</body>
</html>
