<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ModificaAnagraficaSocieta.aspx.cs" Inherits="test.ModificaAnagraficaSocieta" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Modifica Anagrafica</title>
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
                        <li class="nav-item" role="presentation"><a class="nav-link" href="#">Formazione</a></li>
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
               
            </div>
        </div>
    </nav>
    <!--Banner-->
    <div class="page-title row">
        <h1 class=" col-12 text-center my-auto">Modifica Anagrafica</h1>
    </div>

    <div class="container">
        <div class="card-container mr-3 ml-3 mt-3">
            <form id="form1" runat="server">
            <div class="row mt-lg-4">
                <div class="col-sm-12 col-lg-6">
                    <label for="nomeSocieta" class="col-form-label">Nome Società</label>
                </div>
                <div class="col-sm-12 col-lg-6">
                    <asp:TextBox runat="server" type="text" class="form-control" ID="nome" placeholder="NomeSocieta"></asp:TextBox>
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
            <div class="row mt-lg-4">
                <div class="col-sm-12 col-lg-6">
                    <label for="indirizzo" class="col-form-label">Indirizzo</label>
                </div>
                <div class="col-sm-12 col-lg-6">
                    <asp:TextBox runat="server" type="text" class="form-control" ID="indirizzo" placeholder="Indirizzo"></asp:TextBox>
                </div>
            </div>
            <div class="row mt-lg-4">
                <div class="col-sm-12 col-lg-6">
                    <label for="lblCAP" class="col-form-label">Codice Postale (CAP)</label>
                </div>
                <div class="col-sm-6 col-lg-2 form-check form-check-inline">
                    <asp:TextBox runat="server" type="text" class="form-control" ID="CAP" placeholder="Codice Postale (CAP)"></asp:TextBox>
                </div>

            </div>
            <div class="row mt-lg-4">
                <div class="col-sm-12 col-lg-6">
                    <label for="lbldataFondazione" class="col-form-label">Data Fondazione</label>
                </div>
                <div class="col-sm-12 col-lg-6">
                    <asp:TextBox ID="dataFondazione" runat="server" class="form-control" placeholder="Data Fondazione"></asp:TextBox>
                </div>
            </div>
            <div class="row mt-lg-4">
                <div class="col-sm-12 col-lg-6">
                    <label for="lblDataAffiliazione" class="col-form-label">Data Affiliazione</label>
                </div>
                <div class="col-sm-12 col-lg-6">
                    <asp:TextBox runat="server" type="text" class="form-control" ID="dataAffiliazione" placeholder="Data Affiliazione"></asp:TextBox>
                </div>
            </div>
            <div class="row mt-lg-4 mb-2">
                <div class="col-sm-12 col-lg-6">
                    <label for="lblcodiceAffiliazione" class="col-form-label">CodiceAffiliazione</label>
                </div>
                <div class="col-sm-12 col-lg-6">
                    <asp:TextBox runat="server" type="text" class="form-control" ID="codiceAffiliazione" placeholder="Codice Affiliazione"></asp:TextBox>
                </div>
            </div>
            <div class="row mt-lg-4 mb-2">
                <div class="col-sm-12 col-lg-6">
                    <label for="lblAffiliata" class="col-form-label">Affiliata</label>
                </div>
                <div class="col-sm-12 col-lg-6">
                    <asp:CheckBox runat="server" type="text" class="form-control" ID="affiliata" placeholder="affiliata"></asp:CheckBox>
                </div>
            </div>
            <div class="row mt-lg-4">
                <div class="col-sm-12 col-lg-6">
                    <label for="lblEmail" class="col-form-label">Email</label>
                </div>
                <div class="col-sm-12 col-lg-6">
                    <asp:TextBox runat="server" type="text" class="form-control" ID="email" placeholder="Email"></asp:TextBox>
                </div>
            </div>
            <div class="row mt-lg-4">
                <div class="col-sm-12 col-lg-6">
                    <label for="lblSito" class="col-form-label">Sito</label>
                </div>
                <div class="col-sm-12 col-lg-6">
                    <asp:TextBox runat="server" type="text" class="form-control" ID="sito" placeholder="Sito"></asp:TextBox>
                </div>
            </div>
            <div class="row mt-lg-4">
                <div class="col-sm-12 col-lg-6">
                    <label for="lblTel1" class="col-form-label">Numero di telefono 1</label>
                </div>
                <div class="col-sm-12 col-lg-6">
                    <asp:TextBox runat="server" type="text" class="form-control" ID="tel1" placeholder="Numero di telefono 1"></asp:TextBox>
                </div>
            </div>
            <div class="row mt-lg-4">
                <div class="col-sm-12 col-lg-6">
                    <label for="lblTel2" class="col-form-label">Numero di telefono 2</label>
                </div>
                <div class="col-sm-12 col-lg-6">
                    <asp:TextBox runat="server" type="text" class="form-control" ID="tel2" placeholder="Numero di telefono 2"></asp:TextBox>
                </div>
            </div>
            <div class="row mt-lg-4">
                <div class="col-sm-12 col-lg-6">
                    <label for="lblPec" class="col-form-label ">Posta Elettronica Certificata (PEC)</label>
                </div>
                <div class="col-sm-12 col-lg-6">
                    <asp:TextBox runat="server" type="text" class="form-control " ID="PEC" placeholder="Posta Elettronica Certificata (PEC)"></asp:TextBox>
                </div>
            </div>
            <div class="row mt-lg-4">
                <div class="col-sm-12 col-lg-6">
                    <label for="lblPIVA" class="col-form-label ">Partita Iva (P.IVA)</label>
                </div>
                <div class="col-sm-12 col-lg-6">
                    <asp:TextBox runat="server" type="text" class="form-control " ID="PIVA" placeholder="Partita Iva (P.IVA)"></asp:TextBox>
                </div>
            </div>
            <div class="row mt-lg-4">
                <div class="col-sm-12 col-lg-6">
                    <label for="lblCF" class="col-form-label ">Codice Fiscale</label>
                </div>
                <div class="col-sm-12 col-lg-6">
                    <asp:TextBox runat="server" type="text" class="form-control " ID="CF" placeholder="Codice Fiscale"></asp:TextBox>
                </div>
            </div>
            <div class="row mt-lg-4">
                <div class="col-sm-12 col-lg-6">
                    <label for="lblCU" class="col-form-label ">Certificazione Unica</label>
                </div>
                <div class="col-sm-12 col-lg-6">
                    <asp:TextBox runat="server" type="text" class="form-control " ID="CU" placeholder="Certificazione Unica"></asp:TextBox>
                </div>
            </div>
            <div class="row">
                <asp:Button Text="Modifica" runat="server" OnClick="ModificaAnagrafica_Click" class="btnLogin mx-auto mt-3" />
            </div>
            <br />
        </form>
        </div>
    </div>
    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>
