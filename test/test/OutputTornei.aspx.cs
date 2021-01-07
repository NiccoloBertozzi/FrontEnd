using Newtonsoft.Json;
using RestSharp;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace test
{
    public partial class OutputTornei : System.Web.UI.Page
    {
        IRestResponse response;
        string token;

        public void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack) 
            { 
                token = Request.QueryString["token"];
                //txtProva.Text = token;
            }

            var client = new RestClient("https://aibvcapi.azurewebsites.net/api/v1/GetTornei/2020-12-22%22");
            client.Timeout = -1;
            var request = new RestRequest(Method.GET);
            request.AddHeader("Authorization", "Bearer " + token);
            request.AddHeader("Cookie", "ARRAffinity=e7fc3e897f5be57469671ac828c06570ef8d3ea8fb2416293fd2acc3f67e0ee6; ARRAffinitySameSite=e7fc3e897f5be57469671ac828c06570ef8d3ea8fb2416293fd2acc3f67e0ee6");
            response = client.Execute(request);

            txtProva.Text = response.Content;

            /*
            string stringaTornei = response.ToString();
            DataTable tornei = (DataTable)JsonConvert.DeserializeObject(stringaTornei, (typeof(DataTable)));
            txtProva.Text = response.Content;
            */
        }

        protected void btnInvia_Click(object sender, EventArgs e)        
        {
           
        }
    }
}