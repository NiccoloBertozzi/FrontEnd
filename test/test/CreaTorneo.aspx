<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CreaTorneo.aspx.cs" Inherits="test.CreaTorneo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>CREA UN TORNEO</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
</head>
<body>
    <form id="form1" runat="server">
        <div id="divTorneo"> <!-- INFORMAZIONI TORNEO -->
            <asp:Label ID="lblTorneo" runat="server" Text="CREAZIONE TORNEO"></asp:Label> <br />

            <asp:Label ID="lblTitolo" runat="server" Text="Titolo torneo: "></asp:Label> <!-- titolo -->
            <asp:TextBox ID="txtTitolo" runat="server" required="true"></asp:TextBox> <br />

            <asp:Label ID="lblQuotaIscr" runat="server" Text="Quota iscrizione: "></asp:Label> <!-- quota iscrizione -->
            <asp:TextBox ID="txtQuotaIscr" runat="server" required="true"></asp:TextBox> <br />

            <asp:Label ID="lblPuntiVitt" runat="server" Text="Punti vittoria: "></asp:Label> <!-- punti vittoria -->
            <asp:TextBox ID="txtPuntiVitt" runat="server" required="true"></asp:TextBox> <br />

            <asp:Label ID="lblMontepremi" runat="server" Text="Montepremi: "></asp:Label> <!-- montepremi -->
            <asp:TextBox ID="txtMontepremi" runat="server" required="true"></asp:TextBox> <br />

            <asp:Label ID="lblDataChiusuraIscr" runat="server" Text="Data chiusura iscrizioni: "></asp:Label> <!-- data chiusura iscrizioni -->
            <asp:TextBox ID="txtDataChiusuraIscr" runat="server" required="true"></asp:TextBox> <br />

            <asp:Label ID="lblDataInizio" runat="server" Text="Data inizio: "></asp:Label> <!-- data inizio -->
            <asp:TextBox ID="txtDataInizio" runat="server" required="true"></asp:TextBox> <br />

            <asp:Label ID="lblDataFine" runat="server" Text="Data fine: "></asp:Label> <!-- data fine -->
            <asp:TextBox ID="txtDataFine" runat="server" required="true"></asp:TextBox> <br /> <br />

            <asp:Label ID="lblGender" runat="server" Text="Gender: "></asp:Label> <br /> <!-- gender -->
            <asp:RadioButton ID="M" runat="server" Text="Maschile" GroupName="gender" /> <br />
            <asp:RadioButton ID="F" runat="server" Text="Femminile" GroupName="gender" /> <br /> <br />

            <asp:Label ID="lblNumTeamTabellone" runat="server" Text="Numero Team Tabellone: "></asp:Label> <!-- num team tabellone -->
            <asp:TextBox ID="txtNumTeamTabellone" runat="server" required="true"></asp:TextBox> <br />
            <asp:Label ID="lblNumTeamQualifiche" runat="server" Text="Numero Team Qualifiche: "></asp:Label> <!-- num team qualifiche -->
            <asp:TextBox ID="txtNumTeamQualifiche" runat="server" required="true"></asp:TextBox> <br /> <br />

            <asp:Label ID="lblTipoTorneo" runat="server" Text="Tipo Torneo: "></asp:Label> <!-- tipo torneo -->
            <asp:DropDownList ID="cmbTipoTorneo" runat="server"></asp:DropDownList> <br />

            <asp:Label ID="lblFormula" runat="server" Text="Formula: "></asp:Label> <!-- formula -->
            <asp:DropDownList ID="cmbFormula" runat="server"></asp:DropDownList> <br />

        </div>
        <br />
        <div id="divParamtri"> <!-- PARAMETRI -->
            <asp:Label ID="lblParametri" runat="server" Text="PARAMETRI TORNEO"></asp:Label> <br />

            <asp:Label ID="lblIDParametri" runat="server" Text="Parametro: "></asp:Label> <!-- parametro -->
            <asp:DropDownList ID="cmbParametro" runat="server"></asp:DropDownList> <br />
            <asp:Label ID="parametriInseriti" runat="server" Text="Parametri inseriti: "></asp:Label>
        </div>
        <br />
        <div id="divImpianto"> <!-- IMPIANTO -->
            <asp:Label ID="lblImpianto" runat="server" Text="INFORMAZIONI IMPIANTO"></asp:Label> <br />

            <asp:Label ID="lblIDImpianto" runat="server" Text="Impianto: "></asp:Label> <!-- impianto -->
            <asp:DropDownList ID="cmbImpianto" runat="server"></asp:DropDownList> <br />
            <asp:Label ID="impiantiInseriti" runat="server" Text="Impianti inseriti: "></asp:Label>
        </div>
        <div>
            <asp:Button ID="creaTorneo" runat="server" Text="Crea torneo" OnClick="creaTorneo_Click" />
        </div>
    </form>
</body>
</html>
