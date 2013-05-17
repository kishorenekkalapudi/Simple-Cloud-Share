using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using B_DAL;

public partial class User_ViewVirtualachineDetails : System.Web.UI.Page
{
    private DataSet dataset;
    private GetDetailsBy b_getdetailsby = new GetDetailsBy();

    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            string VmId = Request.QueryString["VmId"].ToString();
            dataset = new DataSet();
            dataset = b_getdetailsby.GetPerticularVmDetailsByVmId(VmId);
            DetailsView1.DataSource=dataset;
            DetailsView1.DataBind();
        }
    }
}