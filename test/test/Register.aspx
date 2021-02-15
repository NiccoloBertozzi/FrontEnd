<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="test.Register" %>


<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registrazione</title>
    <link rel="stylesheet" href="Content/bootstrap.min.css">
    <link rel="stylesheet" href="Content/styles.css">
</head>

<body>
    <!--Navigatore-->
    <nav class="navbar navbar-dark navbar-expand-md my-navbar sticky" id="my-navbar">
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
                                    <a class="dropdown-item" href="#">Anagrafica</a>
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
    <!--Banner-->
    <div class="page-title row">
        <h1 class=" col-12 text-center my-auto">Registrazione</h1>
    </div>
    <!--FORM-->
    <div class="container">
        <div class="card-container mr-3 ml-3 mt-3">
            <form id="formregister" runat="server">
            <div class="row mt-lg-4">
                <div class="col-sm-12 col-lg-6">
                    <label for="Ruolo" class="col-form-label">Ruolo</label>
                </div>
                <div class="col-sm-12 col-lg-6">
                    <div class="btn-group" role="group" aria-label="Basic example">
                        <asp:HiddenField ID="ruolo" runat="server" />
                        <asp:Button ID="btnAtleta" runat="server" Text="Atleta" CssClass="btn btn-info" OnClientClick="return false;" />
                        <asp:Button ID="btnAllenatore" runat="server" Text="Allenatore" CssClass="btn btn-secondary" OnClientClick="return false;" />
                        <asp:Button ID="btnDelegato" runat="server" Text="Delegato" CssClass="btn btn-secondary" OnClientClick="return false;" />
                    </div>
                </div>
            </div>
            <div class="row mt-lg-4">
                <div class="col-sm-12 col-lg-6">
                    <label for="codiceTessera" class="col-form-label">Codice Tessera</label>
                </div>
                <div class="col-sm-12 col-lg-6">
                    <asp:TextBox ID="codiceTessera" runat="server" class="form-control" placeholder="Codice Tessera"></asp:TextBox>
                </div>
            </div>
            <div class="row mt-lg-4">
                <div class="col-sm-12 col-lg-6">
                    <label for="lblCf" class="col-form-label">Codice Fiscale</label>
                </div>
                <div class="col-sm-12 col-lg-6">
                    <asp:TextBox ID="cf" runat="server" class="form-control" placeholder="Codice Fiscale"></asp:TextBox>
                </div>
            </div>
            <div class="row mt-lg-4">
                <div class="col-sm-12 col-lg-6">
                    <label for="Email" class="col-form-label">Email</label>
                </div>
                <div class="col-sm-12 col-lg-6">
                    <asp:TextBox ID="email" runat="server" class="form-control" placeholder="Email"></asp:TextBox>
                </div>
            </div>
            <div class="row mt-lg-4">
                <div class="col-sm-12 col-lg-6">
                    <label for="PWD" class="col-form-label">Password</label>
                </div>
                <div class="col-sm-12 col-lg-6">
                    <asp:TextBox ID="password" runat="server" class="form-control" placeholder="Password"></asp:TextBox>
                </div>
            </div>
            <div class="row mt-lg-4">
                <div class="col-sm-12 col-lg-6">
                    <label for="lblNome" class="col-form-label">Nome</label>
                </div>
                <div class="col-sm-12 col-lg-6">
                    <asp:TextBox ID="nome" runat="server" class="form-control" placeholder="Nome"></asp:TextBox>
                </div>
            </div>
            <div class="row mt-lg-4">
                <div class="col-sm-12 col-lg-6">
                    <label for="lblCognome" class="col-form-label">Cognome</label>
                </div>
                <div class="col-sm-12 col-lg-6">
                    <asp:TextBox ID="cognome" runat="server" class="form-control" placeholder="Cognome"></asp:TextBox>
                </div>
            </div>
            <div class="row mt-lg-4">
                <div class="col-sm-12 col-lg-6">
                    <label for="lbldataNascita" class="col-form-label">Data di nascita</label>
                </div>
                <div class="col-sm-12 col-lg-6">
                    <asp:TextBox ID="dataNascita" runat="server" class="form-control" TextMode="Date" placeholder="Data di nascita"></asp:TextBox>
                </div>
            </div>
            <div class="row mt-lg-4">
                <div class="col-sm-12 col-lg-6">
                    <label for="lbldataNascita" class="col-form-label">Sesso</label>
                </div>
                <div class="col-sm-6 col-lg-2 form-check form-check-inline">
                    <asp:RadioButton ID="sesso1" GroupName="sesso" Text="Maschio" runat="server" />
                </div>
                <div class="col-sm-6 col-lg-2 form-check form-check-inline">
                    <asp:RadioButton ID="sesso2" GroupName="sesso" Text="Femmina" runat="server" />
                </div>
            </div>
            <div class="row mt-lg-4">
                <div class="col-sm-12 col-lg-6">
                    <label for="lblTel" class="col-form-label">Numero di cellulare</label>
                </div>
                <div class="col-sm-12 col-lg-6">
                    <asp:TextBox ID="tel" runat="server" class="form-control" placeholder="Numero di cellulare"></asp:TextBox>
                </div>
            </div>
            <div class="row mt-lg-4">
                <div class="col-sm-12 col-lg-6">
                    <label for="lblIndirizzo" class="col-form-label">Indirizzo di residenza</label>
                </div>
                <div class="col-sm-12 col-lg-6">
                    <asp:TextBox ID="indirizzo" runat="server" class="form-control" placeholder="Indirizzo di residenza"></asp:TextBox>
                </div>
            </div>
            <div class="row mt-lg-4">
                <div class="col-sm-12 col-lg-6">
                    <label for="lblCAP" class="col-form-label">Codice postale (CAP)</label>
                </div>
                <div class="col-sm-12 col-lg-6">
                    <asp:TextBox ID="cap" runat="server" class="form-control" placeholder="Codice Postale"></asp:TextBox>
                </div>
            </div>
            <hr>

            <!--FORM ATLETA-->
            <div id="atleta">
                <div class="row mt-lg-4">
                    <div class="col-sm-12 col-lg-6">
                        <label for="lblDataScadCert" class="col-form-label ">Data scadenza certificato</label>
                    </div>
                    <div class="col-sm-12 col-lg-6">
                        <asp:TextBox ID="dataScadenzaCertificato" runat="server" class="form-control" TextMode="Date" placeholder="Data scadenza certificato"></asp:TextBox>
                    </div>
                </div>
                <div class="row mt-lg-4">
                    <div class="col-sm-12 col-lg-6">
                        <label for="lblDataScadCert" class="col-form-label ">Altezza</label>
                    </div>
                    <div class="col-sm-12 col-lg-6">
                        <asp:TextBox ID="altezza" runat="server" class="form-control" placeholder="Altezza"></asp:TextBox>
                    </div>
                </div>
                <div class="row mt-lg-4">
                    <div class="col-sm-12 col-lg-6">
                        <label for="lblPeso" class="col-form-label ">Peso</label>
                    </div>
                    <div class="col-sm-12 col-lg-6">
                        <asp:TextBox ID="peso" runat="server" class="form-control" placeholder="Peso"></asp:TextBox>
                    </div>
                </div>
            </div>
            <!--FORM ALLENATORE-->
            <div id="allenatore">
                <div class="row mt-lg-4">
                    <div class="col-sm-12 col-lg-6">
                        <label for="lblgrado" class="col-form-label ">Grado</label>
                    </div>
                    <div class="col-sm-12 col-lg-6">
                        <asp:TextBox ID="grado" runat="server" class="form-control" placeholder="Grado"></asp:TextBox>
                    </div>
                </div>
            </div>
            <!--FORM DELEGATO-->
            <div class="row mt-lg-4" id="delegato">
                <div class="col-sm-12 col-lg-6">
                    <label for="lblRuolo" class="col-form-label ">Ruolo</label>
                </div>
                <div class="col-sm-12 col-lg-6">
                    <div class="form-check form-check-inline col-sm-6 col-lg-3">
                        <asp:CheckBox ID="supervisore" Text="Supervisore" Checked="true" runat="server" />
                    </div>
                    <div class="form-check form-check-inline col-sm-6 col-lg-3">
                        <asp:CheckBox ID="arbitro" Text="Arbitro" Checked="true" runat="server" />
                    </div>
                </div>
            </div>
            <div class="row mt-lg-4">
                <div class="col-sm-12 col-lg-6">
                    <label for="lblcomuneNascita" class="col-form-label">Comune di nascita</label>
                </div>
                <div class="col-sm-12 col-lg-6">
                    <asp:TextBox ID="comuneNascita" runat="server" class="form-control" placeholder="Comune di nascita"></asp:TextBox>
                </div>
            </div>
            <div class="row mt-lg-4 mb-2">
                <div class="col-sm-12 col-lg-6">
                    <label for="lblcomuneResidenza" class="col-form-label">Comune di residenza</label>
                </div>
                <div class="col-sm-12 col-lg-6">
                    <asp:TextBox ID="comuneResidenza" runat="server" class="form-control" placeholder="Comune di residenza"></asp:TextBox>
                </div>
            </div>
            <div class="row mt-lg-4 mb-2">
                <div class="col-sm-12 col-lg-6">
                    <label for="lblnomeSocieta" class="col-form-label ">Nome società</label>
                </div>
                <div class="col-sm-12 col-lg-6">
                    <asp:TextBox ID="nomeSocieta" runat="server" class="form-control" placeholder="Nome società"></asp:TextBox>
                </div>
            </div>
            
            <div class="row mt-lg-4 mt-3">
                <asp:Button CssClass="btnLogin mx-auto" ID="btnregistra" OnClick="btn_registerAtleta_Click" runat="server" Text="Registrati" />
            </div>
        </form>
        </div>
    </div>



    <!--SCRIPT-->
    <script src="Scripts/jquery-3.4.1.min.js "></script>
    <script src="Scripts/bootstrap.min.js "></script>
    <script src="Scripts/main.js"></script>

</body>

</html>
