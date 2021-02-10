<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AnagraficaSocieta.aspx.cs" Inherits="test.AnagraficaSocieta" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Anagrafica societa</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:PlaceHolder runat="server" ID="anagraficaSocieta"></asp:PlaceHolder>
            <asp:Button runat="server" OnClick="ModificaAnagraficaSocieta_Click" Text="Modifica anagrafica" />
        </div>
    </form>
</body>
</html>
