using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using B_DAL;

public partial class Admin_ViewUserDetails : System.Web.UI.Page
{
    DataSet dataset;
    GetDetailsBy b_getdetails = new GetDetailsBy();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            int UserId = Convert.ToInt32(Request.QueryString["UserId"].ToString());
            dataset = new DataSet();
            dataset = b_getdetails.GetUserProfileById(UserId.ToString());
            DetailsView1.DataSource = dataset;
            DetailsView1.DataBind();
        }
    }
}