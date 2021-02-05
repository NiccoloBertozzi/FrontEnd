using Newtonsoft.Json;
using RestSharp;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace test
{
    public partial class ModificaAnagraficaDelegato : System.Web.UI.Page
    {
        string token;
        int idDelegato;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["ruolo"].ToString() == "Atleta") Response.Redirect("ModificaAnagraficaAtleta.aspx");
            if (Session["ruolo"].ToString() == "Societa") Response.Redirect("ModificaAnagraficaSocieta.aspx"); 
            token = Session["Token"].ToString();
            idDelegato = Convert.ToInt32(Session["idUtente"]);
            if (!this.IsPostBack)
                DownloadSocieta();
        }
        protected void DownloadSocieta()
        {
            var client = new RestClient("https://aibvcapi.azurewebsites.net/api/v1/GetAnagraficaDelegato/" + idDelegato);
            client.Timeout = -1;
            var request = new RestRequest(Method.GET);
            request.AddHeader("Authorization", "Bearer " + token);
            request.AddHeader("Cookie", "ARRAffinity=e7fc3e897f5be57469671ac828c06570ef8d3ea8fb2416293fd2acc3f67e0ee6; ARRAffinitySameSite=e7fc3e897f5be57469671ac828c06570ef8d3ea8fb2416293fd2acc3f67e0ee6; ruolo=Admin");
            IRestResponse response = client.Execute(request);
            //deserializza il risultato ritornato
            dynamic deserialzied = JsonConvert.DeserializeObject(response.Content);
            if (deserialzied != null)
            {
                if (deserialzied[0].sesso == "F")
                {
                    maschio.Checked = false;
                    femmina.Checked = true;
                }
                if (deserialzied[0].arbitro) arbitro.Checked = true;
                if (deserialzied[0].supervisore) supervisore.Checked = true;
                for (int i = 0; i < deserialzied.Count; i++)
                {
                    nome.Text = deserialzied[i].nome;
                    indirizzo.Text = deserialzied[i].cognome;
                    cf.Text = deserialzied[i].cf;
                    dataNascita.Text = deserialzied[i].dataNascita;
                    indirizzo.Text = deserialzied[i].indirizzo;
                    cap.Text = deserialzied[i].cap;
                    email.Text = deserialzied[i].email;
                    tel.Text = deserialzied[i].tel;
                    codiceTessera.Text = deserialzied[i].codiceTessera;
                }
            }
        }
    }
        protected void ModificaAnagrafica_Click(object sender, EventArgs e)
        {

        }
    }
}