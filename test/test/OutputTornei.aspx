<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OutputTornei.aspx.cs" Inherits="test.OutputTornei" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="lblData" runat="server" Text="Inserisci data: "></asp:Label> <!-- inserimento data -->
            <asp:TextBox ID="txtData" runat="server"> </asp:TextBox> <br /> <br />

            <asp:Button ID="btnInvia" runat="server" Text="invia" OnClick="btnInvia_Click"/> <!--richiama l'api-->
            <br /> <br />
            <asp:Label ID="txtProva" runat="server" Text="test"></asp:Label>
        </div>
    </form>
</body>
</html>