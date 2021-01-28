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
    public partial class TestBench : System.Web.UI.Page
    {
        string token;
        protected void Page_Load(object sender, EventArgs e)
        {
            token = Request.QueryString["token"];
            if (!this.IsPostBack)
            {
                DownloadDelegati(token);
            }
        }

        protected void DownloadDelegati(string token)
        {
            //download Supervisori
            var client = new RestClient("https://aibvcapi.azurewebsites.net/api/v1/GetSupervisori");
            client.Timeout = -1;
            var request = new RestRequest(Method.GET);
            request.AddHeader("Authorization", "Bearer " + token);
            request.AddHeader("Cookie", "ARRAffinity=e7fc3e897f5be57469671ac828c06570ef8d3ea8fb2416293fd2acc3f67e0ee6; ARRAffinitySameSite=e7fc3e897f5be57469671ac828c06570ef8d3ea8fb2416293fd2acc3f67e0ee6; ruolo=Societa");
            IRestResponse response = client.Execute(request);
            dynamic deserialzied = JsonConvert.DeserializeObject(response.Content);
            if (deserialzied != null)
            {
                for (int i = 0; i < deserialzied.Count; i++)
                {
                    cbSupervisori.Items.Add(new ListItem(Convert.ToString(deserialzied[i].delegato), Convert.ToString(deserialzied[i].cf)));
                }
            }
            //download arbitri
            client = new RestClient("https://aibvcapi.azurewebsites.net/api/v1/GetArbitri");
            client.Timeout = -1;
            request = new RestRequest(Method.GET);
            request.AddHeader("Authorization", "Bearer " + token);
            request.AddHeader("Cookie", "ARRAffinity=e7fc3e897f5be57469671ac828c06570ef8d3ea8fb2416293fd2acc3f67e0ee6; ARRAffinitySameSite=e7fc3e897f5be57469671ac828c06570ef8d3ea8fb2416293fd2acc3f67e0ee6; ruolo=Societa");
            response = client.Execute(request);
            deserialzied = JsonConvert.DeserializeObject(response.Content);
            if (deserialzied != null)
            {
                for (int i = 0; i < deserialzied.Count; i++)
                {
                    cbArbitro.Items.Add(new ListItem(Convert.ToString(deserialzied[i].delegato), Convert.ToString(deserialzied[i].cf)));
                }
            }
            //download direttori
            client = new RestClient("https://aibvcapi.azurewebsites.net/api/v1/GetDirettori");
            client.Timeout = -1;
            request = new RestRequest(Method.GET);
            request.AddHeader("Authorization", "Bearer " + token);
            request.AddHeader("Cookie", "ARRAffinity=e7fc3e897f5be57469671ac828c06570ef8d3ea8fb2416293fd2acc3f67e0ee6; ARRAffinitySameSite=e7fc3e897f5be57469671ac828c06570ef8d3ea8fb2416293fd2acc3f67e0ee6; ruolo=Societa");
            response = client.Execute(request);
            deserialzied = JsonConvert.DeserializeObject(response.Content);
            if (deserialzied != null)
            {
                for (int i = 0; i < deserialzied.Count; i++)
                {
                    cbDirettore.Items.Add(new ListItem(Convert.ToString(deserialzied[i].delegato), Convert.ToString(deserialzied[i].cf)));
                }
            }
        }
        
        protected void Supervisore_TextChanged(object sender, EventArgs e)
        {
            //prende supervisore selezionato e scarica id
            if (cbSupervisori.SelectedItem.Value.Length > 11)
            {
                var client = new RestClient("https://aibvcapi.azurewebsites.net/api/v1/GetIDSupervisore/" + cbSupervisori.SelectedItem.Value + "/Nome/" + cbSupervisori.SelectedItem.Text.Split(' ')[0] + "/Cognome/" + cbSupervisori.SelectedItem.Text.Split(' ')[1] + "/");
                client.Timeout = -1;
                var request = new RestRequest(Method.GET);
                request.AddHeader("Authorization", "Bearer "+token+"");
                request.AddHeader("Cookie", "ARRAffinity=e7fc3e897f5be57469671ac828c06570ef8d3ea8fb2416293fd2acc3f67e0ee6; ARRAffinitySameSite=e7fc3e897f5be57469671ac828c06570ef8d3ea8fb2416293fd2acc3f67e0ee6; ruolo=Atleta");
                IRestResponse response = client.Execute(request);
                if (response.Content!="[]")
                {
                    dynamic deserialzied = JsonConvert.DeserializeObject(response.Content);
                    Session["IDSupervisore"] = deserialzied[0].idDelegato;
                    Nomesupervisore.Text = deserialzied[0].delegato + ", " + Session["IDSupervisore"];
                }
            }
        }

        protected void Arbitro_TextChanged(object sender, EventArgs e)
        {
            //prende arbitro selezionato e scarica id
            if (cbArbitro.SelectedItem.Value.Length > 11)
            {
                var client = new RestClient("https://aibvcapi.azurewebsites.net/api/v1/GetIDArbitro/" + cbArbitro.SelectedItem.Value + "/Nome/" + cbArbitro.SelectedItem.Text.Split(' ')[0] + "/Cognome/" + cbArbitro.SelectedItem.Text.Split(' ')[1] + "/");
                client.Timeout = -1;
                var request = new RestRequest(Method.GET);
                request.AddHeader("Authorization", "Bearer " + token + "");
                request.AddHeader("Cookie", "ARRAffinity=e7fc3e897f5be57469671ac828c06570ef8d3ea8fb2416293fd2acc3f67e0ee6; ARRAffinitySameSite=e7fc3e897f5be57469671ac828c06570ef8d3ea8fb2416293fd2acc3f67e0ee6; ruolo=Atleta");
                IRestResponse response = client.Execute(request);
                if (response.Content != "[]")
                {
                    dynamic deserialzied = JsonConvert.DeserializeObject(response.Content);
                    Session["IDArbitro"] = deserialzied[0].idDelegato;
                    Nomearbitro.Text = deserialzied[0].delegato + ", " + Session["IDArbitro"];
                }
            }
        }

        protected void Direttore_TextChanged(object sender, EventArgs e)
        {
            //prende direttore selezionato e scarica id
            if (cbDirettore.SelectedItem.Value.Length > 11)
            {
                var client = new RestClient("https://aibvcapi.azurewebsites.net/api/v1/GetIDDirettore/" + cbDirettore.SelectedItem.Value + "/Nome/" + cbDirettore.SelectedItem.Text.Split(' ')[0] + "/Cognome/" + cbDirettore.SelectedItem.Text.Split(' ')[1] + "/");
                client.Timeout = -1;
                var request = new RestRequest(Method.GET);
                request.AddHeader("Authorization", "Bearer " + token + "");
                request.AddHeader("Cookie", "ARRAffinity=e7fc3e897f5be57469671ac828c06570ef8d3ea8fb2416293fd2acc3f67e0ee6; ARRAffinitySameSite=e7fc3e897f5be57469671ac828c06570ef8d3ea8fb2416293fd2acc3f67e0ee6; ruolo=Atleta");
                IRestResponse response = client.Execute(request);
                if (response.Content != "[]")
                {
                    dynamic deserialzied = JsonConvert.DeserializeObject(response.Content);
                    Session["IDDirettore"] = deserialzied[0].idDelegato;
                    Nomedirettore.Text = deserialzied[0].delegato + ", " + Session["IDDirettore"];
                }
            }
        }

        protected void btnassegnasupervisore_Click(object sender, EventArgs e)
        {
            //assegna delegati al torneo
            var client = new RestClient("https://aibvcapi.azurewebsites.net/api/v1/tornei/AssegnaDelegati");
            client.Timeout = -1;
            var request = new RestRequest(Method.PUT);
            request.AddHeader("Authorization", "Bearer " + token);
            request.AddHeader("Content-Type", "application/json");
            request.AddHeader("Cookie", "ARRAffinity=e7fc3e897f5be57469671ac828c06570ef8d3ea8fb2416293fd2acc3f67e0ee6; ARRAffinitySameSite=e7fc3e897f5be57469671ac828c06570ef8d3ea8fb2416293fd2acc3f67e0ee6");
            request.AddParameter("application/json", "{\r\n    \"IdSupervisore\":" + Session["IDSupervisore"] + ",\r\n    \"IdSupArbitrale\":" + Session["IDArbitro"] + ",\r\n    \"IdDirettore\":" + Session["IDDirettore"] + ",\r\n    \"IdTorneo\":" + Session["IdTorneo"] + "\r\n}", ParameterType.RequestBody);
            IRestResponse response = client.Execute(request);
            if (response.StatusCode == HttpStatusCode.OK)
            {
                Response.Redirect("InfoTorneo.aspx?token=" + token); //rimanda alla form 'output tornei'
            }
        }
    }
}


















