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
            if (string.IsNullOrEmpty(Session["Token"] as string))
            {
                if (Session["ruolo"].ToString() == "Admin" || Session["ruolo"].ToString() == "Delegato") Response.Redirect("AnagraficaDelegato.aspx");
                if (Session["ruolo"].ToString() == "Societa") Response.Redirect("AnagraficaSocieta.aspx");
                if (Session["ruolo"].ToString() == "Allenatore") Response.Redirect("AnagraficaAllenatore.aspx");
                token = Session["Token"].ToString();
                int idAtleta = Convert.ToInt32(Session["IdUtente"]);
                DownloadAnagrafica(idAtleta);
            }
            else Response.Redirect("OutputTornei.aspx");
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
                for(int i=0; i<16; i++)
                {
                    table.Append("" +
                        "<div class='row mt-3'>" +
                        getLabel(i) +
                        getText(deserialzied, i) +
                        "</div>"
                        );
                }
                //Append the HTML string to Placeholder.
                anagraficaAtleta.Controls.Add(new Literal { Text = table.ToString() });
            }
        }
        protected void ModificaAnagrafica_Click(object sender, EventArgs e)
        {
            Response.Redirect("ModificaAnagraficaAtleta.aspx"); //manda alla form 'ModificaAnagraficaAtleta'
        }

        protected string getLabel(int c)
        {
            string[] testi = { "Nome", "Cognome", "Codice Tessera", "Nome Societa", "Sesso", "CF", "Data di Nascita", "Comune di Nascita", "Comune di Residenza", "Indirizzo", "Codice Postale (CAP)", "Email", "Telefono", "Altezza", "Peso", "Scadenza Certificato" };
            return ("<label class='col-md-5 text-center my-auto'>" +testi[c]+ "</label>");
        }

        protected string getText(dynamic data, int c)
        {
            switch (c) {

                case 0:
                    return "<p class='col-md-5 text-center my-auto'>" + data[0].nome + "</p>";
                case 1:
                    return "<p class='col-md-5 text-center my-auto'>" + data[0].cognome + "</p>";
                case 2:
                    return "<p class='col-md-5 text-center my-auto'>" + data[0].codiceTessera + "</p>";
                case 3:
                    return "<p class='col-md-5 text-center my-auto'>" + data[0].nomeSocieta + "</p>";
                case 4:
                    return "<p class='col-md-5 text-center my-auto'>" + data[0].sesso + "</p>";
                case 5:
                    return "<p class='col-md-5 text-center my-auto'>" + data[0].cf + "</p>";
                case 6:
                    return "<p class='col-md-5 text-center my-auto'>" + data[0].dataNascita.ToString().Split(' ')[0] + "</p>";
                case 7:
                    return "<p class='col-md-5 text-center my-auto'>" + data[0].comuneNascita + "</p>";
                case 8:
                    return "<p class='col-md-5 text-center my-auto'>" + data[0].comuneResidenza + "</p>";
                case 9:
                    return "<p class='col-md-5 text-center my-auto'>" + data[0].indirizzo + "</p>";
                case 10:
                    return "<p class='col-md-5 text-center my-auto'>" + data[0].cap + "</p>";
                case 11:
                    return "<p class='col-md-5 text-center my-auto'>" + data[0].email + "</p>";
                case 12:
                    return "<p class='col-md-5 text-center my-auto'>" + data[0].tel + "</p>";
                case 13:
                    return "<p class='col-md-5 text-center my-auto'>" + data[0].altezza + "</p>";
                case 14:
                    return "<p class='col-md-5 text-center my-auto'>" + data[0].peso + "</p>";
                case 15:
                    return "<p class='col-md-5 text-center my-auto'>" + data[0].dataScadenzaCertificato.ToString().Split(' ')[0] + "</p>";
            }
            return "Error getText";
        }
    }
}