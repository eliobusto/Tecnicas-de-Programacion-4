<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="adm_marcas.aspx.cs" Inherits="adm_marcas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:HyperLink ID="HyperLink6" runat="server" NavigateUrl="~/alta_marca.aspx">Agregar Nueva Marca</asp:HyperLink>
    <br />
    <br />
    <asp:HyperLink ID="HyperLink5" runat="server" 
        NavigateUrl="~/modificacionconsulta_marcas.aspx">Edicion, Consulta y Baja de Marcas</asp:HyperLink>
    <br />
</asp:Content>

