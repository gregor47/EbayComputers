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
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        
        }
        protected void LogInApp_Click(object sender, EventArgs e)
        {
            bool validacion = Validacion(Usuario.Value, Contrasena.Value);
            if (validacion)
            {
                //iniciar sesion
                Response.Redirect("AgregarCatalogo.aspx");
            }
            else
            {
                //no inicia sesion
            }
        }
        public bool Validacion(String usuario, string contraseña)
        {
            try
            {
                string sql = "select top(1) * from usuarios where username = '" + usuario + "' and contrasena = '" + contraseña + "'";
                string ConnString = ConfigurationManager.ConnectionStrings["DataBaseConnection"].ToString();
                SqlConnection connection = new SqlConnection(ConnString);
                connection.Open();
                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = sql;
                cmd.Connection = connection;
                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.HasRows)
                {
                    HttpCookie cook = new HttpCookie("sesion");
                    cook.Value="1";
                    Response.Cookies.Add(cook);
                    return true;
                }
                else
                {
                    return false;
                }
                
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.ToString());
                return false;
            }
        }
    }
}