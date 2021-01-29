using Newtonsoft.Json;
using RestSharp;
using System;
using System.Collections.Generic;
using System.Linq;
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
            token = Session["Token"].ToString();
            if (!this.IsPostBack)
            {
                //prende id torneo squadra e supervisore
                idSquadra = int.Parse(Session["IdSquadra"].ToString());
                idTorneo = int.Parse(Session["IdTorneo"].ToString());
                idSupervisore = int.Parse(Session["IdSupervisore"].ToString());
                DownloadInformazioniSquadra();
            }
        }

        protected void DownloadInformazioniSquadra()
        {
            var client = new RestClient("http://aibvcapi.azurewebsites.net/api/v1/tornei/Squadra/" + idTorneo);
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

        protected void EliminaSquadra_Click(object sender, EventArgs e)
        {
            var client = new RestClient("https://localhost:44339/api/v1/tornei/EliminaSquadraBySupervisore");
            client.Timeout = -1;
            var request = new RestRequest(Method.DELETE);
            request.AddHeader("Authorization", "Bearer " + token);
            request.AddHeader("Content-Type", "application/json");
            request.AddParameter("application/json", "{\r\n    \"idTorneo\": " + idTorneo + ",\r\n    \"idSquadra\":" + idSquadra + ",\r\n    \"IdSupervisore\":" + idSupervisore + "\r\n}", ParameterType.RequestBody);
            IRestResponse response = client.Execute(request);
            Response.Redirect("AutorizzaTorneo.aspx");
        }
    }
}