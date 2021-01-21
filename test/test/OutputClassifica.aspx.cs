using Newtonsoft.Json;
using RestSharp;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace test
{
    public partial class OutputClassifica : System.Web.UI.Page
    {
        string genere;
        protected void Page_Load(object sender, EventArgs e)
        {
            genere = Request.QueryString["genere"];
        }
    }
}