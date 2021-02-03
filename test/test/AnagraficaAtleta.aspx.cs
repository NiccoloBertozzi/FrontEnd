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
    public partial class AnagraficaAtleta : System.Web.UI.Page
    {
        string token;
        protected void Page_Load(object sender, EventArgs e)
        {
            token = Session["Token"].ToString();
            int idAtleta = Convert.ToInt32(Session["idUtente"]);
            DownloadAnagrafica(idAtleta);
        }

        protected void DownloadAnagrafica(int idAtleta)
        {
            var client = new RestClient("https://aibvcapi.azurewebsites.net/api/v1/atleti/GetAnagraficaAtleta/" + idAtleta);
            client.Timeout = -1;
            var request = new RestRequest(Method.GET);
            request.AddHeader("Authorization", "Bearer " + token);
            request.AddHeader("Cookie", "ruolo=Admin; ARRAffinity=e7fc3e897f5be57469671ac828c06570ef8d3ea8fb2416293fd2acc3f67e0ee6; ARRAffinitySameSite=e7fc3e897f5be57469671ac828c06570ef8d3ea8fb2416293fd2acc3f67e0ee6");
            IRestResponse response = client.Execute(request);
            //deserializza il risultato ritornato
            dynamic deserialzied = JsonConvert.DeserializeObject(response.Content);
            if (deserialzied != null)
            {
                StringBuilder table = new StringBuilder();
                table.Clear();
                anagraficaAtleta.Controls.Add(new Literal { Text = table.ToString() });
                for (int i = 0; i < deserialzied.Count; i++)
                {
                    table.Append("" +
                        "<p>Nome: " + deserialzied[i].nome + "</p>" +
                        "<p>Cognome: " + deserialzied[i].cognome + "</p>" +
                        "<p>Codice Tessera: " + deserialzied[i].codiceTessera + "</p>" +
                        "<p> Nome Societa: " + deserialzied[i].nomeSocieta + "</p>" +
                        "<p>Sesso: " + deserialzied[i].sesso + "</p>" +
                        "<p>CF: " + deserialzied[i].cf + "</p>" +
                        "<p>Data Nascita: " + deserialzied[i].dataNascita + "</p>" +
                        "<p>Comune di Nascita: " + deserialzied[i].comuneNascita + "</p>" +
                        "<p>Comune di Residenza: " + deserialzied[i].comuneResidenza + "</p>" +
                        "<p>Indirizzo: " + deserialzied[i].indirizzo + "</p>" +
                        "<p>CAP: " + deserialzied[i].cap + "</p>" +
                        "<p>Email: " + deserialzied[i].email + "</p>" +
                        "<p>Tel: " + deserialzied[i].tel + "</p>" +
                        "<p>Altezza: " + deserialzied[i].altezza + "</p>" +
                        "<p>Peso: " + deserialzied[i].peso + "</p>" +
                        "<p>Data Scadenza Certificato: " + deserialzied[i].dataScadenzaCertificato + "</p>");
                }
                //Append the HTML string to Placeholder.
                anagraficaAtleta.Controls.Add(new Literal { Text = table.ToString() });
            }
        }
        protected void ModificaAnagrafica_Click(object sender, EventArgs e)
        {
            Response.Redirect("ModificaAnagraficaAtleta.aspx"); //manda alla form 'ModificaAnagraficaAtleta'
        }
    }
}