<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RegisterAtleta.aspx.cs" Inherits="test.RegisterAtleta" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="lblTessera" runat="server" Text="Codice Tessera"></asp:Label> <!-- Codice Tessera -->
            <asp:TextBox ID="codTessera" runat="server"></asp:TextBox> <br />

            <asp:Label ID="lblNome" runat="server" Text="Nome"></asp:Label> <!-- Nome -->
            <asp:TextBox ID="nome" runat="server"></asp:TextBox> <br />

            <asp:Label ID="lblCognome" runat="server" Text="Cognome"></asp:Label> <!-- Cognome -->
            <asp:TextBox ID="cognome" runat="server"></asp:TextBox> <br />

            <asp:Label ID="lblEmail" runat="server" Text="Email"></asp:Label> <!-- Email -->
            <asp:TextBox ID="email" runat="server"></asp:TextBox> <br />

            <asp:Label ID="lblTel" runat="server" Text="Numero di cellulare"></asp:Label> <!-- Numero Cellulare -->
            <asp:TextBox ID="tel" runat="server"></asp:TextBox> <br />
            
            <asp:Label ID="lblDataNascita" runat="server" Text="Data di nascita"></asp:Label> <!-- Data Nascita -->
            <asp:TextBox ID="dataNascita" runat="server"></asp:TextBox> <br />

            <asp:Label ID="lblCf" runat="server" Text="Codice fiscale"></asp:Label> <!-- Codice Fiscale -->
            <asp:TextBox ID="cf" runat="server"></asp:TextBox> <br />

            <asp:Label ID="lblIndirizzo" runat="server" Text="Indirizzo"></asp:Label> <!-- Indirizzo -->
            <asp:TextBox ID="indirizzo" runat="server"></asp:TextBox> <br />

            <asp:Label ID="lblCap" runat="server" Text="cap"></asp:Label> <!-- Cap -->
            <asp:TextBox ID="cap" runat="server"></asp:TextBox> <br />

            <asp:Label ID="lblDataScadCert" runat="server" Text="Data di scadenza del certificato"></asp:Label> <!-- Data Scadenza Certificato -->
            <asp:TextBox ID="dataScadCert" runat="server"></asp:TextBox> <br />

            <asp:Label ID="lblAltezza" runat="server" Text="Altezza"></asp:Label> <!-- Altezza -->
            <asp:TextBox ID="altezza" runat="server"></asp:TextBox> <br />

            <asp:Label ID="lblPeso" runat="server" Text="Peso"></asp:Label> <!-- Peso -->
            <asp:TextBox ID="peso" runat="server"></asp:TextBox> <br />

            <asp:Label ID="lblSesso" runat="server" Text="Sesso"></asp:Label> <!-- Sesso -->
            <asp:RadioButton ID="sesso1" runat="server" Text="Maschio" GroupName="sesso"></asp:RadioButton>
            <asp:RadioButton ID="sesso2" runat="server" Text="Femmina" GroupName="sesso"></asp:RadioButton>

            <!--CREDENZIALI-->

            <asp:Label ID="lblComuneNascita" runat="server" Text="Comune di nascita"></asp:Label> <!-- Comune di nascita -->
            <asp:TextBox ID="comuneNascita" runat="server"></asp:TextBox> <br />

            <asp:Label ID="lblComuneResidenza" runat="server" Text="Comune di residenza"></asp:Label> <!-- Comune di residenza -->
            <asp:TextBox ID="comuneResidenza" runat="server"></asp:TextBox>

            <asp:Label ID="lblNomeSocieta" runat="server" Text="Nome della società "></asp:Label> <!-- Nome Società  -->
            <asp:TextBox ID="nomeSocieta" runat="server"></asp:TextBox>

            <asp:Label ID="lblPassword" runat="server" Text="Password"></asp:Label> <!-- Password -->
            <asp:TextBox ID="password" runat="server"></asp:TextBox> <br />

            <asp:Button ID="btn_registerAtleta" runat="server" Text="RegistraAtleta" OnClick="btn_registerAtleta_Click" />
            <asp:Label ID="risultato" runat="server" Text="Label"></asp:Label>

        </div>
    </form>
</body>
</html>