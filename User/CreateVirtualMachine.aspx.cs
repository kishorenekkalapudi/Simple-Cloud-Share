using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using B_DAL;
using System.Data;

public partial class User_CreateVirtualMachine : System.Web.UI.Page
{
    private GetDetails b_getdetails = new GetDetails();
    private GetDetailsBy b_getdetailsby = new GetDetailsBy();
    private DataSet dataset;
    private UserVirtualMachine b_vm = new UserVirtualMachine();
    private MailMessageSSL mail = new MailMessageSSL();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            dataset = new DataSet();
            dataset = b_getdetails.GetTemplates();
            DropDownList1.DataSource = dataset;
            DropDownList1.DataTextField = "TemplateName";
            DropDownList1.DataValueField = "TemplateId";
            DropDownList1.DataBind();

            DropDownList1.Items.Insert(0, "Select");
        }

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        string Result = b_vm.CreateVirtualMachine(Convert.ToInt32(Session["UserId"].ToString()),
                                                  Convert.ToInt32(DropDownList1.SelectedItem.Value.ToString()),
                                                  txtvmname.Text,
                                                  Convert.ToInt32(txtminutes.Text), txtcost.Text, txtfn.Text, txtln.Text,
                                                  txtemail.Text, txtaddress.Text, txtcity.Text, txtstate.Text,
                                                  Convert.ToInt32(txtzip.Text),
                                                  Convert.ToInt64(txtcreditcardnumber.Text), txtstartdate.Text,
                                                  txtexpdate.Text, Convert.ToInt32(txtcvv.Text));
        if (Result.Equals("Virtual Machine Created Successfully"))
        {
            dataset = new DataSet();
            dataset = b_getdetailsby.GetUserProfileById(Session["UserId"].ToString());
            string FirstName, LastNae, Email1;
            FirstName = dataset.Tables[0].Rows[0][1].ToString();
            LastNae=dataset.Tables[0].Rows[0][2].ToString();
            Email1=dataset.Tables[0].Rows[0][7].ToString();


            string Body = "Congratulations " + FirstName+ ", " + LastNae +
                              "\nYou Are Successfully Created A Virtual Machine " +txtvmname.Text + " Under "+DropDownList1.SelectedItem.Text+". "+
                          "\n\nYou Can Use This Virtual Machine For "+txtminutes.Text+" Minuits.   \n\n\n\nThank You\nSimple Cloud Share Team";
            mail.SendMessage(Email1, "Reg: Your New Virtual Machine", Body);


            Body = "Congratulations " + txtfn.Text+ ", " + txtln.Text+
                              "\nYour Request Has Been Processed Successfully And You Have Been Charged "+txtcost.Text+" $ For Creating A Virtual Machine Name As :" +txtvmname.Text + "." + "Under "+DropDownList1.SelectedItem.Text+" "+
                          "\n\nYou Can Use This Virtual Machine For "+txtminutes.Text+" Minuits.   \n\n\n\nThank You\nSimple Cloud Share Team";
            mail.SendMessage(txtemail.Text, "Reg: Your Payment Information", Body);




            Response.Redirect("VirtualMachine.aspx");
        }

        else
        {
            Response.Write("<script language='javascript'>  alert('Maximum Limit Exceeded'); </script>");
        }
    }
    protected void txtminutes_TextChanged(object sender, EventArgs e)
    {
        try
        {
            txtcost.Text = (Convert.ToInt32(txtminutes.Text)*0.10).ToString();
        }
        catch(Exception er)
        {
            
        }
    }
}
    
