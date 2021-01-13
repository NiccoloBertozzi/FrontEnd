using RestSharp;
using System;
using System.Net;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace test
{
    public partial class RegisterSocieta : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void btn_registerSocieta_Click(object sender, EventArgs e)
        {
            object parameter;
            parameter = "{\r\n  \"societa\": {\r\n";
            bool check = false;//controlla se sono arrivate le credenziali
            foreach (Control c in formsocieta.Controls)//Controllo se tutte le textbox sono riempite
            {
                if (c is TextBox)
                {
                    TextBox textBox = c as TextBox;
                    if ((textBox.ID == "comuneResidenza" || textBox.ID == "password") && !check) //inserisco inizo credenziali
                    {
                        parameter = parameter.ToString().Substring(0, parameter.ToString().Length - 3);//elimino ultimi 3 caratteri
                        parameter += "},\r\n  \"cred\": {\r\n ";
                        check = !check;
                    }
                    if (textBox.Text != string.Empty)//Creo object body
                        parameter += " \"" + textBox.ID + "\": \"" + textBox.Text + "\",\r\n";

                }
            }
            parameter = parameter.ToString().Substring(0, parameter.ToString().Length - 3);//elimino ultimi 3 caratteri
            parameter += "\r\n}\r\n}";
            var client = new RestClient("https://aibvcapi.azurewebsites.net/api/v1/LoginRegister/RegistraSocieta");
            client.Timeout = -1;
            var request = new RestRequest(Method.POST);
            request.AddHeader("Content-Type", "application/json");
            request.AddParameter("application/json", parameter, ParameterType.RequestBody);
            IRestResponse response = client.Execute(request);
            if (response.StatusCode == HttpStatusCode.OK)
                risultato.Text = response.Content;
            else
                risultato.Text = response.ErrorMessage;
        }
    }
}