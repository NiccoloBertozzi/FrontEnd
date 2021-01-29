<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ModificaAnagraficaAtleta.aspx.cs" Inherits="test.ModificaAnagraficaAtleta" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Modifica anagrafica</title>
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/styles.css">
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
<!--Banner-->
<div class="page-title row">
    <h1 class=" col-12 text-center my-auto">Modifica Anagrafica - Atleta</h1>
</div>

    <div class="container">
        <form id="form1">
            <div class="row mt-lg-4">
                <div class="col-sm-12 col-lg-6">
                    <label for="nome" class="col-form-label">Nome</label>
                </div>
                <div class="col-sm-12 col-lg-6">
                    <input type="text" class="form-control" id="nome" placeholder="Nome">
                </div>
            </div>
            <div class="row mt-lg-4">
                <div class="col-sm-12 col-lg-6">
                    <label for="cognome" class="col-form-label">Cognome</label>
                </div>
                <div class="col-sm-12 col-lg-6">
                    <input type="text" class="form-control" id="cognome" placeholder="Cognome">
                </div>
            </div>
            <div class="row mt-lg-4">
                <div class="col-sm-12 col-lg-6">
                    <label for="lbldataNascita" class="col-form-label">Sesso</label>
                </div>
                <div class="col-sm-6 col-lg-2 form-check form-check-inline">
                    <input name="sesso" type="radio" id="maschio" checked>
                    <label for="maschio" class="lblRadio">Maschio</label>
                </div>
                <div class="col-sm-6 col-lg-2 form-check form-check-inline">
                    <input name="sesso" type="radio" id="femmina">
                    <label for="femmina" class="lblRadio">Femmina</label>
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
                    <input type="text" class="form-control" id="comuneNascita" placeholder="Comune di nascita">
                </div>
            </div>
            <div class="row mt-lg-4 mb-2">
                <div class="col-sm-12 col-lg-6">
                    <label for="lblcomuneResidenza" class="col-form-label">Comune di residenza</label>
                </div>
                <div class="col-sm-12 col-lg-6">
                    <input type="text" class="form-control" id="comuneResidenza" placeholder="Comune di residenza">
                </div>
            </div>
            <div class="row mt-lg-4">
                <div class="col-sm-12 col-lg-6">
                    <label for="lblIndirizzo" class="col-form-label">Indirizzo di residenza</label>
                </div>
                <div class="col-sm-12 col-lg-6">
                    <input type="text" class="form-control" id="indirizzo" placeholder="Indirizzo di residenza">
                </div>
            </div>
            <div class="row mt-lg-4">
                <div class="col-sm-12 col-lg-6">
                    <label for="lblCAP" class="col-form-label">Codice postale (CAP)</label>
                </div>
                <div class="col-sm-12 col-lg-6">
                    <input type="text" class="form-control" id="cap" placeholder="Codice Postale">
                </div>
            </div>
            <div class="row mt-lg-4">
                <div class="col-sm-12 col-lg-6">
                    <label for="lblTel" class="col-form-label">Numero di cellulare</label>
                </div>
                <div class="col-sm-12 col-lg-6">
                    <input type="text" class="form-control" id="tel" placeholder="Numero di cellulare">
                </div>
            </div>
            <div class="row mt-lg-4">
                <div class="col-sm-12 col-lg-6">
                    <label for="lblDataScadCert" class="col-form-label ">Altezza</label>
                </div>
                <div class="col-sm-12 col-lg-6">
                    <input type="number" class="form-control " id="altezza" placeholder="Altezza">
                </div>
            </div>
            <div class="row mt-lg-4">
                <div class="col-sm-12 col-lg-6">
                    <label for="lblPeso" class="col-form-label ">Peso</label>
                </div>
                <div class="col-sm-12 col-lg-6">
                    <input type="number" class="form-control " id="peso" placeholder="Peso">
                </div>
            </div>
        </form>
        <div class="row">
            <a href="#" class="btnLogin mx-auto mt-3">Modifica</a>
        </div>
        
    </div>
    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>

</body>

</html>
