using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using B_DAL;
using System.Data;

public partial class Admin_ViewStatistics : System.Web.UI.Page
{
    private DataSet dataset;
    private Actions b_actions = new Actions();

    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            dataset = new DataSet();
            dataset = b_actions.GetStatistics();
            if(dataset.Tables[0].Rows.Count>0)
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
    }
}