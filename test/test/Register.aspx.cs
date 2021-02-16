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
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) DownloadComuni();
        }
        protected void DownloadComuni()
        {
            var client = new RestClient("http://aibvcapi.azurewebsites.net/api/v1/gestionale/GetComuni");
            client.Timeout = -1;
            var request = new RestRequest(Method.GET);
            request.AddHeader("Cookie", "ARRAffinity=e7fc3e897f5be57469671ac828c06570ef8d3ea8fb2416293fd2acc3f67e0ee6");
            IRestResponse response = client.Execute(request);
            dynamic deserialzied = JsonConvert.DeserializeObject(response.Content);
            if (deserialzied != null)
            {
                cbComNasc.Items.Insert(0, new ListItem(string.Empty, string.Empty));
                cbComRes.Items.Insert(0, new ListItem(string.Empty, string.Empty));
                cbComResSoc.Items.Insert(0, new ListItem(string.Empty, string.Empty));
                for (int i = 0; i < deserialzied.Count; i++)
                {
                    cbComNasc.Items.Add(new ListItem(Convert.ToString(deserialzied[i].citta), Convert.ToString(deserialzied[i].idComune)));
                    cbComRes.Items.Add(new ListItem(Convert.ToString(deserialzied[i].citta), Convert.ToString(deserialzied[i].idComune)));
                    cbComResSoc.Items.Add(new ListItem(Convert.ToString(deserialzied[i].citta), Convert.ToString(deserialzied[i].idComune)));
                }
            }
            client = new RestClient("http://aibvcapi.azurewebsites.net/api/v1/societa/GetAllSocieta");
            client.Timeout = -1;
            request = new RestRequest(Method.GET);
            request.AddHeader("Cookie", "ARRAffinity=e7fc3e897f5be57469671ac828c06570ef8d3ea8fb2416293fd2acc3f67e0ee6");
            response = client.Execute(request);
            deserialzied = JsonConvert.DeserializeObject(response.Content);
            if (deserialzied != null)
            {
                cbNomeSocietaAllenatore.Items.Insert(0, new ListItem(string.Empty, string.Empty));
                cbNomeSocietaAtleta.Items.Insert(0, new ListItem(string.Empty, string.Empty));
                for (int i = 0; i < deserialzied.Count; i++)
                {
                    cbNomeSocietaAllenatore.Items.Add(new ListItem(Convert.ToString(deserialzied[i].nomeSocieta), Convert.ToString(deserialzied[i].idSocieta)));
                    cbNomeSocietaAtleta.Items.Add(new ListItem(Convert.ToString(deserialzied[i].nomeSocieta), Convert.ToString(deserialzied[i].idSocieta)));
                }
            }
        }
        protected void cbComRes_TextChanged(object sender, EventArgs e)
        {
            Session["comResidenza"] = cbComRes.SelectedItem.Text;
        }
        protected void cbComNasc_TextChanged(object sender, EventArgs e)
        {
            Session["comNascita"] = cbComNasc.SelectedItem.Text;
        }
        protected void cbComResSoc_TextChanged(object sender, EventArgs e)
        {
            Session["comResidenza"] = cbComResSoc.SelectedItem.Text;
        }
        protected void nomeSocietaAtleta_TextChanged(object sender, EventArgs e)
        {
            Session["nomeSocieta"] = cbNomeSocietaAtleta.SelectedItem.Text;
        }
        protected void cbNomeSocietaAllenatore_TextChanged(object sender, EventArgs e)
        {
            Session["nomeSocieta"] = cbNomeSocietaAllenatore.SelectedItem.Text;
        }
        protected void btn_register_Click(object sender, EventArgs e)
        {
            string role = Request.QueryString["ruolo"];
            object parameter = "";
            if (role == "Atleta")
                parameter = "{\r\n  \"atleta\": {\r\n";
            else if (role == "Allenatore")
                parameter = "{\r\n  \"allenatore\": {\r\n";
            else if (role == "Delegato")
                parameter = "{\r\n  \"delegato\": {\r\n";
            else if (role == "Societa")
            {
                Session["nomeSocieta"] = nomeSocieta.Text;
                parameter = "{\r\n  \"societa\": {\r\n";
            }
            bool check_sesso = false;//controlla se arrivato il sesso
            bool check_ruolo = false;//controlla se arrivato il ruolo
            foreach (Control c in formregister.Controls)//Controllo se tutte le textbox sono riempite
            {
                if (c is TextBox)
                {
                    TextBox textBox = c as TextBox;
                    if (textBox.Text != string.Empty && textBox.ID != "password")//Creo object body
                        parameter += " \"" + textBox.ID + "\": \"" + textBox.Text + "\",\r\n";
                }
                else if (c is RadioButton)//sesso
                {
                    RadioButton radioButton = c as RadioButton;
                    if (sesso1.Checked == true && !check_sesso)//controllo sesso
                    { parameter += " \"sesso\": \"M\",\r\n"; check_sesso = !check_sesso; }
                    else if (sesso2.Checked == true && !check_sesso)
                    { parameter += " \"sesso\": \"F\",\r\n"; check_sesso = !check_sesso; }
                    if (role == "Delegato")
                    {
                        if (supervisore.Checked == true && !check_ruolo)//controllo ruolo
                        { parameter += " \"supervisore\": \"true\",\r\n"; check_ruolo = !check_ruolo; }
                        else if (arbitro.Checked == true && !check_ruolo)
                        { parameter += " \"aribtro\": \"true\",\r\n"; check_ruolo = !check_ruolo; }
                    }
                }
            }
            parameter = parameter.ToString().Substring(0, parameter.ToString().Length - 3);//elimino ultimi 3 caratteri
            parameter += "},\r\n  \"cred\": {\r\n \"" + password.ID + "\": \"" + password.Text + "\",\r\n";
            if (role == "Atleta" || role == "Allenatore") parameter += "\"nomeSocieta\":\"" + Session["nomeSocieta"].ToString() + "\",\r\n";
            parameter += "\"comuneNascita\":\"" + Session["comNascita"].ToString() + "\",\r\n\"comuneResidenza\":\"" + Session["comResidenza"].ToString() + "\"\r\n}\r\n}";
            var client = new RestClient();
            //----------------------Registrazione-------------------------//
            if (role == "Atleta")
                client = new RestClient("https://aibvcapi.azurewebsites.net/api/v1/LoginRegister/RegistraAtleta");
            else if (role == "Allenatore")
                client = new RestClient("https://aibvcapi.azurewebsites.net/api/v1/LoginRegister/RegistraAllenatore");
            else if (role == "Delegato")
                client = new RestClient("https://aibvcapi.azurewebsites.net/api/v1/LoginRegister/RegistraDelegato");
            client.Timeout = -1;
            var request = new RestRequest(Method.POST);
            request.AddHeader("Content-Type", "application/json");
            request.AddParameter("application/json", parameter, ParameterType.RequestBody);
            IRestResponse response = client.Execute(request);
            if (response.StatusCode == HttpStatusCode.OK)
            {
                Response.Redirect("Login.aspx"); //rimanda alla form 'output tornei'
            }
            //------------------------------------------------------------//
        }


    }
}