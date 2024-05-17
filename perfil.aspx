<%@ Page Title="" Language="C#" MasterPageFile="~/Modelo.Master" AutoEventWireup="true" CodeBehind="perfil.aspx.cs" Inherits="MendesStand.WebForm9" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <span class="badge">
    <asp:FormView ID="FormView1" runat="server" DataKeyNames="Username" DataSourceID="Dados_Utilizador_Editar" DefaultMode="Edit">
        <EditItemTemplate>
            Username:
            <asp:Label ID="UsernameLabel1" runat="server" Text='<%# Eval("Username") %>' />
            <br />
            Nome:
            <asp:TextBox ID="NomeTextBox" runat="server" Text='<%# Bind("Nome") %>' />
            <br />
            email:
            <asp:TextBox ID="emailTextBox" runat="server" Text='<%# Bind("email") %>' />
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" OnClick="UpdateButton_Click" Text="Atualizar" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancelar" />
        </EditItemTemplate>
        <InsertItemTemplate>
            Username:
            <asp:TextBox ID="UsernameTextBox" runat="server" Text='<%# Bind("Username") %>' />
            <br />
            Nome:
            <asp:TextBox ID="NomeTextBox0" runat="server" Text='<%# Bind("Nome") %>' />
            <br />
            email:
            <asp:TextBox ID="emailTextBox0" runat="server" Text='<%# Bind("email") %>' />
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Inserir" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancelar" />
        </InsertItemTemplate>
        <ItemTemplate>
            Username:
            <asp:Label ID="UsernameLabel" runat="server" Text='<%# Eval("Username") %>' />
            <br />
            Nome:
            <asp:Label ID="NomeLabel" runat="server" Text='<%# Bind("Nome") %>' />
            <br />
            email:
            <asp:Label ID="emailLabel" runat="server" Text='<%# Bind("email") %>' />
            <br />
            <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Editar" />
            &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Excluir" />
            &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="Novo" />
        </ItemTemplate>
    </asp:FormView>
    </span>
</asp:Content>
