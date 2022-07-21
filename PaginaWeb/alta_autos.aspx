<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="alta_autos.aspx.cs" Inherits="alta_autos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Label width="100px" ID="Label1" runat="server" Text="Año del auto: "></asp:Label>
    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
        ErrorMessage="Debe completar el campo 'A&ntilde;o del Auto'" 
        ControlToValidate="TextBox1">*</asp:RequiredFieldValidator>
    <asp:CustomValidator ID="CustomValidator1" runat="server" 
        ErrorMessage="Debe ingresar un a&ntilde;o valido" 
        ControlToValidate="TextBox1" onservervalidate="CustomValidator1_ServerValidate">*</asp:CustomValidator>
    <br />
    <br />
    <asp:Label width="100px" ID="Label2" runat="server" Text="Marca: "></asp:Label>
    <asp:DropDownList ID="DropDownList1" runat="server" 
        DataSourceID="SqlDataSourceMarcas" DataTextField="desc_marca" 
        DataValueField="id_marca" AutoPostBack="True">
</asp:DropDownList>
    <br />
    <br />
    <asp:Label width="100px" ID="Label3" runat="server" Text="Modelo:"></asp:Label>
    <asp:DropDownList ID="DropDownList2" runat="server" 
        DataSourceID="SqlDataSourceModelos" DataTextField="desc_modelo" 
        DataValueField="id_modelo">
</asp:DropDownList>
    <br />
    <br />
    <asp:Label width="100px" ID="Label4" runat="server" Text="Pagina web:"></asp:Label>
    <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
        ControlToValidate="TextBox2" 
        ErrorMessage="Debe completar el campo 'Pagina web'">*</asp:RequiredFieldValidator>
    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
        ControlToValidate="TextBox2" ErrorMessage="Debe ingresar una pagina web valida" 
        
        ValidationExpression="^((ftp|http|https):\/\/)?([a-zA-Z0-9]+(\.[a-zA-Z0-9]+)+.*)$">*</asp:RegularExpressionValidator>
    <br />
    <br />
    <asp:Label width="100px" ID="Label5" runat="server" Text="Foto: "></asp:Label>
<asp:FileUpload ID="FileUpload1" runat="server" />
    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
        ControlToValidate="FileUpload1" ErrorMessage="Debe seleccionar un archivo">*</asp:RequiredFieldValidator>
    <asp:CustomValidator ID="CustomValidator2" runat="server" 
        ControlToValidate="FileUpload1" 
        ErrorMessage="Ya hay un archivo con el mismo nombre" 
        onservervalidate="CustomValidator2_ServerValidate">*</asp:CustomValidator>
    <br />
    <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Button ID="Button1" runat="server" Text="Alta" onclick="Button1_Click" />
    <asp:Label ID="Label6" runat="server"></asp:Label>
    <br />
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" />
    <br />
<asp:SqlDataSource ID="SqlDataSourceMarcas" runat="server" 
    ConnectionString="<%$ ConnectionStrings:TP4_RegularidadExtraConnectionString %>" 
    SelectCommand="SELECT * FROM [MARCAS]"></asp:SqlDataSource>
<asp:SqlDataSource ID="SqlDataSourceModelos" runat="server" 
    ConnectionString="<%$ ConnectionStrings:TP4_RegularidadExtraConnectionString %>" 
    
        SelectCommand="SELECT [id_modelo], [desc_modelo] FROM [MODELOS] WHERE ([id_marca] = @id_marca)">
    <SelectParameters>
        <asp:ControlParameter ControlID="DropDownList1" Name="id_marca" 
            PropertyName="SelectedValue" Type="Int32" />
    </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataAutos" runat="server" 
        ConnectionString="<%$ ConnectionStrings:TP4_RegularidadExtraConnectionString %>" 
        InsertCommand="INSERT INTO AUTOS(anio_auto, id_marca, id_modelo, web_auto, archivo) VALUES (@anio, @marca, @modelo, @web, @archivo)" 
        ProviderName="<%$ ConnectionStrings:TP4_RegularidadExtraConnectionString.ProviderName %>">
        <InsertParameters>
            <asp:Parameter Name="anio" />
            <asp:Parameter Name="marca" />
            <asp:Parameter Name="modelo" />
            <asp:Parameter Name="web" />
            <asp:Parameter Name="archivo" />
        </InsertParameters>
    </asp:SqlDataSource>
</asp:Content>

