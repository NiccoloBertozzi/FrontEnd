using Newtonsoft.Json;
using RestSharp;
using System;
using System.Net;
using System.Web.UI.WebControls;

namespace test
{
    public partial class IscrizioneSquadra : System.Web.UI.Page
    {
        //PROVVISORIO PER FARE I TEST
        string idAtleta1;
        string token;
        int idsocieta;
        //-----------------------------
        protected void Page_Load(object sender, EventArgs e)
        {
            idAtleta1 = Session["IdUtente"].ToString();
            token = Request.QueryString["token"];
            //-------------------SCARICO ID SOCIETA DELL'ATLETA-----
            var client1 = new RestClient("https://aibvcapi.azurewebsites.net/api/v1/atleti/GetIdSocieta/"+idAtleta1+"");
            client1.Timeout = -1;
            var request1 = new RestRequest(Method.GET);
            request1.AddHeader("Authorization", "Bearer" + token + "");
            request1.AddHeader("Cookie", "ARRAffinity=e7fc3e897f5be57469671ac828c06570ef8d3ea8fb2416293fd2acc3f67e0ee6; ARRAffinitySameSite=e7fc3e897f5be57469671ac828c06570ef8d3ea8fb2416293fd2acc3f67e0ee6");
            IRestResponse response1 = client1.Execute(request1);
            idsocieta = Convert.ToInt32(response1.Content);
            //----------------------
            if (!this.IsPostBack)
            {
                //Scarica gli atleti di una societa
                var client = new RestClient("https://aibvcapi.azurewebsites.net/api/v1/tornei/AtletiSocieta/2");
                client.Timeout = -1;
                var request = new RestRequest(Method.POST);
                request.AddHeader("Authorization", "Bearer " + token + "");
                request.AddHeader("Cookie", "ARRAffinity=e7fc3e897f5be57469671ac828c06570ef8d3ea8fb2416293fd2acc3f67e0ee6; ARRAffinitySameSite=e7fc3e897f5be57469671ac828c06570ef8d3ea8fb2416293fd2acc3f67e0ee6");
                IRestResponse response = client.Execute(request);
                dynamic deserialzied = JsonConvert.DeserializeObject(response.Content);
                if (deserialzied != null)
                {
                    for (int i = 0; i < deserialzied.Count; i++)
                    {
                        ListItem lst = new ListItem(Convert.ToString(deserialzied[i].codiceTessera));
                        cmbAtleta2.Items.Insert(i + 1, lst);
                    }
                }
                client.ClearHandlers();
                client = new RestClient("https://aibvcapi.azurewebsites.net/api/v1/tornei/AllenatoriSocieta/2");
                client.Timeout = -1;
                request = new RestRequest(Method.POST);
                request.AddHeader("Authorization", "Bearer " + token + "");
                request.AddHeader("Cookie", "ARRAffinity=e7fc3e897f5be57469671ac828c06570ef8d3ea8fb2416293fd2acc3f67e0ee6; ARRAffinitySameSite=e7fc3e897f5be57469671ac828c06570ef8d3ea8fb2416293fd2acc3f67e0ee6");
                response = client.Execute(request);
                deserialzied = JsonConvert.DeserializeObject(response.Content);
                if (deserialzied != null)
                {
                    for (int i = 0; i < deserialzied.Count; i++)
                    {
                        ListItem lst = new ListItem(Convert.ToString(deserialzied[i].codiceTessera));
                        cmballenatore.Items.Insert(i + 1, lst);
                    }
                }
            }
        }

        protected void btn_IscriviSquadra_Click(object sender, EventArgs e)
        {
            //----------------------Inserimento Squadra-------------------------//
            var client = new RestClient("https://aibvcapi.azurewebsites.net/api/v1/tornei/InserisciSquadra");
            client.Timeout = -1;
            var request = new RestRequest(Method.POST);
            request.AddHeader("Authorization", "Bearer "+ token + "");
            request.AddHeader("Content-Type", "application/json");
            request.AddParameter("application/json", "{\r\n  \"Atleta1\": \"" + idAtleta1 + "\",\r\n  \"Atleta2\": \"" + cmbAtleta2.SelectedItem.Text + "\",\r\n \"NomeTeam\": \"" + txtNomeTeam.Text + "\"}", ParameterType.RequestBody);
            IRestResponse response = client.Execute(request);
            //-----------------------------------------------------------------//
            //----------------------Iscrizione Squadra--------------------------//
            client = new RestClient("https://aibvcapi.azurewebsites.net/api/v1/tornei/IscriviSquadra");
            client.Timeout = -1;
            request = new RestRequest(Method.POST);
            request.AddHeader("Authorization", "Bearer " + token + "");
            request.AddHeader("Content-Type", "application/json");
            request.AddHeader("Cookie", "ARRAffinity=e7fc3e897f5be57469671ac828c06570ef8d3ea8fb2416293fd2acc3f67e0ee6");
            request.AddParameter("application/json", "{\r\n  \"idSquadra\": " + Convert.ToInt32(response.Content) + ",\r\n  \"idTorneo\": 1,\r\n  \"idAllenatore\": " + cmballenatore.SelectedItem.Text + "\r\n}", ParameterType.RequestBody);
            IRestResponse response1 = client.Execute(request);
            //------------------------------------------------------------------//
        }

        protected void cmbAtleta2_SelectedIndexChanged(object sender, EventArgs e)
        {
            //Stampo il nome dell'atleta in base alla tessera selezionata
            DropDownList cmb = (DropDownList)sender;
            var client = new RestClient("https://aibvcapi.azurewebsites.net/api/v1/tornei/AtletaTessera/" + cmb.SelectedItem.Text + "");
            client.Timeout = -1;
            var request = new RestRequest(Method.POST);
            request.AddHeader("Authorization", "Bearer " + token + "");
            request.AddHeader("Cookie", "ARRAffinity=e7fc3e897f5be57469671ac828c06570ef8d3ea8fb2416293fd2acc3f67e0ee6; ARRAffinitySameSite=e7fc3e897f5be57469671ac828c06570ef8d3ea8fb2416293fd2acc3f67e0ee6");
            IRestResponse response = client.Execute(request);
            nomeAtleta2.Text = response.Content;

        }

        protected void cmballenatore_SelectedIndexChanged(object sender, EventArgs e)
        {
            //Stampo il nome dell'allenatore in base alla tessera selezionata
            DropDownList cmb = (DropDownList)sender;
            var client = new RestClient("https://aibvcapi.azurewebsites.net/api/v1/tornei/AllenatoriTessera/" + cmb.SelectedItem.Text + "");
            client.Timeout = -1;
            var request = new RestRequest(Method.POST);
            request.AddHeader("Authorization", "Bearer " + token + "");
            request.AddHeader("Cookie", "ARRAffinity=e7fc3e897f5be57469671ac828c06570ef8d3ea8fb2416293fd2acc3f67e0ee6; ARRAffinitySameSite=e7fc3e897f5be57469671ac828c06570ef8d3ea8fb2416293fd2acc3f67e0ee6");
            IRestResponse response = client.Execute(request);
            nomeAllenatore.Text = response.Content;
        }
    }
}