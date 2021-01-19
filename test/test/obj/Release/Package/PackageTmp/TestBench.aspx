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
            <asp:Label runat="server" Text="Nome supervisore"></asp:Label>
            <asp:TextBox ID="nomeSupervisore" runat="server"></asp:TextBox><br />
            <asp:Label runat="server" Text="Cognome supervisore"></asp:Label>
            <asp:TextBox ID="cognomeSupervisore" runat="server"></asp:TextBox><br />
            <asp:Label runat="server" Text="NomeSupArbitrale"></asp:Label>
            <asp:TextBox ID="nomeSupArbitrale" runat="server"></asp:TextBox><br />
            <asp:Label runat="server" Text="cognomeSupArbitrale"></asp:Label>
            <asp:TextBox ID="cognomeSupArbitrale" runat="server"></asp:TextBox><br />
            <asp:Label runat="server" Text="Nome direttore"></asp:Label>
            <asp:TextBox ID="nomeDirettore" runat="server"></asp:TextBox><br />
            <asp:Label runat="server" Text="Cognome direttore"></asp:Label>
            <asp:TextBox ID="cognomeDirettore" runat="server"></asp:TextBox><br />
            <asp:Label runat="server" Text="Titolo torneo"></asp:Label>
            <asp:TextBox ID="titoloTorneo" runat="server"></asp:TextBox><br />
            <asp:Button ID="btnassegnasupervisore" OnClick="btnassegnasupervisore_Click" runat="server" Text="Assegna delegati" /><br />
            <asp:Label ID="risultato" runat="server" Text=""></asp:Label>
            <br /><br /><br /><br /><br /><br />

        </div>
    </form>
</body>
</html>
