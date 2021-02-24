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
    public partial class OutputTorneiIscritti : System.Web.UI.Page
    {
        string token;
        public void Page_Load(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(Session["Token"] as string))
            {
                token = Session["Token"].ToString();
                if (!this.IsPostBack)
                {
                    DownloadDataTorneiIscritti();
                    DownloadDataTorneiInCorso();
                    DownloadDataTorneiFiniti();
                }
            }
            else Response.Redirect("OutputTornei.aspx");
        }
        protected void DownloadDataTorneiIscritti()
        {
            if (Session["ruolo"].ToString() == "Atleta")
            {
                var client = new RestClient("https://aibvcapi.azurewebsites.net/api/v1/atleti/Iscrizioni/" + Session["idUtente"]);
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
                    torneilist.Controls.Add(new Literal { Text = table.ToString() });
                    for (int i = 0; i < deserialzied.Count; i++)
                    {
                        table.Append("<div class=\"col-sm-12 col-md-3 my-2\">" +
                            "<div id=\"" + deserialzied[i].idTorneo + "\" class=\"card\" onclick=\"javascript:DivClicked(" + deserialzied[i].idTorneo + "); return true;\">" +
                            "<img class=\"card-img-top\" src=\"Img/sand.jpg\" alt=\"Card image cap\">" +
                            "<div class=\"card-body\">" +
                            "<h5 class=\"card-title\">" + deserialzied[i].titolo + "</h5>" +
                            "<p class=\"card-text my-2\">" + deserialzied[i].atleta1 + "-" + deserialzied[i].atleta2 + "</p>" +
                            "<p class=\"card-text my-2\"><small class=\"text-muted\">" + deserialzied[i].citta + "</small></p>" +
                            "<p class=\"card-text my-2\"><small class=\"text-muted\">" + Convert.ToDateTime(deserialzied[i].dataInizio).Date.ToString("dd/MM/yyyy") + "</small></p>" +
                            "</div>" +
                            "</div>" +
                            "</div>");
                    }
                    //Append the HTML string to Placeholder.
                    torneilist.Controls.Add(new Literal { Text = table.ToString() });
                }
            }
            else if (Session["ruolo"].ToString() == "Allenatore")
            {
                var client = new RestClient("https://aibvcapi.azurewebsites.net/api/v1/allenatori/TorneiIscritti/"+ Session["idUtente"]);
                client.Timeout = -1;
                var request = new RestRequest(Method.GET);
                request.AddHeader("Authorization", "Bearer " + token);
                request.AddHeader("Cookie", "ARRAffinity=e7fc3e897f5be57469671ac828c06570ef8d3ea8fb2416293fd2acc3f67e0ee6; ARRAffinitySameSite=e7fc3e897f5be57469671ac828c06570ef8d3ea8fb2416293fd2acc3f67e0ee6; ruolo=Admin");
                IRestResponse response = client.Execute(request);
                dynamic deserialzied = JsonConvert.DeserializeObject(response.Content);
                if (deserialzied != null)
                {
                    StringBuilder table = new StringBuilder();
                    table.Clear();
                    torneilist.Controls.Add(new Literal { Text = table.ToString() });
                    for (int i = 0; i < deserialzied.Count; i++)
                    {
                        table.Append("<div class=\"col-sm-12 col-md-3 my-2\">" +
                            "<div id=\"" + deserialzied[i].idTorneo + "\" class=\"card\" onclick=\"javascript:DivClicked(" + deserialzied[i].idTorneo + "); return true;\">" +
                            "<img class=\"card-img-top\" src=\"Img/sand.jpg\" alt=\"Card image cap\">" +
                            "<div class=\"card-body\">" +
                            "<h5 class=\"card-title\">" + deserialzied[i].titolo + "</h5>" +
                            "<p class=\"card-text my-2\">" + deserialzied[i].atleta1 + "-" + deserialzied[i].atleta2 + "</p>" +
                            "<p class=\"card-text my-2\"><small class=\"text-muted\">" + deserialzied[i].citta + "</small></p>" +
                            "<p class=\"card-text my-2\"><small class=\"text-muted\">" + Convert.ToDateTime(deserialzied[i].dataInizio).Date.ToString("dd/MM/yyyy") + "</small></p>" +
                            "</div>" +
                            "</div>" +
                            "</div>");
                    }
                    //Append the HTML string to Placeholder.
                    torneilist.Controls.Add(new Literal { Text = table.ToString() });
                }
            }
            else Response.Redirect("OutputTornei.aspx"); //rimanda alla form 'output tornei'
        }
        protected void DownloadDataTorneiInCorso()
        {
            if (Session["ruolo"].ToString() == "Atleta")
            {
                var client = new RestClient("https://aibvcapi.azurewebsites.net/api/v1/tornei/TorneInCorso/" + Session["idUtente"]);
                client.Timeout = -1;
                var request = new RestRequest(Method.GET);
                request.AddHeader("Authorization", "Bearer " + token);
                request.AddHeader("Cookie", "ARRAffinity=e7fc3e897f5be57469671ac828c06570ef8d3ea8fb2416293fd2acc3f67e0ee6; ARRAffinitySameSite=e7fc3e897f5be57469671ac828c06570ef8d3ea8fb2416293fd2acc3f67e0ee6; ruolo=Atleta");
                IRestResponse response = client.Execute(request);
                //deserializza il risultato ritornato
                dynamic deserialzied = JsonConvert.DeserializeObject(response.Content);
                if (deserialzied != null)
                {
                    StringBuilder table = new StringBuilder();
                    table.Clear();
                    inCorso.Controls.Add(new Literal { Text = table.ToString() });
                    for (int i = 0; i < deserialzied.Count; i++)
                    {
                        table.Append("<div class=\"col-sm-12 col-md-3 my-2\">" +
                            "<div id=\"" + deserialzied[i].idTorneo + "\" class=\"card\" onclick=\"javascript:DivClicked(" + deserialzied[i].idTorneo + "); return true;\">" +
                            "<img class=\"card-img-top\" src=\"Img/sand.jpg\" alt=\"Card image cap\">" +
                            "<div class=\"card-body\">" +
                            "<h5 class=\"card-title\">" + deserialzied[i].titolo + "</h5>" +
                            "<p class=\"card-text my-2\">" + deserialzied[i].atleta1 + "-" + deserialzied[i].atleta2 + "</p>" +
                            "<p class=\"card-text my-2\"><small class=\"text-muted\">" + deserialzied[i].citta + "</small></p>" +
                            "<p class=\"card-text my-2\"><small class=\"text-muted\">" + Convert.ToDateTime(deserialzied[i].dataInizio).Date.ToString("dd/MM/yyyy") + "</small></p>" +
                            "</div>" +
                            "</div>" +
                            "</div>");
                    }
                    //Append the HTML string to Placeholder.
                    inCorso.Controls.Add(new Literal { Text = table.ToString() });
                }
            }
            else if (Session["ruolo"].ToString() == "Allenatore")
            {
                var client = new RestClient("https://aibvcapi.azurewebsites.net/api/v1/allenatori/TorneiInCorso/" + Session["idUtente"]);
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
                    inCorso.Controls.Add(new Literal { Text = table.ToString() });
                    for (int i = 0; i < deserialzied.Count; i++)
                    {
                        table.Append("<div class=\"col-sm-12 col-md-3 my-2\">" +
                            "<div id=\"" + deserialzied[i].idTorneo + "\" class=\"card\" onclick=\"javascript:DivClicked(" + deserialzied[i].idTorneo + "); return true;\">" +
                            "<img class=\"card-img-top\" src=\"Img/sand.jpg\" alt=\"Card image cap\">" +
                            "<div class=\"card-body\">" +
                            "<h5 class=\"card-title\">" + deserialzied[i].titolo + "</h5>" +
                            "<p class=\"card-text my-2\">" + deserialzied[i].atleta1 + "-" + deserialzied[i].atleta2 + "</p>" +
                            "<p class=\"card-text my-2\"><small class=\"text-muted\">" + deserialzied[i].citta + "</small></p>" +
                            "<p class=\"card-text my-2\"><small class=\"text-muted\">" + Convert.ToDateTime(deserialzied[i].dataInizio).Date.ToString("dd/MM/yyyy") + "</small></p>" +
                            "</div>" +
                            "</div>" +
                            "</div>");
                    }
                    //Append the HTML string to Placeholder.
                    inCorso.Controls.Add(new Literal { Text = table.ToString() });
                }
            }
            else Response.Redirect("OutputTornei.aspx"); //rimanda alla form 'output tornei'
        }
        protected void DownloadDataTorneiFiniti()
        {
            if (Session["ruolo"].ToString() == "Atleta")
            {
                var client = new RestClient("https://aibvcapi.azurewebsites.net/api/v1/tornei/ToreniFiniti/" + Session["idUtente"]);
                client.Timeout = -1;
                var request = new RestRequest(Method.GET);
                request.AddHeader("Authorization", "Bearer " + token);
                request.AddHeader("Cookie", "ARRAffinity=e7fc3e897f5be57469671ac828c06570ef8d3ea8fb2416293fd2acc3f67e0ee6; ARRAffinitySameSite=e7fc3e897f5be57469671ac828c06570ef8d3ea8fb2416293fd2acc3f67e0ee6; ruolo=Atleta");
                IRestResponse response = client.Execute(request);
                dynamic deserialzied = JsonConvert.DeserializeObject(response.Content);
                if (deserialzied != null)
                {
                    StringBuilder table = new StringBuilder();
                    table.Clear();
                    finiti.Controls.Add(new Literal { Text = table.ToString() });
                    for (int i = 0; i < deserialzied.Count; i++)
                    {
                        table.Append("<div class=\"col-sm-12 col-md-3 my-2\">" +
                            "<div id=\"" + deserialzied[i].idTorneo + "\" class=\"card\" onclick=\"javascript:DivClicked(" + deserialzied[i].idTorneo + "); return true;\">" +
                            "<img class=\"card-img-top\" src=\"Img/sand.jpg\" alt=\"Card image cap\">" +
                            "<div class=\"card-body\">" +
                            "<h5 class=\"card-title\">" + deserialzied[i].titolo + "</h5>" +
                            "<p class=\"card-text my-2\">" + deserialzied[i].atleta1 + "-" + deserialzied[i].atleta2 + "</p>" +
                            "<p class=\"card-text my-2\"><small class=\"text-muted\">" + deserialzied[i].citta + "</small></p>" +
                            "<p class=\"card-text my-2\"><small class=\"text-muted\">" + Convert.ToDateTime(deserialzied[i].dataInizio).Date.ToString("dd/MM/yyyy") + "</small></p>" +
                            "</div>" +
                            "</div>" +
                            "</div>");
                    }
                    //Append the HTML string to Placeholder.
                    finiti.Controls.Add(new Literal { Text = table.ToString() });
                }
            }
            else if (Session["ruolo"].ToString() == "Allenatore")
            {
                var client = new RestClient("https://aibvcapi.azurewebsites.net/api/v1/allenatori/TorneiFiniti/" + Session["idUtente"]);
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
                    finiti.Controls.Add(new Literal { Text = table.ToString() });
                    for (int i = 0; i < deserialzied.Count; i++)
                    {
                        table.Append("<div class=\"col-sm-12 col-md-3 my-2\">" +
                            "<div id=\"" + deserialzied[i].idTorneo + "\" class=\"card\" onclick=\"javascript:DivClicked(" + deserialzied[i].idTorneo + "); return true;\">" +
                            "<img class=\"card-img-top\" src=\"Img/sand.jpg\" alt=\"Card image cap\">" +
                            "<div class=\"card-body\">" +
                            "<h5 class=\"card-title\">" + deserialzied[i].titolo + "</h5>" +
                            "<p class=\"card-text my-2\">" + deserialzied[i].atleta1 + "-" + deserialzied[i].atleta2 + "</p>" +
                            "<p class=\"card-text my-2\"><small class=\"text-muted\">" + deserialzied[i].citta + "</small></p>" +
                            "<p class=\"card-text my-2\"><small class=\"text-muted\">" + Convert.ToDateTime(deserialzied[i].dataInizio).Date.ToString("dd/MM/yyyy") + "</small></p>" +
                            "</div>" +
                            "</div>" +
                            "</div>");
                    }
                    //Append the HTML string to Placeholder.
                    finiti.Controls.Add(new Literal { Text = table.ToString() });
                }
            }
            else Response.Redirect("OutputTornei.aspx"); //rimanda alla form 'output tornei'
        }

        protected void clickArea_Click(object sender, EventArgs e)
        {
            Session["IdTorneo"] = HiddenField1.Value;
            Response.Redirect("EliminaTorneo.aspx"); //rimanda alla form 'output tornei'
        }
    }
}