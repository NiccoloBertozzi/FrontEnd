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
    public partial class AutorizzaTorneo : System.Web.UI.Page
    {
        //QUESTA PAGINA SERVE SOLO COME ESEMPIO PER SCARICARE SQUADRE
        string token;
        int idTorneo;
        protected void Page_Load(object sender, EventArgs e)
        {
            token = Session["Token"].ToString();
            idTorneo = int.Parse(Session["IdTorneo"].ToString());
            DownloadInformazioniSquadre();
        }
        protected void DownloadInformazioniSquadre()
        {
            var client = new RestClient("https://aibvcapi.azurewebsites.net/api/v1/tornei/SquadreTorneo/" + idTorneo);
            client.Timeout = -1;
            var request = new RestRequest(Method.GET);
            request.AddHeader("Authorization", "Bearer " + token);
            request.AddHeader("Cookie", "ARRAffinity=e7fc3e897f5be57469671ac828c06570ef8d3ea8fb2416293fd2acc3f67e0ee6; ARRAffinitySameSite=e7fc3e897f5be57469671ac828c06570ef8d3ea8fb2416293fd2acc3f67e0ee6; ruolo=Societa");
            IRestResponse response = client.Execute(request);
            //deserializza il risultato ritornato
            dynamic deserialzied = JsonConvert.DeserializeObject(response.Content);
            if (deserialzied != null)
            {
                StringBuilder table = new StringBuilder();
                table.Clear();
                squadre.Controls.Add(new Literal { Text = table.ToString() });
                for (int i = 0; i < deserialzied.Count; i++)
                {
                    table.Append("<div id=\"" + deserialzied[i].idSquadra + "\" onclick=\"javascript:DivClicked(" + deserialzied[i].idSquadra + "); return true;\"> <p> Squadra: " + deserialzied[i].nomeTeam + "</p></div>");
                }
                //Append the HTML string to Placeholder.
                squadre.Controls.Add(new Literal { Text = table.ToString() });
            }
        }
        protected void clickArea_Click(object sender, EventArgs e)
        {
            Session["IdSquadra"] = HiddenField1.Value;
            Response.Redirect("InfoSquadra.aspx");
        }
    }
}



