<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="alta_modelos.aspx.cs" Inherits="alta_modelos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Label ID="Label1" runat="server" 
        Text="Seleccione la Marca del nuevo Modelo:" Width="260px"></asp:Label>
    <asp:DropDownList ID="DropDownList1" runat="server" 
        DataSourceID="SqlDataSourceMarca" DataTextField="desc_marca" 
        DataValueField="id_marca" Width="150px">
    </asp:DropDownList>
    <br />
    <br />
    <asp:Label ID="Label2" runat="server" 
        Text="Ingrese el nombre del nuevo Modelo:" Width="260px"></asp:Label>
    <asp:TextBox ID="TextBox1" runat="server" Width="150px"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
        ControlToValidate="TextBox1" ErrorMessage="Debe ingresar un nombre">*</asp:RequiredFieldValidator>
    <asp:CustomValidator ID="CustomValidator1" runat="server" 
        ControlToValidate="TextBox1" 
        ErrorMessage="Se ingresaron car&amp;aacute;cteres invalidos" 
        onservervalidate="CustomValidator1_ServerValidate">*</asp:CustomValidator>
    <br />
    <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Button ID="Button1" runat="server" onclick="Button1_Click" 
        Text="Agregar" />
    <br />
    <br />
&nbsp;&nbsp;&nbsp;
    <asp:Label ID="Label3" runat="server" ForeColor="Lime"></asp:Label>
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" />
    <asp:SqlDataSource ID="SqlDataSourceMarca" runat="server" 
        ConnectionString="<%$ ConnectionStrings:TP4_RegularidadExtraConnectionString %>" 
        ProviderName="<%$ ConnectionStrings:TP4_RegularidadExtraConnectionString.ProviderName %>" 
        SelectCommand="SELECT * FROM [MARCAS]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSourceModelo" runat="server" 
        ConnectionString="<%$ ConnectionStrings:TP4_RegularidadExtraConnectionString %>" 
        InsertCommand="insert into MODELOS (desc_modelo, id_marca) values (@desc_modelo, @id_marca)" 
        ProviderName="<%$ ConnectionStrings:TP4_RegularidadExtraConnectionString.ProviderName %>">
        <InsertParameters>
            <asp:Parameter Name="desc_modelo" />
            <asp:Parameter Name="id_marca" />
        </InsertParameters>
    </asp:SqlDataSource>
</asp:Content>

