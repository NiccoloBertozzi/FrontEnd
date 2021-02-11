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
	public partial class ModificaAnagraficaAtleta : System.Web.UI.Page
	{
        string token;
        int idAtleta;
        protected void Page_Load(object sender, EventArgs e)
		{
            if (string.IsNullOrEmpty(Session["Token"] as string))
            {
                if (Session["ruolo"].ToString() == "Admin" || Session["ruolo"].ToString() == "Delegato") Response.Redirect("ModificaAnagraficaDelegato.aspx");
			if (Session["ruolo"].ToString() == "Societa") Response.Redirect("ModificaAnagraficaSocieta.aspx");
            token = Session["Token"].ToString();
            idAtleta = Convert.ToInt32(Session["idUtente"]);
            if (!this.IsPostBack) DownloadAtleta();
            }
            else Response.Redirect("OutputTornei.aspx");
        }
        protected void DownloadAtleta()
        {
            var client = new RestClient("https://aibvcapi.azurewebsites.net/api/v1/atleti/GetAnagraficaAtleta/" + idAtleta);
            client.Timeout = -1;
            var request = new RestRequest(Method.GET);
            request.AddHeader("Authorization", "Bearer " + token);
            request.AddHeader("Cookie", "ruolo=Admin; ARRAffinity=e7fc3e897f5be57469671ac828c06570ef8d3ea8fb2416293fd2acc3f67e0ee6; ARRAffinitySameSite=e7fc3e897f5be57469671ac828c06570ef8d3ea8fb2416293fd2acc3f67e0ee6");
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
                for (int i = 0; i < deserialzied.Count; i++)
                {
                    codTessera.Text = deserialzied[i].codiceTessera;
                    nomeSocieta.Text = deserialzied[i].nomeSocieta;
                    nomee.Text = deserialzied[i].nome;
                    cognomee.Text = deserialzied[i].cognome;
                    cf.Text = deserialzied[i].cf;
                    dataNascita.Text = deserialzied[i].dataNascita.ToString().Split(' ')[0];
                    comuneNascita.Text = deserialzied[i].comuneNascita;
                    comuneResidenza.Text = deserialzied[i].comuneResidenza;
                    indirizzo.Text = deserialzied[i].indirizzo;
                    cap.Text = deserialzied[i].cap;
                    email.Text = deserialzied[i].email;
                    tel.Text = deserialzied[i].tel;
                    altezza.Text = deserialzied[i].altezza;
                    peso.Text = deserialzied[i].peso;
                    scadCertificato.Text = deserialzied[i].dataScadenzaCertificato;
                }
            }
        }
        protected void ModificaAnagrafica_Click(object sender, EventArgs e)
		{
            string sessoSelezionato = "M";
            if (femmina.Checked) sessoSelezionato = "F";
            var client = new RestClient("https://aibvcapi.azurewebsites.net/api/v1/LoginRegister/UpdateAtleta");
            client.Timeout = -1;
            var request = new RestRequest(Method.PUT);
            request.AddHeader("Authorization", "Bearer " + token);
            request.AddHeader("Content-Type", "application/json");
            request.AddHeader("Cookie", "ARRAffinity=e7fc3e897f5be57469671ac828c06570ef8d3ea8fb2416293fd2acc3f67e0ee6; ARRAffinitySameSite=e7fc3e897f5be57469671ac828c06570ef8d3ea8fb2416293fd2acc3f67e0ee6; ruolo=Atleta");
            request.AddParameter("application/json", "{\r\n  \"atleta\": {\r\n    \"idAtleta\": "+idAtleta+",\r\n    \"codiceTessera\": \""+codTessera.Text+"\",\r\n    \"nome\": \""+nomee.Text+"\",\r\n    \"cognome\": \""+cognomee.Text+"\",\r\n    \"sesso\": \""+sessoSelezionato+"\",\r\n    \"cf\": \""+cf.Text+"\",\r\n    \"dataNascita\": \""+ Convert.ToDateTime(dataNascita.Text)+"\",\r\n    \"indirizzo\": \""+indirizzo.Text+"\",\r\n    \"cap\": \""+cap.Text+"\",\r\n    \"email\": \""+email.Text+"\",\r\n    \"tel\": \""+tel.Text+"\",\r\n    \"altezza\": "+altezza.Text+",\r\n    \"peso\": "+peso.Text+ ",\r\n    \"dataScadenzaCertificato\" : \""+ Convert.ToDateTime(scadCertificato.Text) + "\"\r\n },\r\n  \"comuneNascita\": \"" + comuneNascita.Text+"\",\r\n  \"comuneResidenza\": \""+comuneResidenza.Text+"\",\r\n  \"nomeSocieta\": \""+nomeSocieta.Text+"\"\r\n}", ParameterType.RequestBody);
            IRestResponse response = client.Execute(request);
            if (response.StatusCode == HttpStatusCode.OK) Response.Redirect("AnagraficaAtleta.aspx");
            else Response.Write("<script>alert('" + response.Content + "');</script>");
        }
    }
}