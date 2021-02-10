<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ModificaAnagraficaAllenatore.aspx.cs" Inherits="test.ModificaAnagraficaAllenatore" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Modifica anagrafica</title>
    <link rel="stylesheet" href="Content/bootstrap.min.css" />
    <link rel="stylesheet" href="Content/styles.css" />
</head>
<body>
    <!--Navigatore-->
    <nav class="navbar navbar-dark navbar-expand-md my-navbar sticky" id="my-navbar">
        <div class="container-fluid">
            <button data-toggle="collapse" class="navbar-toggler my-button" data-target="#navcol-1" id="my-navbar-items">
                <span class="sr-only">Toggle navigation</span>
                <i class="fas fa-bars" style="color: white;"></i>
            </button>
            <img src="Img/aibvc-logo.png" style="width: 94px;" />
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
                        <li class="nav-item" role="presentation"><a class="nav-link active" href="#">Formazione</a></li>
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
        <h1 class=" col-12 text-center my-auto">Modifica anagrafica</h1>
    </div>

    <div class="container">
        <form id="form1" runat="server">
            <div class="row mt-lg-4">
                <div class="col-sm-12 col-lg-6">
                    <label for="nome" class="col-form-label">Nome</label>
                </div>
                <div class="col-sm-12 col-lg-6">
                    <asp:TextBox runat="server" class="form-control" ID="nomee" placeholder="Nome" />
                </div>
            </div>
            <div class="row mt-lg-4">
                <div class="col-sm-12 col-lg-6">
                    <label for="cognome" class="col-form-label">Cognome</label>
                </div>
                <div class="col-sm-12 col-lg-6">
                    <asp:TextBox runat="server" class="form-control" ID="cognomee" placeholder="Cognome" />
                </div>
            </div>
            <div class="row mt-lg-4">
                <div class="col-sm-12 col-lg-6">
                    <label for="codTessera" class="col-form-label">Codice tessera</label>
                </div>
                <div class="col-sm-12 col-lg-6">
                    <asp:TextBox runat="server" class="form-control" ID="codTessera" placeholder="Codice tessera" />
                </div>
            </div>
            <div class="row mt-lg-4">
                <div class="col-sm-12 col-lg-6">
                    <label for="nomeSocieta" class="col-form-label">Nome societa</label>
                </div>
                <div class="col-sm-12 col-lg-6">
                    <asp:TextBox runat="server" class="form-control" ID="nomeSocieta" placeholder="Nome societa" />
                </div>
            </div>
            <div class="row mt-lg-4">
                <div class="col-sm-12 col-lg-6">
                    <label for="lbldataNascita" class="col-form-label">Sesso</label>
                </div>
                <div class="col-sm-6 col-lg-2 form-check form-check-inline">
                    <asp:RadioButton runat="server" name="sesso" type="radio" ID="maschio" Checked="true" />
                    <label for="maschio" class="lblRadio">Maschio</label>
                </div>
                <div class="col-sm-6 col-lg-2 form-check form-check-inline">
                    <asp:RadioButton runat="server" name="sesso" type="radio" ID="femmina" />
                    <label for="femmina" class="lblRadio">Femmina</label>
                </div>
            </div>
            <div class="row mt-lg-4">
                <div class="col-sm-12 col-lg-6">
                    <label for="cf" class="col-form-label">CF</label>
                </div>
                <div class="col-sm-12 col-lg-6">
                    <asp:TextBox runat="server" class="form-control" ID="cf" placeholder="CF" />
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
                    <label for="email" class="col-form-label">email</label>
                </div>
                <div class="col-sm-12 col-lg-6">
                    <asp:TextBox runat="server" class="form-control" ID="email" placeholder="email" />
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
                    <label for="grado" class="col-form-label ">Grado</label>
                </div>
                <div class="col-sm-12 col-lg-6">
                    <asp:TextBox runat="server" type="number" class="form-control " ID="grado" placeholder="Grado" />
                </div>
            </div>
            <div class="row">
                <asp:Button runat="server" class="btnLogin mx-auto mt-3" Text="Modifica" OnClick="ModificaAnagrafica_Click"/>
            </div>
        </form>
    </div>
    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>

</body>
</html>
