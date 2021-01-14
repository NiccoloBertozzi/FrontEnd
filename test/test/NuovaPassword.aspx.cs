using Newtonsoft.Json;
using RestSharp;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using test.Models;

namespace test
{
    public partial class NuovaPassword : System.Web.UI.Page
    {
        string email;
        protected void Page_Load(object sender, EventArgs e)
        {
            //scarico l'email criptata
            if (!this.IsPostBack)
            {
                email = Request.Params["email"];
                //salvo nella sessione per non perdere il valore durante il PostBack
                Session["email"] = email;
                risultato.Text = email;
            }
            else
                email = Session["email"].ToString();
        }

        protected void btn_nuovaPassword_Click(object sender, EventArgs e)
        {
            if (PWD.Text.Length <= 20)
            {
                //-------------CHIAMATA API----------------
                var client = new RestClient("https://aibvcapi.azurewebsites.net/api/v1/LoginRegister/CambiaPsw");
                client.Timeout = -1;
                var request = new RestRequest(Method.PUT);
                request.AddHeader("Content-Type", "application/json");
                request.AddHeader("Cookie", "ARRAffinity=e7fc3e897f5be57469671ac828c06570ef8d3ea8fb2416293fd2acc3f67e0ee6; ARRAffinitySameSite=e7fc3e897f5be57469671ac828c06570ef8d3ea8fb2416293fd2acc3f67e0ee6");
                request.AddParameter("application/json", "{\r\n  \"email\": \"" + email + "\",\r\n  \"password\": \"" + PWD.Text + "\"\r\n}", ParameterType.RequestBody);
                IRestResponse response = client.Execute(request);
                if (response.StatusCode == HttpStatusCode.OK)
                {
                    //-------------CHIAMATA API----------------
                    var clientLogin = new RestClient("https://aibvcapi.azurewebsites.net/api/v1/LoginRegister/Login");
                    clientLogin.Timeout = -1;
                    var requestLogin = new RestRequest(Method.POST);
                    requestLogin.AddHeader("Content-Type", "application/json");
                    requestLogin.AddHeader("Cookie", "ARRAffinity=aabe420e4783a6118a9a1427c97a8517a6f227fb2599a8749b4c88f4b53ca222; ARRAffinitySameSite=aabe420e4783a6118a9a1427c97a8517a6f227fb2599a8749b4c88f4b53ca222");
                    requestLogin.AddParameter("application/json", "{\r\n  \"email\": \"" + email + "\",\r\n  \"password\": \"" + PWD.Text + "\"\r\n}", ParameterType.RequestBody);
                    IRestResponse responseLogin = clientLogin.Execute(requestLogin);
                    if (responseLogin.StatusCode == HttpStatusCode.OK)
                    {
                        var contenutoLogin = JsonConvert.DeserializeObject<getToken>(responseLogin.Content);
                        Response.Redirect("OutputTornei.aspx?token=" + contenutoLogin.token); //rimanda alla form 'output tornei'
                    }
                    else
                        risultato.Text = responseLogin.ErrorMessage;
                    //------------------------------------------
                }
                else
                    risultato.Text = response.ErrorMessage;
                //------------------------------------------
            }
            else
            {
                errore.Text = "Assicurati che password abbia una lunghezza inferiore ai 20 caratteri";
            }
        }
    }
}