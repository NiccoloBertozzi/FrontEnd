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
    public partial class OutputTorneiIscritti : System.Web.UI.Page
    {
        string token;
        public void Page_Load(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(Session["Token"] as string)) Response.Redirect("OutputTornei.aspx");
        } 
        protected void clickArea_Click(object sender, EventArgs e)
        {
            Session["IdTorneo"] = HiddenField1.Value;
            Response.Redirect("EliminaTorneo.aspx"); //rimanda alla form 'output tornei'
        }
    }
}