using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace WNC
{
    public partial class SinglePost : System.Web.UI.Page
    {
        private static readonly String sCnStr = ConfigurationManager.ConnectionStrings["dbConnection"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            string newId = Request.QueryString["newId"];
            if (string.IsNullOrEmpty(newId))
            {
                Response.Redirect("index.aspx");
            }

            if (!Boolean.Parse(Session["isAdmin"].ToString()))
            {
                hyperlink1.Visible = false;
            }
            loadCategory();
            loadNews(newId);
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
        private void loadNews(string Id)
        {
            using (SqlConnection conn = new SqlConnection(sCnStr))
            {
                conn.Open();
                SqlCommand comm = new SqlCommand();
                comm.Connection = conn;
                comm.CommandType = CommandType.StoredProcedure;
                comm.CommandText = "SP_doGetNew";
                comm.Parameters.AddWithValue("@id", Id);
                SqlDataReader reader = comm.ExecuteReader();
                if (!reader.HasRows)
                {
                    Response.Redirect("index.aspx");
                }
                else
                {
                    while (reader.Read())
                    {
                        image.InnerHtml = "<img src=\"" + HttpContext.Current.Request.Url.GetLeftPart(UriPartial.Authority) + "/img/content-img/" + reader.GetString(6) + "\" alt=\"\">";
                        newContent.InnerHtml = reader.GetString(2);
                        title.InnerHtml = reader.GetString(1);
                        category.InnerHtml = reader.GetString(10);
                        categoryName.InnerHtml = reader.GetString(10);
                        newTitle.InnerHtml = reader.GetString(1);
                        author.InnerHtml = reader.GetString(16);
                        date.InnerHtml = reader.GetDateTime(4).ToString();
                    }
                }
            }
        }
    }
}