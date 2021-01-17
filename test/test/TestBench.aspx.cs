using RestSharp;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace test
{
    public partial class TestBench : System.Web.UI.Page
    {
        string token;
        protected void Page_Load(object sender, EventArgs e)
        {
            token = Request.QueryString["token"];
        }

        protected void btnassegnasupervisore_Click(object sender, EventArgs e)
        {
            var client = new RestClient("https://aibvcapi.azurewebsites.net/api/v1/tornei/AssegnaDelegati");
            client.Timeout = -1;
            var request = new RestRequest(Method.PUT);
            request.AddHeader("Authorization", "Bearer " + token);
            request.AddHeader("Content-Type", "application/json");
            request.AddHeader("Cookie", "ARRAffinity=e7fc3e897f5be57469671ac828c06570ef8d3ea8fb2416293fd2acc3f67e0ee6; ARRAffinitySameSite=e7fc3e897f5be57469671ac828c06570ef8d3ea8fb2416293fd2acc3f67e0ee6");
            request.AddParameter("application/json", "{\r\n    \"NomeSupervisore\":\"" + nomeSupervisore.Text + "\",\r\n    \"CognomeSupervisore\":\"" + cognomeSupervisore.Text + "\",\r\n    \"NomeSupArbitrale\":\"" + nomeSupArbitrale.Text + "\",\r\n    \"CognomeSupArbitrale\":\"" + cognomeSupArbitrale.Text + "\",\r\n    \"NomeDirettore\":\"" + nomeDirettore.Text + "\",\r\n    \"CognomeDirettore\":\"" + cognomeDirettore.Text + "\",\r\n    \"TitoloTorneo\":\"" + titoloTorneo.Text + "\"\r\n    }", ParameterType.RequestBody);
            IRestResponse response = client.Execute(request);
            risultato.Text = response.Content;
        }
    }
}


















