using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using B_DAL;
using System.Data;

public partial class User_VirtualMachineActions : System.Web.UI.Page
{
    private GetDetailsBy b_getdetailsby = new GetDetailsBy();
    private Actions b_actions = new Actions();
    private DataSet dataset;
    public static string HiddenVirtualName;
    private UserVirtualMachine b_uvm = new UserVirtualMachine();

    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {

            int VmId =Convert.ToInt32(Request.QueryString["VmId"].ToString());
            dataset = new DataSet();
            dataset = b_getdetailsby.GetPerticularVmDetailsByVmId(VmId.ToString());

            lbltemplate.Text = dataset.Tables[0].Rows[0][2].ToString();
            lblvmname.Text = dataset.Tables[0].Rows[0][3].ToString();
            lblram.Text = dataset.Tables[0].Rows[0][4].ToString();
            lblcpucores.Text = dataset.Tables[0].Rows[0][5].ToString();
            lblcpu.Text = dataset.Tables[0].Rows[0][6].ToString();
            lblminit.Text = dataset.Tables[0].Rows[0][9].ToString();
            lblcredits.Text = dataset.Tables[0].Rows[0][10].ToString();

            HiddenVirtualName = dataset.Tables[0].Rows[0][1].ToString();

            try
            {
                lblname.Text = Session["FullName"].ToString();
            }

            catch (Exception er)
            {
                Response.Redirect("~/Login.aspx");
            }



            try
            {
                b_uvm.Login();
                string Message = b_uvm.PowerOnVirtualMachine(HiddenVirtualName);
                TextBox1.Text += DateTime.Now.ToString() + " " + Message + Environment.NewLine;
                
                ViewConsumedData();
            }

            catch(Exception er)
            {
                TextBox1.Text += DateTime.Now.ToString() +" "+ er.Message + Environment.NewLine;
            }
        }

    }

    private void ViewConsumedData()
    {
        string ConsumedRamCpu = b_uvm.ConsumedRamAndCpu(HiddenVirtualName);
        string[] ramcpu = ConsumedRamCpu.Split(',');
        lblcram.Text = ramcpu[0].ToString();
        lblccpu.Text = ramcpu[1].ToString();
    }

    protected void RAM_Tick(object sender, EventArgs e)
    {
        
        ViewConsumedData();

        b_actions.ReduceMinuitCredit(Convert.ToInt32(lblminit.Text), Convert.ToDouble(lblcredits.Text), lblcpucores.Text,
                                     Request.QueryString["VmId"].ToString());
        dataset = new DataSet();
        dataset = b_getdetailsby.GetPerticularVmDetailsByVmId(Request.QueryString["VmId"].ToString());
        lblminit.Text = dataset.Tables[0].Rows[0][9].ToString();
        lblcredits.Text = dataset.Tables[0].Rows[0][10].ToString();

        if(Convert.ToInt32(lblminit.Text)==0)
        {
            b_uvm.Login();
            string Message = b_uvm.PowerOffVirtualMachine(HiddenVirtualName);
            TextBox1.Text += DateTime.Now.ToString() + " " + Message + Environment.NewLine;
            RAM.Enabled = false;
            Response.Redirect("VirtualMachine.aspx");
        }

        if (Convert.ToInt32(lblminit.Text) == 1)
        {
            TextBox1.Text += DateTime.Now.ToString() + " Your Virtual Machine Credits Are Almost Over. Purchase More To Use Virtual Machine" + Environment.NewLine;
        }
    }
    
    protected void lnklogout_Click(object sender, EventArgs e)
    {
        Session.Clear();
        Response.Redirect("~/Login.aspx");
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        string Result = b_uvm.SuspendVirtualMachine(HiddenVirtualName);
        TextBox1.Text += DateTime.Now.ToString() +" "+ Result + Environment.NewLine;
    }
    protected void LinkButton2_Click(object sender, EventArgs e)
    {
        string Result = b_uvm.ResumeVirtualMachine(HiddenVirtualName);
        TextBox1.Text += DateTime.Now.ToString() + " " + Result + Environment.NewLine;
    }

    protected void LinkButton4_Click(object sender, EventArgs e)
    {
        string Result = b_uvm.ResetVirtualMachine(HiddenVirtualName);
        TextBox1.Text += DateTime.Now.ToString() + " " + Result + Environment.NewLine;
    }
    protected void LinkButton6_Click(object sender, EventArgs e)
    {
        string Result = b_uvm.PowerOffVirtualMachine(HiddenVirtualName);
        TextBox1.Text += DateTime.Now.ToString() + " " + Result + Environment.NewLine;
        Response.Redirect("VirtualMachine.aspx");
    }
    protected void LinkButton3_Click(object sender, EventArgs e)
    {
        string Result = b_uvm.PowerOffVirtualMachine(HiddenVirtualName);
        Response.Redirect("ReconfigureVirtualMachine.aspx?VmId=" + Request.QueryString["VmId"].ToString() +"&VmName=" +HiddenVirtualName);
    }
}