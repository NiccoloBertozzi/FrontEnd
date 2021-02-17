using Newtonsoft.Json;
using RestSharp;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace test
{
    public partial class ModificaInfoTorneo : System.Web.UI.Page
    {
        string token;
        int idTorneo;

        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (string.IsNullOrEmpty(Session["Token"] as string))
            {
                if (Session["ruolo"].ToString() == "Atleta") Response.Redirect("OutputTornei.aspx");
                if (Session["ruolo"].ToString() == "Admin" || Session["ruolo"].ToString() == "Delegato") Response.Redirect("OutputTornei.aspx");
                token = Session["Token"].ToString();
                idTorneo = Convert.ToInt32(Request.QueryString["id"]);

                if (!this.IsPostBack)
                    DownloadInfoTorneo(idTorneo);
            }
            else Response.Redirect("OutputTornei.aspx");
        }
        protected void DownloadInfoTorneo(int idTorneo)
        {
            /*API da cambiare */
            var client = new RestClient("https://aibvcapi.azurewebsites.net/api/v1/GetTorneoByID/" + idTorneo);
            client.Timeout = -1;
            var request = new RestRequest(Method.GET);
            request.AddHeader("Authorization", "Bearer  " + token + "");
            request.AddHeader("Cookie", "ARRAffinity=e7fc3e897f5be57469671ac828c06570ef8d3ea8fb2416293fd2acc3f67e0ee6; ARRAffinitySameSite=e7fc3e897f5be57469671ac828c06570ef8d3ea8fb2416293fd2acc3f67e0ee6; ruolo=Societa");
            IRestResponse response = client.Execute(request);
            //deserializza il risultato ritornato
            dynamic deserialized = JsonConvert.DeserializeObject(response.Content);
            if (deserialized != null)
            {
                if (deserialized[0].gender.ToString() == "F") femmina.Checked = true;
                for (int i = 0; i < deserialized.Count; i++)
                {
                    titolo.Text = deserialized[i].titolo;
                    tipoTorneo.Text = deserialized[i].tipoTorneo;
                    formula.Text = deserialized[i].formula;
                    quotaIscrizione.Text = deserialized[i].quotaIscrizione;
                    puntiVittoria.Text = deserialized[i].puntiVittoria ;
                    montepremi.Text = deserialized[i].montepremi;
                    dataInizio.Text = deserialized[i].dataInizio;
                    dataFine.Text = deserialized[i].dataFine;
                    nomeImpianto.Text = deserialized[i].nomeImpianto;
                    citta.Text = deserialized[i].citta;
                }
            }

        }
        protected void ModificaInfoTorneo_Click(object sender, EventArgs e)
        {
           //manca API ModificaInfoTorneo
        }
    }
}