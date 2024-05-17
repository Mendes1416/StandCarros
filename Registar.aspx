<%@ Page Title="" Language="C#" MasterPageFile="~/Modelo.Master" AutoEventWireup="true" CodeBehind="Registar.aspx.cs" Inherits="MendesStand.WebForm3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="https://www.google.com/recaptcha/api.js"></script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!-- Formulário de registo -->

    <div class="container" style="width:300px">
        <h2>Registar nova conta </h2>
        <hr />
        <div class="card card-container">
            Nome:
            <input type="text" id="txt_nome" class="form-control" style="width: 300px" runat="server" placeholder="Introduza o seu nome..." />

            Username:
            <% if (Lbl_erro_utilizador.Visible == true)
                { %>
            <input type="text" id="txt_username_erro" class="form-control" style="width: 300px; border-color: red" runat="server" placeholder="Nome do Utilizador..." />
            <% }
                else
                { %>
            <input type="text" id="txt_username" class="form-control" style="width: 300px" runat="server" placeholder="Nome do Utilizador..." />
            <% } %>

            <asp:Label ID="Lbl_erro_utilizador" Visible="false" runat="server" Text="Label" Style="color: red"></asp:Label>
            <div></div>
            Password:
            <input type="password" id="txt_password" class="form-control" style="width: 300px" runat="server" />
            Confirma Password:
            <% if (Lbl_erro_pass.Visible == true)
                { %>
            <input type="password" id="Txt_confirmapassword_erro" class="form-control" style="width: 300px; border-color: red" runat="server" />
            <% }
                else
                { %>
            <input type="password" id="txt_confirmapassword" class="form-control" style="width: 300px" runat="server" />
            <% } %>

            <asp:Label ID="Lbl_erro_pass" Visible="false" runat="server" Text="Label" Style="color: red"></asp:Label>
            <div></div>
            Email:
            <input type="email" id="Txt_Email" class="form-control" style="width: 300px" runat="server" placeholder="O seu email..." />
            <br />
            Foto Perfil
            <asp:FileUpload ID="Upload_Foto_perfil" runat="server" />
            <br />
            <asp:Button ID="btn_registar" OnClick="btn_registar_Click" Text="Registar" runat="server" CssClass="btn btn-success" Style="width: 300px" />

            <br />

        </div>
     

    </div>


</asp:Content>
