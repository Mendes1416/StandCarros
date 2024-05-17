using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MendesStand
{
    public partial class WebForm6 : System.Web.UI.Page
    {
        BaseDados bd = new BaseDados();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Verifica se foi passado um parâmetro na URL (por exemplo, o ID do carro)
                if (!string.IsNullOrEmpty(Request.QueryString["id_Carro"]))
                {
                    int carroID = Convert.ToInt32(Request.QueryString["id_Carro"]);

                    // Chama o método para obter os detalhes do carro
                    CarregarDetalhesCarro(carroID);
                }
            }

            if (bd.devolve_consulta("select count(CarroID) from favoritos where CarroID='" + Request.QueryString["id_Carro"] + "' and username='" + Session["user"] + "'").Rows[0][0].ToString() == "1")
            {
                btn_favorito.ImageUrl = "~/imagens/carro/favorito.png";
            }
            else
            {
                btn_favorito.ImageUrl = "~/imagens/carro/tornar_favorito.png";
            }
        }

        private void CarregarDetalhesCarro(int carroID)
        {   
            // Define a string de conexão com o banco de dados
            string connectionString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|datadirectory|\MendesStand.mdf;Integrated Security=True";

            // Cria a conexão com o banco de dados
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                // Define a consulta SQL para obter os detalhes do carro
                string query = "SELECT CarroID, Modelo, Marca, Ano, Preco, Stock, Tipologia FROM Carros WHERE CarroID = @CarroID";

                // Cria o comando SQL com os parâmetros
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    // Adiciona o parâmetro do ID do carro
                    command.Parameters.AddWithValue("@CarroID", carroID);

                    // Abre a conexão com o banco de dados
                    connection.Open();

                    // Executa o comando SQL e obtém o resultado
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        // Verifica se há linhas retornadas
                        if (reader.Read())
                        {
                            // Preenche os controles da página com os detalhes do carro
                            ImgCarro.ImageUrl=("~/carro/"+ carroID + ".png");
                            lblModelo.Text = "Modelo: " + reader["Modelo"].ToString();
                            lblMarca.Text = "Marca: " + reader["Marca"].ToString();
                            lblAno.Text = "Ano: " + reader["Ano"].ToString();
                            lblPreco.Text = "Preço: " + reader["Preco"].ToString();
                            lblStock.Text = "Stock: " + reader["Stock"].ToString();
                            lblTipologia.Text = "Tipologia: " + reader["Tipologia"].ToString();
                        }
                        else
                        {
                            // Caso não encontre o carro, exibe uma mensagem de erro
                            Response.Write("Carro não encontrado.");
                        }
                    }

                }
            }
         

        }
        protected void btn_favorito_click(object sender, ImageClickEventArgs e)
        {   
            // Gravar como favorito
            if (bd.devolve_consulta("select count(CarroID) from favoritos where CarroID='" + Request.QueryString["id_Carro"] + "' and username='" + Session["user"] + "'").Rows[0][0].ToString() == "1")
            {
                bd.executa_SQL("delete from favoritos where CarroID='" + Request.QueryString["id_Carro"] + "' and username='" + Session["user"] + "'");
                btn_favorito.ImageUrl = "imagens/carro/tornar_favorito.png";
            }
            else
            {
                bd.executa_SQL("Insert into Favoritos(username,CarroID) values('" + Session["user"] + "','" + Request.QueryString["id_Carro"] + "')");
                btn_favorito.ImageUrl = "imagens/carro/favorito.png";
            }
            Response.Redirect("detalhes.aspx?id_Carro=" + Request.QueryString["id_Carro"]);
        }
        
    }


}
