<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="consulta_nroauto.aspx.cs" Inherits="consulta_autos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        #div_imagenes
        {
            width: 600px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Label ID="Label1" runat="server" Text="Ingresar nro de auto"></asp:Label>
    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
        ControlToValidate="TextBox1" ErrorMessage="Debe ingresar un nro">*</asp:RequiredFieldValidator>
    <asp:CustomValidator ID="CustomValidator1" runat="server" 
        ControlToValidate="TextBox1" ErrorMessage="Debe ingresar un nro valido" 
        onservervalidate="CustomValidator1_ServerValidate">*</asp:CustomValidator>
    <br />
    <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="Buscar" />
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" />
    <br />
    <br />
    <asp:Image ID="ImagenDetalle" runat="server" Height="150px" Visible="False" 
        Width="300px" />
    <br />
    <asp:Label ID="Label2" runat="server"></asp:Label>
    <asp:SqlDataSource ID="SqlDataAutos" runat="server" 
        ConnectionString="<%$ ConnectionStrings:TP4_RegularidadExtraConnectionString %>" 
        SelectCommand="SELECT au.id_auto, au.anio_auto, au.id_marca, au.id_modelo, au.web_auto, au.archivo, ma.id_marca AS Expr1, ma.desc_marca, mo.id_modelo AS Expr2, mo.desc_modelo, mo.id_marca AS Expr3 FROM AUTOS AS au INNER JOIN MARCAS AS ma ON au.id_marca = ma.id_marca INNER JOIN MODELOS AS mo ON au.id_modelo = mo.id_modelo WHERE (au.id_auto = @id)">
        <SelectParameters>
            <asp:Parameter Name="id" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
    <br />
</asp:Content>

