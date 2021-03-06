﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="test.Register" %>


<!DOCTYPE html>
<html lang="en">

<head runat="server"> 
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registrazione</title>
    <link rel="stylesheet" href="Content/bootstrap.min.css">
    <link rel="stylesheet" href="Content/styles.css">
</head>

<body>
    <!--Navigatore-->
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
                        <asp:PlaceHolder runat="server" ID="dinamicload"></asp:PlaceHolder>
                    </ul>
                </div>
                <div class="col-1">
                    <asp:PlaceHolder runat="server" ID="AccediBtn"></asp:PlaceHolder>
                </div>
            </div>
        </div>
    </nav>
    <!--Banner-->
    <div class="row mt-3 mb-3">
        <h1 class="col-12 text-center my-auto banner">Registrazione</h1>
    </div>
    <!--FORM-->
        <div class="container">
        <form id="formregister" runat="server">
            <div class="row mt-md-3">
                <div class="col-12 col-lg-4  offset-lg-2">
                    <label for="Ruolo" class="col-form-label">Ruolo</label>
                </div>
                <div class="col-12 col-lg-4 text-lg-center">
                    <div class="btn-group" role="group">
                        <asp:HiddenField ID="ruolo" runat="server" />
                        <asp:Button ID="btnAtleta" runat="server" Text="Atleta" CssClass="btn btn-info" OnClientClick="return false;" />
                        <asp:Button ID="btnAllenatore" runat="server" Text="Allenatore" CssClass="btn btn-secondary" OnClientClick="return false;" />
                        <asp:Button ID="btnDelegato" runat="server" Text="Delegato" CssClass="btn btn-secondary" OnClientClick="return false;" />
                        <asp:Button ID="btnSocieta" runat="server" Text="Società" CssClass="btn btn-secondary" OnClientClick="return false;" />
                    </div>
                </div>
            </div>
            <!--FORM COMUNE-->
        <div id="common">
            <asp:ScriptManager ID="sp1" runat="server"></asp:ScriptManager>
            <div class="row mt-md-3">
                <div class="col-12 col-lg-4  offset-lg-2">
                    <label for="lblNome" class="col-form-label">Nome</label>
                </div>
                <div class="col-12 col-lg-4">
                    <asp:TextBox ID="nome" runat="server" class="form-control" placeholder="Nome"></asp:TextBox>
                </div>
            </div>
            <div class="row mt-md-3">
                <div class="col-12 col-lg-4  offset-lg-2">
                    <label for="lblCognome" class="col-form-label">Cognome</label>
                </div>
                <div class="col-12 col-lg-4">
                    <asp:TextBox ID="cognome" runat="server" class="form-control" placeholder="Cognome"></asp:TextBox>
                </div>
            </div>
            <div class="row mt-md-3">
                <div class="col-12 col-lg-4  offset-lg-2">
                    <label for="lbldataNascita" class="col-form-label">Data di nascita</label>
                </div>
                <div class="col-12 col-lg-4">
                    <asp:TextBox ID="dataNascita" runat="server" class="form-control" TextMode="Date" placeholder="Data di nascita"></asp:TextBox>
                </div>
            </div>
            <div class="row mt-md-3">
                <div class="col-12 col-lg-4  offset-lg-2">
                    <label for="cbComNasc" class="col-form-label">Comune di nascita</label>
                </div>
                <div class="col-12 col-lg-4">
                    <ajaxToolkit:ComboBox AutoPostBack="true" required="true" ID="cbComNasc" runat="server" AutoCompleteMode="SuggestAppend" DropDownStyle="DropDownList" OnTextChanged="cbComNasc_TextChanged"/>
                </div>
            </div>
            <div class="row mt-md-3">
                <div class="col-12 col-lg-4  offset-lg-2">
                    <label for="lblCf" class="col-form-label">Codice Fiscale</label>
                </div>
                <div class="col-12 col-lg-4">
                    <asp:TextBox ID="cf" runat="server" class="form-control" placeholder="Codice Fiscale"></asp:TextBox>
                </div>
            </div>
            <div class="row mt-md-3">
                <div class="col-12 col-lg-4  offset-lg-2">
                    <label for="lblSesso" class="col-form-label">Sesso</label>
                </div>
                <div class="col-6 col-lg-2 my-auto">
                    <asp:RadioButton ID="sesso1" GroupName="sesso" class="my-auto" Text="Maschio" runat="server" />
                </div>
                <div class="col-6 col-lg-2 my-auto">
                    <asp:RadioButton ID="sesso2" GroupName="sesso" class="my-auto" Text="Femmina" runat="server" />
                </div>
            </div>
            <div class="row mt-md-3 ">
                <div class="col-12 col-lg-4 offset-lg-2 ">
                    <label for="lblTel " class="col-form-label ">Numero di cellulare</label>
                </div>
                <div class="col-12 col-lg-4 ">
                    <asp:TextBox ID="tel" runat="server" class="form-control" placeholder="Numero di cellulare"></asp:TextBox>
                </div>
            </div>
            <div class="row mt-md-3 mb-2 ">
                <div class="col-12 col-lg-4 offset-lg-2 ">
                    <label for="cbComRes" class="col-form-label ">Comune di residenza</label>
                </div>
                <div class="col-12 col-lg-4 ">
                    <ajaxToolkit:ComboBox AutoPostBack="true" required="true" ID="cbComRes" runat="server" AutoCompleteMode="SuggestAppend" DropDownStyle="DropDownList" OnTextChanged="cbComRes_TextChanged"/>
                </div>
            </div>
            <div class="row mt-md-3 ">
                <div class="col-12 col-lg-4 offset-lg-2 ">
                    <label for="lblIndirizzo " class="col-form-label ">Indirizzo di residenza</label>
                </div>
                <div class="col-12 col-lg-4 ">
                    <asp:TextBox ID="indirizzo" runat="server" class="form-control" placeholder="Indirizzo di residenza"></asp:TextBox>
                </div>
            </div>
            <div class="row mt-md-3 ">
                <div class="col-12 col-lg-4 offset-lg-2 ">
                    <label for="lblCAP " class="col-form-label ">Codice postale (CAP)</label>
                </div>
                <div class="col-12 col-lg-4 ">
                    <asp:TextBox ID="cap" runat="server" class="form-control" placeholder="Codice Postale"></asp:TextBox>
                </div>
            </div>
            <div class="row mt-md-3 ">
                <div class="col-12 col-lg-4 offset-lg-2 ">
                    <label for="Email " class="col-form-label ">Email</label>
                </div>
                <div class="col-12 col-lg-4 ">
                    <asp:TextBox ID="email" runat="server" class="form-control" placeholder="Email"></asp:TextBox>
                </div>
            </div>
            <div class="row mt-md-3 ">
                <div class="col-12 col-lg-4 offset-lg-2 ">
                    <label for="PWD " class="col-form-label ">Password</label>
                </div>
                <div class="col-12 col-lg-4 ">
                    <asp:TextBox ID="password" runat="server" class="form-control" placeholder="Password"></asp:TextBox>
                </div>
            </div>
        </div>
        <!--FORM ATLETA-->
        <div id="atleta">
            <div class="row mt-md-3 ">
                <div class="col-12 col-lg-4 offset-lg-2 ">
                    <label for="cbNomeSocietaAtleta" class="col-form-label ">Nome società</label>
                </div>
                <div class="col-12 col-lg-4 ">
                    <ajaxToolkit:ComboBox AutoPostBack="true" required="true" ID="cbNomeSocietaAtleta" runat="server" AutoCompleteMode="SuggestAppend" DropDownStyle="DropDownList" OnTextChanged="nomeSocietaAtleta_TextChanged"/>
                </div>
            </div>
            <div class="row mt-md-3 ">
                <div class="col-12 col-lg-4 offset-lg-2 ">
                    <label for="lblDataScadCert " class="col-form-label ">Data scadenza certificato</label>
                </div>
                <div class="col-12 col-lg-4 ">
                    <asp:TextBox ID="dataScadenzaCertificato" runat="server" class="form-control" TextMode="Date" placeholder="Data scadenza certificato"></asp:TextBox>
                </div>
            </div>
            <div class="row mt-md-3 ">
                <div class="col-12 col-lg-4 offset-lg-2 ">
                    <label for="lblDataScadCert " class="col-form-label ">Altezza</label>
                </div>
                <div class="col-12 col-lg-4 ">
                    <asp:TextBox ID="altezza" runat="server" class="form-control" placeholder="Altezza"></asp:TextBox>
                </div>
            </div>
            <div class="row mt-md-3 ">
                <div class="col-12 col-lg-4 offset-lg-2 ">
                    <label for="lblPeso " class="col-form-label ">Peso</label>
                </div>
                <div class="col-12 col-lg-4 ">
                    <asp:TextBox ID="peso" runat="server" class="form-control" placeholder="Peso"></asp:TextBox>
                </div>
            </div>
        </div>
        <!--FORM ALLENATORE-->
        <div id="allenatore">
            <div class="row mt-md-3 ">
                <div class="col-12 col-lg-4 offset-lg-2 ">
                    <label for="cbNomeSocietaAllenatore" class="col-form-label ">Nome società</label>
                </div>
                <div class="col-12 col-lg-4 ">
                    <ajaxToolkit:ComboBox AutoPostBack="true" required="true" ID="cbNomeSocietaAllenatore" runat="server" AutoCompleteMode="SuggestAppend" DropDownStyle="DropDownList" OnTextChanged="cbNomeSocietaAllenatore_TextChanged"/>
                </div>
            </div>
            <div class="row mt-md-3 ">
                <div class="col-12 col-lg-4 offset-lg-2 ">
                    <label for="lblgrado " class="col-form-label ">Grado</label>
                </div>
                <div class="col-12 col-lg-4 ">
                    <asp:TextBox ID="grado" runat="server" class="form-control" placeholder="Grado"></asp:TextBox>
                </div>
            </div>
        </div>
        <!--FORM DELEGATO-->
        <div id="delegato">
            <div class="row mt-md-3 ">
                <div class="col-12 col-lg-4 offset-lg-2 ">
                    <label for="lblRuolo " class="col-form-label ">Ruolo</label>
                </div>
                <div class="col-6 col-lg-2 my-auto ">
                    <asp:CheckBox ID="supervisore" class="my-auto" Text="Supervisore" Checked="true" runat="server" />
                </div>
                <div class="col-6 col-lg-2 my-auto ">
                    <asp:CheckBox ID="arbitro" class="my-auto" Text="Arbitro" Checked="true" runat="server" />
                </div>
            </div>
        </div>
        <!--FORM SOCIETA-->
        <div id="societa">
            <div class="row mt-md-3 ">
                <div class="col-12 col-lg-4 offset-lg-2 ">
                    <label for="nomeSocieta" class="col-form-label ">Nome Società</label>
                </div>
                <div class="col-12 col-lg-4 ">
                    <asp:TextBox ID="nomeSocieta" runat="server" class="form-control" placeholder="Nome Società"></asp:TextBox>
                </div>
            </div>
            <div class="row mt-md-3 ">
                <div class="col-12 col-lg-4 offset-lg-2 ">
                    <label for="lblNome " class="col-form-label ">Indirizzo</label>
                </div>
                <div class="col-12 col-lg-4 ">
                    <asp:TextBox ID="indirizzosoc" runat="server" class="form-control" placeholder="Indirizzo"></asp:TextBox>
                </div>
            </div>
            <div class="row mt-md-3 ">
                <div class="col-12 col-lg-4 offset-lg-2 ">
                    <label for="lblNome " class="col-form-label ">Citta</label>
                </div>
                <div class="col-12 col-lg-4 ">
                    <asp:TextBox ID="citta" runat="server" class="form-control" placeholder="Citta"></asp:TextBox>
                </div>
            </div>
            <div class="row mt-md-3 ">
                <div class="col-12 col-lg-4 offset-lg-2 ">
                    <label for="lblCAP " class="col-form-label ">Codice postale (CAP)</label>
                </div>
                <div class="col-12 col-lg-4 ">
                    <asp:TextBox ID="capsoc" runat="server" class="form-control" placeholder="Codice Postale"></asp:TextBox>
                </div>
            </div>
            <div class="row mt-md-3 ">
                <div class="col-12 col-lg-4 offset-lg-2 ">
                    <label for="lbldataFondazione " class="col-form-label ">Data di fondazione</label>
                </div>
                <div class="col-12 col-lg-4 ">
                    <asp:TextBox ID="dataFondazione" runat="server" class="form-control" TextMode="Date" placeholder="Data di fondazione"></asp:TextBox>
                </div>
            </div>
            <div class="row mt-md-3 ">
                <div class="col-12 col-lg-4 offset-lg-2 ">
                    <label for="lbldataAffiliazione " class="col-form-label ">Data di affiliazione</label>
                </div>
                <div class="col-12 col-lg-4 ">
                    <asp:TextBox ID="dataAffiliazione" runat="server" class="form-control" TextMode="Date" placeholder="Data di affiliazione"></asp:TextBox>
                </div>
            </div>
            <div class="row mt-md-3 ">
                <div class="col-12 col-lg-4 offset-lg-2 ">
                    <label for="lblcodAffiliazione " class="col-form-label ">Codice di affiliazione</label>
                </div>
                <div class="col-12 col-lg-4 ">
                    <asp:TextBox ID="codiceAffiliazione" runat="server" class="form-control" placeholder="Codice di affiliazione"></asp:TextBox>
                </div>
            </div>
            <div class="row mt-md-3 mb-2 ">
                <div class="col-12 col-lg-4 offset-lg-2 ">
                    <label for="lblsito " class="col-form-label ">Sito</label>
                </div>
                <div class="col-12 col-lg-4 ">
                    <asp:TextBox ID="sito" runat="server" class="form-control" placeholder="Sito"></asp:TextBox>
                </div>
            </div>
            <div class="row mt-md-3 ">
                <div class="col-12 col-lg-4 offset-lg-2 ">
                    <label for="lblTelefono1 " class="col-form-label ">Telefono 1</label>
                </div>
                <div class="col-12 col-lg-4 ">
                    <asp:TextBox ID="tel1" runat="server" class="form-control" placeholder="Telefono 1"></asp:TextBox>
                </div>
            </div>
            <div class="row mt-md-3 ">
                <div class="col-12 col-lg-4 offset-lg-2 ">
                    <label for="lblTelefono2 " class="col-form-label ">Telefono 2</label>
                </div>
                <div class="col-12 col-lg-4 ">
                    <asp:TextBox ID="tel2" runat="server" class="form-control" placeholder="Telefono 2"></asp:TextBox>
                </div>
            </div>
            <div class="row mt-md-3 ">
                <div class="col-12 col-lg-4 offset-lg-2 ">
                    <label for="PEC " class="col-form-label ">Indirizzo PEC</label>
                </div>
                <div class="col-12 col-lg-4 ">
                    <asp:TextBox ID="PEC" runat="server" class="form-control" placeholder="Indirizzo PEC"></asp:TextBox>
                </div>
            </div>
            <div class="row mt-md-3 ">
                <div class="col-12 col-lg-4 offset-lg-2 ">
                    <label for="pIVA " class="col-form-label ">Partita IVA</label>
                </div>
                <div class="col-12 col-lg-4 ">
                    <asp:TextBox ID="PIVA" runat="server" class="form-control" placeholder="Partita IVA"></asp:TextBox>
                </div>
            </div>
            <div class="row mt-md-3 ">
                <div class="col-12 col-lg-4 offset-lg-2 ">
                    <label for="lblCf " class="col-form-label ">Codice Fiscale</label>
                </div>
                <div class="col-12 col-lg-4 ">
                    <asp:TextBox ID="cfSoc" runat="server" class="form-control" placeholder="Codice Fiscale"></asp:TextBox>
                </div>
            </div>
            <div class="row mt-md-3 ">
                <div class="col-12 col-lg-4 offset-lg-2 ">
                    <label for="lblCertUnica " class="col-form-label ">Codice SDI</label>
                </div>
                <div class="col-12 col-lg-4 ">
                    <asp:TextBox ID="CU" runat="server" class="form-control" placeholder="Codice SDI"></asp:TextBox>
                </div>
            </div>
            <div class="row mt-md-3 mb-2 ">
                <div class="col-12 col-lg-4 offset-lg-2 ">
                    <label for="cbComResSoc" class="col-form-label ">Comune di residenza</label>
                </div>
                <div class="col-12 col-lg-4 ">
                    <ajaxToolkit:ComboBox AutoPostBack="true" required="true" ID="cbComResSoc" runat="server" AutoCompleteMode="SuggestAppend" DropDownStyle="DropDownList" OnTextChanged="cbComResSoc_TextChanged"/>
                </div>
            </div>
            <div class="row mt-md-3 ">
                <div class="col-12 col-lg-4 offset-lg-2 ">
                    <label for="Presidente" class="col-form-label ">Nome Presidente</label>
                </div>
                <div class="col-12 col-lg-4 ">
                    <asp:TextBox ID="Presidente" runat="server" class="form-control" placeholder="Nome Presidente"></asp:TextBox>
                </div>
            </div>
            <div class="row mt-md-3 ">
                <div class="col-12 col-lg-4 offset-lg-2 ">
                    <label for="Referente" class="col-form-label ">Nome Referente</label>
                </div>
                <div class="col-12 col-lg-4 ">
                    <asp:TextBox ID="Referente" runat="server" class="form-control" placeholder="Nome Referente"></asp:TextBox>
                </div>
            </div>
            <div class="row mt-md-3 ">
                <div class="col-12 col-lg-4 offset-lg-2 ">
                    <label for="Email " class="col-form-label ">Email</label>
                </div>
                <div class="col-12 col-lg-4 ">
                    <asp:TextBox ID="emailSoc" runat="server" class="form-control" placeholder="Email"></asp:TextBox>
                </div>
            </div>
            <div class="row mt-md-3 ">
                <div class="col-12 col-lg-4 offset-lg-2 ">
                    <label for="PWD " class="col-form-label ">Password</label>
                </div>
                <div class="col-12 col-lg-4 ">
                    <asp:TextBox ID="pswSoc" runat="server" class="form-control" placeholder="Password"></asp:TextBox>
                </div>
            </div>
        </div>
        <div class="row mt-md-3 mt-3 mb-4">
            <div class="col-12 col-lg-8 offset-lg-2 ">
                <asp:Button class="btnLogin mx-auto btn-block text-center" runat="server" Text="Registra" OnClick="btn_register_Click"/>
            </div>
        </div>
        </form>
    </div>

    <!--SCRIPT-->
    <script src="Scripts/jquery-3.4.1.min.js "></script>
    <script src="Scripts/bootstrap.min.js "></script>
    <script src="Scripts/main.js"></script>

</body>

</html>
