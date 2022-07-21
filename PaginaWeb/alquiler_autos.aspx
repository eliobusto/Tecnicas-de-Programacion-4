<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="alquiler_autos.aspx.cs" Inherits="alquiler_autos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:HyperLink ID="HyperLink5" runat="server" 
        NavigateUrl="~/alta_alquiler.aspx">Registrar nuevo Alquiler</asp:HyperLink>
    <br />
    <br />
    <asp:HyperLink ID="HyperLink6" runat="server" 
        NavigateUrl="~/consultabaja_alquileres.aspx">Consulta y Baja de Alquileres</asp:HyperLink>
</asp:Content>

