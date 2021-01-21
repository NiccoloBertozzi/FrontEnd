using Newtonsoft.Json;
using RestSharp;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
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
            request.AddHeader("Authorization", "Bearer "+token+"");
            request.AddHeader("Content-Type", "application/json");
            request.AddHeader("Cookie", "ARRAffinity=e7fc3e897f5be57469671ac828c06570ef8d3ea8fb2416293fd2acc3f67e0ee6; ARRAffinitySameSite=e7fc3e897f5be57469671ac828c06570ef8d3ea8fb2416293fd2acc3f67e0ee6");
            request.AddParameter("application/json", "{\r\n    \"IdSupervisore\":"+ Session["IDSupervisore"] + ",\r\n    \"IdSupArbitrale\":"+ Session["IDArbitro"] + ",\r\n    \"IdDirettore\":"+ Session["IDDirettore"] + ",\r\n    \"IdTorneo\":"+ Session["IdTorneo"] + "\r\n}", ParameterType.RequestBody);
            IRestResponse response = client.Execute(request);
            if (response.StatusCode == HttpStatusCode.OK){
                Response.Redirect("InfoTorneo.aspx?token=" + token); //rimanda alla form 'output tornei'
            }
        }

        protected void Supervisore_TextChanged(object sender, EventArgs e)
        {
            //sostituire con 11 perche il CF è minimo di 11
            if (Supervisore.Text.Length > 3)
            {
                var client = new RestClient("https://aibvcapi.azurewebsites.net/api/v1/GetIDSupervisore/"+Supervisore.Text+"");
                client.Timeout = -1;
                var request = new RestRequest(Method.GET);
                request.AddHeader("Authorization", "Bearer "+token+"");
                request.AddHeader("Cookie", "ARRAffinity=e7fc3e897f5be57469671ac828c06570ef8d3ea8fb2416293fd2acc3f67e0ee6; ARRAffinitySameSite=e7fc3e897f5be57469671ac828c06570ef8d3ea8fb2416293fd2acc3f67e0ee6; ruolo=Atleta");
                IRestResponse response = client.Execute(request);
                if (response.Content!="[]")
                {
                    dynamic deserialzied = JsonConvert.DeserializeObject(response.Content);
                    Session["IDSupervisore"] = deserialzied[0].idDelegato;
                    Nomesupervisore.Text= deserialzied[0].delegato +","+Session["IDSupervisore"];
                }
            }
        }
        protected void Arbitro_TextChanged(object sender, EventArgs e)
        {
            //sostituire con 11 perche il CF è minimo di 11
            if (Arbitro.Text.Length > 3)
            {
                var client = new RestClient("https://aibvcapi.azurewebsites.net/api/v1/GetIDArbitro/" + Arbitro.Text + "");
                client.Timeout = -1;
                var request = new RestRequest(Method.GET);
                request.AddHeader("Authorization", "Bearer " + token + "");
                request.AddHeader("Cookie", "ARRAffinity=e7fc3e897f5be57469671ac828c06570ef8d3ea8fb2416293fd2acc3f67e0ee6; ARRAffinitySameSite=e7fc3e897f5be57469671ac828c06570ef8d3ea8fb2416293fd2acc3f67e0ee6; ruolo=Atleta");
                IRestResponse response = client.Execute(request);
                if (response.Content != "[]")
                {
                    dynamic deserialzied = JsonConvert.DeserializeObject(response.Content);
                    Session["IDArbitro"] = deserialzied[0].idDelegato;
                    Nomearbitro.Text = deserialzied[0].delegato + "," + Session["IDArbitro"];
                }
            }
        }
        protected void Direttore_TextChanged(object sender, EventArgs e)
        {
            //sostituire con 11 perche il CF è minimo di 11
            if (Direttore.Text.Length > 3)
            {
                var client = new RestClient("https://aibvcapi.azurewebsites.net/api/v1/GetIDDirettore/" + Direttore.Text + "");
                client.Timeout = -1;
                var request = new RestRequest(Method.GET);
                request.AddHeader("Authorization", "Bearer " + token + "");
                request.AddHeader("Cookie", "ARRAffinity=e7fc3e897f5be57469671ac828c06570ef8d3ea8fb2416293fd2acc3f67e0ee6; ARRAffinitySameSite=e7fc3e897f5be57469671ac828c06570ef8d3ea8fb2416293fd2acc3f67e0ee6; ruolo=Atleta");
                IRestResponse response = client.Execute(request);
                if (response.Content != "[]")
                {
                    dynamic deserialzied = JsonConvert.DeserializeObject(response.Content);
                    Session["IDDirettore"] = deserialzied[0].idDelegato;
                    Nomedirettore.Text = deserialzied[0].delegato + "," + Session["IDDirettore"];
                }
            }
        }
    }
}


















