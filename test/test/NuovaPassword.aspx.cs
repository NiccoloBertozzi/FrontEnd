﻿using Newtonsoft.Json;
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
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_nuovaPassword_Click(object sender, EventArgs e)
        {
            if (email.Text.Length <= 50 && PWD.Text.Length <= 20)
            {
                //-------------CHIAMATA API----------------
                var client = new RestClient("https://aibvcapi.azurewebsites.net/api/v1/CambiaPsw");
                client.Timeout = -1;
                var request = new RestRequest(Method.POST);
                request.AddHeader("Content-Type", "application/json");
                request.AddHeader("Cookie", "ARRAffinity=aabe420e4783a6118a9a1427c97a8517a6f227fb2599a8749b4c88f4b53ca222; ARRAffinitySameSite=aabe420e4783a6118a9a1427c97a8517a6f227fb2599a8749b4c88f4b53ca222");
                request.AddParameter("application/json", "{\r\n  \"email\": \"" + email.Text + "\",\r\n  \"password\": \"" + PWD.Text + "\"\r\n}", ParameterType.RequestBody);
                IRestResponse response = client.Execute(request);
                if (response.StatusCode == HttpStatusCode.OK)
                {
                    //-------------CHIAMATA API----------------
                    var clientLogin = new RestClient("https://aibvcapi.azurewebsites.net/api/v1/Login");
                    clientLogin.Timeout = -1;
                    var requestLogin = new RestRequest(Method.POST);
                    requestLogin.AddHeader("Content-Type", "application/json");
                    requestLogin.AddHeader("Cookie", "ARRAffinity=aabe420e4783a6118a9a1427c97a8517a6f227fb2599a8749b4c88f4b53ca222; ARRAffinitySameSite=aabe420e4783a6118a9a1427c97a8517a6f227fb2599a8749b4c88f4b53ca222");
                    requestLogin.AddParameter("application/json", "{\r\n  \"email\": \"" + email.Text + "\",\r\n  \"password\": \"" + PWD.Text + "\"\r\n}", ParameterType.RequestBody);
                    IRestResponse responseLogin = clientLogin.Execute(requestLogin);
                    if (responseLogin.StatusCode == HttpStatusCode.OK)
                    {
                        var contenutoLogin = JsonConvert.DeserializeObject<getToken>(responseLogin.Content);
                        Response.Redirect("OutputTornei.aspx?token=" + contenutoLogin.token); //rimanda alla form 'output tornei'
                    }
                    else
                        risultato.Text = responseLogin.ErrorMessage;
                    //------------------------------------------
                    var contenuto = JsonConvert.DeserializeObject<getToken>(response.Content);
                    Response.Redirect("OutputTornei.aspx?token=" + contenuto.token); //rimanda alla form 'output tornei'
                }
                else
                    risultato.Text = response.ErrorMessage;
                //------------------------------------------
            }
            else
            {
                errore.Text = "Assicurati che email e password abbiano una lunghezza inferiore ai 20 caratteri";
            }
        }
    }
}