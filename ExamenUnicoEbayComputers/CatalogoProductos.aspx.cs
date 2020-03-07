using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.Services;
using System.Web.UI.HtmlControls;

namespace ExamenUnicoEbayComputers
{
    public partial class CatalogoProductos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string sql = "SELECT DISTINCT(TipoProducto) FROM Inventario";
                generarCatalogo(string.Empty);
                string connStr = ConfigurationManager.ConnectionStrings["DataBaseConnection"].ToString();
                SqlConnection conn = new SqlConnection(connStr);
                SqlCommand cmd = new SqlCommand();
                conn.Open();
                cmd.Connection = conn;
                cmd.CommandText = sql;
                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.HasRows)
                {
                    DropDownList1.Items.Add("Seleccione");
                    while (reader.Read())
                    {
                        DropDownList1.Items.Add(reader.GetString(0).Trim());
                    }
                }
                conn.Close();
            }
            
            }
        public void generarCatalogo(string escogido)
        {
            string sql = string.Empty;
            if (String.IsNullOrEmpty(escogido))
            {
                sql = "SELECT * FROM INVENTARIO";
            }
            else
            {
                sql = $"SELECT * FROM INVENTARIO WHERE TipoProducto = '{escogido.Trim()}'";
            }
            
            string body = string.Empty;
            string connStr = ConfigurationManager.ConnectionStrings["DataBaseConnection"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand cmd = new SqlCommand();
            conn.Open();
            cmd.Connection = conn;
            cmd.CommandText = sql;
            SqlDataReader reader = cmd.ExecuteReader();
            if (reader.HasRows)
            {
                body = string.Empty;
                int count = 0;
                int grupo = 0;
                bool listo = false;
                while (reader.Read())
                {
                    listo = false;
                    while (!listo)
                    {
                        if (grupo == 0)
                        {
                            body += "<tr><td>";
                            grupo++;
                        }
                        else if (grupo == 6)
                        {
                            body += "</td></tr>";
                            grupo = 0;
                        }
                        else
                        {
                            if (count > 3)
                            {
                                body += "</div>";
                                count = 0;
                                grupo++;
                            }
                            else if (count == 0)
                            {
                                body += "<div class='row text-center mb-5'>";
                                count++;
                            }
                            else
                            {
                                body += $"<div class='col-md-4'><img src='{reader.GetString(1).TrimEnd()}' width='170' alt='150'/>" +
                                    $"<h5><strong>{reader.GetString(0).TrimEnd()}</strong></h5><h3><strong>${reader.GetDouble(4).ToString()}</strong><p><button type='button' data-toggle='modal'  data-target='#exampleModalCenter' class='btn btn-primary'>Comprar</button></p></h3></div>";
                                count++;
                                listo = true;
                            }
                        }
                    }
                }
                while (count <= 3)
                {
                    if (count == 2)
                    {
                        body += "<div class='col-md-4'></div>";
                        count++;
                    }
                    else if (count == 3)
                    {
                        body += "<div class='col-md-4'></div></div></td></tr>";
                        count++;
                    }
                }
            }
            contenedor.Text = body;
        }

        protected void comprar(object sender, EventArgs e)
        {
            string sql = String.Format("INSERT INTO COMPRAS (Nombre,direccion,telefono,cantidad,tarjetacredito) VALUES ('{0}','{1}','{2}','{3}','{4}')",cnombre.Value,cdireccion.Value,ctelefono.Value,ccantidad.Value,ctarjeta.Value.Substring(12));
            string body = string.Empty;
            string connStr = ConfigurationManager.ConnectionStrings["DataBaseConnection"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand cmd = new SqlCommand();
            conn.Open();
            cmd.Connection = conn;
            cmd.CommandText = sql;
            SqlDataReader reader = cmd.ExecuteReader();
        }

        protected void DropDownList1_TextChanged(object sender, EventArgs e)
        {
            string escogido = DropDownList1.SelectedValue.ToString().Trim();
            if (!escogido.Equals("Seleccione"))
            {
                generarCatalogo(escogido);
            }
            else
            {
                generarCatalogo(string.Empty);
            }
            
        }
    }
}