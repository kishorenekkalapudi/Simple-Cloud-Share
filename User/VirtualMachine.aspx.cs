using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using B_DAL;
using System.Data;

public partial class User_VirtualMachine : System.Web.UI.Page
{
    private GetDetailsBy b_getdetailsby = new GetDetailsBy();
    private DataSet dataset = new DataSet();
    private Actions b_actions = new Actions();
    
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            LoadRepeater();
        }
    }

    private void LoadRepeater()
    {
        dataset = new DataSet();
        dataset = b_getdetailsby.GetVmDetailsByUser(Session["UserId"].ToString());
        if (dataset.Tables[0].Rows.Count > 0)
        {
            Repeater1.DataSource = dataset;
            Repeater1.DataBind();
        }
        else
        {
            Repeater1.DataSource = null;
            Repeater1.DataBind();
        }
    }

    protected void LinkButton4_Click(object sender, EventArgs e)
    {
        string NoOfVms = b_getdetailsby.GetNoOfVmsCreatedByUsedId(Session["UserId"].ToString());
        if(Convert.ToInt32(NoOfVms)>=3)
        {
            Response.Write("<script> alert('Maximum No Of Limit Exceded') </script>");
        }
        else
        {
            Response.Redirect("CreateVirtualMachine.aspx");
        }
    }
    protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if(e.CommandName=="View")
        {
            Response.Redirect("ViewVirtualMachineDetails.aspx?VmId=" + e.CommandArgument.ToString());
        }

        if (e.CommandName == "Start")
        {
            string VmId = e.CommandArgument.ToString();
            dataset = new DataSet();
            dataset = b_getdetailsby.GetPerticularVmDetailsByVmId(VmId);

            int Minit = Convert.ToInt32(dataset.Tables[0].Rows[0][9].ToString());
            if (Minit >= 1)
            {
                Response.Redirect("VirtualMachineActions.aspx?VmId=" + e.CommandArgument.ToString());
            }
            else
            {
                Response.Write("<script> alert('Buy More Credits To Start Virtual Machine'); </script>");
            }
        }

        if (e.CommandName == "Buy")
        {
            Response.Redirect("BuyCredits.aspx?VmId=" + e.CommandArgument.ToString());
        }

        if (e.CommandName == "Delete")
        {
            b_actions.DeleteVirtualMachine(Convert.ToInt32(e.CommandArgument.ToString()));
            LoadRepeater();
        }
    }
}