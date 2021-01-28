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
                        "<p>" + deserialzied[i].nomeSocieta + "</p>" +
                        "<p>" + deserialzied[i].indirizzo + "</p>" +
                        "<p>" + deserialzied[i].cap + "</p>" +
                        "<p>" + deserialzied[i].dataFondazione + "</p>" +
                        "<p>" + deserialzied[i].dataAffiliazione + "</p>" +
                        "<p>" + deserialzied[i].codiceAffiliazione + "</p>" +
                        "<p>" + deserialzied[i].affiliata + "</p>" +
                        "<p>" + deserialzied[i].email + "</p>" +
                        "<p>" + deserialzied[i].sito + "</p>" +
                        "<p>" + deserialzied[i].tel1 + "</p>" +
                        "<p>" + deserialzied[i].tel2 + "</p>" +
                        "<p>" + deserialzied[i].pec + "</p>" +
                        "<p>" + deserialzied[i].piva + "</p>" +
                        "<p>" + deserialzied[i].cf + "</p>" +
                        "<p>" + deserialzied[i].cu + "</p>");
                }
                //Append the HTML string to Placeholder.
                visualizzaSocieta.Controls.Add(new Literal { Text = table.ToString() });
            }
        }
    }
}