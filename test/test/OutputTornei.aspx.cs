using Newtonsoft.Json;
using RestSharp;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace test
{
    public partial class OutputTornei : System.Web.UI.Page
    {
        string token;

        public void Page_Load(object sender, EventArgs e)
        {
            if (Session["ruolo"] != null)
            {
                if (Session["ruolo"].ToString() == "Atleta")
                {
                    StringBuilder table = new StringBuilder();
                    table.Clear();
                    dinamicload.Controls.Add(new Literal { Text = table.ToString() });
                    table.Append("<li class=\"nav-item\" role=\"presentation\"><a class=\"nav-link active pointer\" onclick=\"LoadPageIscritti(); \">Tornei Iscritti</a></li>");
                    dinamicload.Controls.Add(new Literal { Text = table.ToString() });
                }
                else if (Session["ruolo"].ToString() == "Admin")
                {
                    StringBuilder table = new StringBuilder();
                    table.Clear();
                    dinamicload.Controls.Add(new Literal { Text = table.ToString() });
                    table.Append("<li class=\"nav-item\" role=\"presentation\"><a class=\"nav-link active pointer\" onclick=\"LoadPage(); \">Non autorizzati</a></li>");
                    table.Append("<li class=\"nav-item\" role=\"presentation\"><a class=\"nav-link active pointer\" onclick=\"LoadPageDelegati(); \">Tornei delegato</a></li>");
                    dinamicload.Controls.Add(new Literal { Text = table.ToString() });
                }
                else if (Session["ruolo"].ToString() == "Societa")
                {
                    StringBuilder table = new StringBuilder();
                    table.Clear();
                    dinamicload.Controls.Add(new Literal { Text = table.ToString() });
                    table.Append("<li class=\"nav-item\" role=\"presentation\"><a class=\"nav-link active pointer\" onclick=\"LoadCreaTorneo(); \">CreaTorneo</a></li>");
                    dinamicload.Controls.Add(new Literal { Text = table.ToString() });
                }
                else if (Session["ruolo"].ToString() == "Delegato")
                {
                    StringBuilder table = new StringBuilder();
                    table.Clear();
                    dinamicload.Controls.Add(new Literal { Text = table.ToString() });
                    table.Append("<li class=\"nav-item\" role=\"presentation\"><a class=\"nav-link active pointer\" onclick=\"LoadPageDelegati(); \">Tornei delegato</a></li>");
                    dinamicload.Controls.Add(new Literal { Text = table.ToString() });
                }
            }
            if (Session["idUtente"] == null)
            {
                StringBuilder table = new StringBuilder();
                table.Clear();
                AccediBtn.Controls.Add(new Literal { Text = table.ToString() });
                table.Append("<button type=\"button\" class=\"btn btn-light\" onclick=\"LoadLogin(); \">Login</button>");
                AccediBtn.Controls.Add(new Literal { Text = table.ToString() });
            }
            //Append the HTML string to Placeholder.
            if (!this.IsPostBack)
            {
                //passo i tornei fino a due mesi prima
                string data = Convert.ToDateTime(DateTime.Now.Date.AddDays(+60)).ToString("yyyy-MM-dd");
                DownloadDataTornei(data);
            }
        }
        protected void DownloadDataTornei(string data)
        {
            //se è atlteta scarico tutti i tornei disponibili se è societa scarico tutti i tornei di quella societa
            var client = new RestClient("https://aibvcapi.azurewebsites.net/api/v1/tornei/GetTornei/" + data);
            if(Session["ruolo"]!=null)if(Session["ruolo"].ToString() == "Societa") client = new RestClient("https://aibvcapi.azurewebsites.net/api/v1/societa/GetTorneiSocieta/" + data+ "/IdSocieta/" + Session["IdUtente"].ToString());
            client.Timeout = -1;
            var request = new RestRequest(Method.GET);
            if (Session["ruolo"] != null)
            {
                if (Session["ruolo"].ToString() == "Societa")
                {
                    token = Session["Token"].ToString();
                    request.AddHeader("Authorization", "Bearer " + token);
                }
            }
            request.AddHeader("Cookie", "ARRAffinity=e7fc3e897f5be57469671ac828c06570ef8d3ea8fb2416293fd2acc3f67e0ee6; ARRAffinitySameSite=e7fc3e897f5be57469671ac828c06570ef8d3ea8fb2416293fd2acc3f67e0ee6");
            IRestResponse response = client.Execute(request);
            //deserializza il risultato ritornato
            dynamic deserialzied = JsonConvert.DeserializeObject(response.Content);
            if (deserialzied != null)
            {
                StringBuilder table = new StringBuilder();
                table.Clear();
                torneilist.Controls.Add(new Literal { Text = table.ToString() });
                for (int i = 0; i < deserialzied.Count; i++)
                {
                    table.Append("<div class=\"col-sm-12 col-md-3 my-2\">" +
                        "<div id=\"" + deserialzied[i].idTorneo + "\" class=\"card\" onclick=\"javascript:DivClicked("+ deserialzied[i].idTorneo + "); return true;\">" +
                        "<img class=\"card-img-top\" src=\"Img/sand.jpg\" alt=\"Card image cap\">" +
                        "<div class=\"card-body\">" +
                        "<h5 class=\"card-title\">" + deserialzied[i].titolo + "</h5>" +
                        "<p class=\"card-text my-2\">€" + deserialzied[i].montepremi + "</p>" +
                        //"<p class=\"card-text my-2\"><small class=\"text-muted\">" + deserialzied[i].citta + "</small></p>" +
                        "<p class=\"card-text my-2\"><small class=\"text-muted\">" + Convert.ToDateTime(deserialzied[i].dataInizio).Date.ToString("dd/MM/yyyy") + "</small></p>" +
                        "</div>" +
                        "</div>" +
                        "</div>");
                }
                //Append the HTML string to Placeholder.
                torneilist.Controls.Add(new Literal { Text = table.ToString() });
            }
        }
        protected void clickArea_Click(object sender, EventArgs e)
        {
                Session["IdTorneo"] = HiddenField1.Value;
                Response.Redirect("InfoTorneo.aspx?id="+ HiddenField1.Value); //rimanda alla form 'output tornei'
        }
    }
}