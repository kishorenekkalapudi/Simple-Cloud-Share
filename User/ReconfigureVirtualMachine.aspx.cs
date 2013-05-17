using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using B_DAL;

public partial class User_ReconfigureVirtualMachine : System.Web.UI.Page
{
    private UserVirtualMachine b_uv = new UserVirtualMachine();
    private Actions b_actions = new Actions();

    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string VmId = Request.QueryString["VmId"].ToString();
        string VmName = Request.QueryString["VmName"].ToString();

        b_uv.ReconfigureVm(VmName, Convert.ToInt32(txtram.Text), Convert.ToInt32(txtcpu.Text));
        b_actions.ReconfigureVm(VmId, txtram.Text, txtcpu.Text);
        Response.Redirect("VirtualMachine.aspx");
    }
}