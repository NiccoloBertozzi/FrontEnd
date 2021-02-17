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
    public partial class OutputPartiteTorneo : System.Web.UI.Page
    {
        string token;
        int idTorneo;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["idUtente"] == null) Response.Redirect("OutputTornei.aspx");
            token = Session["Token"].ToString();
            idTorneo = Convert.ToInt32(Request.QueryString["id"]);
            if (!this.IsPostBack)
            {
                DownloadInformazioniPartita(idTorneo);
            }
        }
        protected void DownloadInformazioniPartita(int idTorneo)
        {
            var client = new RestClient("https://aibvcapi.azurewebsites.net/api/v1/tornei/GetPartiteTorneo/" + idTorneo);
            client.Timeout = -1;
            var request = new RestRequest(Method.GET);
            request.AddHeader("Authorization", "Bearer " + token);
            request.AddHeader("Cookie", "ARRAffinity=e7fc3e897f5be57469671ac828c06570ef8d3ea8fb2416293fd2acc3f67e0ee6; ARRAffinitySameSite=e7fc3e897f5be57469671ac828c06570ef8d3ea8fb2416293fd2acc3f67e0ee6; ruolo=Societa");
            IRestResponse response = client.Execute(request);
            dynamic deserialzied = JsonConvert.DeserializeObject(response.Content);
            if (deserialzied != null)
            {
                StringBuilder table = new StringBuilder();
                table.Clear();
                partiteList.Controls.Add(new Literal { Text = table.ToString() });
                for (int i = 0; i < deserialzied.Count; i++)
                {
                    table.Append("<div class=\"col-sm-12 col-md-3 my-2\">" +
                        "<div id=\"" + deserialzied[i].numPartita + "\" class=\"card\" onclick=\"javascript:DivClicked(" + deserialzied[i].numPartita + "); return true;\">" +
                        "<img class=\"card-img-top\" src=\"Img/sand.jpg\" alt=\"Card image cap\">" +
                        "<div class=\"card-body\">" +
                        "<h5 class=\"card-title\">" + deserialzied[i].fase + "</h5>" +
                        "<p class=\"card-text my-2\">" + deserialzied[i].nomeTeam + "-" + deserialzied[i].nomeTeam1 + "</p>" +
                        "<p class=\"card-text my-2\"><small class=\"text-muted\">" + deserialzied[i].risultato + "</small></p>" +
                        "<p class=\"card-text my-2\"><small class=\"text-muted\">" + Convert.ToDateTime(deserialzied[i].dataPartita).Date.ToString("dd/MM/yyyy") + "</small></p>" +
                        "</div>" +
                        "</div>" +
                        "</div>");
                }
                partiteList.Controls.Add(new Literal { Text = table.ToString() });
            }
        }
        protected void clickArea_Click(object sender, EventArgs e)
        {
            Response.Redirect("InfoPartita.aspx?id=" + idTorneo + "&partita="+HiddenField1.Value);
        }
    }
}