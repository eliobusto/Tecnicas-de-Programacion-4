<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="modificacionconsulta_modelos.aspx.cs" Inherits="modificacionconsulta_modelos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Label ID="Label1" runat="server" 
        Text="*Seleccione un modelo para eliminar."></asp:Label>
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
        AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" 
        DataKeyNames="id_modelo" DataSourceID="SqlDataSource1" 
        EmptyDataText="No hay registros de datos para mostrar." ForeColor="#333333" 
        GridLines="None" onselectedindexchanged="GridView1_SelectedIndexChanged">
        <RowStyle BackColor="#EFF3FB" />
        <Columns>
            <asp:CommandField ShowEditButton="True" ShowSelectButton="True" />
            <asp:BoundField DataField="id_modelo" HeaderText="C&oacute;digo" ReadOnly="True" 
                SortExpression="id_modelo" InsertVisible="False" />
            <asp:BoundField DataField="desc_modelo" HeaderText="Modelo" 
                SortExpression="desc_modelo" />
            <asp:BoundField DataField="desc_marca" HeaderText="Marca" 
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
    <asp:Label ID="Label2" runat="server" Text="Modelo seleccionado:"></asp:Label>
&nbsp;&nbsp;&nbsp;
    <asp:Label ID="Label3" runat="server" Font-Bold="True"></asp:Label>
&nbsp;&nbsp;&nbsp;
    <asp:Label ID="Label4" runat="server" Font-Bold="True"></asp:Label>
    <br />
    <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Button ID="Button1" runat="server" Enabled="False" onclick="Button1_Click" 
        Text="Eliminar" />
    <br />
    <br />
&nbsp;&nbsp;&nbsp;
    <asp:Label ID="Label5" runat="server"></asp:Label>
    <br />
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:TP4_RegularidadExtraConnectionString %>" 
        DeleteCommand="DELETE FROM [MODELOS] WHERE [id_modelo] = @id_modelo" 
        InsertCommand="INSERT INTO [MODELOS] ([desc_modelo]) VALUES (@desc_modelo)" 
        ProviderName="<%$ ConnectionStrings:TP4_RegularidadExtraConnectionString.ProviderName %>" 
        SelectCommand="SELECT mo.id_modelo, mo.desc_modelo, ma.desc_marca FROM MODELOS AS mo INNER JOIN MARCAS AS ma ON ma.id_marca = mo.id_marca" 
        
        
        UpdateCommand="UPDATE [MODELOS] SET [desc_modelo] = @desc_modelo WHERE [id_modelo] = @id_modelo">
        <DeleteParameters>
            <asp:Parameter Name="id_modelo" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="desc_modelo" Type="String" />
            <asp:Parameter Name="id_marca" Type="Int32" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="desc_modelo" Type="String" />
            <asp:Parameter Name="id_marca" Type="Int32" />
            <asp:Parameter Name="id_modelo" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>

