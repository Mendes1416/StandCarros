using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using MendesStand;

namespace MendesStand
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_registar_Click(object sender, EventArgs e)
        {
            Lbl_erro_pass.Visible = false;
            Lbl_erro_utilizador.Visible = false;

            BaseDados bd = new BaseDados();

            // Testar se já existe um utilizador com esse Username
            if (bd.devolve_consulta("select count(username) from utilizadores where username='" + txt_username.Value + "'").Rows[0][0].ToString() == "1")
            {
                Lbl_erro_utilizador.Visible = true;
                Lbl_erro_utilizador.Text = "Utilizador já existente";
                return;
            }
            else
            {
                Lbl_erro_utilizador.Visible = false;
            }

            // Testar se a pass é igual ao confirmapass
            if (txt_password.Value != txt_confirmapassword.Value)

            {
                Lbl_erro_pass.Visible = true;
                Lbl_erro_pass.Text = "As password não são iguais";
                return;
            }


            // Testar se a pass tem pelo menos 8 caracteres
            if (txt_password.Value.ToString().Length < 8)

            {
                Lbl_erro_pass.Visible = true;
                Lbl_erro_pass.Text = "A password tem de ter no mínimo 8 caracteres";
                return;
            }


            // Verificar se não é um robo
            var encodedResponse = Request.Form["g-Recaptcha-Response"];
            var isCaptchaValid = ReCaptcha.Validate(encodedResponse);
            //if (isCaptchaValid == true)
            {
                if (Upload_Foto_perfil.HasFile)
                {
                    string nome_imagem = txt_username.Value;
                    Upload_Foto_perfil.SaveAs(Server.MapPath("~/imagens/utilizadores/" + nome_imagem + ".jpg"));
                }

                // Inserir os dados do utilizador na tabela da BD
                string StrSql = "Insert into utilizadores(username,pass,nome,perfil,email)";
                StrSql += " Values(@username, HASHBYTES('MD5',@pass), @nome,'Cliente',@email)";

                List<SqlParameter> parametros = new List<SqlParameter>();
                parametros.Add(new SqlParameter("@username", txt_username.Value));
                parametros.Add(new SqlParameter("@pass", txt_password.Value));
                parametros.Add(new SqlParameter("@nome", txt_nome.Value));
                parametros.Add(new SqlParameter("@email", Txt_Email.Value));

                bd.executa_SQL(StrSql, parametros);
                Response.Redirect("Login.aspx");

            }
             
        }
    }
}