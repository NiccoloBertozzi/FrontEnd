<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AutorizzaTorneo.aspx.cs" Inherits="test.AutorizzaTorneo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:PlaceHolder runat="server" ID="torneiInfo"></asp:PlaceHolder><br />
            <asp:Button runat="server" Text="Autorizza torneo" OnClick="AutorizzaTorneo_Click"/><br />
        </div>
    </form>
</body>
</html>
