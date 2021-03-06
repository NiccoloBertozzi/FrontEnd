﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ModificaAnagraficaDelegato.aspx.cs" Inherits="test.ModificaAnagraficaDelegato" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Modifica anagrafica</title>
    <link rel="stylesheet" href="Content/bootstrap.min.css" />
    <link rel="stylesheet" href="Content/styles.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="Scripts/jquery-dateformat.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script src="https://kit.fontawesome.com/95609c6d0f.js" crossorigin="anonymous"></script>
                <script>
        function LoadClassificaMaschile() {
            window.location = "OutputClassifica.aspx?genere=M";
        }
        function LoadClassificaFemminile() {
            window.location = "OutputClassifica.aspx?genere=F";
        }
        </script>
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
        <h1 class=" col-12 text-center my-auto banner">Modifica Anagrafica</h1>
    </div>
    <form id="form1" runat="server">
        <div class="container">
            <div class="mr-3 ml-3 mt-3 mb-5">
                <div class="row mt-lg-4">
                <div class="col-sm-12 col-lg-6">
                    <label for="nome" class="col-form-label">Nome</label>
                </div>
                <div class="col-sm-12 col-lg-6">
                    <asp:TextBox runat="server" type="text" class="form-control" ID="nome" placeholder="Nome" />
                </div>
            </div>
            <div class="row mt-lg-4">
                <div class="col-sm-12 col-lg-6">
                    <label for="cognome" class="col-form-label">Cognome</label>
                </div>
                <div class="col-sm-12 col-lg-6">
                    <asp:TextBox runat="server" type="text" class="form-control" ID="cognome" placeholder="Cognome" />
                </div>
            </div>
            <div class="row mt-lg-4">
                <div class="col-sm-12 col-lg-6">
                    <label for="lbldataNascita" class="col-form-label">Sesso</label>
                </div>
                <div class="ml-3 col-sm-6 col-lg-2 form-check form-check-inline">
                    <asp:RadioButton GroupName="radioSesso" runat="server" name="sesso" type="radio" ID="maschio" Checked="true" />
                    <label for="maschio" class="lblRadio ml-1">Maschio</label>
                </div>
                <div class="ml-3 col-sm-6 col-lg-2 form-check form-check-inline">
                    <asp:RadioButton GroupName="radioSesso" runat="server" name="sesso" type="radio" ID="femmina" />
                    <label for="femmina" class="lblRadio ml-1">Femmina</label>
                </div>
            </div>
            <div class="row mt-lg-4">
                <div class="col-sm-12 col-lg-6">
                    <label for="lblcf" class="col-form-label">CF</label>
                </div>
                <div class="col-sm-12 col-lg-6">
                    <asp:TextBox ID="cf" runat="server" class="form-control" placeholder="CF"></asp:TextBox>
                </div>
            </div>
            <div class="row mt-lg-4">
                <div class="col-sm-12 col-lg-6">
                    <label for="lbldataNascita" class="col-form-label">Data di nascita</label>
                </div>
                <div class="col-sm-12 col-lg-6">
                    <asp:TextBox ID="dataNascita" runat="server" class="form-control" placeholder="Data di nascita"></asp:TextBox>
                </div>
            </div>
            <div class="row mt-lg-4">
                <div class="col-sm-12 col-lg-6">
                    <label for="lblcomuneNascita" class="col-form-label">Comune di nascita</label>
                </div>
                <div class="col-sm-12 col-lg-6">
                    <asp:TextBox runat="server" type="text" class="form-control" ID="comuneNascita" placeholder="Comune di nascita" />
                </div>
            </div>
            <div class="row mt-lg-4 mb-2">
                <div class="col-sm-12 col-lg-6">
                    <label for="lblcomuneResidenza" class="col-form-label">Comune di residenza</label>
                </div>
                <div class="col-sm-12 col-lg-6">
                    <asp:TextBox runat="server" type="text" class="form-control" ID="comuneResidenza" placeholder="Comune di residenza" />
                </div>
            </div>
            <div class="row mt-lg-4">
                <div class="col-sm-12 col-lg-6">
                    <label for="lblemail" class="col-form-label">Email</label>
                </div>
                <div class="col-sm-12 col-lg-6">
                    <asp:TextBox ID="email" runat="server" class="form-control" placeholder="Email"></asp:TextBox>
                </div>
            </div>
            <div class="row mt-lg-4">
                <div class="col-sm-12 col-lg-6">
                    <label for="lblIndirizzo" class="col-form-label">Indirizzo di residenza</label>
                </div>
                <div class="col-sm-12 col-lg-6">
                    <asp:TextBox runat="server" type="text" class="form-control" ID="indirizzo" placeholder="Indirizzo di residenza" />
                </div>
            </div>
            <div class="row mt-lg-4">
                <div class="col-sm-12 col-lg-6">
                    <label for="lblCAP" class="col-form-label">Codice postale (CAP)</label>
                </div>
                <div class="col-sm-12 col-lg-6">
                    <asp:TextBox runat="server" type="text" class="form-control" ID="cap" placeholder="Codice Postale" />
                </div>
            </div>
            <div class="row mt-lg-4">
                <div class="col-sm-12 col-lg-6">
                    <label for="lblTel" class="col-form-label">Numero di cellulare</label>
                </div>
                <div class="col-sm-12 col-lg-6">
                    <asp:TextBox runat="server" type="text" class="form-control" ID="tel" placeholder="Numero di cellulare" />
                </div>
            </div>
            <div class="row mt-lg-4">
                <div class="col-sm-12 col-lg-6">
                    <label for="lblTel" class="col-form-label">Codice tessera</label>
                </div>
                <div class="col-sm-12 col-lg-6">
                    <asp:TextBox runat="server" type="text" class="form-control" ID="codiceTessera" placeholder="Codice tessera" />
                </div>
            </div>
            <div class="row mt-lg-4 mb-2">
                <div class="col-sm-12 col-lg-6">
                    <label for="lblArbitro" class="col-form-label">Arbitro</label>
                </div>
                <div class="col-sm-12 col-lg-6">
                    <asp:CheckBox runat="server" type="text" class="form-control" ID="arbitro" placeholder="arbitro"></asp:CheckBox>
                </div>
            </div>
            <div class="row mt-lg-4 mb-2">
                <div class="col-sm-12 col-lg-6">
                    <label for="lblSupervisore" class="col-form-label">Supervisore</label>
                </div>
                <div class="col-sm-12 col-lg-6">
                    <asp:CheckBox runat="server" type="text" class="form-control" ID="supervisore" placeholder="Supervisore"></asp:CheckBox>
                </div>
            </div>
            <div class="row">
                <asp:Button runat="server" Text="Modifica" OnClick="ModificaAnagrafica_Click" class="btnLogin mx-auto mt-3"/>
            </div>
            </div>
        </div>
    </form>
    <script src="Scripts/jquery-3.4.1.min.js "></script>
    <script src="Scripts/bootstrap.min.js "></script>
</body>
</html>
