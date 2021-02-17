<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InfoSquadra.aspx.cs" Inherits="test.EliminaSquadra" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="card-container mr-3 ml-3 mt-3">
            <asp:PlaceHolder runat="server" ID="squadraInfo"></asp:PlaceHolder>
            <asp:Button runat="server" Text="Assegna WC" OnClick="AssegnaWC_Click"/>
            <asp:Button runat="server" Text="Cancella squadra" OnClick="EliminaSquadra_Click"/>
        </div>
    </form>
</body>
</html>
