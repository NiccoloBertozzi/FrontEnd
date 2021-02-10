<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OutputClassifica.aspx.cs" Inherits="test.OutputClassifica" %>

<!DOCTYPE html>

<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Classifica</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.23/css/jquery.dataTables.min.css">
    <script src="https://cdn.datatables.net/1.10.23/js/jquery.dataTables.min.js"></script>
    <script>
        $(document).ready(function () {
            var parametri = new URLSearchParams(window.location.search);
            var genere = parametri.get('genere');
            var settings = {
                "url": "https://aibvcapi.azurewebsites.net/api/v1/gestionale/GetClassifica/" + genere,
                "method": "GET",
                "timeout": 0,
                "withCredentials": true,
                "headers": {},
            };
            $.ajax(settings).done(function (response) {
                response.forEach(function (dati) {
                    $('#tabella').append("<tr><td>" + (dati.nome) + "</td><td>" + (dati.cognome) + "</td><td>" + (dati.punteggi) + "</td></tr>");
                });
                $('#data-table').DataTable({
                    "order": [[2, "desc"]]
                });
            });
        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table id="data-table">
                <thead>
                    <tr>
                        <th>Nome</th>
                        <th>Cognome</th>
                        <th>Punteggio</th>
                    </tr>
                </thead>
                <tbody id="tabella">
                </tbody>
            </table>
            <br />
            <asp:PlaceHolder runat="server" ID="classificaTable"></asp:PlaceHolder>
        </div>
    </form>
</body>
</html>
