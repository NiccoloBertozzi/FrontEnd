﻿using Newtonsoft.Json;
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
    public partial class VisualizzaTorneiAtleta : System.Web.UI.Page
    {
        string token;
        int idAtleta;
        public void Page_Load(object sender, EventArgs e)
        {
            idAtleta = int.Parse(Session["IdUtente"].ToString());
            token = Session["Token"].ToString();
            if (!this.IsPostBack)
            {
                DownloadTornei(token);
            }
        }
        protected void DownloadTornei(string token)
        {
            var client = new RestClient("https://aibvcapi.azurewebsites.net/api/v1/atleti/Iscrizioni/1");
            client.Timeout = -1;
            var request = new RestRequest(Method.GET);
            request.AddHeader("Authorization", "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6ImxvcmVuem9yaWdvbmlAZ21haWwuY29tIiwicm9sZSI6WyJEZWxlZ2F0byIsIkFkbWluRGVsZWdhdG8iLCJBZG1pbiJdLCJuYmYiOjE2MTE5MDkxMTYsImV4cCI6MTYxMTkxMDMxNiwiaWF0IjoxNjExOTA5MTE2fQ.4X052Us3uECYjL4oYUiNLOlgc1ZecV9HYcf32s5V0Is");
            request.AddHeader("Cookie", "ARRAffinity=e7fc3e897f5be57469671ac828c06570ef8d3ea8fb2416293fd2acc3f67e0ee6; ARRAffinitySameSite=e7fc3e897f5be57469671ac828c06570ef8d3ea8fb2416293fd2acc3f67e0ee6; ruolo=Admin");
            IRestResponse response = client.Execute(request);
            Console.WriteLine(response.Content);
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
                        "<p class=\"card-text my-2\">€" + deserialzied[i].montepremi + "</p>" +
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
        protected void clickArea_Click(object sender, EventArgs e)
        {
            Session["IdTorneo"] = HiddenField1.Value;
            Response.Redirect("AutorizzaTorneo.aspx"); //rimanda alla form 'output tornei'
        }
    }
}