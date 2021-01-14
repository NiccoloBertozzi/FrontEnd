using RestSharp;
using System;
using System.Net;

namespace test
{
    public partial class IscrizioneSquadra : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_IscriviSquadra_Click(object sender, EventArgs e)
        {
            if (codatleta2.Text != null)
            {
                //----------------------Inserimento Squadra-------------------------//
                var client = new RestClient("https://aibvcapi.azurewebsites.net/api/v1/tornei/InserisciSquadra%22");
                client.Timeout = -1;
                var request = new RestRequest(Method.POST);
                request.AddHeader("Authorization", "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6ImJlcnRvem5pY29AZ21haWwuY29tIiwicm9sZSI6IkF0bGV0YSIsIm5iZiI6MTYxMDM2NzQ4MywiZXhwIjoxNjEwMzY4NjgzLCJpYXQiOjE2MTAzNjc0ODN9.ax2rNHvnoX8j9E_gmR6pweNMHOZX0Qam1JYRAYYIFLI");
                request.AddHeader("Content-Type", "application/json");
                request.AddParameter("application/json", "{\r\n  \"Atleta1\": \"12345\",\r\n  \"Atleta2\": \"" + codatleta2.Text + "\"\r\n}", ParameterType.RequestBody);
                IRestResponse response = client.Execute(request);
                //-----------------------------------------------------------------//

                //----------------------Iscrizione Squadra--------------------------//
                var client1 = new RestClient("https://aibvcapi.azurewebsites.net/api/v1/tornei/IscriviSquadra%22");
                client.Timeout = -1;
                var request1 = new RestRequest(Method.POST);
                request.AddHeader("Authorization", "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6ImJlcnRvem5pY29AZ21haWwuY29tIiwicm9sZSI6IkF0bGV0YSIsIm5iZiI6MTYxMDM2NzQ4MywiZXhwIjoxNjEwMzY4NjgzLCJpYXQiOjE2MTAzNjc0ODN9.ax2rNHvnoX8j9E_gmR6pweNMHOZX0Qam1JYRAYYIFLI");
                request.AddHeader("Content-Type", "application/json");
                request.AddHeader("Cookie", "ARRAffinity=e7fc3e897f5be57469671ac828c06570ef8d3ea8fb2416293fd2acc3f67e0ee6");
                request.AddParameter("application/json", "{\r\n  \"idSquadra\": 52,\r\n  \"idTorneo\": 1,\r\n  \"idAllenatore\": \"" + codallenatore.Text + "\"\r\n}", ParameterType.RequestBody);
                IRestResponse response1 = client.Execute(request);
                //------------------------------------------------------------------//
            }
            else
                risultato.Text = "Riempi tutti i campi obbligatori!";
        }
    }
}