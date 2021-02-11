using Newtonsoft.Json;
using RestSharp;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
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
            if (string.IsNullOrEmpty(Session["Token"] as string))
            {
                if (Session["ruolo"].ToString() == "Atleta") Response.Redirect("ModificaAnagraficaAtleta.aspx");
            if (Session["ruolo"].ToString() == "Societa") Response.Redirect("ModificaAnagraficaSocieta.aspx"); 
            token = Session["Token"].ToString();
            idDelegato = Convert.ToInt32(Session["idUtente"]);
            if (!this.IsPostBack) DownloadDelegato();
            }
            else Response.Redirect("OutputTornei.aspx");
        }
        protected void DownloadDelegato()
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
                if (deserialzied[0].arbitro.ToString() == "True") arbitro.Checked = true;
                if (deserialzied[0].supervisore.ToString() == "True") supervisore.Checked = true;
                for (int i = 0; i < deserialzied.Count; i++)
                {
                    nome.Text = deserialzied[i].nome;
                    cognome.Text = deserialzied[i].cognome;
                    cf.Text = deserialzied[i].cf;
                    dataNascita.Text = deserialzied[i].dataNascita.ToString().Split(' ')[0];
                    comuneNascita.Text = deserialzied[i].comuneNascita;
                    comuneResidenza.Text = deserialzied[i].comuneResidenza;
                    indirizzo.Text = deserialzied[i].indirizzo;
                    cap.Text = deserialzied[i].cap;
                    email.Text = deserialzied[i].email;
                    tel.Text = deserialzied[i].tel;
                    codiceTessera.Text = deserialzied[i].codiceTessera;
                }
            }
        }
        protected void ModificaAnagrafica_Click(object sender, EventArgs e)
        {
            string sesso = "M";
            int arbitroC = 0, supervisoreC = 0;
            if (femmina.Checked) sesso = "F";
            if (arbitro.Checked) arbitroC = 1;
            if (supervisore.Checked) supervisoreC = 1;
            var client = new RestClient("https://aibvcapi.azurewebsites.net/api/v1/LoginRegister/UpdateDelegatoTecnico");
            client.Timeout = -1;
            var request = new RestRequest(Method.PUT);
            request.AddHeader("Authorization", "Bearer " + token);
            request.AddHeader("Content-Type", "application/json");
            request.AddHeader("Cookie", "ARRAffinity=e7fc3e897f5be57469671ac828c06570ef8d3ea8fb2416293fd2acc3f67e0ee6; ARRAffinitySameSite=e7fc3e897f5be57469671ac828c06570ef8d3ea8fb2416293fd2acc3f67e0ee6; ruolo=Admin");
            request.AddParameter("application/json", "{\r\n  \"delegato\": {\r\n    \"idDelegato\": "+idDelegato+",\r\n    \"nome\": \"" + nome.Text + "\",\r\n    \"cognome\": \""+cognome.Text+"\",\r\n    \"sesso\": \""+sesso+"\",\r\n    \"cf\": \""+cf.Text+"\",\r\n    \"dataNascita\": \""+Convert.ToDateTime(dataNascita.Text)+"\",\r\n \"indirizzo\": \""+indirizzo.Text+"\",\r\n    \"cap\": \""+cap.Text+"\",\r\n    \"email\": \""+email.Text+"\",\r\n    \"tel\": \""+tel.Text+"\",\r\n    \"arbitro\": "+arbitroC+",\r\n    \"supervisore\": "+supervisoreC+",\r\n    \"codiceTessera\": \""+codiceTessera.Text+"\"\r\n  },\r\n  \"comuneNascita\": \""+comuneNascita.Text+"\",\r\n  \"comuneResidenza\": \""+comuneResidenza.Text+"\"\r\n}", ParameterType.RequestBody);
            IRestResponse response = client.Execute(request);
            if (response.StatusCode == HttpStatusCode.OK) Response.Redirect("AnagraficaDelegato.aspx");
            else Response.Write("<script>alert('"+ response.Content +"');</script>");
        }
    }
}