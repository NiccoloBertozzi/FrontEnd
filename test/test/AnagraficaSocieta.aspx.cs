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
                    table.Append("" +
                        "<p> <b>Nome :</b>" + deserialzied[i].nomeSocieta + "</p>" +
                        "<p> <b>Indirizzo :</b>" + deserialzied[i].indirizzo + "</p>" +
                        "<p> <b>Cap :</b>" + deserialzied[i].cap + "</p>" +
                        "<p> <b>Data Fondazione :</b>" + deserialzied[i].dataFondazione + "</p>" +
                        "<p> <b>Data Affiliazione :</b>" + deserialzied[i].dataAffiliazione + "</p>" +
                        "<p> <b>Codice Affiliazione :</b>" + deserialzied[i].codiceAffiliazione + "</p>" +
                        "<p> <b>Affiliata :</b>" + deserialzied[i].affiliata + "</p>" +
                        "<p> <b>Email :</b>" + deserialzied[i].email + "</p>" +
                        "<p> <b>Sito :</b>" + deserialzied[i].sito + "</p>" +
                        "<p> <b>Tell1 :</b>" + deserialzied[i].tel1 + "</p>" +
                        "<p> <b>Tell2 :</b>" + deserialzied[i].tel2 + "</p>" +
                        "<p> <b>Pec :</b>" + deserialzied[i].pec + "</p>" +
                        "<p> <b>Partita IVA :</b>" + deserialzied[i].piva + "</p>" +
                        "<p> <b>Codice Fiscale :</b>" + deserialzied[i].cf + "</p>" +
                        "<p> <b>CU:</b>" + deserialzied[i].cu + "</p>");
                }
                //Append the HTML string to Placeholder.
                visualizzaSocieta.Controls.Add(new Literal { Text = table.ToString() });
            }
        }
    }
}