﻿using Newtonsoft.Json;
using RestSharp;
using System;
using System.Net;
using System.Web.WebPages;
using test.Models;

namespace test
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

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
                    var contenuto = JsonConvert.DeserializeObject<getToken>(response.Content);

                    Response.Redirect("OutputTornei.aspx?token=" + contenuto.token); //rimanda alla form 'output tornei'
                }
                else
                    Response.Write("<script>alert('" + response.ErrorMessage + "');</script>");
                //------------------------------------------
            }
            else
            {
                Response.Write("<script>alert('Completare i Campi');</script>");
            }
        }

        protected void LabelRecovery_Click(object sender, EventArgs e)
        {
            if (email.Text.IsEmpty())
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

        protected void register_Click(object sender, EventArgs e)
        {
            Response.Redirect("Register.aspx");
        }
    }
}