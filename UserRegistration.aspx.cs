using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using B_DAL;

public partial class UserRegistration : System.Web.UI.Page
{
    GetDetails b_getdetails = new GetDetails();
    Authentication b_authentication = new Authentication();
    private GetDetailsBy b_getdetailsby = new GetDetailsBy();

    private MailMessageSSL mail = new MailMessageSSL();

    protected void Page_Load(object sender, EventArgs e)
    {
        Label text = new Label();
        text = (Label) Master.FindControl("lblintro");
        text.Visible = false;
    }
    
    protected void Button2_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            string Password = b_getdetails.GeneratePassword();
            string Result = b_authentication.RegisterUser(txtfn.Text, txtln.Text, txtun.Text, Password,
                                                          RadioButtonList1.SelectedItem.Text, txtdob.Text, txtmail.Text,
                                                          txtadd.Text, txtphno.Text);
            lblmessage.Text = Result;
            if (Result.Equals("User Registered Successfully"))
            {
                string Body = "Congratulations " + txtfn.Text + ", " + txtln.Text +
                              "\nYou Are Successfully Registered With Us, And Your Login Information Is \nUser Name :" +
                              txtun.Text + "\nPassword :" + Password +
                              "\nAlthough You Are Registered With Us, Administrator Need to Activate In Order to login And Use Our Services, You Will Get a Conformation E-Mail When ever you get Activated.\n\n\n\nThank You\nSimple Cloud Share Team";
                mail.SendMessage(txtmail.Text, "Reg : SimpleCloudShare Account Information", Body);
            }
        }
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        lblavailable.Text = "";
        System.Threading.Thread.Sleep(1000);
        string Result=b_getdetailsby.CheckUserNameExists(txtun.Text);
        lblavailable.Text = Result;
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        txtadd.Text = "";
        txtdob.Text = "";
        txtfn.Text = "";
        txtln.Text = "";
        txtmail.Text = "";
        txtphno.Text = "";
        txtun.Text = "";
        RadioButtonList1.SelectedIndex = -1;
    }
}