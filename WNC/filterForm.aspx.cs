using Newtonsoft.Json;
using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.Script.Services;
using System.Web.Services;

namespace WNC
{
    public partial class filterForm : System.Web.UI.Page
    {
        private static readonly String sCnStr = ConfigurationManager.ConnectionStrings["dbConnection"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (!Boolean.Parse(Session["isAdmin"].ToString()))
                {
                    hyperlink1.Visible = false;
                }
                loadCategory();
                loadTrendingWeek();
                if (!string.IsNullOrEmpty(Session["name"] as string))
                {
                    username.Text = Session["name"].ToString();
                    hyperlink2.ToolTip = "Đăng xuất";
                    hyperlink2.NavigateUrl = "~/loginForm.aspx";
                    hyperlink3.Text = "Đăng xuất";
                }
                if (!Boolean.Parse(Session["isAdmin"].ToString()))
                {
                    hyperlink1.Visible = false;
                }
            }
        }

        [WebMethod]
        public static string LoadNews(string filter)
        {
            using (SqlConnection conn = new SqlConnection(sCnStr))
            {
                conn.Open();
                SqlCommand comm = new SqlCommand();
                comm.Connection = conn;
                comm.CommandType = CommandType.StoredProcedure;
                comm.CommandText = "SP_filter";
                comm.Parameters.AddWithValue("@title", filter);
                SqlDataAdapter da = new SqlDataAdapter(comm);
                DataTable dt = new DataTable();
                da.Fill(dt);
                if (dt.Rows.Count != 0 && dt != null)
                {
                    var result = JsonConvert.SerializeObject(dt);
                    return result;
                }
                else
                {
                    return "false";
                }
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
    }
}