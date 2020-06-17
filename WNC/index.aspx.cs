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
            if (!string.IsNullOrEmpty(Session["isAdmin"] as string))
            {
                hyperlink1.Visible = false;
            }
            loadRPTContent();
            loadTrendingNew();
            loadLastestNews();
            loadCategory();
            loadCategoryNews();
            loadTrendingWeek();
            //Panel panel = (Panel)Repeater2.Items[0].FindControl("post-1");
            //panel.Attributes.Add("class", "tab-pane fade active show");
            if (!string.IsNullOrEmpty(Session["name"] as string))
            {
                username.Text = Session["name"].ToString();
                hyperlink2.ToolTip = "Đăng xuất";
                hyperlink2.NavigateUrl = "~/loginForm.aspx";
                hyperlink3.Text = "Đăng xuất";
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
                rpt10LastestNews.DataSource = dt;
                rptBigNews.DataSource = dt;
                rpt10LastestNews.DataBind();
                rptBigNews.DataBind();
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
                rptTredingNews.DataSource = dt;
                rptTredingNews.DataBind();
            }
        }

        private void loadLastestNews()
        {
            using (SqlConnection conn = new SqlConnection(sCnStr))
            {
                conn.Open();
                SqlCommand comm = new SqlCommand();
                comm.Connection = conn;
                comm.CommandType = CommandType.StoredProcedure;
                comm.CommandText = "spGetLastestNews";
                SqlDataAdapter da = new SqlDataAdapter(comm);
                DataTable dt = new DataTable();
                da.Fill(dt);
                rptLastestNews.DataSource = dt;
                rptLastestNews.DataBind();
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
                Repeater4.DataSource = dt;
                Repeater4.DataBind();
            }
        }

        private void loadTrendingWeek()
        {
            using (SqlConnection conn = new SqlConnection(sCnStr))
            {
                conn.Open();
                SqlCommand comm = new SqlCommand();
                comm.Connection = conn;
                comm.CommandType = CommandType.StoredProcedure;
                comm.CommandText = "SP_doGetTrendingNewsWeek";
                SqlDataAdapter da = new SqlDataAdapter(comm);
                DataTable dt = new DataTable();
                da.Fill(dt);
                Repeater5.DataSource = dt;
                Repeater5.DataBind();
            }
        }

        private void loadCategoryNews()
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
                ParentRepeater.DataSource = dt;
                ParentRepeater.DataBind();
            }
        }

        protected void childRepeater_DataBinding(object sender, System.EventArgs e)
        {
            Repeater rep = (Repeater)(sender);

            int categoryId = (int)(Eval("ParentID"));

            // Assuming you have a function call `GetSomeData` that will return
            // the data you want to bind to your child repeater.
            //SP_doGetNewByCategory

        }
        protected void ItemBound(object sender, RepeaterItemEventArgs args)
        {
            if (args.Item.ItemType == ListItemType.Item || args.Item.ItemType == ListItemType.AlternatingItem)
            {
                Repeater childRepeater = (Repeater)args.Item.FindControl("ChildRepeater");
                Label category = (Label)args.Item.FindControl("lblId");
                int categoryId = int.Parse(category.Text);
                using (SqlConnection conn = new SqlConnection(sCnStr))
                {
                    conn.Open();
                    SqlCommand comm = new SqlCommand();
                    comm.Connection = conn;
                    comm.CommandType = CommandType.StoredProcedure;
                    comm.CommandText = "SP_doGetNewByCategory";
                    comm.Parameters.AddWithValue("@categoryId", categoryId);
                    SqlDataAdapter da = new SqlDataAdapter(comm);
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    childRepeater.DataSource = dt;
                    childRepeater.DataBind();
                }
            }
        }
    }
}