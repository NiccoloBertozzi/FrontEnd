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
    public partial class ModificaInformazioniTorneo : System.Web.UI.Page
    {
        int idTorneo;
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
                    txtDataInizio.Text = DateTime.Now.Date.ToString("yyyy-MM-dd");
                    txtDataFine.Text = DateTime.Now.Date.ToString("yyyy-MM-dd");
                    txtDataChiusuraIscr.Text = DateTime.Now.Date.ToString("yyyy-MM-dd");
                    token = Session["Token"].ToString();
                    if (!IsPostBack)
                    {
                        idTorneo = Convert.ToInt32(Request.QueryString["id"]);
                        //-------------CHIAMATA API e popolazione impianti ----------------              
                        var client = new RestClient("https://aibvcapi.azurewebsites.net/api/v1/GetTorneoByID/" + idTorneo);
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

                            for (int i = 0; i < deserialzied.Count; i++)
                            {
                                txtTitolo.Text = deserialzied[i].titolo;
                                txtQuotaIscr.Text = deserialzied[i].quotaIscrizione;
                                txtOraInizio.Text = deserialzied[i].oraInizio;
                                txtNumWildCard.Text = deserialzied[i].numWildCard;
                                txtNumTeamTabellone.Text = deserialzied[i].numMaxTeamMainDraw;
                                txtNumTeamQualifiche.Text = deserialzied[i].numMaxTeamQualifiche;
                                txtNumTeamQualificati.Text = deserialzied[i].numTeamQualificati;
                                txtMontepremi.Text = deserialzied[i].montepremi;
                                txtDataInizio.Text = deserialzied[i].dataInizio.ToString("MM/dd/yyyy");
                                txtDataFine.Text = deserialzied[i].dataFine.ToString("yyyy/MM/dd");
                                //txtDataChiusuraIscr.Text = deserialzied[i].dataChiusuraIscrizioni.ToString("dd/MM/yyyy");
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
                            }
                        }
                        //------------------------------------------
                    }
                }
                else Response.Redirect("OutputTornei.aspx");
            }
            else Response.Redirect("OutputTornei.aspx");
        }

        protected void ModificaInfoTorneo_Click(object sender, EventArgs e)
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

            var client = new RestClient("https://aibvcapi.azurewebsites.net/api/v1/tornei/UpdateInfoTorneo");
            client.Timeout = -1;
            var request = new RestRequest(Method.POST);
            request.AddHeader("Authorization", "Bearer " + token + "");
            request.AddHeader("Content-Type", "application/json");
            request.AddHeader("Cookie", "ARRAffinity=e7fc3e897f5be57469671ac828c06570ef8d3ea8fb2416293fd2acc3f67e0ee6; ARRAffinitySameSite=e7fc3e897f5be57469671ac828c06570ef8d3ea8fb2416293fd2acc3f67e0ee6");
            request.AddParameter("application/json", "{\r\n  \"titolo\": \"" + txtTitolo.Text + "\",\r\n  \"puntiVittoria\": " + dlPuntiVittoria.SelectedValue + ",\r\n  \"montepremi\": " + txtMontepremi.Text + ",\r\n  \"dataChiusuraIscrizioni\": \"" + Convert.ToDateTime(txtDataChiusuraIscr.Text).Date.ToString("yyyy-MM-dd") + "\",\r\n  \"dataInizio\": \"" + Convert.ToDateTime(txtDataInizio.Text).Date.ToString("yyyy-MM-dd") + "\",\r\n  \"dataFine\": \"" + Convert.ToDateTime(txtDataFine.Text).Date.ToString("yyyy-MM-dd") + "\",\r\n  \"genere\": \"" + gender + "\",\r\n  \"quotaIscrizione\": " + txtQuotaIscr.Text + ",\r\n  \"formulaTorneo\": \"" + cmbFormula.SelectedItem.Text + "\",\r\n  \"numMaxTeamMainDraw\": " + txtNumTeamTabellone.Text + ",\r\n  \"numMaxTeamQualifiche\": " + txtNumTeamQualifiche.Text + ",\r\n  \"parametriTorneo\": \r\n " + strParametri + ",\r\n \"tipoTorneo\": \"" + cmbTipoTorneo.SelectedItem.Text + "\",\r\n  \"idImpianto\": " + Session["Impianto"].ToString() + ",\r\n" + "\"oraInizio\": \"" + txtOraInizio.Text + "\",\r\n" + "\"idSocieta\":" + Session["idUtente"] + ",\r\n" + "\"numWildCard\": " + txtNumWildCard.Text + ",\r\n" + "\"numTeamQualificati\": " + txtNumTeamQualificati.Text + ",\r\n" + "\"outdoor\": " + (dlOutdoor.SelectedValue == "Si" ? "true" : "false") + ",\r\n" + "\"riunioneTecnica\": " + (dlRiunioneTecnica.SelectedValue == "Si" ? "true" : "false") + "\r\n}", ParameterType.RequestBody);
            error = "{\r\n  \"titolo\": \"" + txtTitolo.Text + "\",\r\n  \"puntiVittoria\": " + dlPuntiVittoria.SelectedValue + ",\r\n  \"montepremi\": " + txtMontepremi.Text + ",\r\n  \"dataChiusuraIscrizioni\": \"" + Convert.ToDateTime(txtDataChiusuraIscr.Text).Date.ToString("yyyy-MM-dd") + "\",\r\n  \"dataInizio\": \"" + Convert.ToDateTime(txtDataInizio.Text).Date.ToString("yyyy-MM-dd") + "\",\r\n  \"dataFine\": \"" + Convert.ToDateTime(txtDataFine.Text).Date.ToString("yyyy-MM-dd") + "\",\r\n  \"genere\": \"" + gender + "\",\r\n  \"quotaIscrizione\": " + txtQuotaIscr.Text + ",\r\n  \"formulaTorneo\": \"" + cmbFormula.SelectedItem.Text + "\",\r\n  \"numMaxTeamMainDraw\": " + txtNumTeamTabellone.Text + ",\r\n  \"numMaxTeamQualifiche\": " + txtNumTeamQualifiche.Text + ",\r\n  \"parametriTorneo\": \r\n " + strParametri + ",\r\n \"tipoTorneo\": \"" + cmbTipoTorneo.SelectedItem.Text + "\",\r\n  \"idImpianto\": " + Session["Impianto"].ToString() + ",\r\n" + "\"oraInizio\": \"" + txtOraInizio.Text + "\",\r\n" + "\"idSocieta\":" + Session["idUtente"] + ",\r\n" + "\"numWildCard\": " + txtNumWildCard.Text + ",\r\n" + "\"numTeamQualificati\": " + txtNumTeamQualificati.Text + ",\r\n" + "\"outdoor\": " + (dlOutdoor.SelectedValue == "Si" ? "true" : "false") + ",\r\n" + "\"riunioneTecnica\": " + (dlRiunioneTecnica.SelectedValue == "Si" ? "true" : "false") + "\r\n}";
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
