<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="baja_autos.aspx.cs" Inherits="baja_autost" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Label ID="Label1" runat="server" 
        Text="Ingrese nro indentificador del auto:"></asp:Label>
    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
        ControlToValidate="TextBox1" ErrorMessage="Campo incompleto">*</asp:RequiredFieldValidator>
    <asp:CustomValidator ID="CustomValidator1" runat="server" 
        ControlToValidate="TextBox1" ErrorMessage="Debe ingresar un dato numerico" 
        onservervalidate="CustomValidator1_ServerValidate">*</asp:CustomValidator>
    <br />
    <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Button ID="Button1" runat="server" onclick="Button1_Click" 
        Text="Eliminar" />
    <asp:Label ID="Label2" runat="server"></asp:Label>
    <br />
    <asp:SqlDataSource ID="SqlDataAutos" runat="server" 
        ConnectionString="<%$ ConnectionStrings:TP4_RegularidadExtraConnectionString %>" 
        DeleteCommand="DELETE FROM AUTOS WHERE (id_auto = @id)" 
        ProviderName="<%$ ConnectionStrings:TP4_RegularidadExtraConnectionString.ProviderName %>" 
        SelectCommand="SELECT archivo FROM AUTOS WHERE (id_auto = @id)">
        <SelectParameters>
            <asp:Parameter Name="id" />
        </SelectParameters>
        <DeleteParameters>
            <asp:Parameter Name="id" />
        </DeleteParameters>
    </asp:SqlDataSource>
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" />
</asp:Content>

