using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

namespace WNC
{
    public partial class PostEditor : System.Web.UI.Page
    {
        private static readonly String sCnStr = ConfigurationManager.ConnectionStrings["dbConnection"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if((bool) Session["isAdmin"] == true)
            {
                if (!Page.IsPostBack)
                {
                    LoadDDLCategory();

                }
                if (!string.IsNullOrEmpty(Session["name"] as string))
                {
                    username.Text = Session["name"].ToString();
                    hyperlink2.ToolTip = "Đăng xuất";
                    hyperlink2.NavigateUrl = "~/loginForm.aspx";
                    hyperlink3.Text = "Đăng xuất";
                }
            }
            else
            {
                hyperlink1.Visible = false;
                Response.Redirect("index.aspx");
            }
        }

        private void LoadDDLCategory()
        {
            using (SqlConnection sCnn = new SqlConnection(sCnStr))
            {
                sCnn.Open();
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    cmd.CommandText = "SP_doGetCategory";
                    cmd.Connection = sCnn;
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    ddlCategory.DataSource = dt;
                    ddlCategory.DataTextField = "sCategoryName";
                    ddlCategory.DataValueField = "Id";
                    ddlCategory.DataBind();
                }
            }
        }

        private void GhiFileAnh()
        {
            try
            {
                if (picUp.PostedFile != null)
                {
                    HttpPostedFile myfile = picUp.PostedFile;
                    int nFileLen = myfile.ContentLength;
                    byte[] mydata = new byte[nFileLen];
                    myfile.InputStream.Read(mydata, 0, nFileLen);
                    string strFilename = Path.GetFileName(myfile.FileName);
                    WriteToFile(Server.MapPath("./img/content-img/" + strFilename), ref mydata);
                }
            }
            catch
            { }
        }
        private void WriteToFile(string strPath, ref byte[] Buffer)
        {
            try
            {
                FileStream newFile = new FileStream(strPath, FileMode.Create);
                newFile.Write(Buffer, 0, Buffer.Length);
                newFile.Close();
            }
            catch { }
        }

        protected void btnChooseImage_Click(object sender, EventArgs e)
        {
            imagePic.Visible = false;
            picUp.Visible = true;
            btnChooseImage.Visible = false;
        }

        protected void btnSendPost_Click(object sender, EventArgs e)
        {
            HttpPostedFile myfile = picUp.PostedFile;
            string strFileName = picUp.FileName + "";
            if (strFileName != "")
            {
                GhiFileAnh();
            }
            else
            {
                strFileName = imagePic.ImageUrl;
                GhiFileAnh();
            }

            using (SqlConnection conn = new SqlConnection(sCnStr))
            {
                conn.Open();
                SqlCommand comm = new SqlCommand();
                comm.Connection = conn;
                comm.CommandType = CommandType.StoredProcedure;
                comm.CommandText = "sp_InsertNewPost";
                comm.Parameters.AddWithValue("@sTitle", txtTitle.Text);
                comm.Parameters.AddWithValue("@sContent", ckcontent.InnerText);
                comm.Parameters.AddWithValue("@bIsAproved", 1);
                comm.Parameters.AddWithValue("@sPostedDate", new DateTime().ToString());
                comm.Parameters.AddWithValue("@sPostedBy", Session["idUser"].ToString());
                comm.Parameters.AddWithValue("@imgPicture", strFileName);
                comm.Parameters.AddWithValue("@sCategory", ddlCategory.SelectedValue);
                int kq = comm.ExecuteNonQuery();
                if (kq != 0)
                {
                    Response.Write("<script>alert('Thành công')</script>");
                    Response.Write(ddlCategory.SelectedValue);
                }
                else
                {
                    Response.Write("<script>alert('Thất bại')</script>");
                }
            }
        }
    }
}