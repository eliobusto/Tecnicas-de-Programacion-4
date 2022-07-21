<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="adm_modelos.aspx.cs" Inherits="adm_modelos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:HyperLink ID="HyperLink5" runat="server" NavigateUrl="~/alta_modelos.aspx">Agregar nuevo Modelo</asp:HyperLink>
    <br />
    <br />
    <asp:HyperLink ID="HyperLink6" runat="server" 
        NavigateUrl="~/modificacionconsulta_modelos.aspx">Edición, consulta y baja de Modelos</asp:HyperLink>
</asp:Content>

