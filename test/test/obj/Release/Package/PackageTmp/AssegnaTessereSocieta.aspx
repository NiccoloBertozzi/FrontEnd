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
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
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
    <!--Banner-->
    <div class="row mt-3 mb-3">
        <h1 class=" col-12 text-center my-auto banner">Assegna Tessere</h1>
    </div>
    <!--Form Assegna Tessere-->
    
        <div class="container">
            <div class="mr-3 ml-3 mt-3 mb-5">
                <form id="form1" runat="server">
                    <asp:ScriptManager ID="sp1" runat="server"></asp:ScriptManager>
                    <div class="form-group">
                        <label for="lblIdAtleta">Atleta: </label> <br/>
                        <ajaxToolkit:ComboBox AutoPostBack="true" required="true" ID="cbAtleti" runat="server" AutoCompleteMode="SuggestAppend" DropDownStyle="DropDownList" OnTextChanged="cbAtleti_TextChanged"/> <br/>
                        <asp:Label runat="server" Text="" ID="idAtleta"></asp:Label>
                    </div>
                    <div class="form-group">
                        <label for="lblCodiceTessera">Codice tessera: </label>
                        <asp:TextBox runat="server" ID="txtCodiceTessera" required="true" placeholder="Inserisci codice tessera" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label for="lblTipoTessera">Tipo tessera: </label>
                        <asp:TextBox runat="server" ID="txtTipoTessera" required="true" placeholder="Inserisci tipo tessera" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label for="lblDataTesseramento">Data di tesseramento: </label>
                        <asp:TextBox ID="txtDataTesseramento" runat="server" required="true" placeholder="Inserisci data di tesseramento" CssClass="form-control" TextMode="Date"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label for="lblAnnoTesseramento">Anno di tesseramento: </label>
                        <asp:TextBox ID="txtAnnoTesseramento" runat="server" required="true" placeholder="Inserisci anno di tesseramento" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label for="lblImporto">Importo: </label>
                        <asp:TextBox ID="txtImporto" runat="server" required="true" placeholder="Inserisci importo" CssClass="form-control"></asp:TextBox>
                    </div>
                    <asp:Button runat="server" ID="btnInvio" Text="Assegna" OnClick="btnInvio_Click" class="btn btn-primary" />
                </form>
            </div>
        </div>
    
    <!--SCRIPT-->
    <script src="Scripts/jquery-3.4.1.min.js "></script>
    <script src="Scripts/bootstrap.min.js "></script>
    <script src="Scripts/main.js"></script>
</body>
</html>
