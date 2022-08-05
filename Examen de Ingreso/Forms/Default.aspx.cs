using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;
using Flurl.Http;

namespace Examen_de_Ingreso
{
    
    public partial class _Default : Page
    {
        #region
        string[] subs;
        string estado;
        string NOT = "LOS DATOS NO ESTAN COMPLETOS";
        string valid = "DATOS CORRECTOS";
        #endregion
        protected void Page_Init(object sender, EventArgs e)
        {
            var onBlurScript = Page.ClientScript.GetPostBackEventReference(tbcp, "OnBlur");
            tbcp.Attributes.Add("onblur", onBlurScript);
        }

        protected void Page_Load(object sender, EventArgs e)
        {

            if (IsPostBack)
            {
                var ctrlName = Request.Params[Page.postEventSourceID];
                var args = Request.Params[Page.postEventArgumentID];

                HandleCustomPostbackEvent(ctrlName, args);
            }

        }

        public void HandleCustomPostbackEvent(string ctrlName, string args)
        {    
            if (ctrlName == tbcp.UniqueID && args == "OnBlur")
            {              
                string cp = tbcp.Text;
                getDom(cp);
            }
            
        }

        public async void getDom(string cp)
        {
            var responseString =
                await "https://apitestcotizamatico.azurewebsites.net/api/catalogos".PostUrlEncodedAsync(
                    new { NombreCatalogo = "Sepomex", Filtro = cp, IdAplication = 0 })
                .ReceiveString();
            string[] subs = responseString.Split('\\');

            _Default _Default = new _Default();
            tbest.Text = subs[17].Substring(1).ToString();
            tbmunicipio.Text = subs[25].Substring(1).ToString();
            tbcolonia.Text = subs[59].Substring(1).ToString();
            Array.Clear(subs, 0, subs.Length);
        }
        public void validar_datos(object sender, EventArgs e)
        {
            string date = Request.Form["datepicker"];
            if (
                tbest.Text == null || tbest.Text == ""
                ||tbmunicipio.Text == null || tbcolonia.Text == null
                || tbmunicipio.Text == "" || tbcolonia.Text == "" || ddl_gen.SelectedValue == ""||date==""||date==string.Empty
                )
            { ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + NOT + "');", true); }
            else { ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + valid + "');", true); }
        
        }
      
    }

}