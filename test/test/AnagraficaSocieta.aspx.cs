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
            if (string.IsNullOrEmpty(Session["Token"] as string))
            {
                if (Session["ruolo"].ToString() == "Atleta") Response.Redirect("AnagraficaAtleta.aspx");
                if (Session["ruolo"].ToString() == "Allenatore") Response.Redirect("AnagraficaAllenatore.aspx");
                if (Session["ruolo"].ToString() == "Admin" || Session["ruolo"].ToString() == "Delegato") Response.Redirect("AnagraficaDelegato.aspx");
                token = Session["Token"].ToString();
                int idSocieta = Convert.ToInt32(Session["idUtente"]);
                DownloadSocieta(idSocieta);
            }
            else Response.Redirect("OutputTornei.aspx");
        }

        protected void DownloadSocieta(int idSocieta)
        {
            var client = new RestClient("https://aibvcapi.azurewebsites.net/api/v1/societa/GetAnagraficaSocieta/" + idSocieta);
            client.Timeout = -1;
            var request = new RestRequest(Method.GET);
            request.AddHeader("Authorization", "Bearer  " + token);
            request.AddHeader("Cookie", "ARRAffinity=e7fc3e897f5be57469671ac828c06570ef8d3ea8fb2416293fd2acc3f67e0ee6; ARRAffinitySameSite=e7fc3e897f5be57469671ac828c06570ef8d3ea8fb2416293fd2acc3f67e0ee6; ruolo=Societa");
            IRestResponse response = client.Execute(request);
            //deserializza il risultato ritornato
            dynamic deserialzied = JsonConvert.DeserializeObject(response.Content);
            if (deserialzied != null)
            {
                StringBuilder table = new StringBuilder();
                table.Clear();
                anagraficaSocieta.Controls.Add(new Literal { Text = table.ToString() });
                for (int i = 0; i < 18; i++)
                {
                    table.Append("" + "<div class='row mt-3'>" + getLabel(i) + getText(deserialzied, i) + "</div>");
                }
                anagraficaSocieta.Controls.Add(new Literal { Text = table.ToString() });
            }
        }
        protected void ModificaAnagraficaSocieta_Click(object sender, EventArgs e)
        {
            Response.Redirect("ModificaAnagraficaSocieta.aspx"); //manda alla form 'ModificaAnagraficaSocieta'
        }
        protected string getLabel(int c)
        {
            string[] testi = { "Nome Societa':", "Citta':", "Indirizzo:", "Cap:", "Data Fondazione:", "Data Affiliazione:", "Codice Affiliazione:", "Affiliata:", "Email:", "Sito:", "Tell1:", "Tell2:", "Pec:", "Partita IVA:", "Codice Fiscale:", "CU:", "Presidente:", "Referente:" };
            return ("<label class='col-md-4 offset-md-2 my-auto'>" + testi[c] + "</label>");
        }
        protected string getText(dynamic data, int c)
        {
            switch (c)
            {
                case 0:
                    return "<p class='col-md-4 my-auto'>" + data[0].nomeSocieta + "</p>";
                case 1:
                    return "<p class='col-md-4 my-auto'>" + data[0].citta + "</p>";
                case 2:
                    return "<p class='col-md-4 my-auto'>" + data[0].indirizzo + "</p>";
                case 3:
                    return "<p class='col-md-4 my-auto'>" + data[0].cap + "</p>";
                case 4:
                    return "<p class='col-md-4 my-auto'>" + data[0].dataFondazione.ToString().Split(' ')[0] + "</p>";
                case 5:
                    return "<p class='col-md-4 my-auto'>" + data[0].dataAffiliazione.ToString().Split(' ')[0] + "</p>";
                case 6:
                    return "<p class='col-md-4 my-auto'>" + data[0].codiceAffiliazione + "</p>";
                case 7:
                    return "<p class='col-md-4 my-auto'>" + data[0].affiliata + "</p>";
                case 8:
                    return "<p class='col-md-4 my-auto'>" + data[0].email + "</p>";
                case 9:
                    return "<p class='col-md-4 my-auto'>" + data[0].sito + "</p>";
                case 10:
                    return "<p class='col-md-4 my-auto'>" + data[0].tel1 + "</p>";
                case 11:
                    return "<p class='col-md-4 my-auto'>" + data[0].tel2 + "</p>";
                case 12:
                    return "<p class='col-md-4 my-auto'>" + data[0].pec + "</p>";
                case 13:
                    return "<p class='col-md-4 my-auto'>" + data[0].piva + "</p>";
                case 14:
                    return "<p class='col-md-4 my-auto'>" + data[0].cf + "</p>";
                case 15:
                    return "<p class='col-md-4 my-auto'>" + data[0].cu + "</p>";
                case 16:
                    return "<p class='col-md-4 my-auto'>" + data[0].presidente + "</p>";
                case 17:
                    return "<p class='col-md-4 my-auto'>" + data[0].referente + "</p>";
            }
            return "Error getText";
        }
    }
}