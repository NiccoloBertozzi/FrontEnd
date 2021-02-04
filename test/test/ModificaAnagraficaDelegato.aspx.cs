using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace test
{
    public partial class ModificaAnagraficaDelegato : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["ruolo"].ToString() == "Atleta") Response.Redirect("ModificaAnagraficaAtleta.aspx");
            if (Session["ruolo"].ToString() == "Societa") Response.Redirect("ModificaAnagraficaSocieta.aspx");
        }
        protected void ModificaAnagrafica_Click(object sender, EventArgs e)
        {

        }
    }
}