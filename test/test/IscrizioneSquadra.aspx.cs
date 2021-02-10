using Newtonsoft.Json;
using RestSharp;
using System;
using System.Net;
using System.Web.UI.WebControls;

namespace test
{
    public partial class IscrizioneSquadra : System.Web.UI.Page
    {
        string idAtleta1;
        string token;
        string idsocieta;
        //-----------------------------
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["ruolo"].ToString() == "Admin" || Session["ruolo"].ToString() == "Delegato") Response.Redirect("OutputTorneiDelegato.aspx");
            if (Session["ruolo"].ToString() == "Societa") Response.Redirect("OutputTornei.aspx");
            if (Session["ruolo"].ToString() == "Allenatore") Response.Redirect("OutputTornei.aspx");
            idAtleta1 = Session["IdUtente"].ToString();
            token = Session["Token"].ToString();
            //-------------------SCARICO ID SOCIETA DELL'ATLETA-----
            var client = new RestClient("https://aibvcapi.azurewebsites.net/api/v1/atleti/GetIdSocieta/" + idAtleta1 + "");
            client.Timeout = -1;
            var request = new RestRequest(Method.GET);
            request.AddHeader("Authorization", "Bearer " + token + "");
            request.AddHeader("Cookie", "ARRAffinity=e7fc3e897f5be57469671ac828c06570ef8d3ea8fb2416293fd2acc3f67e0ee6; ARRAffinitySameSite=e7fc3e897f5be57469671ac828c06570ef8d3ea8fb2416293fd2acc3f67e0ee6");
            IRestResponse response = client.Execute(request);
            idsocieta = response.Content;
            client.ClearHandlers();
            //----------------------
        }

        protected void btn_IscriviSquadra_Click(object sender, EventArgs e)
        {
            //se è stato trovato un atleta
            if (nomeAtleta2.Text!="") {
                //----------------------Inserimento Squadra-------------------------//
                var client = new RestClient("https://aibvcapi.azurewebsites.net/api/v1/tornei/InserisciSquadra");
                client.Timeout = -1;
                var request = new RestRequest(Method.POST);
                request.AddHeader("Authorization", "Bearer " + token + "");
                request.AddHeader("Content-Type", "application/json");
                request.AddParameter("application/json", "{\r\n  \"Atleta1\": \"" + idAtleta1 + "\",\r\n  \"Atleta2\": \"" + Atleta.Text + "\",\r\n \"NomeTeam\": \"" + txtNomeTeam.Text + "\"}", ParameterType.RequestBody);
                IRestResponse response = client.Execute(request);
                //-----------------------------------------------------------------//
                //----------------------Iscrizione Squadra--------------------------//
                client = new RestClient("https://aibvcapi.azurewebsites.net/api/v1/tornei/IscriviSquadra");
                client.Timeout = -1;
                request = new RestRequest(Method.POST);
                request.AddHeader("Authorization", "Bearer " + token + "");
                request.AddHeader("Content-Type", "application/json");
                request.AddHeader("Cookie", "ARRAffinity=e7fc3e897f5be57469671ac828c06570ef8d3ea8fb2416293fd2acc3f67e0ee6");
                request.AddParameter("application/json", "{\r\n  \"idSquadra\": " + Convert.ToInt32(response.Content) + ",\r\n  \"idTorneo\": " + Session["IdTorneo"] + ",\r\n  \"idAllenatore\": " + Allenatore.Text + "\r\n}", ParameterType.RequestBody);
                IRestResponse response1 = client.Execute(request);
                //------------------------------------------------------------------//
                Response.Redirect("OutputTornei.aspx");
            }
        }
        protected void Atleta_TextChanged(object sender, EventArgs e)
        {
            // da modificare il 3 con il numero minimo della tessera
            if (Atleta.Text.Length >= 3)
            {
                //Stampo il nome dell'atleta in base alla tessera selezionata
                var client = new RestClient("https://aibvcapi.azurewebsites.net/api/v1/tornei/AtletaTessera/" + Atleta.Text + "/Societa/"+idsocieta+"");
                client.Timeout = -1;
                var request = new RestRequest(Method.POST);
                request.AddHeader("Authorization", "Bearer " + token + "");
                request.AddHeader("Cookie", "ARRAffinity=e7fc3e897f5be57469671ac828c06570ef8d3ea8fb2416293fd2acc3f67e0ee6; ARRAffinitySameSite=e7fc3e897f5be57469671ac828c06570ef8d3ea8fb2416293fd2acc3f67e0ee6");
                IRestResponse response = client.Execute(request);
                nomeAtleta2.Text = response.Content;
            }
        }

        protected void Allenatore_TextChanged(object sender, EventArgs e)
        {
            if (Allenatore.Text.Length >= 3)
            {
                //Stampo il nome dell'allenatore in base alla tessera selezionata
                var client = new RestClient("https://aibvcapi.azurewebsites.net/api/v1/tornei/AllenatoriTessera/" + Allenatore.Text + "/Societa/" + idsocieta + "");
                client.Timeout = -1;
                var request = new RestRequest(Method.POST);
                request.AddHeader("Authorization", "Bearer " + token + "");
                request.AddHeader("Cookie", "ARRAffinity=e7fc3e897f5be57469671ac828c06570ef8d3ea8fb2416293fd2acc3f67e0ee6; ARRAffinitySameSite=e7fc3e897f5be57469671ac828c06570ef8d3ea8fb2416293fd2acc3f67e0ee6");
                IRestResponse response = client.Execute(request);
                nomeAllenatore.Text = response.Content;
            }
        }
    }
}