using Newtonsoft.Json;
using RestSharp;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace test
{
    public partial class EliminaSquadra : System.Web.UI.Page
    {
        string token;
        int idSquadra, idTorneo, idSupervisore;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(Session["Token"] as string))
            {
                token = Session["Token"].ToString();
                idSquadra = int.Parse(Session["IdSquadra"].ToString());
                idTorneo = Convert.ToInt32(Request.QueryString["id"]);
                idSupervisore = int.Parse(Session["IdUtente"].ToString());
                if (!this.IsPostBack)
                {
                    DownloadInformazioniSquadra();
                }
            }
            else Response.Redirect("OutputTornei.aspx");
        }

        protected void DownloadInformazioniSquadra()
        {
            var client = new RestClient("http://aibvcapi.azurewebsites.net/api/v1/tornei/Squadra/" + idSquadra);
            client.Timeout = -1;
            var request = new RestRequest(Method.GET);
            request.AddHeader("Authorization", "Bearer " + token);
            request.AddHeader("Cookie", "ARRAffinity=e7fc3e897f5be57469671ac828c06570ef8d3ea8fb2416293fd2acc3f67e0ee6; ruolo=Admin");
            IRestResponse response = client.Execute(request);
            //deserializza il risultato ritornato
            dynamic deserialzied = JsonConvert.DeserializeObject(response.Content);
            if (deserialzied != null)
            {
                StringBuilder table = new StringBuilder();
                table.Clear();
                squadraInfo.Controls.Add(new Literal { Text = table.ToString() });
                for (int i = 0; i < deserialzied.Count; i++)
                {
                    table.Append("<p> idSquadra: " + deserialzied[i].idSquadra + ", nomeTeam: " + deserialzied[i].nomeTeam + ", atleta1: " + deserialzied[i].atleta1 + ", atleta2: " + deserialzied[i].atleta2 + "</p>");
                }
                //Append the HTML string to Placeholder.
                squadraInfo.Controls.Add(new Literal { Text = table.ToString() });
            }
        }

        protected void AssegnaWC_Click(object sender, EventArgs e)
        {
            var client = new RestClient("https://aibvcapi.azurewebsites.net/api/v1/tornei/AssegnaWildCard/" + idTorneo + "/" + idSupervisore + "/" + idSquadra);
            client.Timeout = -1;
            var request = new RestRequest(Method.PUT);
            request.AddHeader("Authorization", "Bearer " + token);
            request.AddHeader("Cookie", "ARRAffinity=e7fc3e897f5be57469671ac828c06570ef8d3ea8fb2416293fd2acc3f67e0ee6; ARRAffinitySameSite=e7fc3e897f5be57469671ac828c06570ef8d3ea8fb2416293fd2acc3f67e0ee6; ruolo=Admin");
            IRestResponse response = client.Execute(request);
            if (response.StatusCode == HttpStatusCode.OK) Response.Redirect("AutorizzaTorneo.aspx");
            else Response.Write("<script>alert('" + response.Content.ToString() + "');</script>");
        }

        protected void EliminaSquadra_Click(object sender, EventArgs e)
        {
            //elimina squadra da lista iscritti (solo supervisore)
            var client = new RestClient("https://aibvcapi.azurewebsites.net/api/v1/tornei/EliminaSquadraBySupervisore");
            client.Timeout = -1;
            var request = new RestRequest(Method.DELETE);
            request.AddHeader("Authorization", "Bearer " + token);
            request.AddHeader("Content-Type", "application/json");
            request.AddHeader("Cookie", "ruolo=Admin; ARRAffinity=e7fc3e897f5be57469671ac828c06570ef8d3ea8fb2416293fd2acc3f67e0ee6; ARRAffinitySameSite=e7fc3e897f5be57469671ac828c06570ef8d3ea8fb2416293fd2acc3f67e0ee6");
            request.AddParameter("application/json", "{\r\n    \"idTorneo\": " + idTorneo + ",\r\n    \"idSquadra\":" + idSquadra + ",\r\n    \"IdSupervisore\":" + idSupervisore + "\r\n}", ParameterType.RequestBody);
            IRestResponse response = client.Execute(request);
            if (response.StatusCode == HttpStatusCode.OK) Response.Redirect("AutorizzaTorneo.aspx");
            else Response.Write("<script>alert('" + response.Content.ToString() + "');</script>");
        }
    }
}