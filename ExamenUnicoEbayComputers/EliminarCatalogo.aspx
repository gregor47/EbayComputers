<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EliminarCatalogo.aspx.cs" Inherits="ExamenUnicoEbayComputers.EliminarCatalogo" MasterPageFile="~/MasterPageAdmin.Master" %>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <link rel="stylesheet" href="//cdn.datatables.net/1.10.20/css/jquery.dataTables.min.css">
    <script src="//cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/TableExport/5.2.0/js/tableexport.js"></script>
    <form id="form1" runat="server">
        <br/><br/><br/>
    <div class="container mt-5 h-100 w-100">
            <h2>Eliminar Productos</h2>

        <div class="row mt-5 text-left">
            <div class="col-md-12">
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="table table-hover" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
            <Columns>
                <asp:BoundField DataField="id_producto" HeaderText="id_producto" InsertVisible="False" ReadOnly="True" SortExpression="id_producto" />
                <asp:BoundField DataField="Nombre" HeaderText="Nombre" SortExpression="Nombre" />
                <asp:BoundField DataField="ImagenUrl" HeaderText="ImagenUrl" SortExpression="ImagenUrl" />
                <asp:BoundField DataField="TipoProducto" HeaderText="TipoProducto" SortExpression="TipoProducto" />
                <asp:BoundField DataField="precio" HeaderText="precio" SortExpression="precio" />
                <asp:CommandField ShowSelectButton="True" SelectText="Eliminar" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DataBaseConnection %>" SelectCommand="SELECT * FROM [Inventario]"></asp:SqlDataSource>
        </div>
        </div>
        </div>
    </form>
      <script>

        $(document).ready(function () {
            $('#<%=GridView1.ClientID%>').DataTable();
        });

    </script>
    </asp:Content>