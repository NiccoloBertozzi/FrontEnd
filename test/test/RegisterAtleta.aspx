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
            <asp:Button ID="btn_registerAtleta" runat="server" Text="RegistraAtleta" OnClick="btn_registerAtleta_Click" />
            <asp:Label ID="risultato" runat="server" Text="Label"></asp:Label>
        </div>
    </form>
</body>
</html>
