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
	public partial class visualizzaStatoTessere : System.Web.UI.Page
	{
        string token;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["ruolo"].ToString() == "Atleta" || Session["ruolo"].ToString() == "Delegato") Response.Redirect("OutputTornei.aspx");
            token = Session["Token"].ToString();
            int idSocieta = Convert.ToInt32(Session["idUtente"]);
            DownloadTessere(idSocieta);
        }

        protected void DownloadTessere(int idSocieta) //mostra tutti gli allenatori della socità
        {
            //codice api

            //deserializza il risultato ritornato
            /*dynamic deserialized = JsonConvert.DeserializeObject(response.Content);
            if (deserialized != null)
            {
                StringBuilder table = new StringBuilder();
                table.Clear();
                visualizzaTessere.Controls.Add(new Literal { Text = table.ToString() });
                for (int i = 0; i < deserialized.Count; i++)
                {
                    table.Append("");
                }
                //Append the HTML string to Placeholder.
                visualizzaTessere.Controls.Add(new Literal { Text = table.ToString() });*/
            }
        }
    }
}