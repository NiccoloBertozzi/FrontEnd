<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AnagraficaAllenatore.aspx.cs" Inherits="test.AnagraficaAllenatore" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Anagrafica allenatore</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:PlaceHolder runat="server" ID="anagraficaAllenatore"></asp:PlaceHolder>
            <asp:Button runat="server" OnClick="ModificaAnagrafica_Click" Text="Modifica anagrafica" />
        </div>
    </form>
</body>
</html>
