<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CreaTorneo.aspx.cs" Inherits="test.CreaTorneo" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

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
            </div>
        </div>
    </nav>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="sp1" runat="server"></asp:ScriptManager>
        <!--Banner-->
        <div class="page-title-login row">
            <h1 class=" col-12 text-center my-auto">Creazione torneo</h1>
        </div>
        <!--Inserimento parametri-->
        <div class="container">
            <div class="mr-3 ml-3 mt-3 card-container">
                <div class="form-group">
                    <label for="titoloTorneo">Titolo torneo</label>
                    <asp:TextBox ID="txtTitolo" runat="server" required="true" placeholder="Inserisci il titolo del torneo" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label for="lblQuotaIscr">Quota iscrizione a coppia: </label>
                    <asp:TextBox ID="txtQuotaIscr" runat="server" required="true" placeholder="Inserisci la quota di iscrizione a coppia" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label for="lblPuntiVitt">Punti vittoria set: </label>
                    <asp:TextBox ID="txtPuntiVitt" runat="server" required="true" placeholder="Inserisci punti vittoria set" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label for="lblDataChiusuraIscr">Data chiusura iscrizioni: </label>
                    <asp:TextBox ID="txtDataChiusuraIscr" runat="server" required="true" placeholder="Inserisci data chiusura iscrizioni" CssClass="form-control" TextMode="Date" Text=""></asp:TextBox>
                </div>
                <div class="form-group">
                    <label for="lblDataInizio">Data inizio: </label>
                    <asp:TextBox ID="txtDataInizio" runat="server" required="true" placeholder="Inserisci data inizio torneo" CssClass="form-control" TextMode="Date"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label for="lblOraInizio">Ora inizio: </label>
                    <asp:TextBox ID="txtOraInizio" runat="server" required="true" placeholder="Inserisci ora inizio torneo" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label for="lblDataFine">Data fine: </label>
                    <asp:TextBox ID="txtDataFine" runat="server" required="true" placeholder="Inserisci data fine torneo" CssClass="form-control" TextMode="Date"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label for="lblOutdoor">Outdoor</label>
                    <asp:CheckBox ID="cbOutdoor" runat="server" CssClass="form-control" />
                </div>
                <div class="form-group">
                    <label for="lblRiunioneTecnica">Riunione tecnica</label>
                    <asp:CheckBox ID="cbRiunioneTecnica" runat="server" CssClass="form-control" />
                </div>
                <br />
                <p>Gender:</p>
                <div class="form-check">
                    <asp:RadioButton ID="M" runat="server" CssClass="form-check-radio" Text="Maschile" GroupName="gender" Checked="true" />
                </div>
                <div class="form-check">
                    <asp:RadioButton ID="F" runat="server" CssClass="form-check-radio" Text="Femminile" GroupName="gender" />
                </div>
                <br />
                <div class="form-group">
                    <label for="lblNumTeamTabellone">Numero di squadre totali nel tabellone: </label>
                    <asp:TextBox ID="txtNumTeamTabellone" runat="server" required="true" placeholder="Inserisci il numero di Team totali del tabellone" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label for="lblNumTeamQualifiche">Numero di squadre partecipanti alle qualifiche: </label>
                    <asp:TextBox ID="txtNumTeamQualifiche" runat="server" required="true" placeholder="Inserisci il numero di Team che partecipano alle qualifiche" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label for="lblNumTeamQualificati">Numero di squadre che si qualificano: </label>
                    <asp:TextBox ID="txtNumTeamQualificati" runat="server" required="true" placeholder="Inserisci il numero di Team  che si qualificano" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label for="lblNumWildCard">Numero di squadre aventi la wildCard: </label>
                    <asp:TextBox ID="txtNumWildCard" runat="server" required="true" placeholder="Inserisci il numero di Team Team che hanno la wildCard" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label for="lblTipoTorneo">Tipo Torneo: </label>
                    <asp:DropDownList ID="cmbTipoTorneo" runat="server" CssClass="form-control" AutoPostBack="True" OnSelectedIndexChanged="cmbTipoTorneo_SelectedIndexChanged"></asp:DropDownList>
                    <br />
                </div>
                <div class="form-group">
                    <label for="lblMontepremi">Montepremi: </label>
                    <asp:TextBox ID="txtMontepremi" runat="server" required="true" placeholder="Inserisci il montepremi" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label for="lblFormula">Formula Torneo: </label>
                    <asp:DropDownList ID="cmbFormula" runat="server" CssClass="form-control"></asp:DropDownList>
                    <br />
                </div>
                <br />
                <div class="form-group" id="parametriSelezionati" runat="server">
                    <label for="lblIDParametri">Parametri: </label>
                    <asp:PlaceHolder ID="cmbParametri" runat="server">
                        <asp:CheckBoxList ID="cbListParametri" runat="server"></asp:CheckBoxList>
                    </asp:PlaceHolder>
                    <br />
                </div>
                <br />
                <div class="form-group" id="impiantiSelezionati" runat="server">
                    <label for="Impianti">Impianti</label><br />
                   <ajaxToolkit:ComboBox AutoPostBack="true" required="true" ID="cbImpianti" runat="server" AutoCompleteMode="SuggestAppend" DropDownStyle="DropDownList" OnTextChanged="cbImpianti_TextChanged"/>
                   <asp:Label runat="server" Text="" ID="idImpianto"></asp:Label>
                </div>
                <asp:Button ID="Button1" runat="server" Text="Crea torneo" OnClick="creaTorneo_Click" CssClass="btn btn-primary" />
            </div>
        </div>
        <script src="Scripts/jquery-3.4.1.min.js "></script>
        <script src="Scripts/bootstrap.min.js "></script>
    </form>
</body>
</html>
