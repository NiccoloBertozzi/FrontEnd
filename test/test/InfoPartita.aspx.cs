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
    public partial class InfoPartita : System.Web.UI.Page
    {
        string token;
        int idTorneo, numPartita;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["idUtente"] == null) Response.Redirect("OutputTornei.aspx");
            if (Session["ruolo"].ToString() == "Delegato" || Session["ruolo"].ToString() == "Admin") partite.Visible = true;
            token = Session["Token"].ToString();
            idTorneo = Convert.ToInt32(Request.QueryString["id"]);
            numPartita = Convert.ToInt32(Request.QueryString["partita"]);
            if (!this.IsPostBack) DownloadInformazioniPartita(idTorneo);
        }
        protected void DownloadInformazioniPartita(int idTorneo)
        {
            var client = new RestClient("https://aibvcapi.azurewebsites.net/api/v1/tornei/GetPartiteTorneo/" + idTorneo);
            client.Timeout = -1;
            var request = new RestRequest(Method.GET);
            request.AddHeader("Authorization", "Bearer " + token);
            request.AddHeader("Cookie", "ARRAffinity=e7fc3e897f5be57469671ac828c06570ef8d3ea8fb2416293fd2acc3f67e0ee6; ARRAffinitySameSite=e7fc3e897f5be57469671ac828c06570ef8d3ea8fb2416293fd2acc3f67e0ee6; ruolo=Societa");
            IRestResponse response = client.Execute(request);
            dynamic deserialzied = JsonConvert.DeserializeObject(response.Content);
            if (deserialzied != null)
            {
                StringBuilder table = new StringBuilder();
                StringBuilder table2 = new StringBuilder();
                table.Clear();
                table2.Clear();
                torneiInfo.Controls.Add(new Literal { Text = table.ToString() });
                torneiinfoset.Controls.Add(new Literal { Text = table2.ToString() });
                for (int i = 0; i < deserialzied.Count; i++)
                {
                    if (deserialzied[i].numPartita == Request.QueryString["partita"])
                    {
                        table.Append("<h2>Info Torneo</h2>" +
                                            "<h3>Nome squadra 1</h3>" +
                                            "<p>" + deserialzied[i].nomeTeam + "</p>" +
                                            "<h3>Nome squadra 2</h3>" +
                                            "<p>" + deserialzied[i].nomeTeam1 + "</p>" +
                                            "<h3>Arbitro</h3>" +
                                            "<p>" + deserialzied[i].arbitro1 + ", " + deserialzied[i].arbitro2 + "</p>" +
                                            "<h3>Fase</h3>" +
                                            "<p>" + deserialzied[i].fase + "</p>" +
                                            "<h3>Campo</h3>" +
                                            "<p>" + deserialzied[i].campo + "</p>" +
                                            "<h3>Data partita</h3>" +
                                            "<p>" + deserialzied[i].dataPartita + "</p>" +
                                            "<h3>Ora partita</h3>" +
                                            "<p>" + deserialzied[i].oraPartita + "</p>" +
                                            "<h3>Risultato</h3>" +
                                            "<p>" + deserialzied[i].risultato + "</p>" +
                                            "<h3>Durata</h3>" +
                                            "<p>" + deserialzied[i].durata + "</p>");

                        table2.Append(" <h3>T1S1</h3>" +
                                            "<p> " + deserialzied[i].pT1S1 + " </p> " +
                                            "<h3>T1S2</h3>" +
                                            "<p> " + deserialzied[i].pT2S1 + " </p> " +
                                            "<h3>T2S1</h3>" +
                                            "<p> " + deserialzied[i].pT1S2 + " </p> " +
                                            "<h3>T2S2</h3>" +
                                            "<p> " + deserialzied[i].pT2S2 + " </p> " +
                                            "<h3>T3S1</h3>" +
                                            "<p> " + deserialzied[i].pT1S3 + " </p> " +
                                            "<h3>T3S2</h3>" +
                                            "<p> " + deserialzied[i].pT2S3 + " </p> " +
                                            "<h3>setS1</h3>" +
                                            "<p> " + deserialzied[i].setSQ1 + " </p> " +
                                            "<h3>setS2</h3>" +
                                            "<p> " + deserialzied[i].setSQ2 + " </p> ");
                    }
                }
                torneiInfo.Controls.Add(new Literal { Text = table.ToString() });
                torneiinfoset.Controls.Add(new Literal { Text = table2.ToString() });
            }
        }
        protected void partite_Click(object sender, EventArgs e)
        {
            Response.Redirect("GestisciPartita.aspx?id=" + idTorneo + "&partita=" + numPartita);
        }
    }
}