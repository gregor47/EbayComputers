<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CatalogoProductos.aspx.cs" Inherits="ExamenUnicoEbayComputers.CatalogoProductos" MasterPageFile="~/MasterPageClientes.Master" %>


<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <form runat="server">
        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
        <link rel="stylesheet" href="//cdn.datatables.net/1.10.20/css/jquery.dataTables.min.css">
        <script src="//cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
        <div class="row mb-5"></div>
        <div class="row mb-5"></div>
        <div class="section-2-container section-container section-container-gray-bg">
            <div class="container">
                <div class="row">
                    <div class="col section-1 section-description wow fadeIn">
                        <h2>Catalogo de Productos</h2>

                        <div class="row">
                            <div class="col-md-4">
                                <label class="mt-4">Filtrar por tipo de producto</label>
                                <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-control" DataTextField="TipoProducto" DataValueField="TipoProducto">
                                </asp:DropDownList>
                                <button class="btn btn-primary mt-3" runat="server" onserverclick="DropDownList1_TextChanged">Filtrar</button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col section-2 section-description wow fadeIn">
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <table class="table" id="mitabla">
                            <thead>
                                <tr>
                                    <th>Productos Disponibles</th>
                                </tr>
                            </thead>
                            <tbody>
                                <asp:Label runat="server" ID="contenedor" Text="Te cambiare papux"></asp:Label>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>

        <%--MODALLLLL INICIO--%>
        <!-- Button trigger modal -->
<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModalCenter">
  Launch demo modal
</button>

<!-- Modal -->
<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">Compra</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body text-left">
        <p>Nombre Completo:</p>
          <input type="text" class="form-control" required runat="server" placeholder="Nombre Completo" id="cnombre"/>
          <p>Telefono:</p>
          <input type="number" class="form-control" required runat="server" placeholder="Telefono" id="ctelefono"/>
          <p>Direccion:</p>
          <input type="text" class="form-control" required runat="server" placeholder="Direccion" id="cdireccion"/>
          <div class="row mt-3">
              <div class="col-md-4">
                  <p>Nombre del titular</p>
                  <input type="text" runat="server" placeholder="Nombre Titular"  class="form-control" required/>
              </div>
              <div class="col-md-4">
                  <p>Numero de Tarjeta</p>
                  <input runat="server" placeholder="TN" type="number" id="ctarjeta" class="form-control" min="1000000000000000" max="9999999999999999" required/>
              </div>
              <div class="col-md-4">
                  <p>CCV</p>
                  <input runat="server" placeholder="CCV" type="number" class="form-control" min="0" max="999" required/>
              </div>
          </div>
          <p>Cantidad:</p>
          <input type="number" id="ccantidad" class="form-control" runat="server" placeholder="Cantidad" min="0" max="10" required/>

      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-dismiss="modal" >Salir</button>
        <button type="button" class="btn btn-success" runat="server" onserverclick="comprar">Comprar</button>
      </div>
    </div>
  </div>
</div>
        <%--MODAL FINN--%>
    </form>
    <script>

        $(document).ready(function () {
           


            $('#mitabla').dataTable({
                'pageLength': 1,
                'lengthChange': false,
                'bFilter': false,
                'order': false
            });
        });

        function abrirmodal() {
            $('#myModal').show();
        }

    </script>
</asp:Content>
