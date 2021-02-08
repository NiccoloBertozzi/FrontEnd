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
    public partial class visualizzaComponentiSocieta : System.Web.UI.Page
    {
        string token;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["ruolo"].ToString() == "Atleta" || Session["ruolo"].ToString() == "Delegato") Response.Redirect("OutputTornei.aspx");
            token = Session["Token"].ToString();
            int idSocieta = Convert.ToInt32(Session["idUtente"]);
            DownloadAllenatori(idSocieta);
            DownloadAtleti(idSocieta);
        }

        protected void DownloadAllenatori(int idSocieta) //mostra tutti gli allenatori della socità
        {
            var client = new RestClient("https://aibvcapi.azurewebsites.net/api/v1/tornei/AllenatoriSocieta/" + Session["idUtente"]);
            client.Timeout = -1;
            var request = new RestRequest(Method.POST);
            request.AddHeader("Authorization", "Bearer " + token + "");
            request.AddHeader("Cookie", "ARRAffinity=e7fc3e897f5be57469671ac828c06570ef8d3ea8fb2416293fd2acc3f67e0ee6; ARRAffinitySameSite=e7fc3e897f5be57469671ac828c06570ef8d3ea8fb2416293fd2acc3f67e0ee6; ruolo=" + Session["ruolo"] );
            IRestResponse response = client.Execute(request);
            //deserializza il risultato ritornato
            dynamic deserialized = JsonConvert.DeserializeObject(response.Content);
            if (deserialized != null)
            {
                StringBuilder table = new StringBuilder();
                table.Clear();
                visualizzaAllenatori.Controls.Add(new Literal { Text = table.ToString() });
                for (int i = 0; i < deserialized.Count; i++)
                {
                    table.Append("" +
                        "<p> Nome atleta: " + deserialized[i].nome + "</p>" +
                        "<p> Cognome atleta: " + deserialized[i].cognome + "</p>" +
                        "<p> Sesso: " + deserialized[i].sesso + "</p>" + 
                        "<p> Codice fiscale: " + deserialized[i].cf + "</p>" +
                        "<p> Data nascita: " + deserialized[i].dataNascita.ToString().Split(' ')[0] + "</p>" +
                        "<p> Comune nascita: " + deserialized[i].comuneNascita + "</p>" +
                        "<p> Comune residenza: " + deserialized[i].comuneResidenza + "</p>" +
                        "<p> Indirizzo: " + deserialized[i].indirizzo + "</p>" +
                        "<p> Cap: " + deserialized[i].cap + "</p>" +
                        "<p> Email: " + deserialized[i].email + "</p>" +
                        "<p> Telefono: " + deserialized[i].tel + "</p>" +
                        "<p> Altezza: " + deserialized[i].altezza + "</p>" +
                        "<p> Peso: " + deserialized[i].peso + "</p>" +
                        "<p> Data scadenza certificato: " + deserialized[i].dataScadenzaCertificato.ToString().Split(' ')[0] + "</p>");
                }
                //Append the HTML string to Placeholder.
                visualizzaAllenatori.Controls.Add(new Literal { Text = table.ToString() });
            }
        }

        protected void DownloadAtleti(int idSocieta) //mostra tutti gli atleti della socità
        {
            var client = new RestClient("https://aibvcapi.azurewebsites.net/api/v1/tornei/AtletiSocieta/" + Session["idUtente"]);
            client.Timeout = -1;
            var request = new RestRequest(Method.POST);
            request.AddHeader("Authorization", "Bearer " + token + "");
            request.AddHeader("Cookie", "ARRAffinity=e7fc3e897f5be57469671ac828c06570ef8d3ea8fb2416293fd2acc3f67e0ee6; ARRAffinitySameSite=e7fc3e897f5be57469671ac828c06570ef8d3ea8fb2416293fd2acc3f67e0ee6; ruolo=" + Session["ruolo"]);
            IRestResponse response = client.Execute(request);
            //deserializza il risultato ritornato
            dynamic deserialized = JsonConvert.DeserializeObject(response.Content);
            if (deserialized != null)
            {
                StringBuilder table = new StringBuilder();
                table.Clear();
                visualizzaAtleti.Controls.Add(new Literal { Text = table.ToString() });
                for (int i = 0; i < deserialized.Count; i++)
                {
                    table.Append("" +
                        "<p> Nome atleta: " + deserialized[i].nome + "</p>" +
                        "<p> Cognome atleta: " + deserialized[i].cognome + "</p>" +
                        "<p> Sesso: " + deserialized[i].sesso + "</p>" +
                        "<p> Codice fiscale: " + deserialized[i].cf + "</p>" +
                        "<p> Data nascita: " + deserialized[i].dataNascita.ToString().Split(' ')[0] + "</p>" +
                        "<p> Comune nascita: " + deserialized[i].comuneNascita + "</p>" +
                        "<p> Comune residenza: " + deserialized[i].comuneResidenza + "</p>" +
                        "<p> Indirizzo: " + deserialized[i].indirizzo + "</p>" +
                        "<p> Cap: " + deserialized[i].cap + "</p>" +
                        "<p> Email: " + deserialized[i].email + "</p>" +
                        "<p> Telefono: " + deserialized[i].tel + "</p>");
                }
                //Append the HTML string to Placeholder.
                visualizzaAtleti.Controls.Add(new Literal { Text = table.ToString() });
            }
        }

        protected void ModificaAnagraficaDelegato_Click(object sender, EventArgs e)
        {
            Response.Redirect("ModificaAnagraficaDelegato.aspx"); //manda alla form 'ModificaAnagraficaDelegato'
        }
        protected void ModificaAnagraficaAtleta_Click(object sender, EventArgs e)
        {
            Response.Redirect("ModificaAnagraficaAtleta.aspx"); //manda alla form 'ModificaAnagraficaAtleta'
        }
    }
}