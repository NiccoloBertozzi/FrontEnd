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
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["ruolo"] != null)
            {
                if (Session["ruolo"].ToString() == "Societa") btnIscriviti.Visible = false;
                if (Session["ruolo"].ToString() == "Delegato") btnIscriviti.Visible = false;
                if (Session["ruolo"].ToString() == "Allenatore") btnIscriviti.Visible = false;
                if (Session["ruolo"].ToString() == "Admin") btnIscriviti.Text = "Assegna Delegato";
            }
            if (Session["idUtente"] == null)
            {
                StringBuilder table = new StringBuilder();
                table.Clear();
                AccediBtn.Controls.Add(new Literal { Text = table.ToString() });
                table.Append("<button type=\"button\" class=\"btn btn-light\" onclick=\"LoadLogin(); \">Login</button>");
                AccediBtn.Controls.Add(new Literal { Text = table.ToString() });
                btnIscriviti.Visible = false;
            }
            if (!this.IsPostBack)
            {
                //idricevuto.Text = Session["IdUtente"].ToString();
                int idTorneo = Convert.ToInt32(Request.QueryString["id"]);
                DownloadInformazioniTorneo(idTorneo);
            }
        }
        protected void DownloadInformazioniTorneo(int idTorneo)
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
                    "<h3>Nome</h3>" +
                    "<p>" + deserialzied[0].titolo + "</p>" +
                    "<h3>TipoTorneo</h3>" +
                    "<p>" + deserialzied[0].tipoTorneo + "</p>" +
                    "<h3>Formula</h3>" +
                    "<p>" + deserialzied[0].formula + "</p>" +
                    "<h3>Quota Iscrizione</h3>" +
                    "<p>" + deserialzied[0].quotaIscrizione + "</p>" +
                    "<h3>Punti Vittoria</h3>" +
                    "<p>" + deserialzied[0].puntiVittoria + "</p>" +
                    "<h3>Montepremi</h3>" +
                    "<p>" + deserialzied[0].montepremi + "</p>" +
                    "<h3>Data Inizio</h3>" +
                    "<p>" + deserialzied[0].dataInizio + "</p>" +
                    "<h3>Data Fine</h3>" +
                    "<p>" + deserialzied[0].dataFine + "</p>" +
                    "<h3>Sesso</h3>" +
                    "<p>" + deserialzied[0].gender + "</p>");

                table2.Append(" <h3>Nome Impianto</h3>" +
                    "<p> " + deserialzied[0].nomeImpianto + " </p> " +
                    " <h3>Indirizzo</h3>" +
                    "<p> " + deserialzied[0].citta + " </p> ");

                //Append the HTML string to Placeholder.
                torneiInfo.Controls.Add(new Literal { Text = table.ToString() });
                torneiinfoluogo.Controls.Add(new Literal { Text = table2.ToString() });
            }
        }

        protected void btnIscriviti_Click(object sender, EventArgs e)
        {
            if (Session["ruolo"].ToString() == "Admin") Response.Redirect("AssegnaDelegati.aspx");
            Response.Redirect("IscrizioneSquadra.aspx"); //rimanda alla form 'output tornei'
        }
    }
}

