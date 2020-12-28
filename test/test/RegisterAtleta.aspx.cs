using RestSharp;
using System;
using System.Net;

namespace test
{
    public partial class RegisterAtleta : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_registerAtleta_Click(object sender, EventArgs e)
        {
            //----------------------RegisterAtleta------------------------
            var client = new RestClient("https://aibvcapi.azurewebsites.net/api/v1/registrati/RegistraAtleta");
            client.Timeout = -1;
            var request = new RestRequest(Method.POST);
            request.AddHeader("Content-Type", "application/json");
            request.AddParameter("application/json", "{\r\n  \"atleta\": {\r\n    \"codiceTessera\": \"666\",\r\n    \"nome\": \"MATTEO\",\r\n    \"cognome\": \"tamagnini\",\r\n    \"sesso\": \"M\",\r\n    \"cf\": \"MTTTMG\",\r\n    \"dataNascita\": \"2002-03-05T06:57:25.473Z\",\r\n    \"indirizzo\": \"Via di santermete\",\r\n    \"cap\": \"47822\",\r\n    \"email\": \"matteotama@gmail.com\",\r\n    \"tel\": \"58234053\",\r\n    \"altezza\": 180,\r\n    \"peso\": 65,\r\n    \"dataScadenzaCertificato\": \"2020-12-22T06:57:25.473Z\"\r\n  },\r\n  \"cred\": {\r\n    \"comuneNascita\": \"Rimini\",\r\n    \"comuneResidenza\": \"Rimini\",\r\n    \"nomeSocieta\": \"Beach Volley University\",\r\n    \"password\": \"Matteo1234\"\r\n  }\r\n}", ParameterType.RequestBody);
            IRestResponse response = client.Execute(request);
            if (response.StatusCode == HttpStatusCode.OK)
                risultato.Text = response.Content;
            else
                risultato.Text = response.ErrorMessage;
            //-----------------------------------------
        }
    }
}