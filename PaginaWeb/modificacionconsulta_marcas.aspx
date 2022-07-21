<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="modificacionconsulta_marcas.aspx.cs" Inherits="adm_marcas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Label ID="Label1" runat="server" 
        Text="*Seleccione una marca para eliminar."></asp:Label>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        CellPadding="4" DataKeyNames="id_marca" DataSourceID="SqlDataSource1" 
        EmptyDataText="No hay registros de datos para mostrar." ForeColor="#333333" 
        GridLines="None" AllowPaging="True" AllowSorting="True" Height="125px" 
        onselectedindexchanged="GridView1_SelectedIndexChanged">
        <RowStyle BackColor="#EFF3FB" />
        <Columns>
            <asp:CommandField ShowEditButton="True" ShowSelectButton="True" />
            <asp:BoundField DataField="id_marca" HeaderText="C&oacute;digo" 
                ReadOnly="True" SortExpression="id_marca" />
            <asp:BoundField DataField="desc_marca" HeaderText="Descripci&oacute;n" 
                SortExpression="desc_marca" />
        </Columns>
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <EditRowStyle BackColor="#2461BF" />
        <AlternatingRowStyle BackColor="White" />
    </asp:GridView>
    <br />
    <asp:Label ID="Label2" runat="server" Text="Marca seleccionada:"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Label ID="Label3" runat="server" Font-Bold="True"></asp:Label>
&nbsp;
    <asp:Label ID="Label5" runat="server" Font-Bold="True"></asp:Label>
    <br />
    <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Button ID="Button1" runat="server" onclick="Button1_Click" 
        Text="Eliminar" />
    <br />
    <br />
&nbsp;&nbsp;&nbsp;
    <asp:Label ID="Label4" runat="server" ForeColor="Red"></asp:Label>
    <br />
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:TP4_RegularidadExtraConnectionString %>" 
        DeleteCommand="DELETE FROM [MARCAS] WHERE [id_marca] = @id_marca" 
        InsertCommand="INSERT INTO [MARCAS] ([desc_marca]) VALUES (@desc_marca)" 
        ProviderName="<%$ ConnectionStrings:TP4_RegularidadExtraConnectionString.ProviderName %>" 
        SelectCommand="SELECT id_marca, desc_marca FROM [MARCAS]" 
        UpdateCommand="UPDATE [MARCAS] SET [desc_marca] = @desc_marca WHERE [id_marca] = @id_marca">
        <DeleteParameters>
            <asp:Parameter Name="id_marca" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="desc_marca" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="desc_marca" Type="String" />
            <asp:Parameter Name="id_marca" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>

