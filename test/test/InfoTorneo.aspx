<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InfoTorneo.aspx.cs" Inherits="test.InfoTorneo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="idricevuto" runat="server" Text=""></asp:Label>
            <asp:PlaceHolder runat="server" ID="torneiInfo"></asp:PlaceHolder>
        </div>
    </form>
</body>
</html>
