using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using B_DAL;
using System.Data;

public partial class Login : System.Web.UI.Page
{
    GetDetails b_getdetails = new GetDetails();
    Authentication b_authentication = new Authentication();
    DataSet dataset;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {            
            dataset = new DataSet();
            dataset = b_getdetails.GetRoles();
            if (dataset != null)
            {
                droprole.DataSource = dataset;
                droprole.DataTextField = "Role";
                droprole.DataValueField = "RoleId";
                droprole.DataBind();
                droprole.Items.Insert(0, "Select");
            }
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        lblerr.Text = "";
        dataset = new DataSet();
        if (droprole.SelectedItem.Value.Equals("1"))
        {            
            dataset=b_authentication.Login(txtun.Text, txtpwd.Text, droprole.SelectedItem.Value.ToString());
            string UserId, FirstName, LastName,UserExists,Status;
            UserExists = dataset.Tables[0].Rows[0][0].ToString();
            Status = dataset.Tables[0].Rows[0][1].ToString();
            UserId = dataset.Tables[0].Rows[0][2].ToString();
            FirstName = dataset.Tables[0].Rows[0][3].ToString();
            LastName = dataset.Tables[0].Rows[0][4].ToString();

            if (UserExists.Equals("1"))
            {
                if (Status.Equals("1"))
                {
                    Session["UserId"] = UserId;
                    Session["FullName"] = FirstName+" "+LastName;                    
                    Response.Redirect("User/UserHome.aspx");
                }
                else
                {
                    lblerr.Text = "Your account is created and must be activated by Administrator before you can use it";
                }
            }
            else
            {
                lblerr.Text = "Invalid Credentials";
            }

        }

        if (droprole.SelectedItem.Value.Equals("2"))
        {
            dataset=b_authentication.Login(txtun.Text, txtpwd.Text, droprole.SelectedItem.Value.ToString());
            int AdminStatus =Convert.ToInt32(dataset.Tables[0].Rows[0][0].ToString());

            if (AdminStatus == 1)
            {
                Session["AdminStatus"] = AdminStatus;
                Response.Redirect("Admin/AdminHome.aspx");
            }

            else
            {
                lblerr.Text = "Invalid Credentials";
            }
        }
    }
}