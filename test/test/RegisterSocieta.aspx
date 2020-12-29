<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RegisterSocieta.aspx.cs" Inherits="test.RegisterSocieta" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="lblNomeSocieta" runat="server" Text="Nome Società"></asp:Label> <!-- Nome Società -->
            <asp:TextBox ID="nomesocieta" runat="server"></asp:TextBox> <br />

            <asp:Label ID="lblIndirizzo" runat="server" Text="Indirizzo"></asp:Label> <!-- Indirizzo -->
            <asp:TextBox ID="indirizzo" runat="server"></asp:TextBox> <br />

            <asp:Button ID="btn_registerSocieta" runat="server" Text="RegistraSocieta" OnClick="btn_registerSocieta_Click" />
            <asp:Label ID="risultato" runat="server" Text="Label"></asp:Label>
        </div>
    </form>
</body>
</html>
