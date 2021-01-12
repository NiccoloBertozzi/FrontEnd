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
            request.AddParameter("application/json", "{\r\n  \"societa\": {\r\n    \"nomeSocieta\": \"" + nomesocieta.Text + "\",\r\n    \"indirizzo\": \"" + indirizzo.Text + "\",\r\n    \"cap\": \"" + cap + "\",\r\n    \"dataFondazione\": \"" + fondazione.Text + "\",\r\n    \"dataAffiliazione\": \"" + affiliazione.Text + "\",\r\n    \"codiceAffiliazione\": \"" + codaffiliazione.Text + "\",\r\n    \"affiliata\": true,\r\n    \"email\": \"" + email.Text + "\",\r\n    \"sito\": \"" + sito.Text + "\",\r\n    \"tel1\": \"" + telefono1.Text + "\",\r\n    \"tel2\": \"" + telefono2.Text + ",\r\n    \"pec\": \"" + pec.Text +"\",\r\n    \"piva\": \"" + partitaiva.Text + "\",\r\n    \"cf\": \"" + codicefiscale.Text + "\",\r\n    \"cu\": \"" + certificazioneunica.Text + "\"\r\n  },\r\n  \"cred\": {\r\n    \"comuneNascita\": \"" + comunenascita.Text + "\",\r\n    \"comuneResidenza\": \"" + comuneresidenza.Text + "\",\r\n    \"nomeSocieta\": \"" + nomesocieta.Text + "\",\r\n    \"password\": \"" + password.Text + "\"\r\n  }\r\n}", ParameterType.RequestBody);
            IRestResponse response = client.Execute(request);
            if (response.StatusCode == HttpStatusCode.OK)
                risultato.Text = response.Content;
            else
                risultato.Text = response.ErrorMessage;
        }
    }
}