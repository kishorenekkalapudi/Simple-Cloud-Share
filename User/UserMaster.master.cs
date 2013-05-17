using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class User_UserMaster : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {   
        try
        {
            lblname.Text = Session["FullName"].ToString();
        }

        catch (Exception er)
        {
            Response.Redirect("~/Login.aspx");
        }
    }
    protected void lnklogout_Click(object sender, EventArgs e)
    {
        Session.Clear();
        Response.Redirect("~/Login.aspx");
    }
}
