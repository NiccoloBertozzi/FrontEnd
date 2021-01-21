using RestSharp;
using System;
using System.Net;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace test
{
    public partial class RegisterAtleta : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }
        protected void btn_registerAtleta_Click(object sender, EventArgs e)
        {  
            object parameter = "";
            if (ruolo.SelectedValue=="Atleta")
                 parameter = "{\r\n  \"atleta\": {\r\n";
            else if(ruolo.SelectedValue=="Allenatore")
                 parameter = "{\r\n  \"allenatore\": {\r\n";
            else if (ruolo.SelectedValue == "Delegato")
                parameter = "{\r\n  \"delegato\": {\r\n";
            bool check = false;//controlla se sono arrivate le credenziali
            bool check_sesso = false;//controlla se arrivato il sesso
            bool check_ruolo = false;//controlla se arrivato il ruolo
            foreach (Control c in formregister.Controls)//Controllo se tutte le textbox sono riempite
            {  
                if (c is TextBox)
                {
                    TextBox textBox = c as TextBox;
                    if ((textBox.ID== "comuneNascita" || textBox.ID == "comuneResidenza" || textBox.ID == "nomeSocieta" || textBox.ID == "password") && !check) //inserisco inizo credenziali
                    {
                        parameter = parameter.ToString().Substring(0, parameter.ToString().Length - 3);//elimino ultimi 3 caratteri
                        parameter += "},\r\n  \"cred\": {\r\n ";
                        check = !check;
                    }
                    if (textBox.Text != string.Empty)//Creo object body
                        parameter += " \"" + textBox.ID + "\": \"" + textBox.Text + "\",\r\n";

                }
                else if(c is RadioButton)//sesso
                {
                    RadioButton radioButton = c as RadioButton;
                    if (sesso1.Checked == true && !check_sesso)//controllo sesso
                    { parameter += " \"sesso\": \"M\",\r\n"; check_sesso = !check_sesso; }
                    else if (sesso2.Checked == true&& !check_sesso)
                    { parameter += " \"sesso\": \"F\",\r\n"; check_sesso = !check_sesso; }
                    if (ruolo.SelectedValue == "Delegato")
                    {
                        if (supervisore.Checked == true && !check_ruolo)//controllo ruolo
                        { parameter += " \"supervisore\": \"true\",\r\n"; check_ruolo = !check_ruolo; }
                        else if (arbitro.Checked == true && !check_ruolo)
                        { parameter += " \"aribtro\": \"true\",\r\n"; check_ruolo = !check_ruolo; }
                    }
                }
            }
            parameter= parameter.ToString().Substring(0,parameter.ToString().Length - 3);//elimino ultimi 3 caratteri
            parameter += "\r\n}\r\n}";
                var client=new RestClient();
                //----------------------Registrazione-------------------------//
                if (ruolo.SelectedValue == "Atleta")
                    client = new RestClient("https://aibvcapi.azurewebsites.net/api/v1/LoginRegister/RegistraAtleta");
                else if (ruolo.SelectedValue == "Allenatore")
                    client = new RestClient("https://aibvcapi.azurewebsites.net/api/v1/LoginRegister/RegistraAllenatore");
                else if (ruolo.SelectedValue == "Delegato")
                    client = new RestClient("https://aibvcapi.azurewebsites.net/api/v1/LoginRegister/RegistraDelegato");
                client.Timeout = -1;
                var request = new RestRequest(Method.POST);
                request.AddHeader("Content-Type", "application/json");
                request.AddParameter("application/json",parameter, ParameterType.RequestBody);
                IRestResponse response = client.Execute(request);
                if (response.StatusCode == HttpStatusCode.OK)
                    risultato.Text = response.Content;
                else
                    risultato.Text = response.ErrorMessage;
                //------------------------------------------------------------//
        }
    }
}