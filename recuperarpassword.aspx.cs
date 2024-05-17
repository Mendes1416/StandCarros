using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MendesStand
{
    public partial class WebForm4 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            BaseDados bd = new BaseDados();

            // Atualizar a PassWord
            string Username = bd.devolve_consulta("select Username from recuperar_password where id='" + Request.QueryString["id"] + "'").Rows[0][0].ToString();
            string strsql = "Update utilizadores set pass=HASHBYTES('MD5',@pass) where Username=@user";
            List<SqlParameter> parametros = new List<SqlParameter>();
            parametros.Add(new SqlParameter("pass", TextBox1.Text));
            parametros.Add(new SqlParameter("user", Username));
            bd.executa_SQL(strsql, parametros);

            // Apagar o Token
            bd.executa_SQL("delete from recuperar_password where id='" + Request.QueryString["id"] + "'");

            Response.Redirect("login.aspx");
        }
    }
}