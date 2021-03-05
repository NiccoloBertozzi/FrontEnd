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
                for (int i = 0; i < deserialzied.Count; i++)
                {
                    if (deserialzied[i].numPartita == numPartita)
                    {
                        nomeT.InnerText = deserialzied[i].titolo;
                        team1.InnerText = deserialzied[i].nomeTeam;
                        team2.InnerText = deserialzied[i].nomeTeam1;
                        tipoT.InnerText = deserialzied[i].fase;
                        dataT.InnerText = deserialzied[i].dataPartita.ToString().Split(' ')[0];
                        oraT.InnerText = deserialzied[i].oraPartita.ToString().Split(':')[0] + ":" + deserialzied[i].oraPartita.ToString().Split(':')[1];
                        punteggioT.InnerText = deserialzied[i].risultato;
                        setT1.InnerText = deserialzied[i].pT1S1 + "⠀-⠀" + deserialzied[i].pT2S1;
                        setT2.InnerText = deserialzied[i].pT1S2 + "⠀-⠀" + deserialzied[i].pT2S2;
                        setT3.InnerText = deserialzied[i].pT1S3 + "⠀-⠀" + deserialzied[i].pT2S3;
                    }
                }
            }
        }
        protected void partite_Click(object sender, EventArgs e)
        {
            Response.Redirect("GestisciPartita.aspx?id=" + idTorneo + "&partita=" + numPartita);
        }
    }
}