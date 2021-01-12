using RestSharp;
using System;
using System.Net;

namespace test
{
    public partial class RegisterDelegato : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_registerDelegato_Click(object sender, EventArgs e)
        {
            var client = new RestClient("https://aibvcwa.azurewebsites.net/api/v1/registrati/RegistraDelegato");
            client.Timeout = -1;
            var request = new RestRequest(Method.POST);
            request.AddHeader("Content-Type", "application/json");
            request.AddParameter("application/json", "{\r\n  \"delegato\": {\r\n    \"nome\": \"Nome\",\r\n    \"Cognome\": \"Marini\",\r\n    \"sesso\": \"M\",\r\n    \"cf\": \"MRMRN\",\r\n    \"dataNascita\": \"2020-12-22T18:50:27.644Z\",\r\n    \"indirizzo\": \"Via Delegati\",\r\n    \"cap\": \"44563\",\r\n    \"email\": \"mariomarini@gmail.com\",\r\n    \"tel\": \"253453\",\r\n    \"arbitro\": false,\r\n    \"supervisore\": true\r\n  },\r\n  \"cred\": {\r\n    \"comuneNascita\": \"Rimini\",\r\n    \"comuneResidenza\": \"Rimini\",\r\n    \"nomeSocieta\": \"Beach Volley University\",\r\n    \"password\": \"delegato1234\"\r\n  }\r\n}", ParameterType.RequestBody);
            IRestResponse response = client.Execute(request);
            if (response.StatusCode == HttpStatusCode.OK)
                risultato.Text = response.Content;
            else
                risultato.Text = response.ErrorMessage;
        }
    }
}