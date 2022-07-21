<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="modificacion_autos.aspx.cs" Inherits="modificacion_autos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Label ID="Label1" runat="server" Text="Ingrese numero de auto:" 
        Width="180px"></asp:Label>
    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
        ControlToValidate="TextBox1" ErrorMessage="Debe ingresar un numero de auto">*</asp:RequiredFieldValidator>
    <asp:CustomValidator ID="CustomValidator1" runat="server" 
        ControlToValidate="TextBox1" ErrorMessage="Debe igresar un numero" 
        onservervalidate="CustomValidator1_ServerValidate">*</asp:CustomValidator>
    <br />
    <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="BUSCAR" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Button ID="Button3" runat="server" onclick="Button3_Click" 
        Text="LIMPIAR" />
    <br />
    <br />
    <asp:Label ID="Label7" runat="server" ForeColor="Red"></asp:Label>
    <br />
    <br />
    <asp:Label ID="Label2" runat="server" Text="A&amp;ntilde;o: " Width="80px"></asp:Label>
    <asp:TextBox ID="TextBox2" runat="server" Width="125px"></asp:TextBox>
    <asp:CustomValidator ID="CustomValidator2" runat="server" 
        ControlToValidate="TextBox2" 
        ErrorMessage="Debe ingresar un a&amp;ntilde;o v&amp;aacute;lido" 
        onservervalidate="CustomValidator2_ServerValidate">*</asp:CustomValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
        ControlToValidate="TextBox2" 
        ErrorMessage="Debe ingresar un a&amp;ntilde;o" Enabled="False">*</asp:RequiredFieldValidator>
    <br />
    <br />
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:Label ID="Label4" runat="server" Text="Marca:" Width="80px"></asp:Label>
            <asp:DropDownList ID="DropDownList1" runat="server" 
                DataSourceID="SqlDataSourceMarcas" DataTextField="desc_marca" 
                DataValueField="id_marca" ontextchanged="ChangeValueDropDownList1" 
                Width="125px">
            </asp:DropDownList>
            <br />
            <br />
            <asp:Label ID="Label5" runat="server" Text="Modelo:" Width="80px"></asp:Label>
            <asp:DropDownList ID="DropDownList2" runat="server" 
                DataSourceID="SqlDataSourceModelos" DataTextField="desc_modelo" 
                DataValueField="id_modelo" Width="125px">
            </asp:DropDownList>
        </ContentTemplate>
    </asp:UpdatePanel>
    <br />
    <asp:Label ID="Label3" runat="server" Text="Pagina web:" Width="80px" 
        Height="16px"></asp:Label>
    <asp:TextBox ID="TextBox3" runat="server" Width="125px"></asp:TextBox>
    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
        ControlToValidate="TextBox3" 
        ErrorMessage="Debe ingresar una p&amp;aacute;gina web v&amp;aacute;lida" 
        
        ValidationExpression="^((ftp|http|https):\/\/)?([a-zA-Z0-9]+(\.[a-zA-Z0-9]+)+.*)$">*</asp:RegularExpressionValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
        ControlToValidate="TextBox3" 
        ErrorMessage="Debe ingresar una p&amp;aacute;gina web" Enabled="False">*</asp:RequiredFieldValidator>
    <br />
    <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Button ID="Button2" runat="server" onclick="Button2_Click" 
        Text="ACTUALIZAR DATOS" Width="180px" Enabled="False" />
    <br />
    <br />
    <asp:Label ID="Label8" runat="server" ForeColor="Lime"></asp:Label>
    <br />
    <br />
            <asp:Image ID="Image" runat="server" 
        Width="200px" Visible="False" />
            <br />
    <br />
            <asp:Label ID="Label9" runat="server" Text="Seleccione una nueva foto:"></asp:Label>
            <asp:FileUpload ID="FileUpload1" runat="server" filename="esta pagina" 
        />
    <asp:Label ID="Label11" runat="server" ForeColor="Red"></asp:Label>
    <br />
    <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="Button4" runat="server" Enabled="False" onclick="Button4_Click" 
                style="width: 148px" Text="CAMBIAR FOTO" />
            <br />
    <br />
            <asp:Label ID="Label10" runat="server" ForeColor="Lime"></asp:Label>
        <br />
    <br />
    <br />
    <asp:SqlDataSource ID="SqlDataSourceMarcas" runat="server" 
        ConnectionString="<%$ ConnectionStrings:TP4_RegularidadExtraConnectionString %>" 
        ProviderName="<%$ ConnectionStrings:TP4_RegularidadExtraConnectionString.ProviderName %>" 
        SelectCommand="SELECT * FROM [MARCAS]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSourceModelos" runat="server" 
        ConnectionString="<%$ ConnectionStrings:TP4_RegularidadExtraConnectionString %>" 
        ProviderName="<%$ ConnectionStrings:TP4_RegularidadExtraConnectionString.ProviderName %>" 
        SelectCommand="SELECT * FROM [MODELOS]">
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownList1" Name="id_marca" 
                PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDatosAutos" runat="server" 
        ConnectionString="<%$ ConnectionStrings:TP4_RegularidadExtraConnectionString %>" 
        ProviderName="<%$ ConnectionStrings:TP4_RegularidadExtraConnectionString.ProviderName %>" 
        SelectCommand="SELECT id_auto, anio_auto, id_marca, id_modelo, web_auto, archivo FROM AUTOS WHERE (id_auto = @id_auto)" 
        
        UpdateCommand="UPDATE AUTOS SET anio_auto = @anio_auto, id_marca = @id_marca, id_modelo = @id_modelo, web_auto = @web_auto WHERE (id_auto = @id_auto)">
        <SelectParameters>
            <asp:Parameter Name="id_auto" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="anio_auto" />
            <asp:Parameter Name="id_marca" />
            <asp:Parameter Name="id_modelo" />
            <asp:Parameter Name="web_modelo" />
            <asp:Parameter Name="archivo" />
            <asp:Parameter Name="id_auto" />
            <asp:Parameter Name="web_auto" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlImagenAutos" runat="server" 
        ConnectionString="<%$ ConnectionStrings:TP4_RegularidadExtraConnectionString %>" 
        DeleteCommandType="StoredProcedure" 
        ProviderName="<%$ ConnectionStrings:TP4_RegularidadExtraConnectionString.ProviderName %>" 
        UpdateCommand="update AUTOS set archivo=@archivo where (id_auto=@id_auto)">
        <UpdateParameters>
            <asp:Parameter Name="archivo" />
            <asp:Parameter Name="id_auto" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" />
</asp:Content>

