<%@ Page Title="" Language="C#" MasterPageFile="~/Modelo.Master" AutoEventWireup="true" CodeBehind="detalhes.aspx.cs" Inherits="MendesStand.WebForm6" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .detalhes-container {
            margin: 0 auto; /* Isso centraliza horizontalmente */
            width: 50%; /* Ajuste conforme necessário */
            border: 1px solid #ccc; /* Adiciona uma borda */
            padding: 20px; /* Adiciona espaço interno */
            text-align: center; /* Centraliza o conteúdo dentro da div */
        }

            .detalhes-container label {
                font-weight: bold; /* Adiciona negrito aos elementos <label> dentro de detalhes-container */
            }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <br />
    <br />
    <div class="detalhes-container">
        <h2>Detalhes do Produto</h2>
        <br />
        <div class="md-3">
            <asp:Image ID="ImgCarro" runat="server" Height="190px" Width="190px" />
            <br />
            <br />
            <label>Modelo: </label>
            <asp:Label ID="lblModelo" runat="server" Text=""></asp:Label><br />
            <label>Marca: </label>
            <asp:Label ID="lblMarca" runat="server" Text=""></asp:Label><br />
            <label>Ano: </label>
            <asp:Label ID="lblAno" runat="server" Text=""></asp:Label><br />
            <label>Stock: </label>
            <asp:Label ID="lblStock" runat="server" Text=""></asp:Label><br />
            <label>Tipologia: </label>
            <asp:Label ID="lblTipologia" runat="server" Text=""></asp:Label><br />
            <label>Preço: </label>
            <asp:Label ID="lblPreco" runat="server" Text=""></asp:Label><br />

            <!-- Verificar se está logado -->
            <% if (Session["user"] != null)
                {  %>

            <!-- Botão para favorito -->
            <asp:ImageButton ID="btn_favorito" runat="server" Height="41px" Width="53px" OnClick="btn_favorito_click" ImageUrl="~/carro/tornar_favorito.png" />

            <!-- Botão para adicionar ao carrinho -->
            <button type="button" class="btn btn-success" data-toggle="modal" data-target="#myModal">Adicionar ao Carrinho</button>

            <%} %>
        </div>
    </div>
</asp:Content>

