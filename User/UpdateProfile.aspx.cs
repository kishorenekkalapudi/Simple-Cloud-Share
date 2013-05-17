using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using B_DAL;
using System.Data;

public partial class User_UpdateProfile : System.Web.UI.Page
{
    GetDetailsBy b_getdetailsby = new GetDetailsBy();
    private Actions b_actions = new Actions();
    DataSet dataset;

    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            dataset = new DataSet();
            dataset = b_getdetailsby.GetUserProfileById(Session["UserId"].ToString());

            txtfn.Text = dataset.Tables[0].Rows[0][1].ToString();
            txtln.Text = dataset.Tables[0].Rows[0][2].ToString();
            txtun.Text = dataset.Tables[0].Rows[0][3].ToString();
            string Gen = dataset.Tables[0].Rows[0][5].ToString();
            if(Gen.Equals("Male"))
            {
                RadioButtonList1.SelectedValue= "Male";
            }
            else
            {
                RadioButtonList1.SelectedValue= "FeMale";
            }
            txtdob.Text = dataset.Tables[0].Rows[0][6].ToString();
            txtmail.Text = dataset.Tables[0].Rows[0][7].ToString();
            txtadd.Text = dataset.Tables[0].Rows[0][8].ToString();
            txtphno.Text = dataset.Tables[0].Rows[0][9].ToString();

            txtadd.Enabled=false;
            txtdob.Enabled=false;
            txtfn.Enabled=false;
            txtln.Enabled=false;
            txtmail.Enabled=false;
            txtphno.Enabled=false;
            txtun.Enabled=false;
            RadioButtonList1.Enabled = false;
        }
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        txtadd.Enabled = true;
        txtdob.Enabled = true;
        txtfn.Enabled = true;
        txtln.Enabled = true;
        txtmail.Enabled = true;
        txtphno.Enabled = true;
        RadioButtonList1.Enabled = true;
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if(txtfn.Enabled==true)
        {
            string Resut = b_actions.UserUpdateProfile(txtfn.Text, txtln.Text, txtun.Text,
                                                       RadioButtonList1.SelectedItem.Text, txtdob.Text, txtmail.Text,
                                                       txtadd.Text, txtphno.Text,Session["UserId"].ToString());
            lblmessage.Text = Resut;
        }
    }
}