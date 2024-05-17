using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MendesStand
{
    public partial class WebForm5 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["pesquisa"]!=null)
            {
                SqlDataSource3.FilterExpression = " modelo like '%" + Request.QueryString["pesquisa"] + "%'";
            }
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            SqlDataSource1.FilterExpression = "marca='" + DropDownList1.SelectedValue + "'";
        }
    }
}