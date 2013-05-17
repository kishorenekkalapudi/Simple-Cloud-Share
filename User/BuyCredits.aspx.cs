using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using B_DAL;
using System.Data;

public partial class User_BuyCredits : System.Web.UI.Page
{
    private Actions b_actions = new Actions();
    private DataSet dataset;
    private GetDetailsBy b_getdetailsby = new GetDetailsBy();
    private MailMessageSSL mail = new MailMessageSSL();

    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void txtmin_TextChanged(object sender, EventArgs e)
    {
        txtcredits.Text = (Convert.ToInt32(txtmin.Text)*0.10).ToString();
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string VmId = Request.QueryString["VmId"].ToString();
        b_actions.BuyMoreCredits(VmId, txtmin.Text, txtcredits.Text);
        

        dataset = new DataSet();
        dataset = b_getdetailsby.GetUserProfileById(Session["UserId"].ToString());
        string FirstName, LastNae, Email1;
        FirstName = dataset.Tables[0].Rows[0][1].ToString();
        LastNae = dataset.Tables[0].Rows[0][2].ToString();
        Email1 = dataset.Tables[0].Rows[0][7].ToString();


        string Body = "Congratulations " + FirstName + ", " + LastNae +
                          "\nYou Are Successfully Purchased "+txtcredits.Text+" Virtual Machine Credits."+
                      "\n\n\n\nThank You\nSimple Cloud Share Team";
        mail.SendMessage(Email1, "Reg: Renewal Virtual Machine", Body);


        Body = "Congratulations " + txtfn.Text + ", " + txtln.Text +
                          "\nYour Request Has Been Processed Successfully And You Have Been Charged " + txtcredits.Text + " $ For Renewing Virtual Machine. \n\n   \n\n\n\nThank You\nSimple Cloud Share Team";
        mail.SendMessage(txtemail.Text, "Reg: Your Payment Information", Body);

        Response.Redirect("VirtualMachine.aspx");
    }
}