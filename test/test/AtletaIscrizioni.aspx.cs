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
    public partial class AtletaIscrizioni1 : System.Web.UI.Page
    {
        string token;
        protected void Page_Load(object sender, EventArgs e)
        {
            token = Session["Token"].ToString();
            if (!this.IsPostBack)
            {
                DownloadIscrizioniAtleta();
            }
        }
        protected void DownloadIscrizioniAtleta()
        {
            var client = new RestClient("https://aibvcapi.azurewebsites.net/api/v1/atleti/Iscrizioni/2");
            client.Timeout = -1;
            var request = new RestRequest(Method.GET);
            request.AddHeader("Authorization", "Bearer " + token);
            request.AddHeader("Cookie", "ARRAffinity=e7fc3e897f5be57469671ac828c06570ef8d3ea8fb2416293fd2acc3f67e0ee6; ARRAffinitySameSite=e7fc3e897f5be57469671ac828c06570ef8d3ea8fb2416293fd2acc3f67e0ee6; ruolo=Admin");
            IRestResponse response = client.Execute(request);
            //deserializza il risultato ritornato
            dynamic deserialzied = JsonConvert.DeserializeObject(response.Content);
            if (deserialzied != null)
            {
                StringBuilder table = new StringBuilder();
                table.Clear();
                torneilist.Controls.Add(new Literal { Text = table.ToString() });
                for (int i = 0; i < deserialzied.Count; i++)
                {
                    table.Append(
                        "<p>" + deserialzied[i].titolo + "</p>" +
                        "<p>" + deserialzied[i].tipoTorneo + "</p>" +
                        "<p>" + deserialzied[i].puntiVittoria + "</p>" +
                        "<p>" + deserialzied[i].montepremi + "</p>" +
                        "<p>" + deserialzied[i].dataInizio + "</p>" +
                        "<p>" + deserialzied[i].dataFine + "</p>" +
                        "<p>" + deserialzied[i].gender + "</p>" +
                        "<p>" + deserialzied[i].numTeamTabellone + "</p>" +
                        "<p>" + deserialzied[i].numTeamQualifiche + "</p>" +
                        "<p>" + deserialzied[i].nomeTeam + "</p>" +
                        "<p>" + deserialzied[i].atleta1 + "</p>" +
                        "<p>" + deserialzied[i].atleta2 + "</p>" );
                }
                //Append the HTML string to Placeholder.
                torneilist.Controls.Add(new Literal { Text = table.ToString() });
            }
        }
    }
}