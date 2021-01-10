<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RecuperaPassword.aspx.cs" Inherits="test.RecuperaPassword" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="Label1" runat="server" Text="Email"></asp:Label>
            <asp:TextBox ID="email" runat="server"></asp:TextBox>
            <asp:Button ID="btn_accedi" runat="server" Text="Accedi" OnClick="btn_recupera_Click" />
        </div>
    </form>
</body>
</html>
