using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;

namespace WNC
{
    public class Global : System.Web.HttpApplication
    {

        protected void Application_Start(object sender, EventArgs e)
        {

        }

        protected void Session_Start(object sender, EventArgs e)
        {
            Session["userName"] = "";
            Session["isAdmin"] = false;
        }

        protected void Application_BeginRequest(object sender, EventArgs e)
        {
            //if (Request.Cookies["username"] != null && Request.Cookies["password"] != null && Request.Cookies["id"] != null)
            //{
            //    HttpContext.Current.Items["name"] = Request.Cookies["username"].Value;
            //    HttpContext.Current.Items["idUser"] = int.Parse(Request.Cookies["id"].Value);
            //    HttpContext.Current.Items["isAdmin"] = true;
            //}
        }
        protected void Application_AcquireRequestState(object sender, EventArgs e)
        {
            //HttpContext context = HttpContext.Current;
            //if (context != null && context.Session != null)
            //{
            //    context.Session["name"] = HttpContext.Current.Items["name"];
            //    context.Session["idUser"] = HttpContext.Current.Items["idUser"];
            //    context.Session["isAdmin"] = HttpContext.Current.Items["isAdmin"];
            //}
        }

        protected void Application_AuthenticateRequest(object sender, EventArgs e)
        {

        }

        protected void Application_Error(object sender, EventArgs e)
        {

        }

        protected void Session_End(object sender, EventArgs e)
        {
            //Response.Redirect("index.aspx");
        }

        protected void Application_End(object sender, EventArgs e)
        {

        }
    }
}