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
    public partial class AnagraficaDelegato : System.Web.UI.Page
    {
        string token;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["ruolo"].ToString() == "Atleta") Response.Redirect("AnagraficaAtleta.aspx");
            if (Session["ruolo"].ToString() == "Societa") Response.Redirect("AnagraficaSocieta.aspx");
            token = Session["Token"].ToString();
            int idDelegato = Convert.ToInt32(Session["idUtente"]);
            DownloadAnagrafica(idDelegato);
        }

        protected void DownloadAnagrafica(int idDelegato)
        {
            var client = new RestClient("https://aibvcapi.azurewebsites.net/api/v1/GetAnagraficaDelegato/" + idDelegato);
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
                anagraficaDelegato.Controls.Add(new Literal { Text = table.ToString() });
                for (int i = 0; i < deserialzied.Count; i++)
                {
                    table.Append("" +
                    "<p>Nome: " + deserialzied[i].nome + "</p>" +
                    "<p>Cognome: " + deserialzied[i].cognome + "</p>" +
                    "<p>Codice Tessera: " + deserialzied[i].codiceTessera + "</p>" +
                    "<p>Sesso: " + deserialzied[i].sesso + "</p>" +
                    "<p>CF: " + deserialzied[i].cf + "</p>" +
                    "<p>Data Nascita: " + deserialzied[i].dataNascita.ToString().Split(' ')[0] + "</p>" +
                    "<p>Comune di Nascita: " + deserialzied[i].comuneNascita + "</p>" +
                    "<p>Comune di Residenza: " + deserialzied[i].comuneResidenza + "</p>" +
                    "<p>Indirizzo: " + deserialzied[i].indirizzo + "</p>" +
                    "<p>CAP: " + deserialzied[i].cap + "</p>" +
                    "<p>Email: " + deserialzied[i].email + "</p>" +
                    "<p>Tel: " + deserialzied[i].tel + "</p>" +
                    "<p>Supervisore: " + deserialzied[i].supervisore + "</p>" +
                    "<p>Arbitro: " + deserialzied[i].arbitro + "</p>");
                }
                //Append the HTML string to Placeholder.
                anagraficaDelegato.Controls.Add(new Literal { Text = table.ToString() });
            }
        }

        protected void ModificaAnagraficaDelegato_Click(object sender, EventArgs e)
        {
            Response.Redirect("ModificaAnagraficaDelegato.aspx");
        }
    }
}