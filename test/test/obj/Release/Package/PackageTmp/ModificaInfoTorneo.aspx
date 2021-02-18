<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ModificaInfoTorneo.aspx.cs" Inherits="test.ModificaInfoTorneo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Modifica info torneo</title>
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
            <img src="Img/aibvc-logo.png" style="width: 94px;"/>
            <div class="collapse navbar-collapse row" id="navcol-1">
                <div class="col-md-11 col-sm-12">
                    <ul class="nav navbar-nav ml-5" id="myNavUl">
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
                    <asp:PlaceHolder runat="server" ID="AccediBtn"></asp:PlaceHolder>
                </div>
            </div>
        </div>
    </nav>
    <!--Banner-->
    <div class="page-title row">
        <h1 class=" col-12 text-center my-auto">Modifica info torneo</h1>
    </div>

    <div class="container">
        <form id="form1" runat="server">
            <div class="row mt-lg-4">
                <div class="col-sm-12 col-lg-6">
                    <label for="titolo" class="col-form-label">Titolo torneo</label>
                </div>
                <div class="col-sm-12 col-lg-6">
                    <asp:TextBox runat="server" type="text" class="form-control" ID="titolo" placeholder="Titolo torneo"></asp:TextBox>
                </div>
            </div>
            <div class="row mt-lg-4">
                <div class="col-sm-12 col-lg-6">
                    <label for="tipoTorneo" class="col-form-label">Tipo torneo</label>
                </div>
                <div class="col-sm-12 col-lg-6">
                    <asp:TextBox runat="server" type="text" class="form-control" ID="tipoTorneo" placeholder="Tipo torneo"></asp:TextBox>
                </div>
            </div>
            <div class="row mt-lg-4">
                <div class="col-sm-12 col-lg-6">
                    <label for="formula" class="col-form-label">Formula torneo</label>
                </div>
                <div class="col-sm-12 col-lg-6">
                    <asp:TextBox runat="server" type="text" class="form-control" ID="formula" placeholder="Formula torneo"></asp:TextBox>
                </div>
            </div>
            <div class="row mt-lg-4">
                <div class="col-sm-12 col-lg-6">
                    <label for="quotaIscrizione" class="col-form-label">Quota iscrizione</label>
                </div>
                <div class="col-sm-6 col-lg-2 form-check form-check-inline">
                    <asp:TextBox runat="server" type="text" class="form-control" ID="quotaIscrizione" placeholder="Quota iscrizione"></asp:TextBox>
                </div>

            </div>
            <div class="row mt-lg-4">
                <div class="col-sm-12 col-lg-6">
                    <label for="puntiVittoria" class="col-form-label">Punti vittoria</label>
                </div>
                <div class="col-sm-12 col-lg-6">
                    <asp:TextBox ID="puntiVittoria" runat="server" class="form-control" placeholder="Punti vittoria"></asp:TextBox>
                </div>
            </div>
            <div class="row mt-lg-4">
                <div class="col-sm-12 col-lg-6">
                    <label for="montepremi" class="col-form-label">Montepremi</label>
                </div>
                <div class="col-sm-12 col-lg-6">
                    <asp:TextBox runat="server" type="text" class="form-control" ID="montepremi" placeholder="Montepremi"></asp:TextBox>
                </div>
            </div>
            <div class="row mt-lg-4 mb-2">
                <div class="col-sm-12 col-lg-6">
                    <label for="dataInizio" class="col-form-label">Data inizio</label>
                </div>
                <div class="col-sm-12 col-lg-6">
                    <asp:TextBox runat="server" type="text" class="form-control" ID="dataInizio"></asp:TextBox>
                </div>
            </div>
            <div class="row mt-lg-4 mb-2">
                <div class="col-sm-12 col-lg-6">
                    <label for="dataFine" class="col-form-label">Data fine</label>
                </div>
                <div class="col-sm-12 col-lg-6">
                    <asp:TextBox runat="server" type="text" class="form-control" ID="dataFine"></asp:TextBox>
                </div>
            </div>
            <div class="row mt-lg-4">
                <div class="col-sm-12 col-lg-6">
                    <label for="sesso" class="col-form-label">Sesso</label>
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
                    <label for="nomeImpianto" class="col-form-label">Nome impianto</label>
                </div>
                <div class="col-sm-12 col-lg-6">
                    <asp:TextBox runat="server" type="text" class="form-control" ID="nomeImpianto" placeholder="Nome impianto"></asp:TextBox>
                </div>
            </div>
            <div class="row mt-lg-4">
                <div class="col-sm-12 col-lg-6">
                    <label for="citta" class="col-form-label">Città</label>
                </div>
                <div class="col-sm-12 col-lg-6">
                    <asp:TextBox runat="server" type="text" class="form-control" ID="citta" placeholder="Città"></asp:TextBox>
                </div>
            </div>
            
            <div class="row">
                <asp:Button Text="Modifica" runat="server" OnClick="ModificaInfoTorneo_Click" class="btnLogin mx-auto mt-3" />
            </div>
            <br />
        </form>
    </div>
    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>

