using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WNC
{
    public partial class loginForm : System.Web.UI.Page
    {
        private static readonly String sCnStr = ConfigurationManager.ConnectionStrings["dbConnection"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(Session["name"] as string))
            {
                Session["name"] = "";
                Session["idUser"] = 0;
                Session["isAdmin"] = false;
            }
            if (!Boolean.Parse(Session["isAdmin"].ToString()))
            {
                hyperlink1.Visible = false;
            }
        }

        public void btnLogin_Click(object sender, EventArgs e)
        {
            using (SqlConnection conn = new SqlConnection(sCnStr))
            {
                conn.Open();
                SqlCommand comm = new SqlCommand();
                comm.Connection = conn;
                comm.CommandType = CommandType.StoredProcedure;
                comm.CommandText = "DoLogin";
                comm.Parameters.AddWithValue("@username", username.Text);
                comm.Parameters.AddWithValue("@password", password.Text);
                SqlDataReader reader = comm.ExecuteReader();
                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        Session["name"] = username.Text.ToString();
                        Session["idUser"] = reader.GetInt32(0);
                        Session["isAdmin"] = Boolean.Parse(reader["isAdmin"].ToString());
                        Response.Redirect("index.aspx");
                    }
                }
                else
                {
                    Response.Write("<script>alert('Sai tên đăng nhập hoặc mật khẩu')</script>");
                }
            }
        }
    }
}