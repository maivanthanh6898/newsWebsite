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
    public partial class Contact : System.Web.UI.Page
    {
        private static readonly String sCnStr = ConfigurationManager.ConnectionStrings["dbConnection"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
             if (!string.IsNullOrEmpty(Session["isAdmin"] as string))
            {
                hyperlink1.Visible = false;
            }
            loadCategory();
            if (!string.IsNullOrEmpty(Session["name"] as string))
            {
                username.Text = Session["name"].ToString();
                hyperlink2.ToolTip = "Đăng xuất";
                hyperlink2.NavigateUrl = "~/loginForm.aspx";
                hyperlink3.Text = "Đăng xuất";
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
    }
}