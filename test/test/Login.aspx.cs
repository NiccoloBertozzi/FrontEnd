using Newtonsoft.Json;
using RestSharp;
using System;
using System.Net;
using System.Web.UI.WebControls;
using System.Web.WebPages;
using test.Models;

namespace test
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["idUtente"] != null)
            {
                Response.Redirect("OutputTornei.aspx"); //rimanda alla form 'output tornei'
            }
        }

        protected void btn_accedi_Click(object sender, EventArgs e)
        {
            if (email.Text.Length <= 50 && PWD.Text.Length <= 30)
            {
                //-------------CHIAMATA API----------------
                var client = new RestClient("https://aibvcapi.azurewebsites.net/api/v1/LoginRegister/Login");
                client.Timeout = -1;
                var request = new RestRequest(Method.POST);
                request.AddHeader("Content-Type", "application/json");
                request.AddHeader("Cookie", "ARRAffinity=aabe420e4783a6118a9a1427c97a8517a6f227fb2599a8749b4c88f4b53ca222; ARRAffinitySameSite=aabe420e4783a6118a9a1427c97a8517a6f227fb2599a8749b4c88f4b53ca222");
                request.AddParameter("application/json", "{\r\n  \"email\": \"" + email.Text + "\",\r\n  \"password\": \"" + PWD.Text + "\"\r\n}", ParameterType.RequestBody);
                IRestResponse response = client.Execute(request);
                if (response.StatusCode == HttpStatusCode.OK)
                {
                    //scarico il cookie del ruolo e lo salvo
                    Session["ruolo"] = response.Cookies[0].Value.ToString();
                    dynamic deserialzied = JsonConvert.DeserializeObject(response.Content);
                    Session["IdUtente"] = deserialzied.id;
                    string x = deserialzied.token;
                    if (x != "") x = "";
                    Session["Token"] = deserialzied.token;
                    Response.Redirect("OutputTornei.aspx"); //rimanda alla form 'output tornei'
                }
                else
                {
                    Response.Write("<script>alert('Dati inseriti non coretti');</script>");
                }
                //------------------------------------------
            }
            else
            {
                Response.Write("<script>alert('Completare i Campi');</script>");
            }
        }

        protected void LabelRecovery_Click(object sender, EventArgs e)
        {
            //recupera password
            if (email.Text!="")
            {
                //-------------CHIAMATA API----------------
                var client = new RestClient("https://aibvcapi.azurewebsites.net/api/v1/LoginRegister/RecuperaPassword");
                client.Timeout = -1;
                var request = new RestRequest(Method.POST);
                request.AddHeader("Content-Type", "application/json");
                request.AddParameter("application/json", "{\r\n  \"email\": \"" + email.Text + "\",\r\n  \"password\": \"\"\r\n}", ParameterType.RequestBody);
                IRestResponse response = client.Execute(request);
                if (response.StatusCode == HttpStatusCode.OK)
                {
                    Response.Write("<script>alert('Mail inviata');</script>");
                }
                else
                Response.Write("<script>alert('"+ response.ErrorMessage + "');</script>");
                //------------------------------------------
            }
            else
            {
                Response.Write("<script>alert('Inserire l'email');</script>");
            }
        }
    }
}