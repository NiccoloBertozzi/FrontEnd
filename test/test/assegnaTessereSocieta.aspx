<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AssegnaTessereSocieta.aspx.cs" Inherits="test.assegnaTessereSocieta" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Assegna Tessere</title>
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
    <!--Banner-->
    <div class="row mt-3 mb-3">
        <h1 class=" col-12 text-center my-auto banner">Assegna Tessere</h1>
    </div>
    <!--Form Assegna Tessere-->
    
        <div class="container">
            <div class="card-container mr-3 ml-3 mt-3 mx-auto">
                <form id="form1" runat="server">
                <asp:ScriptManager ID="sp1" runat="server"></asp:ScriptManager>
                <!--<asp:Label runat="server" text="Assegnazione Tessere"></asp:Label> <br />-->

                <b>
                    <asp:Label runat="server" ID="lblIdAtleta" Text="Atleta: "></asp:Label></b><br />
                <ajaxToolkit:ComboBox AutoPostBack="true" required="true" ID="cbAtleti" runat="server" AutoCompleteMode="SuggestAppend" DropDownStyle="DropDownList" OnTextChanged="cbAtleti_TextChanged" />
                <br />
                <b>
                    <asp:Label runat="server" Text="" ID="idAtleta"></asp:Label></b><br />

                <b>
                    <asp:Label runat="server" ID="lblCodiceTessera" Text="Codice tessera: "></asp:Label></b><br />
                <asp:TextBox runat="server" ID="txtCodiceTessera"></asp:TextBox>
                <br />

                <b>
                    <asp:Label runat="server" ID="lblTipoTessera" Text="Tipo tessera: "></asp:Label></b><br />
                <asp:TextBox runat="server" ID="txtTipoTessera"></asp:TextBox>
                <br />

                <b>
                    <asp:Label runat="server" ID="lblDataTesseramento" Text="Data di tesseramento: "></asp:Label></b><br />
                <asp:Calendar ID="Calendar1" runat="server"></asp:Calendar>

                <b>
                    <asp:Label runat="server" ID="lblAnnoTesseramento" Text="Anno di tesseramento: "></asp:Label></b><br />
                <asp:TextBox runat="server" ID="txtAnnoTesseramento"></asp:TextBox>
                <br />

                <b>
                    <asp:Label runat="server" ID="lblImporto" Text="Importo: "></asp:Label></b><br />
                <asp:TextBox runat="server" ID="txtImporto"></asp:TextBox>
                <br />

                <asp:Button runat="server" ID="btnInvio" Text="invio" OnClick="btnInvio_Click" class="btnLogin mx-auto mt-3" />
</form>
            </div>
        </div>
    
    <!--SCRIPT-->
    <script src="Scripts/jquery-3.4.1.min.js "></script>
    <script src="Scripts/bootstrap.min.js "></script>
    <script src="Scripts/main.js"></script>
    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>
