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
    public partial class InfoTorneo : System.Web.UI.Page
    {
        string token;
        int idTorneo;
        protected void Page_Load(object sender, EventArgs e)
        {
            //controlli visualizza partite da fare
            if (Session["ruolo"] != null)
            {
                token = Session["Token"].ToString();
                if (Session["ruolo"].ToString() == "Societa") btnIscriviti.Visible = false;
                if (Session["ruolo"].ToString() == "Delegato") btnIscriviti.Visible = false;
                if (Session["ruolo"].ToString() == "Allenatore") btnIscriviti.Visible = false;
                if (Session["ruolo"].ToString() == "Admin")
                {
                    if (Session["autorizzato"] != null) if (Session["autorizzato"].ToString() == "0") autorizza.Visible = true;
                    btnIscriviti.Text = "Assegna Delegato";
                }
            }
            if (Session["idUtente"] == null)
            {
                StringBuilder table = new StringBuilder();
                table.Clear();
                AccediBtn.Controls.Add(new Literal { Text = table.ToString() });
                table.Append("<button type=\"button\" class=\"btn btn-light\" onclick=\"LoadLogin(); \">Login</button>");
                AccediBtn.Controls.Add(new Literal { Text = table.ToString() });
                btnIscriviti.Visible = false;
                partite.Visible = false;
            }
            else DownloadInformazioniSquadre();

            idTorneo = Convert.ToInt32(Request.QueryString["id"]);
            if (!this.IsPostBack)
            {
                DownloadInformazioniTorneo();
                if(token != null) DownloadInformazioniSquadre();
            }
        }
        protected void DownloadInformazioniTorneo()
        {
            var client = new RestClient("https://aibvcapi.azurewebsites.net/api/v1/GetTorneoByID/" + idTorneo);
            client.Timeout = -1;
            var request = new RestRequest(Method.GET);
            request.AddHeader("Cookie", "ARRAffinity=e7fc3e897f5be57469671ac828c06570ef8d3ea8fb2416293fd2acc3f67e0ee6; ARRAffinitySameSite=e7fc3e897f5be57469671ac828c06570ef8d3ea8fb2416293fd2acc3f67e0ee6");
            IRestResponse response = client.Execute(request);
            //deserializza il risultato ritornato
            dynamic deserialzied = JsonConvert.DeserializeObject(response.Content);
            if (deserialzied != null)
            {
                StringBuilder table = new StringBuilder();
                StringBuilder table2 = new StringBuilder();//usata per le info torneo riguardanti il luogo
                table.Clear();
                table2.Clear();
                torneiInfo.Controls.Add(new Literal { Text = table.ToString() });
                torneiinfoluogo.Controls.Add(new Literal { Text = table2.ToString() });

                table.Append("<h2>Info Torneo</h2>" +
                    "<p class='head'>Nome<p>" +
                    "<p>" + deserialzied[0].titolo + "</p>" +
                    "<p class='head mt-3'>TipoTorneo</p>" +
                    "<p>" + deserialzied[0].tipoTorneo + "</p>" +
                    "<p class='head mt-3'>Formula</p>" +
                    "<p>" + deserialzied[0].formula + "</p>" +
                    "<p class='head mt-3'>Quota Iscrizione</p>" +
                    "<p>" + deserialzied[0].quotaIscrizione + "</p>" +
                    "<p class='head mt-3'>Punti Vittoria</p>" +
                    "<p>" + deserialzied[0].puntiVittoria + "</p>" +
                    "<p class='head mt-3'>Montepremi</p>" +
                    "<p>" + deserialzied[0].montepremi + "</p>" +
                    "<p class='head mt-3'>Data Inizio</p>" +
                    "<p>" + deserialzied[0].dataInizio + "</p>" +
                    "<p class='head mt-3'>Data Fine</p>" +
                    "<p>" + deserialzied[0].dataFine + "</p>" +
                    "<p class='head mt-3'>Sesso</p>" +
                    "<p>" + deserialzied[0].gender + "</p>");

                table2.Append(" <p class='head'>Nome Impianto</p>" +
                    "<p> " + deserialzied[0].nomeImpianto + " </p> " +
                    "<p class='head'>Indirizzo</p>" +
                    "<p> " + deserialzied[0].citta + " </p> ");

                //Append the HTML string to Placeholder.
                torneiInfo.Controls.Add(new Literal { Text = table.ToString() });
                torneiinfoluogo.Controls.Add(new Literal { Text = table2.ToString() });
            }
        }
        protected void DownloadInformazioniSquadre()
        {
            token = Session["Token"].ToString();
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
                StringBuilder table3 = new StringBuilder();
                table3.Clear();
                squadre.Controls.Add(new Literal { Text = table3.ToString() });
                for (int i = 0; i < deserialzied.Count; i++)
                {
                    table3.Append("<div id=\"" + deserialzied[i].idSquadra + "\" onclick=\"javascript:DivClicked(" + deserialzied[i].idSquadra + "); return true;\"> <p> Squadra: " + deserialzied[i].nomeTeam + "</p></div>");
                }
                //Append the HTML string to Placeholder.
                squadre.Controls.Add(new Literal { Text = table3.ToString() });
            }
        }
        protected void btnIscriviti_Click(object sender, EventArgs e)
        {
            Session["idTorneo"] = idTorneo;
            if (Session["ruolo"].ToString() == "Admin") Response.Redirect("AssegnaDelegati.aspx");
            Response.Redirect("IscrizioneSquadra.aspx"); //rimanda alla form 'output tornei'
        }
        protected void partite_Click(object sender, EventArgs e)
        {
            Response.Redirect("OutputPartiteTorneo.aspx?id=" + idTorneo);
        }
        protected void autorizza_Click(object sender, EventArgs e)
        {
            string token = Session["Token"].ToString();
            var client = new RestClient("https://aibvcapi.azurewebsites.net/api/v1/tornei/AutorizzaTorneo/" + idTorneo);
            client.Timeout = -1;
            var request = new RestRequest(Method.PUT);
            request.AddHeader("Authorization", "Bearer " + token);
            request.AddHeader("Cookie", "ARRAffinity=e7fc3e897f5be57469671ac828c06570ef8d3ea8fb2416293fd2acc3f67e0ee6; ARRAffinitySameSite=e7fc3e897f5be57469671ac828c06570ef8d3ea8fb2416293fd2acc3f67e0ee6");
            IRestResponse response = client.Execute(request);
            Session["autorizzato"] = "";
            Response.Redirect("OutputTornei.aspx");
        }
        protected void clickArea_Click(object sender, EventArgs e)
        {
            Session["IdSquadra"] = HiddenField1.Value;
            Response.Redirect("InfoSquadra.aspx?id=" + idTorneo);
        }
    }
}
