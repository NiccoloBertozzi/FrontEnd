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
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["ruolo"] != null)
            {
                if (Session["ruolo"].ToString() == "Atleta")
                {
                    StringBuilder table = new StringBuilder();
                    table.Clear();
                    dinamicload.Controls.Add(new Literal { Text = table.ToString() });
                    table.Append("<li class=\"nav-item\" role=\"presentation\"><a class=\"nav-link active pointer\" onclick=\"LoadPageIscritti(); \">Tornei Iscritti</a></li>");
                    dinamicload.Controls.Add(new Literal { Text = table.ToString() });
                }
                else if (Session["ruolo"].ToString() == "Admin")
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
                else if (Session["ruolo"].ToString() == "Delegato")
                {
                    StringBuilder table = new StringBuilder();
                    table.Clear();
                    dinamicload.Controls.Add(new Literal { Text = table.ToString() });
                    table.Append("<li class=\"nav-item\" role=\"presentation\"><a class=\"nav-link active pointer\" onclick=\"LoadPageDelegati(); \">Tornei delegato</a></li>");
                    dinamicload.Controls.Add(new Literal { Text = table.ToString() });
                }
                else if (Session["ruolo"].ToString() == "Allenatore")
                {
                    StringBuilder table = new StringBuilder();
                    table.Clear();
                    dinamicload.Controls.Add(new Literal { Text = table.ToString() });
                    table.Append("<li class=\"nav-item\" role=\"presentation\"><a class=\"nav-link active pointer\" onclick=\"LoadPageIscritti(); \">Tornei Iscritti</a></li>");
                    dinamicload.Controls.Add(new Literal { Text = table.ToString() });
                }
            }
        }
    }
}