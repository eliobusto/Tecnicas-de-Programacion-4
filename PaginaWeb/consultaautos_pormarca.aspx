<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="consultaautos_pormarca.aspx.cs" Inherits="consultaautos_pormarca" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Label ID="Label1" runat="server" Text="Seleccione la marca"></asp:Label>
    <br />
    <asp:DropDownList ID="DropDownList1" runat="server" 
        DataSourceID="SqlDataSourceMarcas" DataTextField="desc_marca" 
        DataValueField="id_marca">
    </asp:DropDownList>
    <br />
    <br />
    <asp:Button ID="Button1" runat="server" onclick="Button1_Click" 
        Text="Mostrar" />
    <br />
    <br />
    <asp:Label ID="Label2" runat="server"></asp:Label>
    <asp:SqlDataSource ID="SqlDataSourceMarcas" runat="server" 
        ConnectionString="<%$ ConnectionStrings:TP4_RegularidadExtraConnectionString %>" 
        SelectCommand="SELECT * FROM [MARCAS]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSourceAutos" runat="server" 
        ConnectionString="<%$ ConnectionStrings:TP4_RegularidadExtraConnectionString %>" 
        ProviderName="<%$ ConnectionStrings:TP4_RegularidadExtraConnectionString.ProviderName %>" 
        SelectCommand="select * from AUTOS where id_marca=@marca">
        <SelectParameters>
            <asp:Parameter Name="marca" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>

