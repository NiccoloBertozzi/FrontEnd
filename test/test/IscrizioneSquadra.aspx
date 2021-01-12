<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="IscrizioneSquadra.aspx.cs" Inherits="test.IscrizioneSquadra" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="lblSecondoAtleta" runat="server" Text="Codice secondo atleta *"></asp:Label> <!-- Codice Secondo Atleta -->
            <asp:TextBox ID="codatleta2" runat="server"></asp:TextBox> <br />

            <asp:Label ID="lblAllenatore" runat="server" Text="Codice allenatore"></asp:Label> <!-- Codice Allenatore -->
            <asp:TextBox ID="codallenatore" runat="server"></asp:TextBox> <br />

            <asp:Button ID="btn_IscriviSquadra" runat="server" Text="Iscriviti al Torneo" OnClick="btn_IscriviSquadra_Click" />
            <asp:Label ID="risultato" runat="server" Text="Label"></asp:Label>
        </div>
    </form>
</body>
</html>
