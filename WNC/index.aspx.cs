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
    public partial class index1 : System.Web.UI.Page
    {
        private static readonly String sCnStr = ConfigurationManager.ConnectionStrings["dbConnection"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Boolean.Parse(Session["isAdmin"].ToString()))
            {
                hyperlink1.Visible = false;
            }
            loadRPTContent();
            loadTrendingNew();
            //Panel panel = (Panel)Repeater2.Items[0].FindControl("post-1");
            //panel.Attributes.Add("class", "tab-pane fade active show");
            if (!string.IsNullOrEmpty(Session["name"] as string))
            {
                username.Text = Session["name"].ToString();
                hyperlink2.ToolTip = "Đăng xuất";
                hyperlink2.NavigateUrl = "~/loginForm.aspx";
            }
        }
        private void loadRPTContent()
        {
            using (SqlConnection conn = new SqlConnection(sCnStr))
            {
                conn.Open();
                SqlCommand comm = new SqlCommand();
                comm.Connection = conn;
                comm.CommandType = CommandType.StoredProcedure;
                comm.CommandText = "SP_doQueryIndexContent";
                SqlDataAdapter da = new SqlDataAdapter(comm);
                DataTable dt = new DataTable();
                da.Fill(dt);
                Repeater1.DataSource = dt;
                Repeater2.DataSource = dt;
                Repeater1.DataBind();
                Repeater2.DataBind();
            }
        }

        private void loadTrendingNew()
        {
            using (SqlConnection conn = new SqlConnection(sCnStr))
            {
                conn.Open();
                SqlCommand comm = new SqlCommand();
                comm.Connection = conn;
                comm.CommandType = CommandType.StoredProcedure;
                comm.CommandText = "SP_doGetTrendingNews";
                SqlDataAdapter da = new SqlDataAdapter(comm);
                DataTable dt = new DataTable();
                da.Fill(dt);
                Repeater3.DataSource = dt;
                Repeater3.DataBind();
            }
        }
    }
}