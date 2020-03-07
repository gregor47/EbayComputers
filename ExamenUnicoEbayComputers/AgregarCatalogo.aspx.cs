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
    public partial class Admin : System.Web.UI.Page
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
        public void AgregarProducto(object sender, EventArgs e)
        {
            try
            {
                string connStr = ConfigurationManager.ConnectionStrings["DataBaseConnection"].ToString();
                SqlConnection conn = new SqlConnection(connStr);
                string sql = String.Format("INSERT INTO INVENTARIO (Nombre,ImagenUrl,TipoProducto,precio) VALUES ('{0}','{1}','{2}',{3})", txtnombre.Value, txturl.Value, txtipo.Value,txtprecio.Value);
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