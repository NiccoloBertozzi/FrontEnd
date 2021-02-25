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
    public partial class visualizzaComponentiSocieta : System.Web.UI.Page
    {
        string token;
        int idSocieta;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["ruolo"] != null)
            {
                if (Session["ruolo"].ToString() != "Societa" && Session["ruolo"].ToString() != "Admin") Response.Redirect("OutputTornei.aspx");
                else
                {
                    token = Session["Token"].ToString();
                    idSocieta = Convert.ToInt32(Session["idUtente"]);
                    if (Session["ruolo"].ToString() == "Admin")
                    {
                        StringBuilder table = new StringBuilder();
                        table.Clear();
                        dinamicload.Controls.Add(new Literal { Text = table.ToString() });
                        table.Append("<li class=\"nav-item\" role=\"presentation\"><a class=\"nav-link active pointer\" onclick=\"LoadPage(); \">Non autorizzati</a></li>");
                        table.Append("<li class=\"nav-item\" role=\"presentation\"><a class=\"nav-link active pointer\" onclick=\"LoadPageDelegati(); \">Tornei delegato</a></li>");
                        dinamicload.Controls.Add(new Literal { Text = table.ToString() });
                    }
                    else if (Session["ruolo"].ToString() == "Societa")
                    {
                        StringBuilder table = new StringBuilder();
                        table.Clear();
                        dinamicload.Controls.Add(new Literal { Text = table.ToString() });
                        table.Append("<li class=\"nav-item\" role=\"presentation\"><a class=\"nav-link active pointer\" onclick=\"LoadCreaTorneo(); \">Crea Torneo</a></li>");
                        dinamicload.Controls.Add(new Literal { Text = table.ToString() });
                    }
                }
            }
            else Response.Redirect("OutputTornei.aspx");
        }
        protected void ModificaAnagraficaDelegato_Click(object sender, EventArgs e)
        {
            Response.Redirect("ModificaAnagraficaDelegato.aspx"); //manda alla form 'ModificaAnagraficaDelegato'
        }
        protected void ModificaAnagraficaAtleta_Click(object sender, EventArgs e)
        {
            Response.Redirect("ModificaAnagraficaAtleta.aspx"); //manda alla form 'ModificaAnagraficaAtleta'
        }
    }
}