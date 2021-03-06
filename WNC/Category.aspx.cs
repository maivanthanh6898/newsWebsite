﻿using System;
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
    public partial class Category : System.Web.UI.Page
    {
        private static readonly String sCnStr = ConfigurationManager.ConnectionStrings["dbConnection"].ConnectionString;
        private string category = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            category = Request.QueryString["category"];
            if (!string.IsNullOrEmpty(category))
            {
                loadLastestNews();
            }
             if (!string.IsNullOrEmpty(Session["isAdmin"] as string))
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
             if (!string.IsNullOrEmpty(Session["isAdmin"] as string))
            {
                hyperlink1.Visible = false;
            }
        }


        private void loadLastestNews()
        {
            using (SqlConnection conn = new SqlConnection(sCnStr))
            {
                conn.Open();
                SqlCommand comm = new SqlCommand
                {
                    Connection = conn,
                    CommandType = CommandType.StoredProcedure,
                    CommandText = "SP_doGetNewByCategory"
                };
                SqlDataAdapter da = new SqlDataAdapter(comm);
                comm.Parameters.AddWithValue("@categoryId", int.Parse(category));
                DataTable dt = new DataTable();
                da.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    title.InnerText = "Tin " + dt.Rows[0].Field<string>("sCategoryName"); ;
                    rptNews.DataSource = dt;
                    rptNews.DataBind();
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
    }
}