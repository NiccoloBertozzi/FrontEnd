<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AssegnaDelegati.aspx.cs" Inherits="test.TestBench" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<!DOCTYPE html>

<html>

<head runat="server">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Assegna delegati</title>
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
    <form id="form2" runat="server">
        <!--Banner-->
        <div class="row mt-3 mb-3">
            <h1 class=" col-12 text-center my-auto banner">Assegna delegati</h1>
        </div>
        <div class="container">
           <asp:ScriptManager ID="sp1" runat="server"></asp:ScriptManager>
           <div class="mr-3 ml-3 mt-3 card-container">
                <div class="form-group">
                   <label for="Supervisore">Assegna Supervisori</label><br />
                   <ajaxToolkit:ComboBox AutoPostBack="true" required="true" ID="cbSupervisori" runat="server" AutoCompleteMode="SuggestAppend" DropDownStyle="DropDownList" OnTextChanged="Supervisore_TextChanged"/>
                   <asp:Label runat="server" Text="" ID="Nomesupervisore"></asp:Label>
                </div>
               <div class="form-group">
                   <label for="Arbitro">Assegna Supervisore Arbitrare</label><br />
                   <ajaxToolkit:ComboBox AutoPostBack="true" required="true" ID="cbArbitro" runat="server" AutoCompleteMode="SuggestAppend" DropDownStyle="DropDownList" OnTextChanged="Arbitro_TextChanged"/>
                   <asp:Label runat="server" Text="" ID="Nomearbitro"></asp:Label>
                </div>
               <div class="form-group">
                   <label for="Direttore">Assegna Direttore di competizione</label><br />
                   <ajaxToolkit:ComboBox AutoPostBack="true" required="true" ID="cbDirettore" runat="server" AutoCompleteMode="SuggestAppend" DropDownStyle="DropDownList" OnTextChanged="Direttore_TextChanged"/>
                   <asp:Label runat="server" Text="" ID="Nomedirettore"></asp:Label>
                </div>
                <asp:Button ID="btnassegnasupervisore" OnClick="btnassegnasupervisore_Click" runat="server" Text="Assegna delegati" /><br />
            </div>
        </div>
        <script src="Scripts/jquery-3.4.1.min.js "></script>
        <script src="Scripts/bootstrap.min.js "></script>
    </form>
</body>
</html>