using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;

namespace MendesStand
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                if (Request.Cookies["Username"] != null)
                {
                    txt_user.Value = Request.Cookies["Username"].Value;
                    inputPassword.Value = Request.Cookies["pass"].Value;
                    img_profile.Src = "~/imagens/utilizadores/" + txt_user.Value + ".jpg";
                }
            
        }

        protected void Login_click(object sender, EventArgs e)
        {
            if (Chk_lembrar.Checked)
            {
                Response.Cookies["Username"].Value = txt_user.Value;
                Response.Cookies["pass"].Value = inputPassword.Value;
            }

            BaseDados bd = new BaseDados();

            string sqlstr = "select count(Username) from utilizadores where Username = '" + txt_user.Value + "' and pass = HASHBYTES('MD5',@pass)";
            List<SqlParameter> lista = new List<SqlParameter>();
            lista.Add(new SqlParameter("@pass", inputPassword.Value));

            DataTable login = bd.devolve_consulta(sqlstr, lista);

            if (login.Rows[0][0].ToString() == "1")
            {
                if (bd.devolve_consulta("Select Perfil from Utilizadores where Username='" + txt_user.Value + "'").Rows[0][0].ToString() == "Cliente")
                    Session["user"] = txt_user.Value;
                else
                    Session["admin"] = txt_user.Value;
                Response.Redirect("index.aspx");
            }
            else
            {
                lbl_erro.Visible = true;
            }
        }


        protected void bt_recuperarpassword_Click1(object sender, EventArgs e)
        {
            BaseDados bd = new BaseDados();

            // Mail do utilizador que está a pedir para recuperar a password
            string email = bd.devolve_consulta("select count(email) from utilizadores where Username='" + txt_user.Value + "'").Rows[0][0].ToString();
            if (email == "0")
            {
                Response.Write("<script> alert('Username não encontrado') </script>");
                return;
            }
            else
                email = bd.devolve_consulta("select email from utilizadores where Username='" + txt_user.Value + "'").Rows[0][0].ToString();

            // Criar o Token (código chave para enviar por email)
            String token = System.Guid.NewGuid().ToString();

            // Instanciar o objeto de mail
            MailMessage mail = new MailMessage("gpsiesenpsi@gmail.com", email);

            // Configurar a mensagem a enviar
            mail.From = new MailAddress("gpsiesenpsi@gmail.com");
            mail.Subject = "TecNavarro - Recuperação de Password";
            mail.Body = String.Format("Por favor redefina a sua password clicando aqui: <a href='{0}recuperar_password.aspx?id=" + token + "'> Abrir </a>", HttpContext.Current.Request.Url.AbsoluteUri.Substring(0, (HttpContext.Current.Request.Url.AbsoluteUri).Length - 10));

            // Configurar a conta de email para envio
            mail.IsBodyHtml = true;
            SmtpClient smtp = new SmtpClient();
            smtp.Host = "smtp.gmail.com";
            smtp.Credentials = new System.Net.NetworkCredential("gpsiesenpsi", "yfoxqjeibjxsbizn");

            // Envio para o destinatário o email
            smtp.EnableSsl = true;
            smtp.Send(mail);

            // Gravar na tabela da BD o Token
            bd.executa_SQL("Insert into recuperar_password(Username,id) values('" + txt_user.Value + "','" + token + "')");
            Response.Write("<script> alert('Foi enviado um email para a conta do utilzador')</script>)");

        }
    }

}
