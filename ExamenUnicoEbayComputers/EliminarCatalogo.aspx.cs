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
    public partial class EliminarCatalogo : System.Web.UI.Page
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

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                string id = GridView1.Rows[GridView1.SelectedIndex].Cells[0].Text.ToString();
                string connStr = ConfigurationManager.ConnectionStrings["DataBaseConnection"].ToString();
                SqlConnection conn = new SqlConnection(connStr);
                string sql = String.Format("DELETE FROM INVENTARIO WHERE id_producto = '{0}'",id);
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