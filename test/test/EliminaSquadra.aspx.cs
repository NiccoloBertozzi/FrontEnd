using RestSharp;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace test
{
    public partial class EliminaSquadra : System.Web.UI.Page
    {
        string token;
        int idSquadra, idTorneo;
        protected void Page_Load(object sender, EventArgs e)
        {
            token = Session["Token"].ToString();
            if (!this.IsPostBack)
            {
                //prende id torneo e squadra
                idSquadra = int.Parse(Session["IdTorneo"].ToString());
                idTorneo = int.Parse(Session["IdTorneo"].ToString());
                DownloadInformazioniSquadra(idSquadra);
            }
        }

        protected void DownloadInformazioniSquadra(int idSquadra)
        {
            //scarica tutte le informazioni della squadra
        }

        protected void EliminaSquadra_Click(object sender, EventArgs e)
        {
            var client = new RestClient("https://aibvcapi.azurewebsites.net/api/v1/tornei/EliminaSquadra");
            client.Timeout = -1;
            var request = new RestRequest(Method.DELETE);
            request.AddHeader("Authorization", "Bearer " + token);
            request.AddHeader("Content-Type", "application/json");
            request.AddHeader("Cookie", "ARRAffinity=e7fc3e897f5be57469671ac828c06570ef8d3ea8fb2416293fd2acc3f67e0ee6; ARRAffinitySameSite=e7fc3e897f5be57469671ac828c06570ef8d3ea8fb2416293fd2acc3f67e0ee6; ruolo=Admin");
            request.AddParameter("application/json", "{\r\n    \"idTorneo\" : " + idTorneo + ",\r\n    \"idSquadra\" : " + idSquadra + "\r\n}", ParameterType.RequestBody);
            IRestResponse response = client.Execute(request);
        }
    }
}