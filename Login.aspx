<%@ Page Title="" Language="C#" MasterPageFile="~/Modelo.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="MendesStand.WebForm2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <div class="container" style="width: 250px; height: 120px" />

    <div class="card card-container">

        <% if (Request.Cookies["Username"] != null)
            { %>
        <img class="profile-img-card" style="width: 220px; height: 210px" src="imagens/utiliza/<%Response.Write(Request.Cookies["Username"].Value);%>.jpg" alt="" />
        <%  }
            else
            { %>
        <img class="profile-img-card" style="width: 220px; height: 210px" src="//ssl.gstatic.com/accounts/ui/avatar_2x.png" alt="" id="img_profile" runat="server" />
        <%  } %>
        <p id="profile-name" class="profile-name-card"></p>

        <span id="reauth-email" class="reauth-email"></span>
        <input type="text" id="txt_user" class="form-control" placeholder="Email address" required autofocus runat="server">
        <input type="password" id="inputPassword" class="form-control" placeholder="Password" required runat="server">
        <div id="remember" class="checkbox">
            <label>
                <asp:CheckBox ID="Chk_lembrar" runat="server" Text="lembrar-me" />
            </label>
        </div>
        <asp:Button runat="server" class="btn btn-lg btn-primary btn-block btn-signin" Text="Sign-In" ID="btn_Login" OnClick="Login_click" />


        

        <br />
        <asp:Label ID="lbl_erro" runat="server" Font-Bold="True" ForeColor="Red" Text="Login incorreto" Visible="False"></asp:Label>
    </div>
    <!-- /card-container -->

  
</asp:Content>
