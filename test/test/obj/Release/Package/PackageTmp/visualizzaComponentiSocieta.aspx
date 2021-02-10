<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="visualizzaComponentiSocieta.aspx.cs" Inherits="test.visualizzaComponentiSocieta" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Componenti Societa</title>
</head>
<body>
    <form id="formComponentiSocieta" runat="server">
        <br />
        <div title="Allenatori">
            <asp:Label runat="server" id="lblAllenatori" Text="Allenatori: "></asp:Label><br />
            <asp:PlaceHolder runat="server" ID="visualizzaAllenatori"></asp:PlaceHolder>
        </div>
        <br />
        <div title="Atleti">
            <asp:Label runat="server" id="lblAtleti" Text="Atleti: "></asp:Label><br />
            <asp:Placeholder runat="server" ID="visualizzaAtleti"></asp:Placeholder>
        </div>
    </form>
</body>
</html>