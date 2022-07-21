<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="alta_alquiler.aspx.cs" Inherits="alta_alquiler" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Label ID="Label1" runat="server" Text="Ingrese nro de Auto: "></asp:Label>
    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
        ControlToValidate="TextBox1" 
        ErrorMessage="Debe ingresar un n&amp;uacute;mero de auto">*</asp:RequiredFieldValidator>
    <asp:CustomValidator ID="CustomValidator1" runat="server" 
        ErrorMessage="Debe ingresar un n&amp;uacute;mero v&amp;aacute;lido" 
        onservervalidate="CustomValidator1_ServerValidate">*</asp:CustomValidator>
    <br />
    <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Button ID="Button1" runat="server" onclick="Button1_Click" 
        Text="Registrar Alquiler" />
    <br />
    <br />
&nbsp;&nbsp;&nbsp;
    <asp:Label ID="Label2" runat="server" ForeColor="Lime"></asp:Label>
    <br />
    <asp:SqlDataSource ID="SqlDataSourceAlquileres" runat="server" 
        ConnectionString="<%$ ConnectionStrings:TP4_RegularidadExtraConnectionString %>" 
        InsertCommand="INSERT INTO ALQUILERES(id_auto, fecha_alquiler) VALUES (@id_auto, @fecha_alquiler)" 
        ProviderName="<%$ ConnectionStrings:TP4_RegularidadExtraConnectionString.ProviderName %>">
        <InsertParameters>
            <asp:Parameter Name="id_auto" />
            <asp:Parameter Name="fecha_alquiler" />
        </InsertParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSourceAutos" runat="server" 
        ConnectionString="<%$ ConnectionStrings:TP4_RegularidadExtraConnectionString %>" 
        ProviderName="<%$ ConnectionStrings:TP4_RegularidadExtraConnectionString.ProviderName %>" 
        SelectCommand="SELECT id_auto, anio_auto, id_marca, id_modelo, web_auto, archivo FROM AUTOS WHERE (id_auto = @id_auto)">
        <SelectParameters>
            <asp:Parameter Name="id_auto" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" />
</asp:Content>

