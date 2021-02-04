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
    public partial class AnagraficaSocieta : System.Web.UI.Page
    {
        string token;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["ruolo"].ToString() == "Atleta") Response.Redirect("AnagraficaAtleta.aspx");
            if (Session["ruolo"].ToString() == "Admin" || Session["ruolo"].ToString() == "Delegato") Response.Redirect("AnagraficaDelegato.aspx");
            token = Session["Token"].ToString();
            int idSocieta = Convert.ToInt32(Session["idUtente"]);
            DownloadSocieta(idSocieta);
        }

        protected void DownloadSocieta(int idSocieta)
        {
            var client = new RestClient("https://aibvcapi.azurewebsites.net/api/v1/societa/GetAnagraficaSocieta/" + idSocieta);
            client.Timeout = -1;
            var request = new RestRequest(Method.GET);
            request.AddHeader("Authorization", "Bearer  "+token+"");
            request.AddHeader("Cookie", "ARRAffinity=e7fc3e897f5be57469671ac828c06570ef8d3ea8fb2416293fd2acc3f67e0ee6; ARRAffinitySameSite=e7fc3e897f5be57469671ac828c06570ef8d3ea8fb2416293fd2acc3f67e0ee6; ruolo=Societa");
            IRestResponse response = client.Execute(request);
            //deserializza il risultato ritornato
            dynamic deserialzied = JsonConvert.DeserializeObject(response.Content);
            if (deserialzied != null)
            {
                StringBuilder table = new StringBuilder();
                table.Clear();
                visualizzaSocieta.Controls.Add(new Literal { Text = table.ToString() });
                for (int i = 0; i < deserialzied.Count; i++)
                {
                    string affiliata = "Sì";
                    if (deserialzied[i].affiliata.ToString() == "False") affiliata = "No";
                    table.Append("" +
                        "<p> Nome società: " + deserialzied[i].nomeSocieta + "</p>" +
                        "<p> Indrizzo: " + deserialzied[i].indirizzo + "</p>" +
                        "<p> Cap: " + deserialzied[i].cap + "</p>" +
                        "<p> Data fondazione: " + deserialzied[i].dataFondazione.ToString().Split(' ')[0] + "</p>" +
                        "<p> Data affiliazione: " + deserialzied[i].dataAffiliazione.ToString().Split(' ')[0] + "</p>" +
                        "<p> Codice affiliazione: " + deserialzied[i].codiceAffiliazione + "</p>" +
                        "<p> Affiliata: " + affiliata + "</p>" +
                        "<p> Email: " + deserialzied[i].email + "</p>" +
                        "<p> Sito: " + deserialzied[i].sito + "</p>" +
                        "<p> Telefono: " + deserialzied[i].tel1 + "</p>" +
                        "<p> Telefono secondario: " + deserialzied[i].tel2 + "</p>" +
                        "<p> PEC: " + deserialzied[i].pec + "</p>" +
                        "<p> P.IVA: " + deserialzied[i].piva + "</p>" +
                        "<p> CF: " + deserialzied[i].cf + "</p>" +
                        "<p> CU: " + deserialzied[i].cu + "</p>");
                }
                //Append the HTML string to Placeholder.
                visualizzaSocieta.Controls.Add(new Literal { Text = table.ToString() });
            }
        }
        
        protected void ModificaAnagrafica_Click(object sender, EventArgs e)
        {
            Response.Redirect("ModificaAnagraficaSocieta.aspx"); //manda alla form 'ModificaAnagraficaSocieta'
        }
    }
}