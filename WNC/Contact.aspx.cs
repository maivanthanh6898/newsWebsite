using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WNC
{
    public partial class Contact : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Boolean.Parse(Session["isAdmin"].ToString()))
            {
                hyperlink1.Visible = false;
            }
        }
    }
}