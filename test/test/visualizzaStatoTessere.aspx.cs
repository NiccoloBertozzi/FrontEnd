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
	public partial class visualizzaStatoTessere : System.Web.UI.Page
	{
        string token;
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["ruolo"].ToString() == "Atleta" || Session["ruolo"].ToString() == "Delegato") Response.Redirect("OutputTornei.aspx");
            token = Session["Token"].ToString();
            int idSocieta = Convert.ToInt32(Session["idUtente"]);
            DownloadTessere(idSocieta);
        }

        protected void DownloadTessere(int idSocieta) //mostra tutti gli allenatori della socità
        {
            var client = new RestClient("https://aibvcapi.azurewebsites.net/api/v1/societa/TessereSocieta/" + Session["idUtente"]);
            client.Timeout = -1;
            var request = new RestRequest(Method.GET);
            request.AddHeader("Authorization", "Bearer " + token);
            request.AddHeader("Cookie", "ruolo=Societa; ARRAffinity=e7fc3e897f5be57469671ac828c06570ef8d3ea8fb2416293fd2acc3f67e0ee6; ARRAffinitySameSite=e7fc3e897f5be57469671ac828c06570ef8d3ea8fb2416293fd2acc3f67e0ee6");
            IRestResponse response = client.Execute(request);


            //deserializza il risultato ritornato
            dynamic deserialized = JsonConvert.DeserializeObject(response.Content);
            if (deserialized != null)
            {
                StringBuilder table = new StringBuilder();
                table.Clear();
                visualizzaTessere.Controls.Add(new Literal { Text = table.ToString() });
                for (int i = 0; i < deserialized.Count; i++)
                {
                    table.Append("<p> Atleta: " + deserialized[i].atleta + "</p>" +
                        "<p> Codice Tessera: " + deserialized[i].codiceTessera + "</p>" +
                        "<p> Tipo Tessera: " + deserialized[i].tipoTessera + "</p>" +
                        "<p> Data Tesseramento: " + deserialized[i].dataTesseramento + "</p>" +
                        "<p> Anno Tesseramento: " + deserialized[i].annoTesseramento + "</p>" +
                        "<p> Importo: " + deserialized[i].importo + "</p>");
                }
                //Append the HTML string to Placeholder.
                visualizzaTessere.Controls.Add(new Literal { Text = table.ToString() });
            }
        }
    }
}