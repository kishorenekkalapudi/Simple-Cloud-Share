using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using B_DAL;

public partial class User_ChangePassword : System.Web.UI.Page
{
    Actions b_actions = new Actions();
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btn_Click(object sender, EventArgs e)
    {
        string Result = b_actions.UserChangePassword(Session["UserId"].ToString(), txtoldpwd.Text, txtnewpwd.Text);
        lblmessage.Text = Result;
    }
}