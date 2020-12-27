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
            <asp:Label ID="Label3" runat="server" Text="Codice Tessera"></asp:Label>
            <asp:TextBox ID="codTessera" runat="server"></asp:TextBox>
            <asp:Label ID="Label4" runat="server" Text="Nome"></asp:Label>
            <asp:TextBox ID="nome" runat="server"></asp:TextBox>
            <asp:Label ID="Label5" runat="server" Text="Cognome"></asp:Label>
            <asp:TextBox ID="cognome" runat="server"></asp:TextBox>
            <asp:Label ID="Label1" runat="server" Text="Email"></asp:Label>
            <asp:TextBox ID="email" runat="server"></asp:TextBox>
            <asp:Label ID="Label2" runat="server" Text="Password"></asp:Label>
            <asp:TextBox ID="password" runat="server"></asp:TextBox>
            <asp:Button ID="btn_registerAtleta" runat="server" Text="RegistraAtleta" OnClick="btn_registerAtleta_Click" />
            <asp:Label ID="risultato" runat="server" Text="Label"></asp:Label>
        </div>
    </form>
</body>
</html>