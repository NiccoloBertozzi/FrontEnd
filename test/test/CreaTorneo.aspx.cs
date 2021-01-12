using Newtonsoft.Json;
using RestSharp;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace test
{
    public partial class CreaTorneo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //-------------CHIAMATA API e popolazione tipo torneo ----------------
            var client = new RestClient("http://aibvcapi.azurewebsites.net/api/v1/tornei/TipoTorneo");
            client.Timeout = -1;
            var request = new RestRequest(Method.GET);
            request.AddHeader("Cookie", "ARRAffinity=e7fc3e897f5be57469671ac828c06570ef8d3ea8fb2416293fd2acc3f67e0ee6");
            IRestResponse response = client.Execute(request);
            //deserializza il risultato ritornato
            dynamic deserialzied = JsonConvert.DeserializeObject(response.Content);
            if (deserialzied != null)
            {
                StringBuilder table = new StringBuilder();
                table.Clear();
                cmbTipoTorneo.Items.Add(table.ToString());
                for (int i = 0; i < deserialzied.Count; i++)
                {
                    table.Append("<asp:ListItem Value="+ deserialzied[i].idTipoTorneo + " Text="+ deserialzied[i].descrizione + ">");
                }
                cmbTipoTorneo.Items.Add(table.ToString());
            }
            //------------------------------------------
        }

        protected void creaTorneo_Click(object sender, EventArgs e)
        {
            string gender;
            if (M.Checked) gender = M.ID;
            else gender = F.ID;
            var client = new RestClient("https://aibvcapi.azurewebsites.net/api/v1/tornei/CreaTorneo");
            client.Timeout = -1;
            var request = new RestRequest(Method.POST);
            request.AddHeader("Authorization", "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6ImJlcnRvem5pY29AZ21haWwuY29tIiwicm9sZSI6IkF0bGV0YSIsIm5iZiI6MTYxMDQ0NTA0NCwiZXhwIjoxNjEwNDQ2MjQ0LCJpYXQiOjE2MTA0NDUwNDR9.ExIzZl_eWzojIFbsehroaoPOJJMtsVE4V7Z_8Et87UY");
            request.AddHeader("Content-Type", "application/json");
            request.AddHeader("Cookie", "ARRAffinity=e7fc3e897f5be57469671ac828c06570ef8d3ea8fb2416293fd2acc3f67e0ee6; ARRAffinitySameSite=e7fc3e897f5be57469671ac828c06570ef8d3ea8fb2416293fd2acc3f67e0ee6");
            request.AddParameter("application/json", "{\r\n  \"titolo\": \"" + txtTitolo.Text + "\",\r\n  \"puntiVittoria\": " + txtPuntiVitt.Text + ",\r\n  \"montepremi\": "+txtMontepremi.Text+",\r\n  \"dataChiusuraIscrizioni\": \""+txtDataChiusuraIscr.Text+"\",\r\n  \"dataInizio\": \""+txtDataInizio.Text+"\",\r\n  \"dataFine\": \""+txtDataFine.Text+"\",\r\n  \"genere\": \""+ gender + "\",\r\n  \"formulaTorneo\": \""+cmbFormula.ID+"\",\r\n  \"numTeamTabellone\": "+lblNumTeamTabellone.Text+",\r\n  \"numTeamQualifiche\": "+lblNumTeamQualifiche.Text+",\r\n  \"parametriTorneo\": [\r\n    \"string\"\r\n  ],\r\n \"tipoTorneo\": \"string\",\r\n  \"impianti\": [\r\n    \"string\"\r\n  ]\r\n}", ParameterType.RequestBody);
            IRestResponse response = client.Execute(request);
        }
    }
}