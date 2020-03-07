<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ComprasAdmin.aspx.cs" Inherits="ExamenUnicoEbayComputers.ComprasAdmin" MasterPageFile="~/MasterPageAdmin.Master" %>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <link rel="stylesheet" href="//cdn.datatables.net/1.10.20/css/jquery.dataTables.min.css">
    <script src="//cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/TableExport/5.2.0/js/tableexport.js"></script>
    <form id="form1" runat="server">
        <br/><br/><br/>
    <div class="container mt-5">
            <h2>Historial de Compras</h2>

        <div class="row mt-5">
            <div class="col-md-12">
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="table table-hover" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:BoundField DataField="id_compra" HeaderText="id_compra" InsertVisible="False" ReadOnly="True" SortExpression="id_compra" />
                <asp:BoundField DataField="Nombre" HeaderText="Nombre" SortExpression="Nombre" />
                <asp:BoundField DataField="direccion" HeaderText="Direccion" SortExpression="direccion" />
                <asp:BoundField DataField="telefono" HeaderText="Telefono" SortExpression="telefono" />
                <asp:BoundField DataField="cantidad" HeaderText="Cantidad" SortExpression="cantidad" />
                <asp:BoundField DataField="tarjetacredito" HeaderText="Tarjeta de Credito" SortExpression="tarjetacredito" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DataBaseConnection %>" SelectCommand="SELECT * FROM [Compras]"></asp:SqlDataSource>
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
