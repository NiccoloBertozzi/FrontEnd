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
            string sex  =  "";

            if (sesso1.Checked == true) sex = sesso1.Text;
            else if (sesso2.Checked == true) sex = sesso2.Text;

            //----------------------RegisterAtleta------------------------//
            var client = new RestClient("https://aibvcwa.azurewebsites.net/api/v1/registrati/RegistraAtleta");
            client.Timeout = -1;
            var request = new RestRequest(Method.POST);
            request.AddHeader("Content-Type", "application/json");
            request.AddParameter("application/json", "{\r\n  \"atleta\": {\r\n    \"codiceTessera\": \"" + codTessera.Text + "\",\r\n    \"nome\": \"" + nome.Text + "\",\r\n    \"cognome\": \"" + cognome.Text + "\",\r\n    \"sesso\": \"" + sex + "\",\r\n    \"cf\": \"" + cf.Text + "\",\r\n    \"dataNascita\": \"" + dataNascita.Text + "\",\r\n    \"indirizzo\": \"" + indirizzo.Text + "\",\r\n    \"cap\": \"" + cap.Text + "\",\r\n    \"email\": \"" + email.Text + "\",\r\n    \"tel\": \"" + tel.Text + "\",\r\n    \"altezza\": " + altezza.Text + "\r\n    \"peso\": " + peso.Text + "\r\n    \"dataScadenzaCertificato\": \"" + dataScadCert + "\"\r\n  },\r\n  \"cred\": {\r\n    \"comuneNascita\": \"" + comuneNascita.Text + "\",\r\n    \"comuneResidenza\": \"" + comuneResidenza.Text + "\",\r\n    \"nomeSocieta\": \"" + nomeSocieta.Text + "\",\r\n    \"password\": \"" + password.Text + "\"\r\n  }\r\n}", ParameterType.RequestBody);
            IRestResponse response = client.Execute(request);
            if (response.StatusCode == HttpStatusCode.OK)
                risultato.Text = response.Content;
            else
                risultato.Text = response.ErrorMessage;
            //------------------------------------------------------------//
        }
    }
}