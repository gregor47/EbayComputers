<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AgregarCatalogo.aspx.cs" Inherits="ExamenUnicoEbayComputers.Admin" MasterPageFile="~/MasterPageAdmin.Master" %>
    
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <link rel="stylesheet" href="//cdn.datatables.net/1.10.20/css/jquery.dataTables.min.css">
    <script src="//cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/TableExport/5.2.0/js/tableexport.js"></script>
    <form id="form1" runat="server">
        <br/><br/><br/>
    <div class="container mt-5">
            <h2>Agregar Productos</h2>

        <div class="row mt-5 text-left">

            <div class="col-md-3">
                <p>Nombre</p>
                <input type="text" class="form-control" id="txtnombre" runat="server" required/>
            </div>
            <div class="col-md-3">
                <p>Url Imagen</p>
                <input type="text" class="form-control" id="txturl" runat="server" required/>
            </div>
            <div class="col-md-3">
                <p>Tipo de Producto</p>
                <input type="text" class="form-control" id="txtipo" runat="server" required/>
            </div>
            <div class="col-md-3">
                <p>Precio</p>
                <input type="number" class="form-control" id="txtprecio" runat="server" required/>
            </div>
        </div>
        <div class="row mt-5">
            <div class="col-md-12">
                <asp:Button runat="server" ID="xD" Text="Agregar" OnClick="AgregarProducto" CssClass="btn btn-success" />
            </div>
        </div>


        <div class="row mt-5 text-left">
            <div class="col-md-12">
        <asp:GridView ID="GridView1" runat="server"  AutoGenerateColumns="False" CssClass="table table-hover" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:BoundField DataField="id_producto" HeaderText="id_producto" InsertVisible="False" ReadOnly="True" SortExpression="id_producto" />
                <asp:BoundField DataField="Nombre" HeaderText="Nombre" SortExpression="Nombre" />
                <asp:BoundField DataField="ImagenUrl" HeaderText="ImagenUrl" SortExpression="ImagenUrl" />
                <asp:BoundField DataField="TipoProducto" HeaderText="TipoProducto" SortExpression="TipoProducto" />
                <asp:BoundField DataField="precio" HeaderText="precio" SortExpression="precio" />
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

