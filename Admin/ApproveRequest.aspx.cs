using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using B_DAL;

public partial class Admin_ApproveRequest : System.Web.UI.Page
{
    GetDetails b_getdetails = new GetDetails();
    Actions b_actions = new Actions();
    DataSet dataset;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadGrid();
        }
    }

    private void LoadGrid()
    {
        dataset = new DataSet();
        dataset = b_getdetails.GetUserDetailsWhoseStatusIsZero();
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

        if (CommandName == "Approve")
        {
            int UserId = Convert.ToInt32(e.CommandArgument.ToString());
            string Result = b_actions.ChangeUserStatusToOne(UserId);
            lblmessage.Text = Result;
            LoadGrid();
        }
    }
}