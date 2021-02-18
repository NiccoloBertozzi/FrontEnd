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
    public partial class OutputTorneiCategoria : System.Web.UI.Page
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
                    table.Append("<li class=\"nav-item\" role=\"presentation\"><a class=\"nav-link active pointer\" onclick=\"LoadCreaTorneo(); \">CreaTorneo</a></li>");
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
            }
        }
        protected void clickArea_Click(object sender, EventArgs e)
        {
            Session["IdTorneo"] = HiddenField1.Value;
            Response.Redirect("InfoTorneo.aspx"); //rimanda alla form 'output tornei'
        }
    }
}