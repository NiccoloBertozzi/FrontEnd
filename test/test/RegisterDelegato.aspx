<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RegisterDelegato.aspx.cs" Inherits="test.RegisterDelegato" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <!-- Delegato-->

            <asp:Label ID="lblNome" runat="server" Text="Nome"></asp:Label> <!-- Nome -->
            <asp:TextBox ID="nome" runat="server"></asp:TextBox> <br />

            <asp:Label ID="lblCognome" runat="server" Text="Cognome"></asp:Label> <!-- Cognome -->
            <asp:TextBox ID="cognome" runat="server"></asp:TextBox> <br />

            <asp:Label ID="lblSesso" runat="server" Text="Sesso"></asp:Label> <!-- Sesso -->
            <asp:RadioButton ID="sesso1" runat="server" Text="Maschio" GroupName="sesso"/>
            <asp:RadioButton ID="sesso2" runat="server" Text="Femmina" GroupName="sesso"/>

            <asp:Label ID="lblCf" runat="server" Text="Codice fiscale"></asp:Label> <!-- Codice Fiscale -->
            <asp:TextBox ID="cf" runat="server"></asp:TextBox> <br />

            <asp:Label ID="lblDataNascita" runat="server" Text="Data di nascita"></asp:Label> <!-- Data Nascita -->
            <asp:TextBox ID="dataNascita" runat="server"></asp:TextBox> <br />

            <asp:Label ID="lblIndirizzo" runat="server" Text="Indirizzo"></asp:Label> <!-- Indirizzo -->
            <asp:TextBox ID="idirizzo" runat="server"></asp:TextBox> <br />

            <asp:Label ID="lblCap" runat="server" Text="cap"></asp:Label> <!-- Cap -->
            <asp:TextBox ID="cap" runat="server"></asp:TextBox> <br />

            <asp:Label ID="lblEmail" runat="server" Text="Email"></asp:Label> <!-- Email -->
            <asp:TextBox ID="email" runat="server"></asp:TextBox> <br />

            <asp:Label ID="lblTel" runat="server" Text="Numero di cellulare"></asp:Label> <!-- Numero Cellulare -->
            <asp:TextBox ID="tel" runat="server"></asp:TextBox> <br />

            <asp:Label ID="Label1" runat="server" Text="Arbitro"></asp:Label> <!-- Arbitro -->
            <asp:RadioButton ID="RadioButton1" runat="server" Text="si" GroupName="Arbitro"/>
            <asp:RadioButton ID="RadioButton2" runat="server" Text="no" GroupName="Arbitro"/>

            <asp:Label ID="Label2" runat="server" Text="Supervisore"></asp:Label> <!-- Supervisore -->
            <asp:RadioButton ID="RadioButton3" runat="server" Text="si" GroupName="Supervisore"/>
            <asp:RadioButton ID="RadioButton4" runat="server" Text="no" GroupName="Supervisore"/>

            <!-- Supervisore -->

            <asp:Label ID="lblComNasc" runat="server" Text="Comune di nascita"></asp:Label> <!-- Comune Nascita -->
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox> <br />

            <asp:Label ID="lblComRes" runat="server" Text="Comune di Residenza"></asp:Label> <!-- Comune Residenza -->
            <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox> <br />

            <asp:Label ID="lblNomSoc" runat="server" Text="Nome Società"></asp:Label> <!-- Nome Società -->
            <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox> <br />

            <asp:Label ID="lblPassword" runat="server" Text="Password"></asp:Label> <!-- Password -->
            <asp:TextBox ID="password" runat="server"></asp:TextBox> <br />

            <asp:Button ID="btn_registerDelegato" runat="server" Text="RegistraDelegato" OnClick="btn_registerDelegato_Click" />
            <asp:Label ID="risultato" runat="server" Text="Label"></asp:Label>

        </div>
    </form>
</body>
</html>
