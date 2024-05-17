<%@ Page Title="" Language="C#" MasterPageFile="~/Modelo.Master" AutoEventWireup="true" CodeBehind="recuperarpassword.aspx.cs" Inherits="MendesStand.WebForm4" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container" style="width:300px">
        <p>
            &nbsp;
        </p>
        <p>
            Nova Password:
        <asp:TextBox ID="TextBox1" runat="server" Height="24px" Width="251px"></asp:TextBox>
            &nbsp;<asp:Button ID="Button1" runat="server" Height="33px" OnClick="Button1_Click" Text="Ok" Width="46px" />
        </p>
        <p>
            &nbsp;
        </p>
        <p>
        </p>
    </div>
</asp:Content>
