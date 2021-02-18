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
    public partial class GestisciPartita : System.Web.UI.Page
    {
        string token;
        int idTorneo, numPartita;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["idUtente"] == null) Response.Redirect("OutputTornei.aspx");
            if (Session["ruolo"].ToString() == "Delegato" || Session["ruolo"].ToString() == "Admin") ModificaPartita.Visible = true;
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
                for (int i = 0; i < deserialzied.Count; i++)
                {
                    if (deserialzied[i].numPartita == Request.QueryString["partita"])
                    {
                        NomeTeam1.Text = deserialzied[i].nomeTeam;
                        NomeTeam2.Text = deserialzied[i].nomeTeam1;
                        Arbitri.Text = deserialzied[i].arbitro1 + ", " + deserialzied[i].arbitro2;
                        Fase.Text = deserialzied[i].fase;
                        Campo.Text = deserialzied[i].campo;
                        Data.SelectedDate = deserialzied[i].dataPartita;
                        Ora.Text = deserialzied[i].oraPartita;
                        Risultato.Text = deserialzied[i].risultato;
                        Durata.Text = deserialzied[i].durata;
                        T1S1.Text = deserialzied[i].pT1S1;
                        T2S1.Text = deserialzied[i].pT2S1;
                        T1S2.Text = deserialzied[i].pT1S2;
                        T2S2.Text = deserialzied[i].pT2S2;
                        T1S3.Text = deserialzied[i].pT1S3;
                        T2S3.Text = deserialzied[i].pT2S3;
                        SetQ1.Text = deserialzied[i].setSQ1;
                        SetQ2.Text = deserialzied[i].setSQ2;
                    }
                }
            }
        }
        protected void ModificaPartita_Click(object sender, EventArgs e)
        {

        }
    }
}