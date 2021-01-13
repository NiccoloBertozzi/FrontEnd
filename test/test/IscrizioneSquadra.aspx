<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="IscrizioneSquadra.aspx.cs" Inherits="test.IscrizioneSquadra" %>

<!DOCTYPE html>

<html>

<head runat="server">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Creazione torneo</title>
    <link rel="stylesheet" href="Content/bootstrap.min.css">
    <link rel="stylesheet" href="Content/styles.css">
    <script src="https://kit.fontawesome.com/95609c6d0f.js" crossorigin="anonymous"></script>
</head>
<body>
    <nav class="navbar navbar-dark navbar-expand-md my-navbar sticky" id="my-navbar">
        <div class="container-fluid">
            <button data-toggle="collapse" class="navbar-toggler my-button" data-target="#navcol-1" id="my-navbar-items">
                <span class="sr-only">Toggle navigation</span>
                <i class="fas fa-bars" style="color: white;"></i>
            </button>
            <img src="Img/aibvc-logo.png" style="width: 94px;">
            <div class="collapse navbar-collapse row" id="navcol-1">
                <div class="col-md-11 col-sm-12">
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
                <div class="col-md-1 col-sm-12">
                    <a href="Login.aspx" class="loginButtonTornei btn float-right-md float-left-sm">Accedi</a>
                </div>
            </div>
        </div>
    </nav>
    <form id="form1" runat="server">
        <!--Banner-->
        <div class="page-title row">
            <h1 class=" col-12 text-center my-auto">Inserimento squadra torneo</h1>
        </div>
        <div class="container">
            <div class="mr-3 ml-3 mt-3 card-container">
                <!-- Codice Secondo Atleta -->
                <div class="form-group">
                    <label for="titoloTorneo" id="lblSecondoAtleta">Codice secondo atleta</label>
                    <asp:DropDownList ID="cmbAtleta2" CssClass="form-control" runat="server" AutoPostBack="true" required="true" OnSelectedIndexChanged="cmbAtleta2_SelectedIndexChanged">
                        <asp:ListItem Value="" Selected="true" Text="Seleziona Atleta"></asp:ListItem>
                    </asp:DropDownList>
                    <asp:Label ID="nomeAtleta2" runat="server" Text=""></asp:Label></br>
                </div>
                <!-- Codice Secondo Atleta -->
                <div class="form-group">
                    <label for="titoloTorneo" id="lblAllenatore">Codice allenatore</label>

                    <asp:DropDownList ID="cmballenatore" CssClass="form-control" runat="server" AutoPostBack="true" required="true" OnSelectedIndexChanged="cmballenatore_SelectedIndexChanged">
                        <asp:ListItem Value="" Selected="true" Text="Seleziona Allenatore"></asp:ListItem>
                    </asp:DropDownList>
                    <asp:Label ID="nomeAllenatore" runat="server" Text=""></asp:Label></br>
                </div>
                <!-- Nome Team -->
                <div class="form-group">
                    <label for="titoloTorneo" id="nometeam">Nome Team</label>
                    <asp:TextBox ID="txtNomeTeam" runat="server" CssClass="form-control"></asp:TextBox></br>
                </div>
                <asp:Button ID="btn_IscriviSquadra" runat="server" Text="Iscriviti al Torneo" OnClick="btn_IscriviSquadra_Click" CssClass="btn btn-primary" />
            </div>
        </div>
        <script src="Scripts/jquery-3.4.1.min.js "></script>
        <script src="Scripts/bootstrap.min.js "></script>
    </form>
</body>
</html>
