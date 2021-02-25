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
    public partial class OutputTorneiNonAutorrizati : System.Web.UI.Page
    {

        string token;

        public void Page_Load(object sender, EventArgs e)
        {
            if (Session["Token"] ==null) Response.Redirect("OutputTornei.aspx");
        }
        protected void clickArea_Click(object sender, EventArgs e)
        {
            Session["IdTorneo"] = HiddenField1.Value;
            Session["autorizzato"] = "0";
            Response.Redirect("InfoTorneo.aspx?id=" + HiddenField1.Value); //rimanda alla form 'output tornei'
        }
    }
}





