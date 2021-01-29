<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AnagraficaDelegato.aspx.cs" Inherits="test.AnagraficaDelegato" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:PlaceHolder runat="server" ID="anagraficaDelegato"></asp:PlaceHolder>
            <asp:Button runat="server" OnClick="ModificaAnagraficaDelegato_Click" Text="Modifica anagrafica" />
        </div>
    </form>
</body>
</html>

