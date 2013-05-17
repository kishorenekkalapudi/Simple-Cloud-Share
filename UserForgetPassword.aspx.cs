using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using B_DAL;
using System.Data;

public partial class UserForgetPassword : System.Web.UI.Page
{
    private Actions action = new Actions();
    DataSet dataset;
    private GetDetailsBy b_getdetailsby = new GetDetailsBy();
    private MailMessageSSL mail = new MailMessageSSL();

    protected void Page_Load(object sender, EventArgs e)
    {
        Label text = new Label();
        text = (Label)Master.FindControl("lblintro");
        text.Visible = false;
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string Password= action.UserForgetPassword(txtmail.Text);
        if (Password.Equals("E-Mail Address You Are Entered Not Registered With"))
        {
            lblmessage.Text = "E-Mail Address You Are Entered Not Registered With Us";
        }
        else
        {
            dataset = new DataSet();
            dataset=b_getdetailsby.GetUserDetailsByEMail(txtmail.Text);
            string FirstName = dataset.Tables[0].Rows[0][0].ToString();
            string LastName = dataset.Tables[0].Rows[0][1].ToString();

            string Body = "Hello " + FirstName+ ", " + LastName+
                              "\nWe Are Successfully Recovered Your Password\nPassword :" + Password +
                              "\n\n\n\n\nThank You\nSimple Cloud Share Team";
            mail.SendMessage(txtmail.Text, "Reg : Your SimpleCloudShare Password ", Body);
            lblmessage.Text = "Your Password Successfully Mailed to " + txtmail.Text;
        }
    }
}