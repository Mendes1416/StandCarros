<%@ Page Title="" Language="C#" MasterPageFile="~/Modelo.Master" AutoEventWireup="true" CodeBehind="SUV.aspx.cs" Inherits="MendesStand.WebForm5" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .img-carro {
            padding: 10px;
        }
    </style>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%-- Filtro dos carros --%>
    <div class="col-sm-3">
        <div class="panel panel-default" style="width: 200px">
            <div class="panel-heading">
                FILTROS
            </div>
            <div class="panel-body">
                <hr />
                <b>Marca </b>
                <hr style="width: 200px" />
                <br />
                <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="Marca" DataValueField="Marca" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:LIgação_bd %>" SelectCommand="SELECT DISTINCT [Marca] FROM [Carros] ORDER BY [Marca]"></asp:SqlDataSource>
                <asp:SqlDataSource ID="ligacaostring" runat="server" ConnectionString="<%$ ConnectionStrings:LIgação_bd %>" SelectCommand="SELECT DISTINCT marca FROM [Carros] ORDER BY [Marca]"></asp:SqlDataSource>
            </div>
            <!-- Adicione outros filtros conforme necessário -->
        </div>
    </div>


    <asp:DataList ID="DataList1" runat="server" CellPadding="4" CellSpacing="10" DataKeyField="CarroID" DataSourceID="SqlDataSource3" RepeatColumns="4" RepeatDirection="Horizontal" BorderColor="White" BorderWidth="1px" Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" ForeColor="#333333">
        <AlternatingItemStyle BackColor="White" />
        <EditItemStyle Height="100px" HorizontalAlign="Left" Width="100px" CssClass="type=&quot;text/css&quot;&gt;" />
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <ItemStyle BackColor="#EFF3FB" />
        <ItemTemplate>
            <asp:Image ID="Image1" runat="server" Height="104px" ImageUrl='<%# Eval("CarroID", "carro/{0}.png") %>' Width="107px" />
            <br />
            <asp:LinkButton ID="LinkButton1" runat="server" PostBackUrl='<%# Eval("CarroID", "detalhes.aspx?id_Carro={0}") %>'>Ver Detalhes</asp:LinkButton>
            <br />
        </ItemTemplate>
        <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <SeparatorStyle Font-Bold="true" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" Wrap="False" />
    </asp:DataList>
    &nbsp;
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:LIgação_bd %>" SelectCommand="SELECT [CarroID], [Marca], [modelo] FROM [Carros] WHERE ([Tipologia] = @Tipologia)">
        <SelectParameters>
            <asp:QueryStringParameter Name="Tipologia" QueryStringField="tipologia" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="ListaMarcas" runat="server" ConnectionString="<%$ ConnectionStrings:LIgação_bd %>" SelectCommand="SELECT DISTINCT [Marca] FROM [Carros]"></asp:SqlDataSource>


    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:LIgação_bd %>" SelectCommand="SELECT * FROM [Carros] WHERE ([Tipologia] = @Tipologia)">
        <SelectParameters>
            <asp:QueryStringParameter Name="Tipologia" QueryStringField="tipologia" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
