<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RegisterSocieta.aspx.cs" Inherits="test.RegisterSocieta" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="formsocieta" runat="server">
        <div>
            <asp:Label ID="lblNomeSocieta" runat="server" Text="Nome Società"></asp:Label> <!-- Nome Società -->
            <asp:TextBox ID="nomeSocieta" runat="server" required="true"></asp:TextBox> <br />

            <asp:Label ID="lblIndirizzo" runat="server" Text="Indirizzo"></asp:Label> <!-- Indirizzo -->
            <asp:TextBox ID="indirizzo" runat="server" required="true"></asp:TextBox> <br />

            <asp:Label ID="lblCAP" runat="server" Text="CAP"></asp:Label> <!-- CAP -->
            <asp:TextBox ID="cap" runat="server"></asp:TextBox> <br />

            <asp:Label ID="lblFondazione" runat="server" Text="Data Fondazione"></asp:Label> <!-- Data Fondazione -->
            <asp:TextBox ID="dataFondazione" runat="server" required="true"></asp:TextBox> <br />

            <asp:Label ID="lblAffiliazione" runat="server" Text="Data Affiliazione"></asp:Label> <!-- Data Affiliazione -->
            <asp:TextBox ID="dataAffiliazione" runat="server" required="true"></asp:TextBox> <br />

            <asp:Label ID="lblCodAffiliazione" runat="server" Text="Codice Affiliazione"></asp:Label> <!-- Codice Affiliazione -->
            <asp:TextBox ID="codiceAffiliazione" runat="server"></asp:TextBox> <br />

            <asp:Label ID="lblEmail" runat="server" Text="Email"></asp:Label> <!-- Email -->
            <asp:TextBox ID="email" runat="server" required="true"></asp:TextBox> <br />

            <asp:Label ID="lblSito" runat="server" Text="Sito"></asp:Label> <!-- Sito -->
            <asp:TextBox ID="sito" runat="server"></asp:TextBox> <br />

            <asp:Label ID="lblTelefono1" runat="server" Text="Telefono 1"></asp:Label> <!-- Telefono 1 -->
            <asp:TextBox ID="tel1" runat="server"></asp:TextBox> <br />

            <asp:Label ID="lblTelefono2" runat="server" Text="Telefono 2"></asp:Label> <!-- Telefono 2 -->
            <asp:TextBox ID="tel2" runat="server"></asp:TextBox> <br />

            <asp:Label ID="lblPEC" runat="server" Text="PEC"></asp:Label> <!-- PEC -->
            <asp:TextBox ID="pec" runat="server"></asp:TextBox> <br />

            <asp:Label ID="lblPiva" runat="server" Text="Partita IVA"></asp:Label> <!-- Partita IVA -->
            <asp:TextBox ID="piva" runat="server"></asp:TextBox> <br />

            <asp:Label ID="lblCF" runat="server" Text="Codice Fiscale"></asp:Label> <!-- Codice Fiscale -->
            <asp:TextBox ID="cf" runat="server"></asp:TextBox> <br />

            <asp:Label ID="lblCU" runat="server" Text="Certificazione Unica"></asp:Label> <!-- Certificazione Unica -->
            <asp:TextBox ID="cu" runat="server"></asp:TextBox> <br />

            <!--CREDENZIALI-->
            <asp:Label ID="lblComuneResidenza" runat="server" Text="Comune di residenza"></asp:Label> <!-- Comune di residenza -->
            <asp:TextBox ID="comuneResidenza" runat="server" required="true"></asp:TextBox> <br />

            <asp:Label ID="lblPassword" runat="server" Text="Password"></asp:Label> <!-- Password -->
            <asp:TextBox ID="password" runat="server" required="true"></asp:TextBox> <br />

            <asp:Button ID="btn_registerSocieta" runat="server" Text="RegistraSocieta" OnClick="btn_registerSocieta_Click" />
            <asp:Label ID="risultato" runat="server" Text="Label"></asp:Label>
        </div>
    </form>
</body>
</html>
