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
    public partial class AutorizzaTorneo : System.Web.UI.Page
    {
        string token;
        int idTorneo;
        protected void Page_Load(object sender, EventArgs e)
        {
            token = Session["Token"].ToString();
            idTorneo = int.Parse(Session["IdTorneo"].ToString());
            if (!this.IsPostBack)
            {
                DownloadInformazioniTorneo();
                DownloadInformazioniSquadre();
            }
        }
        protected void DownloadInformazioniTorneo()
        {
            var client = new RestClient("https://aibvcapi.azurewebsites.net/api/v1/GetTorneoByID/" + idTorneo);
            client.Timeout = -1;
            var request = new RestRequest(Method.GET);
            request.AddHeader("Authorization", "Bearer " + token);
            request.AddHeader("Cookie", "ARRAffinity=e7fc3e897f5be57469671ac828c06570ef8d3ea8fb2416293fd2acc3f67e0ee6; ARRAffinitySameSite=e7fc3e897f5be57469671ac828c06570ef8d3ea8fb2416293fd2acc3f67e0ee6");
            IRestResponse response = client.Execute(request);
            //deserializza il risultato ritornato
            dynamic deserialzied = JsonConvert.DeserializeObject(response.Content);
            if (deserialzied != null)
            {
                StringBuilder table = new StringBuilder();
                table.Clear();
                torneiInfo.Controls.Add(new Literal { Text = table.ToString() });

                table.Append("<div class=\"row\">" +
                   "<div class=\"col-3\"><h5 class=\"card-title\">Titolo</h5></div>" +
                   "<div class=\"col-9\"><label for=\"titoloTorneo\">" + deserialzied[0].titolo + "</label></div>" +
                   "<div class=\"col-3\"><h5 class=\"card-title\">Tipo Torneo</h5></div>" +
                   "<div class=\"col-9\"><label for=\"titoloTorneo\">" + deserialzied[0].tipoTorneo + "</label></div>" +
                   "<div class=\"col-3\"><h5 class=\"card-title\">Supervisore Torneo</h5></div>" +
                   "<div class=\"col-9\"><label for=\"titoloTorneo\">" + deserialzied[0].supervisoreTorneo + "</label></div>" +
                   "<div class=\"col-3\"><h5 class=\"card-title\">Supervisore Arbitrale</h5></div>" +
                   "<div class=\"col-9\"><label for=\"titoloTorneo\">" + deserialzied[0].supervisoreArbitrale + "</label></div>" +
                   "<div class=\"col-3\"><h5 class=\"card-title\">Direttore Competizione</h5></div>" +
                   "<div class=\"col-9\"><label for=\"titoloTorneo\">" + deserialzied[0].direttoreCompetizione + "</label></div>" +
                   "<div class=\"col-3\"><h5 class=\"card-title\">Formula Torneo</h5></div>" +
                   "<div class=\"col-9\"><label for=\"titoloTorneo\">" + deserialzied[0].formula + "</label></div>" +
                   "<div class=\"col-3\"><h5 class=\"card-title\">Nome Impianto</h5></div>" +
                   "<div class=\"col-9\"><label for=\"titoloTorneo\">" + deserialzied[0].nomeImpianto + "</label></div>" +
                   "<div class=\"col-3\"><h5 class=\"card-title\">Citta</h5></div>" +
                   "<div class=\"col-9\"><label for=\"titoloTorneo\">" + deserialzied[0].citta + "</label></div>" +
                   "<div class=\"col-3\"><h5 class=\"card-title\">QuotaIscrizione</h5></div>" +
                   "<div class=\"col-9\"><label for=\"titoloTorneo\">" + deserialzied[0].quotaIscrizione + "</label></div>" +
                   "<div class=\"col-3\"><h5 class=\"card-title\">Punti Vittoria</h5></div>" +
                   "<div class=\"col-9\"><label for=\"titoloTorneo\">" + deserialzied[0].puntiVittoria + "</label></div>" +
                   "<div class=\"col-3\"><h5 class=\"card-title\">Montepremi</h5></div>" +
                   "<div class=\"col-9\"><label for=\"titoloTorneo\">" + deserialzied[0].montepremi + "</label></div>" +
                   "<div class=\"col-3\"><h5 class=\"card-title\">Data Inizio</h5></div>" +
                   "<div class=\"col-9\"><label for=\"titoloTorneo\">" + deserialzied[0].dataInizio + "</label></div>" +
                   "<div class=\"col-3\"><h5 class=\"card-title\">Data Fine</h5></div>" +
                   "<div class=\"col-9\"><label for=\"titoloTorneo\">" + deserialzied[0].dataFine + "</label></div>" +
                   "<div class=\"col-3\"><h5 class=\"card-title\">Genere</h5></div>" +
                   "<div class=\"col-9\"><label for=\"titoloTorneo\">" + deserialzied[0].gender + "</label></div>" +
                   "<div class=\"col-3\"><h5 class=\"card-title\">Numero Team Totali Tabellone</h5></div>" +
                   "<div class=\"col-9\"><label for=\"titoloTorneo\">" + deserialzied[0].numTeamTabellone + "</label></div>" +
                   "<div class=\"col-3\"><h5 class=\"card-title\">Numero Team che partecipano alle qualifiche</h5></div>" +
                   "<div class=\"col-9\"><label for=\"titoloTorneo\">" + deserialzied[0].numTeamQualifiche + "</label></div>" +
                   "</div>");

                //Append the HTML string to Placeholder.
                torneiInfo.Controls.Add(new Literal { Text = table.ToString() });
            }
        }
        protected void DownloadInformazioniSquadre()
        {
            var client = new RestClient("https://aibvcapi.azurewebsites.net/api/v1/tornei/SquadreTorneo/" + idTorneo);
            client.Timeout = -1;
            var request = new RestRequest(Method.GET);
            request.AddHeader("Authorization", "Bearer " + token);
            request.AddHeader("Cookie", "ARRAffinity=e7fc3e897f5be57469671ac828c06570ef8d3ea8fb2416293fd2acc3f67e0ee6; ARRAffinitySameSite=e7fc3e897f5be57469671ac828c06570ef8d3ea8fb2416293fd2acc3f67e0ee6; ruolo=Societa");
            IRestResponse response = client.Execute(request);
            //deserializza il risultato ritornato
            dynamic deserialzied = JsonConvert.DeserializeObject(response.Content);
            if (deserialzied != null)
            {
                StringBuilder table = new StringBuilder();
                table.Clear();
                squadre.Controls.Add(new Literal { Text = table.ToString() });
                for (int i = 0; i < deserialzied.Count; i++)
                {
                    table.Append("<div id=\"" + deserialzied[i].idSquadra + "\" onclick=\"javascript:DivClicked(" + deserialzied[i].idSquadra + "); return true;\"> <p> Squadra: " + deserialzied[i].nomeTeam + "</p></div>");
                }
                //Append the HTML string to Placeholder.
                squadre.Controls.Add(new Literal { Text = table.ToString() });
            }
        }
        protected void clickArea_Click(object sender, EventArgs e)
        {
            Session["IdSquadra"] = HiddenField1.Value;
            Response.Redirect("InfoSquadra.aspx"); 
        }
        protected void AutorizzaTorneo_Click(object sender, EventArgs e)
        {
            var client = new RestClient("https://aibvcapi.azurewebsites.net/api/v1/tornei/AutorizzaTorneo/" + idTorneo);
            client.Timeout = -1;
            var request = new RestRequest(Method.PUT);
            request.AddHeader("Authorization", "Bearer " + token);
            request.AddHeader("Cookie", "ARRAffinity=e7fc3e897f5be57469671ac828c06570ef8d3ea8fb2416293fd2acc3f67e0ee6; ARRAffinitySameSite=e7fc3e897f5be57469671ac828c06570ef8d3ea8fb2416293fd2acc3f67e0ee6");
            IRestResponse response = client.Execute(request);
            Response.Redirect("OutputTornei.aspx");
        }
    }
}



