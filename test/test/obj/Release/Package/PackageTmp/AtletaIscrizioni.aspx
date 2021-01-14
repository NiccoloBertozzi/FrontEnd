<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AtletaIscrizioni.aspx.cs" Inherits="test.AtletaIscrizioni" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
            Mostra la lista di iscrizioni di un atleta <br /> <br /> <br />
            <div class="card-deck">
                <div class="row">
                    <asp:PlaceHolder runat="server" ID="torneilist"></asp:PlaceHolder>  
                </div>
            </div>
    </form>
</body>
</html>
