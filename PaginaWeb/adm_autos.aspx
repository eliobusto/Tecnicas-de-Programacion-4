<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="adm_autos.aspx.cs" Inherits="adm_autos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:HyperLink ID="HyperLink5" runat="server" NavigateUrl="~/alta_autos.aspx">Alta de Autos</asp:HyperLink>
    <br />
    <br />
    <asp:HyperLink ID="HyperLink6" runat="server" NavigateUrl="~/baja_autos.aspx">Baja de Autos</asp:HyperLink>
    <br />
    <br />
    <asp:HyperLink ID="HyperLink7" runat="server" 
        NavigateUrl="~/modificacion_autos.aspx">Modificacion de Autos</asp:HyperLink>
    <br />
    <br />
    <asp:HyperLink ID="HyperLink8" runat="server" 
        NavigateUrl="~/consulta_nroauto.aspx">Consulta de Autos por nro</asp:HyperLink>
    <br />
    <br />
    <asp:HyperLink ID="HyperLink9" runat="server" 
        NavigateUrl="~/consultaautos_pormarca.aspx">Consulta de Autos por marca</asp:HyperLink>
    <br />
</asp:Content>

