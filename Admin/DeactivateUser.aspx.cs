using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using B_DAL;
using System.Data;

public partial class Admin_DeactivateUser : System.Web.UI.Page
{
    private Actions b_actions = new Actions();
    private GetDetails b_getdetails = new GetDetails();
    private DataSet dataset;

    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            LoadData();
        }
    }

    private void LoadData()
    {
        dataset = new DataSet();
        dataset = b_getdetails.GetUserDetailsWhoseStatusIsOne();
        if (dataset.Tables[0].Rows.Count > 0)
        {
            GridView1.DataSource = dataset;
            GridView1.DataBind();
        }
        else
        {
            GridView1.DataSource = null;
            GridView1.DataBind();
        }
    }
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        string CommandName = e.CommandName.ToString();

        if (CommandName == "View")
        {
            int UserId = Convert.ToInt32(e.CommandArgument.ToString());
            Response.Redirect("ViewUserDetails.aspx?UserId=" + UserId);
        }

        if (CommandName == "Deactivate")
        {
            int UserId = Convert.ToInt32(e.CommandArgument.ToString());
            string Result = b_actions.ChangeUserStatusToZero(UserId);
            lblmessage.Text = Result;
            LoadData();
        }
    }
}