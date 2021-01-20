<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OutputClassifica.aspx.cs" Inherits="test.OutputClassifica" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Classifica</title>
    <script src="Scripts/jquery-3.4.1.min.js "></script>
    <link href="//cdn.datatables.net/1.10.23/css/jquery.dataTables.min.css" rel="stylesheet" />
    <script src="//cdn.datatables.net/1.10.23/js/jquery.dataTables.min.js"></script>
    <script>
        $(document).ready(function () {
            var genere = getParameterByName('genere');
            var token = getParameterByName('token');

            var settings = {
                "url": "https://aibvcapi.azurewebsites.net/api/v1/gestionale/GetClassifica/" + genere,
                "method": "GET",
                "timeout": 0,
                "headers": {
                    "Authorization": "Bearer " + token,
                    "Cookie": "ruolo=Admin; ARRAffinity=e7fc3e897f5be57469671ac828c06570ef8d3ea8fb2416293fd2acc3f67e0ee6; ARRAffinitySameSite=e7fc3e897f5be57469671ac828c06570ef8d3ea8fb2416293fd2acc3f67e0ee6"
                },
            };

            $.ajax(settings).done(function (response) {
                var classifica = response;
                //popolare tabella
            });

            $('#tabella').DataTable();
        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table id="tabella">
                <thead>
                    <tr>
                        <th>Cognome</th>
                        <th>Nome</th>
                        <th>Punteggio</th>
                    </tr>
                </thead>
            </table>
            <br />
            <hr />
            <br />
            <asp:PlaceHolder runat="server" ID="classificaTable"></asp:PlaceHolder>
        </div>
    </form>
</body>
</html>
