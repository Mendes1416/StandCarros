  <%@ Page Title="" Language="C#" MasterPageFile="~/Modelo.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="MendesStand.WebForm1" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div id="myCarousel" class="carousel slide" data-ride="carousel">
       
        <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource2" Visible="False" AutoGenerateColumns="False" DataKeyNames="carroID">
            <Columns>
                <asp:BoundField DataField="carroID" HeaderText="carroID" ReadOnly="True" SortExpression="carroID" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:LIgação_bd %>" SelectCommand="select top 3 carroID from carros order by carroID desc"></asp:SqlDataSource>
        <!-- Indicators -->
        <ol class="carousel-indicators">
            <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
            <li data-target="#myCarousel" data-slide-to="1"></li>
            <li data-target="#myCarousel" data-slide-to="2"></li>
        </ol>

        <!-- Wrapper for slides -->
        <div class="carousel-inner">
            <div class="item active">

                <img src="carro/<% Response.Write(GridView1.Rows[0].Cells[0].Text); %>.png" alt="Fundo1">
            </div>
                <div class="item">
                    <img src="carro/<% Response.Write(GridView1.Rows[1].Cells[0].Text); %>.png"" alt="Fundo2" />
                </div>

                <div class="item">
                    <img src="carro/<% Response.Write(GridView1.Rows[2].Cells[0].Text); %>.png"" alt="Fundo3" />

                </div>
         </div>

            <!-- Left and right controls -->
            <a class="left carousel-control" href="#myCarousel" data-slide="prev">
                <span class="glyphicon glyphicon-chevron-left"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="right carousel-control" href="#myCarousel" data-slide="next">
                <span class="glyphicon glyphicon-chevron-right"></span>
                <span class="sr-only">Next</span>
            </a>
        </div>
    </div>
</asp:Content>
