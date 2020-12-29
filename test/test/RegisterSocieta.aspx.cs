using RestSharp;
using System;
using System.Net;

namespace test
{
    public partial class RegisterSocieta : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void btn_registerSocieta_Click(object sender, EventArgs e)
        {
            var client = new RestClient("https://aibvcapi.azurewebsites.net/api/v1/registrati/RegistraSocieta");
            client.Timeout = -1;
            var request = new RestRequest(Method.POST);
            request.AddHeader("Content-Type", "application/json");
            request.AddParameter("application/json", "{\r\n  \"societa\": {\r\n    \"nomeSocieta\": \"ITTS Beach Volley\",\r\n    \"indirizzo\": \"Via negri \",\r\n    \"cap\": \"47823\",\r\n    \"dataFondazione\": \"2020-12-22T18:58:07.693Z\",\r\n    \"dataAffiliazione\": \"2020-12-22T18:58:07.693Z\",\r\n    \"codiceAffiliazione\": \"LA-22222\",\r\n    \"affiliata\": true,\r\n    \"email\": \"info@ittsbv.it\",\r\n    \"sito\": \"ittsbv.it\",\r\n    \"tel1\": \"33958395\",\r\n    \"tel2\": \"null\",\r\n    \"pec\": \"itts@pec.it\",\r\n    \"piva\": \"null\",\r\n    \"cf\": \"null\",\r\n    \"cu\": \"null\"\r\n  },\r\n  \"cred\": {\r\n    \"comuneNascita\": \"Rimini\",\r\n    \"comuneResidenza\": \"Rimini\",\r\n    \"nomeSocieta\": \"ITTS Beach Volley\",\r\n    \"password\": \"societa1234\"\r\n  }\r\n}", ParameterType.RequestBody);
            IRestResponse response = client.Execute(request);
            if (response.StatusCode == HttpStatusCode.OK)
                risultato.Text = response.Content;
            else
                risultato.Text = response.ErrorMessage;
        }
    }
}