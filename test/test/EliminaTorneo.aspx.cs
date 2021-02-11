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
    public partial class EliminaTorneo : System.Web.UI.Page
    {
        string token;
        int idTorneo;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(Session["Token"] as string))
            {
                token = Session["Token"].ToString();
            idTorneo = int.Parse(Session["IdTorneo"].ToString());
            if (!this.IsPostBack)
            {
                //idricevuto.Text = Session["IdUtente"].ToString();
                DownloadInformazioniTorneo(idTorneo);
            }
            }
            else Response.Redirect("OutputTornei.aspx");
        }
        protected void DownloadInformazioniTorneo(int idTorneo)
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

        protected void btnelimina_Click(object sender, EventArgs e)
        {
            //PRENDO ID SQUADRA 
            var client = new RestClient("https://aibvcapi.azurewebsites.net/api/v1/atleti/GetIdSquadra/"+Session["idUtente"]+"/Torneo/"+ idTorneo + "");
            client.Timeout = -1;
            var request = new RestRequest(Method.GET);
            request.AddHeader("Authorization", "Bearer "+token+"");
            request.AddHeader("Cookie", "ARRAffinity=e7fc3e897f5be57469671ac828c06570ef8d3ea8fb2416293fd2acc3f67e0ee6; ARRAffinitySameSite=e7fc3e897f5be57469671ac828c06570ef8d3ea8fb2416293fd2acc3f67e0ee6; ruolo=Atleta");
            IRestResponse response = client.Execute(request);
            if (response.StatusCode == HttpStatusCode.OK)
            {
                int idsquadra = Convert.ToInt32(response.Content);
                //ELIMINO TEAM
                client = new RestClient("https://aibvcapi.azurewebsites.net/api/v1/tornei/EliminaSquadraByAtleta");
                client.Timeout = -1;
                request = new RestRequest(Method.DELETE);
                request.AddHeader("Authorization", "Bearer " + token + "");
                request.AddHeader("Content-Type", "application/json");
                string prova = "{\r\n    \"idTorneo\":" + idTorneo + ",\r\n    \"idSquadra\":" + idsquadra + "\r\n}";
                request.AddHeader("Cookie", "ARRAffinity=e7fc3e897f5be57469671ac828c06570ef8d3ea8fb2416293fd2acc3f67e0ee6; ARRAffinitySameSite=e7fc3e897f5be57469671ac828c06570ef8d3ea8fb2416293fd2acc3f67e0ee6; ruolo=Atleta");
                request.AddParameter("application/json",prova, ParameterType.RequestBody);
                IRestResponse response1 = client.Execute(request);
            }
            else Response.Write("<script>alert('Impossibile annullare l'iscrizione: il torneo è già iniziato');</script>");

            Response.Redirect("OutputTorneiIscritti.aspx"); //rimanda alla form 'output tornei iscritti'
        }
    }
}