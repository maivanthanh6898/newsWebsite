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
            loadRPTContent();
            if (!string.IsNullOrEmpty(Session["name"] as string))
            {
                username.Text = Session["name"].ToString();
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
                Repeater1.DataBind();
            }
        }
    }
}