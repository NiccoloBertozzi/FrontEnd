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
	public partial class ModificaAnagraficaSocieta : System.Web.UI.Page
	{
        string token;
		protected void Page_Load(object sender, EventArgs e)
		{
            token = Session["Token"].ToString();
            int idSocieta = Convert.ToInt32(Session["idUtente"]);
            DownloadSocieta(idSocieta);
        }
		protected void ModificaAnagrafica_Click(object sender, EventArgs e)
		{

		}
        protected void DownloadSocieta(int idSocieta)
        {
            var client = new RestClient("https://aibvcapi.azurewebsites.net/api/v1/societa/GetAnagraficaSocieta/" + idSocieta);
            client.Timeout = -1;
            var request = new RestRequest(Method.GET);
            request.AddHeader("Authorization", "Bearer  " + token + "");
            request.AddHeader("Cookie", "ARRAffinity=e7fc3e897f5be57469671ac828c06570ef8d3ea8fb2416293fd2acc3f67e0ee6; ARRAffinitySameSite=e7fc3e897f5be57469671ac828c06570ef8d3ea8fb2416293fd2acc3f67e0ee6; ruolo=Societa");
            IRestResponse response = client.Execute(request);
            //deserializza il risultato ritornato
            dynamic deserialzied = JsonConvert.DeserializeObject(response.Content);
            if (deserialzied != null)
            {
                for (int i = 0; i < deserialzied.Count; i++)
                {
                    nome.Text = deserialzied[i].nomeSocieta;
                    indirizzo.Text = deserialzied[i].indirizzo;
                    CAP.Text = deserialzied[i].cap;
                    dataFondazione.Text = deserialzied[i].dataFondazione;
                    dataAffiliazione.Text = deserialzied[i].dataAffiliazione;
                    codiceAffiliazione.Text = deserialzied[i].codiceAffiliazione;
                    email.Text = deserialzied[i].email;
                    sito.Text = deserialzied[i].sito;
                    tel1.Text = deserialzied[i].tel1;
                    tel2.Text = deserialzied[i].tel2;
                    PEC.Text = deserialzied[i].pec;
                    PIVA.Text = deserialzied[i].piva;
                    CF.Text = deserialzied[i].cf;
                    CU.Text = deserialzied[i].cu;
                }
            }
        }
    }
}