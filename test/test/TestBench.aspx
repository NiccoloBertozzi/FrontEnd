<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TestBench.aspx.cs" Inherits="test.TestBench" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
             <asp:Label ID="Label7" runat="server" Text="AssegnaSupervisori"></asp:Label>
            <asp:Label ID="Label1" runat="server" Text="nomeSupervisore"></asp:Label>
            <asp:TextBox ID="nomeSupervisore" runat="server"></asp:TextBox></br>
            <asp:Label ID="Label2" runat="server" Text="cognomeSupervisore"></asp:Label>
            <asp:TextBox ID="cognomeSupervisore" runat="server"></asp:TextBox></br>
            <asp:Label ID="Label3" runat="server" Text="nomeSupArbitrale"></asp:Label>
            <asp:TextBox ID="nomeSupArbitrale" runat="server"></asp:TextBox></br>
            <asp:Label ID="Label4" runat="server" Text="nomeDirettore"></asp:Label>
            <asp:TextBox ID="nomeDirettore" runat="server"></asp:TextBox></br>
            <asp:Label ID="Label5" runat="server" Text="cognomeDirettore"></asp:Label>
            <asp:TextBox ID="TextcognomeDirettoreBox1" runat="server"></asp:TextBox></br>
            <asp:Label ID="Label6" runat="server" Text="titoloTorneo"></asp:Label>
            <asp:TextBox ID="titoloTorneo" runat="server"></asp:TextBox></br>
            <asp:Button ID="btnassegnasupervisore" OnClick="btnassegnasupervisore_Click" runat="server" Text="Button" />
            <asp:Label ID="risultato" runat="server" Text=""></asp:Label>
            </br></br></br></br></br></br>

        </div>
    </form>
</body>
</html>
