<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="visualizzaStatoTessere.aspx.cs" Inherits="test.visualizzaStatoTessere" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Stato delle tessere dei componenti della societa</title>
</head>
<body>
    <form id="formComponentiSocieta" runat="server">
        <br />
        <asp:Label runat="server" id="lblTessere" Text="Tessere: "></asp:Label><br />

        <asp:PlaceHolder runat="server" ID="visualizzaTessere"></asp:PlaceHolder>
    </form>
</body>
</html>