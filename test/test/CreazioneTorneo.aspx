<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CreazioneTorneo.aspx.cs" Inherits="test.InformazioniTorneo" %>

<!DOCTYPE html>

<html>

<head runat="server">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Creazione torneo</title>
    <link rel="stylesheet" href="Content/bootstrap.min.css">
    <link rel="stylesheet" href="Content/styles.css">
    <script src="https://kit.fontawesome.com/95609c6d0f.js" crossorigin="anonymous"></script>
</head>
<body>
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
    <form id="form1" runat="server">
        <!--Banner-->
        <div class="page-title row">
            <h1 class=" col-12 text-center my-auto">Creazione torneo</h1>
        </div>

        <!--Inserimento parametri-->
        <div class="mr-3 ml-3 mt-3 card-container">
            <div class="form-group">
                <label for="titoloTorneo">Titolo torneo</label>
                <input type="text" class="form-control" id="titoloTorneo" placeholder="Inserisci il titolo del torneo">
            </div>
            <div class="form-group">
                <label for="quotaIscrizione">Quota iscrizione</label>
                <input type="text" class="form-control" id="quotaIscrizione" placeholder="Inserisci la quota di iscrizione">
            </div>
            <div class="form-group">
                <label for="puntiVittoria">Punti vittoria</label>
                <input type="text" class="form-control" id="puntiVittoria" placeholder="Inserisci punti vittoria">
            </div>
            <div class="form-group">
                <label for="montepremi">Montepremi</label>
                <input type="text" class="form-control" id="montepremi" placeholder="Inserisci montepremi">
            </div>
            <div class="form-group">
                <label for="dataChiusura">Data chiusura iscrizioni</label>
                <input type="date" class="form-control" id="datachiusura">
            </div>
            <div class="form-group">
                <label for="dataInizio">Data inizio</label>
                <input type="date" class="form-control" id="dataInizio">
            </div>
            <div class="form-group">
                <label for="dataFine">Data fine</label>
                <input type="date" class="form-control" id="dataFine">
            </div>
            <br />
            <p>Gender:</p>
            <div class="form-check">
                <input type="radio" class="form-check-input" name="genderRadio" id="radioMale" value="male" checked>
                 <label class="form-check-radio" for="radioMale">Maschile</label>
            </div>
            <div class="form-check">
                <input class="form-check-input" type="radio" name="genderRadio" id="radioFemale" value="female">
                 <label class="form-check-radio" for="radioFemale">Femminile</label>
            </div>
            <br />
            <div class="form-group">
                <label for="numeroTeamTab">Numero team tabellone</label>
                <input type="text" class="form-control" id="numeroTeamTab" placeholder="Inserisci numero team tabellone">
            </div>
            <div class="form-group">
                <label for="numeroTeamQual">Numero team qualifiche</label>
                <input type="text" class="form-control" id="numeroTeamQual" placeholder="Inserisci numero team qualifiche">
            </div>
            <br />
            <div class="form-group">
                <label for="tipoTorneo">Tipo torneo</label>
                <select class="form-control" id="tipoTorneo">
                    <option>...</option>
                </select>
            </div>
            <div class="form-group">
                <label for="formulaTorneo">Formula</label>
                <select class="form-control" id="formulaTorneo">
                    <option>...</option>
                </select>
            </div>
            <br />
            <p>Parametri torneo:</p>
            <div class="form-group">
                <label for="parametroTorneo">Parametro</label>
                <select class="form-control" id="parametroTorneo">
                    <option>...</option>
                </select>
                <small>Parametri inseriti:</small>
            </div>
            <br />
            <p>Informazioni impianto:</p>
            <div class="form-group">
                <label for="impiantoTorneo">Impianto</label>
                <select class="form-control" id="impiantoTorneo">
                    <option>...</option>
                </select>
                <small>Impianti inseriti:</small>
            </div>
            <button class="btn btn-primary">Crea</button>
        </div>
        <script src="Scripts/jquery-3.4.1.min.js "></script>
        <script src="Scripts/bootstrap.min.js "></script>
    </form>
</body>
</html>