using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ExamenUnicoEbayComputers
{
    public partial class ActualizarCatalogo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                bool log = false;
                log = Request.Cookies["sesion"].Value.Equals("1");
                if (!log)
                {
                    Response.Redirect("Login.aspx");
                }
            }
            catch (Exception)
            {
                Response.Redirect("Login.aspx");
            }
            txtnombre.Disabled = true;
            txttipo.Disabled = true;
            txturl.Disabled = true;
            txtvalor.Disabled = true;
            gridRefresh();
        }
        public void gridRefresh()
        {
            GridView1.DataBind();
            if (GridView1.Rows.Count != 0)
            {
                GridView1.UseAccessibleHeader = true;
                GridView1.HeaderRow.TableSection = TableRowSection.TableHeader;
            }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            txtnombre.Value = GridView1.Rows[GridView1.SelectedIndex].Cells[1].Text.ToString().Trim();
            txturl.Value = GridView1.Rows[GridView1.SelectedIndex].Cells[2].Text.ToString().Trim();
            txttipo.Value = GridView1.Rows[GridView1.SelectedIndex].Cells[3].Text.ToString().Trim();
            txtvalor.Value = GridView1.Rows[GridView1.SelectedIndex].Cells[4].Text.ToString().Trim();
            txtnombre.Disabled = false;
            txttipo.Disabled = false;
            txturl.Disabled = false;
            txtvalor.Disabled = false;
        }

        protected void xD_Click(object sender, EventArgs e)
        {
            try
            {
                string id = GridView1.Rows[GridView1.SelectedIndex].Cells[0].Text.ToString();
                string connStr = ConfigurationManager.ConnectionStrings["DataBaseConnection"].ToString();
                SqlConnection conn = new SqlConnection(connStr);
                string sql = String.Format("UPDATE INVENTARIO SET Nombre='{0}',ImagenUrl='{1}',TipoProducto='{2}',precio='{3}' where id_producto='{4}'",txtnombre.Value,txturl.Value, txttipo.Value,txtvalor.Value,id);
                conn.Open();
                SqlCommand cmd = new SqlCommand()
                {
                    Connection = conn,
                    CommandText = sql
                };
                cmd.ExecuteNonQuery();
                conn.Close();
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.ToString());
            }
            GridView1.DataBind();
        }
    }
}