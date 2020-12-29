<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RegisterAllenatore.aspx.cs" Inherits="test.RegisterAllenatore" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="lblAllenatore" runat="server" Text="Allenatore"></asp:Label> <!-- Allenatore -->
            <asp:TextBox ID="allenatore" runat="server"></asp:TextBox> <br />

            <asp:Label ID="lblCodiceTessera" runat="server" Text="Codice tessera"></asp:Label> <!-- Codice tessera -->
            <asp:TextBox ID="codiceTessera" runat="server"></asp:TextBox> <br />

            <asp:Label ID="lblGrado" runat="server" Text="Grado"></asp:Label> <!-- Grado -->
            <asp:TextBox ID="grado" runat="server"></asp:TextBox> <br />

            <asp:Label ID="lblNome" runat="server" Text="Nome"></asp:Label> <!-- Nome -->
            <asp:TextBox ID="nome" runat="server"></asp:TextBox> <br />

            <asp:Label ID="lblCognome" runat="server" Text="Cognome"></asp:Label> <!-- Cognome -->
            <asp:TextBox ID="cognome" runat="server"></asp:TextBox> <br />

            <asp:Label ID="lblSesso" runat="server" Text="Sesso"></asp:Label> <!-- Sesso -->
            <asp:RadioButton ID="sesso1" runat="server" Text="Maschio" GroupName="sesso"/>
            <asp:RadioButton ID="sesso2" runat="server" Text="Femmina" GroupName="sesso"/>

            <asp:Label ID="lblCF" runat="server" Text="Codice fiscale"></asp:Label> <!-- CF -->
            <asp:TextBox ID="cf" runat="server"></asp:TextBox> <br />

            <asp:Label ID="lblDataNascita" runat="server" Text="Data nascita"></asp:Label> <!-- Data nascita -->
            <asp:TextBox ID="dataNascita" runat="server"></asp:TextBox> <br />

            <asp:Label ID="lblIndirizzo" runat="server" Text="Indirizzo"></asp:Label> <!-- Indirizzo -->
            <asp:TextBox ID="indirizzo" runat="server"></asp:TextBox> <br />

            <asp:Label ID="lblCap" runat="server" Text="CAP"></asp:Label> <!-- CAP -->
            <asp:TextBox ID="cap" runat="server"></asp:TextBox> <br />

            <asp:Label ID="lblEmail" runat="server" Text="Email"></asp:Label> <!-- Email -->
            <asp:TextBox ID="email" runat="server"></asp:TextBox> <br />

            <asp:Label ID="lblTel" runat="server" Text="Tel"></asp:Label> <!-- Tel -->
            <asp:TextBox ID="tel" runat="server"></asp:TextBox> <br />

            <!-- dopo tel ci sarebbe "cred" -->

            <asp:Label ID="lblComuneNascita" runat="server" Text="Comune nascita"></asp:Label> <!-- Comune nascita -->
            <asp:TextBox ID="comuneNascita" runat="server"></asp:TextBox> <br />

            <asp:Label ID="lblComuneResidenza" runat="server" Text="Comune residenza"></asp:Label> <!-- Comune residenza -->
            <asp:TextBox ID="comuneResidenza" runat="server"></asp:TextBox> <br />

            <asp:Label ID="lblNomeSocieta" runat="server" Text="Nome societa"></asp:Label> <!-- Nome societa -->
            <asp:TextBox ID="nomeSocieta" runat="server"></asp:TextBox> <br />

             <asp:Label ID="lblPassword" runat="server" Text="Password"></asp:Label> <!-- Password -->
            <asp:TextBox ID="password" runat="server"></asp:TextBox> <br />

            <asp:Button ID="btn_registerAllenatore" runat="server" Text="RegistraAllenatore" OnClick="btn_registerAllenatore_Click" />
            <asp:Label ID="risultato" runat="server" Text="Label"></asp:Label>
        </div>
    </form>
</body>
</html>
