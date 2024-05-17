<%@ Page Title="" Language="C#" MasterPageFile="~/Modelo.Master" AutoEventWireup="true" CodeBehind="favorito.aspx.cs" Inherits="MendesStand.WebForm8" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .favorite-item {
            display: grid;
            grid-template-columns: auto 1fr;
            gap: 10px;
            border: 1px solid #ccc;
            padding: 10px;
            margin-bottom: 10px;
        }

        .favorite-item img {
            width: 100%;
            max-width: 156px; /* Largura máxima da imagem */
            height: auto;
        }

        .favorites-title {
            text-align: center;
            margin-bottom: 20px; /* Espaçamento abaixo do título */
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2 class="favorites-title">Meus Favoritos</h2>
    <asp:DataList ID="DataList1" runat="server" DataKeyField="CarroID" DataSourceID="Dados_Carros_Favoritos" Width="100%" OnSelectedIndexChanged="DataList1_SelectedIndexChanged">
        <ItemTemplate>
            <asp:Panel runat="server" CssClass="favorite-item">
                <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("CarroID", "carro/{0}.png") %>' />
                <div>
                    CarroID:
                    <asp:Label ID="CarroIDLabel" runat="server" Text='<%# Eval("CarroID") %>' />
                    <br />
                    Modelo:
                    <asp:Label ID="ModeloLabel" runat="server" Text='<%# Eval("Modelo") %>' />
                    <br />
                    Marca:
                    <asp:Label ID="MarcaLabel" runat="server" Text='<%# Eval("Marca") %>' />
                    <br />
                    Ano:
                    <asp:Label ID="AnoLabel" runat="server" Text='<%# Eval("Ano") %>' />
                    <br />
                    Preco:
                    <asp:Label ID="PrecoLabel" runat="server" Text='<%# Eval("Preco") %>' />
                </div>
            </asp:Panel>
        </ItemTemplate>
    </asp:DataList>
    <asp:SqlDataSource ID="Dados_Carros_Favoritos" runat="server" ConnectionString="<%$ ConnectionStrings:LIgação_bd %>" SelectCommand="SELECT Carros.* FROM [Carros] inner join Favoritos on (Favoritos.CarroID=Carros.CarroID) where username = @username">
        <SelectParameters>
            <asp:SessionParameter Name="username" SessionField="user" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
