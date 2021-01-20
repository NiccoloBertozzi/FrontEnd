<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TestBench.aspx.cs" Inherits="test.TestBench" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label runat="server" Text="AssegnaSupervisori"></asp:Label><br />
            <asp:Label runat="server" Text="Supervisore"></asp:Label>
            <asp:TextBox AutoPostBack="true" ID="Supervisore" runat="server" OnTextChanged="Supervisore_TextChanged"></asp:TextBox>
            <asp:Label runat="server" ID="Nomesupervisore"></asp:Label><br />
            <asp:Label runat="server" Text="Arbitro"></asp:Label>
            <asp:TextBox AutoPostBack="true" ID="Arbitro" runat="server" OnTextChanged="Arbitro_TextChanged"></asp:TextBox>
            <asp:Label runat="server" ID="Nomearbitro"></asp:Label><br />
            <asp:Label runat="server" Text="Delegato"></asp:Label>
            <asp:TextBox AutoPostBack="true" ID="Direttore" runat="server" OnTextChanged="Direttore_TextChanged"></asp:TextBox>
            <asp:Label runat="server" ID="Nomedirettore"></asp:Label><br />
           
            <asp:Button ID="btnassegnasupervisore" OnClick="btnassegnasupervisore_Click" runat="server" Text="Assegna delegati" /><br />
            <asp:Label ID="risultato" runat="server" Text=""></asp:Label>
            <br /><br /><br /><br /><br /><br />

        </div>
    </form>
</body>
</html>
