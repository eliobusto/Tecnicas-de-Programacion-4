<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="consultabaja_alquileres.aspx.cs" Inherits="consultabaja_alquileres" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
        AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" 
        DataKeyNames="id_alquiler" DataSourceID="SqlDataSource1" 
        EmptyDataText="No hay registros de datos para mostrar." ForeColor="#333333" 
        GridLines="None">
        <RowStyle BackColor="#EFF3FB" />
        <Columns>
            <asp:CommandField ShowDeleteButton="True" />
            <asp:BoundField DataField="id_alquiler" HeaderText="C&oacute;digo" ReadOnly="True" 
                SortExpression="id_alquiler" />
            <asp:BoundField DataField="id_auto" HeaderText="Auto" 
                SortExpression="id_auto" />
            <asp:BoundField DataField="fecha_alquiler" HeaderText="Fecha" 
                SortExpression="fecha_alquiler" />
        </Columns>
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <EditRowStyle BackColor="#2461BF" />
        <AlternatingRowStyle BackColor="White" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:TP4_RegularidadExtraConnectionString %>" 
        DeleteCommand="DELETE FROM [ALQUILERES] WHERE [id_alquiler] = @id_alquiler" 
        InsertCommand="INSERT INTO [ALQUILERES] ([id_auto], [fecha_alquiler]) VALUES (@id_auto, @fecha_alquiler)" 
        ProviderName="<%$ ConnectionStrings:TP4_RegularidadExtraConnectionString.ProviderName %>" 
        SelectCommand="SELECT [id_alquiler], [id_auto], [fecha_alquiler] FROM [ALQUILERES]" 
        UpdateCommand="UPDATE [ALQUILERES] SET [id_auto] = @id_auto, [fecha_alquiler] = @fecha_alquiler WHERE [id_alquiler] = @id_alquiler">
        <DeleteParameters>
            <asp:Parameter Name="id_alquiler" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="id_auto" Type="Int32" />
            <asp:Parameter DbType="Date" Name="fecha_alquiler" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="id_auto" Type="Int32" />
            <asp:Parameter DbType="Date" Name="fecha_alquiler" />
            <asp:Parameter Name="id_alquiler" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>

