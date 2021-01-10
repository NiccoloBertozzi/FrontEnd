<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NuovaPassword.aspx.cs" Inherits="test.NuovaPassword" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="Label2" runat="server" Text="Nuova PWD"></asp:Label>
            <asp:TextBox ID="PWD" runat="server"></asp:TextBox>
            <asp:Button ID="btn_accedi" runat="server" Text="Cambia password" OnClick="btn_nuovaPassword_Click" />
            <asp:Label ID="risultato" runat="server" Text="risultato"></asp:Label>
            <asp:Label ID="errore" runat="server" Text="" color="red"></asp:Label>
        </div>
    </form>
</body>
</html>
