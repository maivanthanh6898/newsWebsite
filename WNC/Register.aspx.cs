using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WNC
{
    public partial class Register : System.Web.UI.Page
    {
        private static readonly String sCnStr = ConfigurationManager.ConnectionStrings["dbConnection"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

            loadCategory();
            if (!string.IsNullOrEmpty(Session["name"] as string))
            {
                Session["name"] = "";
                Session["isAdmin"] = false;
            }
        }

        private void loadCategory()
        {
            using (SqlConnection conn = new SqlConnection(sCnStr))
            {
                conn.Open();
                SqlCommand comm = new SqlCommand();
                comm.Connection = conn;
                comm.CommandType = CommandType.StoredProcedure;
                comm.CommandText = "SP_doGetCategory";
                SqlDataAdapter da = new SqlDataAdapter(comm);
                DataTable dt = new DataTable();
                da.Fill(dt);
                rptCategory.DataSource = dt;
                rptCategory.DataBind();
            }
        }

        protected void btnRegist_Click(object sender, EventArgs e)
        {
            using (SqlConnection conn = new SqlConnection(sCnStr))
            {
                conn.Open();
                SqlCommand comm = new SqlCommand();
                comm.Connection = conn;
                comm.CommandType = CommandType.StoredProcedure;
                comm.CommandText = "SP_Register";
                comm.Parameters.AddWithValue("@usname", username.Text);
                comm.Parameters.AddWithValue("@pass", password.Text);
                comm.Parameters.AddWithValue("@name", name.Text);
                comm.Parameters.AddWithValue("@desc", Desc.Text);
                comm.Parameters.AddWithValue("@addr", addr.Text);
                int ire = comm.ExecuteNonQuery();
                if (ire < 1)
                {
                    Response.Write("<script>alert('Đăng kí thất bại')</script>");
                }
                else
                {
                    Response.Write("<script>alert('Đăng kí thành công!!')</script>");
                    Response.Redirect("loginForm.aspx");
                }
            }
        }
    }
}