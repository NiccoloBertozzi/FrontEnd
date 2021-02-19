using Newtonsoft.Json;
using RestSharp;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace test
{
    public partial class CreaTorneo : System.Web.UI.Page
    {
        string error, token;
        CheckBoxList cbListImpianti = new CheckBoxList();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["ruolo"] != null)
            {
                if (Session["ruolo"].ToString() == "Societa")
                {
                    StringBuilder table = new StringBuilder();
                    table.Clear();
                    dinamicload.Controls.Add(new Literal { Text = table.ToString() });
                    table.Append("<li class=\"nav-item\" role=\"presentation\"><a class=\"nav-link active pointer\" onclick=\"LoadCreaTorneo(); \">Crea Torneo</a></li>");
                    dinamicload.Controls.Add(new Literal { Text = table.ToString() });
                }
            }
            if (string.IsNullOrEmpty(Session["Token"] as string))
            {
                txtDataInizio.Text = DateTime.Now.Date.ToString("yyyy-MM-dd");
                txtDataFine.Text = DateTime.Now.Date.ToString("yyyy-MM-dd");
                txtDataChiusuraIscr.Text = DateTime.Now.Date.ToString("yyyy-MM-dd");
                token = Session["Token"].ToString();
                if (!IsPostBack)
                {
                    //-------------CHIAMATA API e popolazione impianti ----------------              
                    var client = new RestClient("https://aibvcapi.azurewebsites.net/api/v1/societa/GetAllImpianti");
                    client.Timeout = -1;
                    var request = new RestRequest(Method.GET);
                    request.AddHeader("Authorization", "Bearer " + token);
                    request.AddHeader("Cookie", "ARRAffinity=e7fc3e897f5be57469671ac828c06570ef8d3ea8fb2416293fd2acc3f67e0ee6; ARRAffinitySameSite=e7fc3e897f5be57469671ac828c06570ef8d3ea8fb2416293fd2acc3f67e0ee6; ruolo=Societa");
                    IRestResponse response = client.Execute(request);
                    //deserializza il risultato ritornato
                    dynamic deserialzied = JsonConvert.DeserializeObject(response.Content);
                    if (deserialzied != null)
                    {
                        cbImpianti.Items.Insert(0, new ListItem(string.Empty, string.Empty));
                        for (int i = 0; i < deserialzied.Count; i++)
                        {
                            cbImpianti.Items.Add(new ListItem(Convert.ToString(deserialzied[i].nomeImpianto), Convert.ToString(deserialzied[i].idImpianto)));
                        }
                    }
                    //------------------------------------------

                    //-------------CHIAMATA API e popolazione tipo torneo ----------------
                    client = new RestClient("http://aibvcapi.azurewebsites.net/api/v1/tornei/TipoTorneo");
                    client.Timeout = -1;
                    request = new RestRequest(Method.GET);
                    request.AddHeader("Cookie", "ARRAffinity=e7fc3e897f5be57469671ac828c06570ef8d3ea8fb2416293fd2acc3f67e0ee6");
                    response = client.Execute(request);
                    //deserializza il risultato ritornato
                    deserialzied = JsonConvert.DeserializeObject(response.Content);
                    if (deserialzied != null)
                    {
                        for (int i = 0; i < deserialzied.Count; i++)
                        {
                            ListItem lst = new ListItem(Convert.ToString(deserialzied[i].descrizione), Convert.ToString(deserialzied[i].idTipoTorneo));
                            cmbTipoTorneo.Items.Insert(i, lst);
                        }
                    }
                    //------------------------------------------

                    //-------------CHIAMATA API e popolazione formula ----------------
                    client = new RestClient("http://aibvcapi.azurewebsites.net/api/v1/tornei/FormulaTorneo");
                    client.Timeout = -1;
                    request = new RestRequest(Method.GET);
                    request.AddHeader("Cookie", "ARRAffinity=e7fc3e897f5be57469671ac828c06570ef8d3ea8fb2416293fd2acc3f67e0ee6");
                    response = client.Execute(request);
                    //deserializza il risultato ritornato
                    deserialzied = JsonConvert.DeserializeObject(response.Content);
                    if (deserialzied != null)
                    {
                        for (int i = 0; i < deserialzied.Count; i++)
                        {
                            ListItem lst = new ListItem(Convert.ToString(deserialzied[i].formula), Convert.ToString(deserialzied[i].idFormula));
                            cmbFormula.Items.Insert(i, lst);
                        }
                    }
                    //------------------------------------------

                    //-------------CHIAMATA API e popolazione parametri torneo ----------------
                    client = new RestClient("http://aibvcapi.azurewebsites.net/api/v1/tornei/ParametroTorneo");
                    client.Timeout = -1;
                    request = new RestRequest(Method.GET);
                    request.AddHeader("Cookie", "ARRAffinity=e7fc3e897f5be57469671ac828c06570ef8d3ea8fb2416293fd2acc3f67e0ee6");
                    response = client.Execute(request);
                    //deserializza il risultato ritornato
                    deserialzied = JsonConvert.DeserializeObject(response.Content);
                    if (deserialzied != null)
                    {
                        for (int i = 0; i < deserialzied.Count; i++)
                        {
                            cbListParametri.Items.Add(new ListItem(Convert.ToString(deserialzied[i].nomeParametro), Convert.ToString(deserialzied[i].idParametro)));
                            cmbParametri.Controls.Add(cbListParametri);
                        }
                    }
                    //------------------------------------------
                }
            }
            else Response.Redirect("OutputTornei.aspx");
        }

        protected void creaTorneo_Click(object sender, EventArgs e)
        {
            foreach (ListItem li in cbListImpianti.Items)
            {
                if (li.Selected == true)
                {
                    Session["idParametri"] += ("\"" + li.Text);
                }
            }
            string gender;
            if (M.Checked) gender = M.ID;
            else gender = F.ID;

            var strParametri = new Func<CheckBoxList, string>((CheckBoxList cbList) =>
            {
                List<string> selectedItems = new List<string>();
                foreach (ListItem item in cbList.Items)
                {
                    if (item.Selected) { selectedItems.Add("\"" + item.Text + "\""); }
                }
                string strFinal = String.Join(",", selectedItems);
                return String.Format("[{0}]", strFinal);
            })(cbListParametri);

            var client = new RestClient("https://aibvcapi.azurewebsites.net/api/v1/tornei/CreaTorneo");
            client.Timeout = -1;
            var request = new RestRequest(Method.POST);
            request.AddHeader("Authorization", "Bearer " + token + "");
            request.AddHeader("Content-Type", "application/json");
            request.AddHeader("Cookie", "ARRAffinity=e7fc3e897f5be57469671ac828c06570ef8d3ea8fb2416293fd2acc3f67e0ee6; ARRAffinitySameSite=e7fc3e897f5be57469671ac828c06570ef8d3ea8fb2416293fd2acc3f67e0ee6");
            request.AddParameter("application/json", "{\r\n  \"titolo\": \"" + txtTitolo.Text + "\",\r\n  \"puntiVittoria\": " + txtPuntiVitt.Text + ",\r\n  \"montepremi\": " + txtMontepremi.Text + ",\r\n  \"dataChiusuraIscrizioni\": \"" + Convert.ToDateTime(txtDataChiusuraIscr.Text).Date.ToString("yyyy-MM-dd") + "\",\r\n  \"dataInizio\": \"" + Convert.ToDateTime(txtDataInizio.Text).Date.ToString("yyyy-MM-dd") + "\",\r\n  \"dataFine\": \"" + Convert.ToDateTime(txtDataFine.Text).Date.ToString("yyyy-MM-dd") + "\",\r\n  \"genere\": \"" + gender + "\",\r\n  \"quotaIscrizione\": " + txtQuotaIscr.Text + ",\r\n  \"formulaTorneo\": \"" + cmbFormula.SelectedItem.Text + "\",\r\n  \"numMaxTeamMainDraw\": " + txtNumTeamTabellone.Text + ",\r\n  \"numMaxTeamQualifiche\": " + txtNumTeamQualifiche.Text + ",\r\n  \"parametriTorneo\": \r\n " + strParametri + ",\r\n \"tipoTorneo\": \"" + cmbTipoTorneo.SelectedItem.Text + "\",\r\n  \"idImpianto\": "+ Session["Impianto"].ToString() + ",\r\n" + "\"oraInizio\": \"" + txtOraInizio.Text + "\",\r\n" + "\"idSocieta\":" + Session["idUtente"] + ",\r\n" + "\"numWildCard\": " + txtNumWildCard.Text + ",\r\n" + "\"numTeamQualificati\": " + txtNumTeamQualificati.Text + ",\r\n" + "\"outdoor\": " + (cbOutdoor.Checked ? "true" : "false") + ",\r\n" + "\"riunioneTecnica\": " + (cbRiunioneTecnica.Checked ? "true" : "false") + "\r\n}", ParameterType.RequestBody);
            error = "{\r\n  \"titolo\": \"" + txtTitolo.Text + "\",\r\n  \"puntiVittoria\": " + txtPuntiVitt.Text + ",\r\n  \"montepremi\": " + txtMontepremi.Text + ",\r\n  \"dataChiusuraIscrizioni\": \"" + Convert.ToDateTime(txtDataChiusuraIscr.Text).Date.ToString("yyyy-MM-dd") + "\",\r\n  \"dataInizio\": \"" + Convert.ToDateTime(txtDataInizio.Text).Date.ToString("yyyy-MM-dd") + "\",\r\n  \"dataFine\": \"" + Convert.ToDateTime(txtDataFine.Text).Date.ToString("yyyy-MM-dd") + "\",\r\n  \"genere\": \"" + gender + "\",\r\n  \"quotaIscrizione\": " + txtQuotaIscr.Text + ",\r\n  \"formulaTorneo\": \"" + cmbFormula.SelectedItem.Text + "\",\r\n  \"numMaxTeamMainDraw\": " + txtNumTeamTabellone.Text + ",\r\n  \"numMaxTeamQualifiche\": " + txtNumTeamQualifiche.Text + ",\r\n  \"parametriTorneo\": \r\n " + strParametri + ",\r\n \"tipoTorneo\": \"" + cmbTipoTorneo.SelectedItem.Text + "\",\r\n  \"idImpianto\": " + Session["Impianto"].ToString() + ",\r\n" + "\"oraInizio\": \"" + txtOraInizio.Text + "\",\r\n" + "\"idSocieta\":" + Session["idUtente"] + ",\r\n" + "\"numWildCard\": " + txtNumWildCard.Text + ",\r\n" + "\"numTeamQualificati\": " + txtNumTeamQualificati.Text + ",\r\n" + "\"outdoor\": " + (cbOutdoor.Checked ? "true" : "false") + ",\r\n" + "\"riunioneTecnica\": " + (cbRiunioneTecnica.Checked ? "true" : "false") + "\r\n}";
            IRestResponse response = client.Execute(request);
            if (response.StatusCode == HttpStatusCode.OK)
                Response.Redirect("OutputTornei.aspx"); //rimanda alla form 'output tornei'
            else
                error = response.ErrorMessage;
        }

        protected void cbImpianti_TextChanged(object sender, EventArgs e)
        {
            Session["Impianto"] = cbImpianti.SelectedItem.Value;
        }

        protected void cmbTipoTorneo_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (cmbTipoTorneo.SelectedItem.Text != "L1")
            {
                txtMontepremi.Text = "0";
                txtMontepremi.Enabled = false;
            }
            else
                txtMontepremi.Enabled = true;
        }
    }
}
