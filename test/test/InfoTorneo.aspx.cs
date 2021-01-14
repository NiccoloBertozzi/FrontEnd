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
    public partial class InfoTorneo : System.Web.UI.Page
    {
        string token;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                token = Request.QueryString["token"];
                idricevuto.Text = Session["IdUtente"].ToString();
                int idTorneo = int.Parse(Session["IdTorneo"].ToString());
                DownloadInformazioniTorneo(idTorneo);
            }
        }
        protected void DownloadInformazioniTorneo(int idTorneo)
        {
            var client = new RestClient("https://aibvcapi.azurewebsites.net/api/v1/GetTorneoByID/" + idTorneo);
            client.Timeout = -1;
            var request = new RestRequest(Method.GET);
            request.AddHeader("Authorization", "Bearer " + token);
            request.AddHeader("Cookie", "ARRAffinity=e7fc3e897f5be57469671ac828c06570ef8d3ea8fb2416293fd2acc3f67e0ee6; ARRAffinitySameSite=e7fc3e897f5be57469671ac828c06570ef8d3ea8fb2416293fd2acc3f67e0ee6");
            IRestResponse response = client.Execute(request);
            //deserializza il risultato ritornato
            dynamic deserialzied = JsonConvert.DeserializeObject(response.Content);
            if (deserialzied != null)
            {
                StringBuilder table = new StringBuilder();
                table.Clear();
                torneiInfo.Controls.Add(new Literal { Text = table.ToString() });

                table.Append(deserialzied[0].titolo + "," /*AGGIUNGERE TUTTI I VALORI DEL TORNEO*/);

                //Append the HTML string to Placeholder.
                torneiInfo.Controls.Add(new Literal { Text = table.ToString() });
            }
        }
    }
}