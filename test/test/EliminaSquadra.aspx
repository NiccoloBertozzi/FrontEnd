<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EliminaSquadra.aspx.cs" Inherits="test.EliminaSquadra" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:PlaceHolder runat="server" ID="squadraInfo"></asp:PlaceHolder>
            <asp:Button runat="server" Text="Elimina squadra" OnClick="EliminaSquadra_Click"/>
        </div>
    </form>
</body>
</html>
