using RestSharp;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace test
{
    public partial class TestBench : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnassegnasupervisore_Click(object sender, EventArgs e)
        {
            var client = new RestClient("https://aibvcapi.azurewebsites.net/api/v1/tornei/AssegnaDelegati");
            client.Timeout = -1;
            var request = new RestRequest(Method.PUT);
            request.AddHeader("Authorization", "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6ImxvcmVuem9yaWdvbmlAZ21haWwuY29tIiwicm9sZSI6WyJEZWxlZ2F0byIsIkFkbWluRGVsZWdhdG8iLCJBZG1pbiJdLCJuYmYiOjE2MTA2NDYxNzcsImV4cCI6MTYxMDY0NzM3NywiaWF0IjoxNjEwNjQ2MTc3fQ.pLQkgZgn-LNVGa0Etfe9TJL0Be1qhgsIDw4R7sh4Jgo");
            request.AddHeader("Content-Type", "application/json");
            request.AddHeader("Cookie", "ARRAffinity=e7fc3e897f5be57469671ac828c06570ef8d3ea8fb2416293fd2acc3f67e0ee6; ARRAffinitySameSite=e7fc3e897f5be57469671ac828c06570ef8d3ea8fb2416293fd2acc3f67e0ee6");
            request.AddParameter("application/json", "{\r\n    \"NomeSupervisore\":\"niccolo\",\r\n    \"CognomeSupervisore\":\"bertozzi\",\r\n    \"NomeSupArbitrale\":\"Andrea\",\r\n    \"CognomeSupArbitrale\":\"Rosati\",\r\n    \"NomeDirettore\":\"lorenzo\",\r\n    \"CognomeDirettore\":\"Rigoni\",\r\n    \"TitoloTorneo\":\"AIBVC Cup\"\r\n    }", ParameterType.RequestBody);
            IRestResponse response = client.Execute(request);
            risultato.Text = response.Content;
        }
    }
}