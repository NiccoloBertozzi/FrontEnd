<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="assegnaTessereSocieta.aspx.cs" Inherits="test.assegnaTessereSocieta" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label runat="server" text="Assegnazione Tessere"></asp:Label>
            
            <asp:Label runat="server" ID="lblIdMembro" Text="Id membro: "></asp:Label> <!-- da modificare -->
            <asp:TextBox runat="server" ID="txtIdMembri"></asp:TextBox> <br />

            <asp:Label runat="server" ID="lblCodiceTessera" Text="Codice tessera: "></asp:Label>
            <asp:TextBox runat="server" ID="txtCodiceTessera"></asp:TextBox> <br />

            <asp:Label runat="server" ID="lblTipoTessera" Text="Tipo tessera: "></asp:Label>
            <asp:TextBox runat="server" ID="txtTipoTessera"></asp:TextBox> <br />

            <asp:Label runat="server" ID="lblDataTesseramento" Text="Data di tesseramento: "></asp:Label>
            <asp:TextBox runat="server" ID="txtDataTesseramento"></asp:TextBox> <br />

            <asp:Label runat="server" ID="lblAnnoTesseramento" Text="Anno di tesseramento: "></asp:Label>
            <asp:TextBox runat="server" ID="txtAnnoTesseramento"></asp:TextBox> <br />

            <asp:Button runat="server" ID="btnInvio" Text="invio" OnClick="btnInvio_Click" />
        </div>
    </form>
</body>
</html>