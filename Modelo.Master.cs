using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace MendesStand
{
    public partial class Modelo : System.Web.UI.MasterPage
    {
        BaseDados bd = new BaseDados();
        protected void Page_Load(object sender, EventArgs e)
        {
        }
        protected void pesquisar_click(object sender, EventArgs e)
        {
            Response.Redirect("SUV.aspx?pesquisa=" + txt_pesquisa.Value +"&tipologia=coupé");
        }

        protected void AutorizarCookies_ServerClick(object sender, EventArgs e)
        {
            Response.Cookies["Autorizacao"].Value = "sim";
            Response.Redirect("index.aspx");

        }

        


    }
}