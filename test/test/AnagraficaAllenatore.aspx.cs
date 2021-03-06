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
    public partial class AnagraficaAllenatore : System.Web.UI.Page
    {
        string token;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(Session["Token"] as string))
            {
                if (Session["ruolo"].ToString() == "Admin" || Session["ruolo"].ToString() == "Delegato") Response.Redirect("AnagraficaDelegato.aspx");
                if (Session["ruolo"].ToString() == "Societa") Response.Redirect("AnagraficaSocieta.aspx");
                if (Session["ruolo"].ToString() == "Atleta") Response.Redirect("AnagraficaAtleta.aspx");
                token = Session["Token"].ToString();
                int idAllenatore = Convert.ToInt32(Session["idUtente"]);
                DownloadAnagrafica(idAllenatore);
            }
            else Response.Redirect("OutputTornei.aspx");
        }
        protected void DownloadAnagrafica(int idAllenatore)
        {
            var client = new RestClient("https://aibvcapi.azurewebsites.net/api/v1/allenatori/GetAnagraficaAllenatore/" + idAllenatore);
            client.Timeout = -1;
            var request = new RestRequest(Method.GET);
            request.AddHeader("Authorization", "Bearer " + token);
            request.AddHeader("Cookie", "ARRAffinity=e7fc3e897f5be57469671ac828c06570ef8d3ea8fb2416293fd2acc3f67e0ee6; ARRAffinitySameSite=e7fc3e897f5be57469671ac828c06570ef8d3ea8fb2416293fd2acc3f67e0ee6; ruolo=Allenatore");
            IRestResponse response = client.Execute(request);
            //deserializza il risultato ritornato
            dynamic deserialzied = JsonConvert.DeserializeObject(response.Content);
            if (deserialzied != null)
            {
                StringBuilder table = new StringBuilder();
                table.Clear();
                anagraficaAllenatore.Controls.Add(new Literal { Text = table.ToString() });
                for (int i = 0; i < 14; i++)
                {
                    table.Append("" +
                        "<div class='row mt-3'>" +
                        getLabel(i) +
                        getText(deserialzied, i) +
                        "</div>"
                        );
                }
                //Append the HTML string to Placeholder.
                anagraficaAllenatore.Controls.Add(new Literal { Text = table.ToString() });
            }
        }
        protected void ModificaAnagrafica_Click(object sender, EventArgs e)
        {
            Response.Redirect("ModificaAnagraficaAllenatore.aspx"); 
        }
        protected string getLabel(int c)
        {
            string[] testi = { "Nome:", "Cognome:", "Codice Tessera:", "Nome Societa:", "Sesso:", "CF:", "Data di Nascita:", "Comune di Nascita:", "Comune di Residenza:", "Indirizzo:", "Codice Postale (CAP):", "Email:", "Telefono:", "Grado:" };
            return ("<label class='col-md-4 offset-md-2 my-auto'>" + testi[c] + "</label>");
        }

        protected string getText(dynamic data, int c)
        {
            switch (c)
            {
                case 0:
                    return "<p class='col-md-4 my-auto'>" + data[0].nome + "</p>";
                case 1:
                    return "<p class='col-md-4 my-auto'>" + data[0].cognome + "</p>";
                case 2:
                    return "<p class='col-md-4 my-auto'>" + data[0].codiceTessera + "</p>";
                case 3:
                    return "<p class='col-md-4 my-auto'>" + data[0].nomeSocieta + "</p>";
                case 4:
                    return "<p class='col-md-4 my-auto'>" + data[0].sesso + "</p>";
                case 5:
                    return "<p class='col-md-4 my-auto'>" + data[0].cf + "</p>";
                case 6:
                    return "<p class='col-md-4 my-auto'>" + data[0].dataNascita.ToString().Split(' ')[0] + "</p>";
                case 7:
                    return "<p class='col-md-4 my-auto'>" + data[0].comuneNascita + "</p>";
                case 8:
                    return "<p class='col-md-4 my-auto'>" + data[0].comuneResidenza + "</p>";
                case 9:
                    return "<p class='col-md-4 my-auto'>" + data[0].indirizzo + "</p>";
                case 10:
                    return "<p class='col-md-4 my-auto'>" + data[0].cap + "</p>";
                case 11:
                    return "<p class='col-md-4 my-auto'>" + data[0].email + "</p>";
                case 12:
                    return "<p class='col-md-4 my-auto'>" + data[0].tel + "</p>";
                case 13:
                    return "<p class='col-md-4 my-auto'>" + data[0].grado + "</p>";
            }
            return "Error getText";
        }
    }
}