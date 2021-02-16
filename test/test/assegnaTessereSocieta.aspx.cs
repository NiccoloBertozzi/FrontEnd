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
    public partial class assegnaTessereSocieta : System.Web.UI.Page
    {
        string token;
        int idSocieta;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["ruolo"].ToString() == "Atleta") Response.Redirect("OutputTornei.aspx");
            if (Session["ruolo"].ToString() == "Allenatore") Response.Redirect("OutputTornei.aspx");
            if (Session["ruolo"].ToString() == "Admin" || Session["ruolo"].ToString() == "Delegato") Response.Redirect("OutputTornei.aspx");
            token = Session["Token"].ToString();
            idSocieta = Convert.ToInt32(Session["idUtente"]);
        }

        protected void btnInvio_Click(object sender, EventArgs e)
        {
            var client = new RestClient("https://aibvcapi.azurewebsites.net/api/v1/societa/AssegnaTessereBySocieta");
            client.Timeout = -1;
            var request = new RestRequest(Method.POST);
            request.AddHeader("Authorization", "Bearer " + token);
            request.AddHeader("Content-Type", "application/json");
            request.AddHeader("Cookie", "ruolo=Societa; ARRAffinity=e7fc3e897f5be57469671ac828c06570ef8d3ea8fb2416293fd2acc3f67e0ee6; ARRAffinitySameSite=e7fc3e897f5be57469671ac828c06570ef8d3ea8fb2416293fd2acc3f67e0ee6");
            request.AddParameter("application/json", "{\r\n    \"IDAtleta\": " + txtIdAtleta.Text + ",\r\n    \"IDSocieta\":" + idSocieta + ",\r\n    \"CodiceTessera\":\"" + txtCodiceTessera.Text + "\",\r\n    \"TipoTessera\":\"" + txtTipoTessera.Text + "\",\r\n    \"DataTesseramento\":\"" + Calendar1.SelectedDate + "\",\r\n    \"AnnoTesseramento\":" + txtAnnoTesseramento.Text + ",\r\n    \"Importo\":" + txtImporto.Text + "\r\n}", ParameterType.RequestBody);
            string error = "{\r\n    \"IDAtleta\": " + txtIdAtleta.Text + ",\r\n    \"IDSocieta\":" + idSocieta + ",\r\n    \"CodiceTessera\":\"" + txtCodiceTessera.Text + "\",\r\n    \"TipoTessera\":\"" + txtTipoTessera.Text + "\",\r\n    \"DataTesseramento\":\"" + Calendar1.SelectedDate + "\",\r\n    \"AnnoTesseramento\":" + txtAnnoTesseramento.Text + ",\r\n    \"Importo\":" + txtImporto.Text + "\r\n}";      
            IRestResponse response = client.Execute(request);
            if (response.StatusCode == System.Net.HttpStatusCode.OK)
            {
                Response.Write("<script> alert('" + response.Content + "') </script>");
            }
            else Response.Write("<script> alert('" + error + "') </script>");
        }
    }
}