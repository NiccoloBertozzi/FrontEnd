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
        string error,token;
        CheckBoxList cbListParametri;
        CheckBoxList cbListImpianti;
        protected void Page_Load(object sender, EventArgs e)
        {
            cbListParametri = new CheckBoxList();
            cbListImpianti = new CheckBoxList();
            token = Request.QueryString["token"];
            int idSocieta = Convert.ToInt32(Session["IdUtente"]); //inviare tramite get id della società
            if (!IsPostBack)
            {
                //-------------CHIAMATA API e popolazione impianti ----------------              
                var client = new RestClient("https://aibvcapi.azurewebsites.net/api/v1/tornei/GetImpianti/" + idSocieta);
                client.Timeout = -1;
                var request = new RestRequest(Method.GET);
                request.AddHeader("Cookie", "ARRAffinity=e7fc3e897f5be57469671ac828c06570ef8d3ea8fb2416293fd2acc3f67e0ee6");
                IRestResponse response = client.Execute(request);
                //deserializza il risultato ritornato
                dynamic deserialzied = JsonConvert.DeserializeObject(response.Content);
                if (deserialzied != null)
                {
                    for (int i = 0; i < deserialzied.Count; i++)
                    {
                        cbListImpianti.Items.Add(new ListItem(Convert.ToString(deserialzied[i].nomeImpianto), Convert.ToString(deserialzied[i].idImpianto)));
                        cmbImpianti.Controls.Add(cbListImpianti);
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

        protected void creaTorneo_Click(object sender, EventArgs e)
        {
            /*prendere i valori dalle combobox
            foreach (Control ctl in parametriSelezionati.Controls)
            {
                if (ctl is CheckBox)
                {
                    if (((CheckBox)ctl).Checked) Session["nomeImpianti"] += ("\"" + ctl);
                }
            }
            foreach (Control ctl in impiantiSelezionati.Controls)
            {
                if (ctl is CheckBox)
                {
                    if (((CheckBox)ctl).Checked) Session["idParametri"] += ("\"" + ctl);
                }
            }*/
            string gender;
            if (M.Checked) gender = M.ID;
            else gender = F.ID;
            var client = new RestClient("https://aibvcapi.azurewebsites.net/api/v1/tornei/CreaTorneo");
            client.Timeout = -1;
            var request = new RestRequest(Method.POST);
            request.AddHeader("Authorization", "Bearer "+token+"");
            request.AddHeader("Content-Type", "application/json");
            request.AddHeader("Cookie", "ARRAffinity=e7fc3e897f5be57469671ac828c06570ef8d3ea8fb2416293fd2acc3f67e0ee6; ARRAffinitySameSite=e7fc3e897f5be57469671ac828c06570ef8d3ea8fb2416293fd2acc3f67e0ee6");
            request.AddParameter("application/json", "{\r\n  \"titolo\": \"" + txtTitolo.Text + "\",\r\n  \"puntiVittoria\": " + txtPuntiVitt.Text + ",\r\n  \"montepremi\": " + txtMontepremi.Text + ",\r\n  \"dataChiusuraIscrizioni\": \"" + Convert.ToDateTime(txtDataChiusuraIscr.Text).Date.ToString("yyyy-MM-dd") + "\",\r\n  \"dataInizio\": \"" + Convert.ToDateTime(txtDataInizio.Text).Date.ToString("yyyy-MM-dd") + "\",\r\n  \"dataFine\": \"" + Convert.ToDateTime(txtDataFine.Text).Date.ToString("yyyy-MM-dd") + "\",\r\n  \"genere\": \"" + gender + "\",\r\n  \"QuotaIngresso\": " + txtQuotaIscr.Text + ",\r\n  \"formulaTorneo\": \"" + cmbFormula.SelectedItem.Text + "\",\r\n  \"numTeamTabellone\": " + txtNumTeamTabellone.Text + ",\r\n  \"numTeamQualifiche\": " + txtNumTeamQualifiche.Text + ",\r\n  \"parametriTorneo\": [\r\n " + Session["idParametri"] + "\r\n  ],\r\n \"tipoTorneo\": \"" + cmbTipoTorneo.SelectedItem.Text + "\",\r\n  \"impianti\": [\r\n    " + Session["nomeImpianti"] + "\r\n  ]\r\n}", ParameterType.RequestBody);
            //manca quota di iscrizione , non prende impianti
            //i double vanno con il PUNTO non con la virgola
            error= "{\r\n  \"titolo\": \"" + txtTitolo.Text + "\",\r\n  \"puntiVittoria\": " + txtPuntiVitt.Text + ",\r\n  \"montepremi\": " + txtMontepremi.Text + ",\r\n  \"dataChiusuraIscrizioni\": \"" + Convert.ToDateTime(txtDataChiusuraIscr.Text).Date.ToString("yyyy-MM-dd") + "\",\r\n  \"dataInizio\": \"" + Convert.ToDateTime(txtDataInizio.Text).Date.ToString("yyyy-MM-dd") + "\",\r\n  \"dataFine\": \"" + Convert.ToDateTime(txtDataFine.Text).Date.ToString("yyyy-MM-dd") + "\",\r\n  \"genere\": \"" + gender + "\",\r\n  \"QuotaIngresso\": " + txtQuotaIscr.Text + ",\r\n  \"formulaTorneo\": \"" + cmbFormula.SelectedItem.Text + "\",\r\n  \"numTeamTabellone\": " + txtNumTeamTabellone.Text + ",\r\n  \"numTeamQualifiche\": " + txtNumTeamQualifiche.Text + ",\r\n  \"parametriTorneo\": [\r\n " + Session["idParametri"] + "\r\n  ],\r\n \"tipoTorneo\": \"" + cmbTipoTorneo.SelectedItem.Text + "\",\r\n  \"impianti\": [\r\n    " + Session["nomeImpianti"] + "\r\n  ]\r\n}";
              IRestResponse response = client.Execute(request);
            if (response.StatusCode == HttpStatusCode.OK)
                Response.Redirect("OutputTorneo.aspx?token=" + token); //rimanda alla form 'output tornei'
            else
                error = response.ErrorMessage;
        }

        /*protected void cmbParametro_SelectedIndexChanged(object sender, EventArgs e)
        {
            DropDownList cmb = (DropDownList)sender;
            Label lb = new Label();
            Session["idParametri"] += ("\"" + cmb.SelectedItem.Text + "\",");
            lb.ID = cmb.SelectedValue;
            lb.Text = cmb.SelectedItem.Text;
            parametriInseriti.Controls.Add(lb);
            cmbParametro.Items.Remove(cmb.SelectedItem);
        }*/

        protected void AddImpianto_Click(object sender, EventArgs e)
        {

        }

        /*protected void impiantiInseriti_SelectedIndexChanged(object sender, EventArgs e)
        {
            DropDownList cmb = (DropDownList)sender;
            Label lb = new Label();
            Session["nomeImpianti"] += ("\"" + cmb.SelectedItem.Text +"\",");
            lb.ID = cmb.SelectedValue;
            lb.Text = cmb.SelectedItem.Text;
            impiantiSelezionati.Controls.Add(lb);
            cmbImpianto.Items.Remove(cmb.SelectedItem);
        }   */
    }
}
