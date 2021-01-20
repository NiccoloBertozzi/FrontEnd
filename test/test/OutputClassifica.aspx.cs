using Newtonsoft.Json;
using RestSharp;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace test
{
    public partial class OutputClassifica : System.Web.UI.Page
    {
        string token, genere;
        protected void Page_Load(object sender, EventArgs e)
        {
            token = Request.QueryString["token"];
            genere = Request.QueryString["genere"];
            if (!this.IsPostBack)
            {
                DownloadClassifica(token, genere);
            }
        }
        protected void DownloadClassifica(string token, string genere)
        {
            var client = new RestClient("https://aibvcapi.azurewebsites.net/api/v1/gestionale/GetClassifica/" + genere);
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
                classificaTable.Controls.Add(new Literal { Text = table.ToString() });
                table.Append("<table border=1> <tr> <th> Cognome </th> <th> Nome </th> <th> Punteggio </th> </tr> ");
                for (int i = 0; i < deserialzied.Count; i++)
                {
                    table.Append("  <tr><td> " + deserialzied[i].cognome + " </td><td> " + deserialzied[i].nome + " </td><td> " + deserialzied[i].punteggi + " </td></tr>  ");
                }
                table.Append(" </table>");
                //Append the HTML string to Placeholder.
                classificaTable.Controls.Add(new Literal { Text = table.ToString() });
            }
        }
    }
}
