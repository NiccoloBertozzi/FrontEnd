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
        int idDelegato;
        protected void Page_Load(object sender, EventArgs e)
        {
            token = Request.QueryString["token"];
            idDelegato = Convert.ToInt32(Session["idUtente"]);
            DownloadAnagrafica(idDelegato);
        }

        protected void DownloadAnagrafica(int idAtleta)
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
                        "<p>" + deserialzied[i].nome + "</p>" +
                        "<p>" + deserialzied[i].cognome + "</p>" +
                        "<p>" + deserialzied[i].dataNascita + "</p>" +
                        "<p>" + deserialzied[i].email + "</p>" +
                        "<p>" + deserialzied[i].tel + "</p>" +
                        "<p>" + deserialzied[i].sesso + "</p>");
                }
                //Append the HTML string to Placeholder.
                anagraficaDelegato.Controls.Add(new Literal { Text = table.ToString() });
            }
        }
    }
}