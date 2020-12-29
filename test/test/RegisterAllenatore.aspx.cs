using RestSharp;
using System;
using System.Net;

namespace test
{
    public partial class RegisterAllenatore : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        
        protected void btn_registerAllenatore_Click()
        {
            //----------------------RegisterAllenatore------------------------
            var client = new RestClient("https://aibvcwa.azurewebsites.net/api/v1/registrati/RegistraAllenatore");
            client.Timeout = -1;
            var request = new RestRequest(Method.POST);
            request.AddHeader("Content-Type", "application/json");
            request.AddParameter("application/json", "{\r\n  \"allenatore\": {\r\n    \"codiceTessera\": \"ALL-223\",\r\n    \"grado\": \"1\",\r\n    \"nome\": \"Maria\",\r\n    \"cognome\": \"Guidi\",\r\n    \"sesso\": \"F\",\r\n    \"cf\": \"MRGDD\",\r\n    \"dataNascita\": \"2020-12-22T18:45:19.236Z\",\r\n    \"indirizzo\": \"Via degli allenatori\",\r\n    \"cap\": \"47825\",\r\n    \"email\": \"mariaguidi@gmail.com\",\r\n    \"tel\": \"343253565\"\r\n  },\r\n  \"cred\": {\r\n    \"comuneNascita\": \"Rimini\",\r\n    \"comuneResidenza\": \"Rimini\",\r\n    \"nomeSocieta\": \"Beach Volley University\",\r\n    \"password\": \"allenatore1234\"\r\n  }\r\n}", ParameterType.RequestBody);
            IRestResponse response = client.Execute(request);
            //-----------------------------------------        
        }
    }
} 