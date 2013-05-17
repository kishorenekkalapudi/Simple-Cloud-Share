<%@ Page Language="C#" AutoEventWireup="true" CodeFile="VirtualMachineActions.aspx.cs" Inherits="User_VirtualMachineActions" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

<head id="Head1" runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Simple Cloud Share</title>
    <link href="../styles.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .style1
        {
            width: 338px;
        }
    </style>
</head>

<body class="noheader">
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>

    

<div id="container">
	<div id="header">
    	<h1><a href="UserHome.aspx">Simple<strong> Cloud Share.com</strong></a></h1>
        <h2>virtual machines for development</h2>
        <div class="clear"></div>
    </div>

    <div id="nav">
    	<ul class="sf-menu dropdown">
        	<li><a href="UserHome.aspx">Home</a></li>
            <li><a href="UpdateProfile.aspx">Update Profile</a> </li>
            <li><a href="VirtualMachine.aspx">Virtual Machine</a> </li>
            <li><a href="ChangePassword.aspx">Change Password</a></li>            
            <li><asp:LinkButton ID="lnklogout" runat="server" onclick="lnklogout_Click" CausesValidation="false">Log Out</asp:LinkButton></li>
        </ul>
    </div>
        
    <div id="body">            
		<div id="content">

        <table>
        <tr>
        <td class="style1">
            <div class="box">
                <b>
                <p>Welcome <asp:Label ID="lblname" runat="server"></asp:Label> </p>
                </b>             
                <br /><br />

                <p style="color:Red">Virtual Machine Information</p>
                <img src="../images/h4.png" /><br />
                <table>
                
                <tr>
                <td>Template :</td>
                <td><asp:Label ID="lbltemplate" runat="server" /></td>
                </tr>
                
                <tr>
                <td>VM Name :</td>
                <td><asp:Label ID="lblvmname" runat="server" /></td>
                </tr>
                </table>                
                
                <p style="color:Red">VM Assigned Resource Details</p>
                <img src="../images/h4.png" /><br />
                <table>
                <tr>
                <td>RAM :</td>
                <td><asp:Label ID="lblram" runat="server" /></td>
                </tr>
                <tr>
                <td>CPU Cores :</td>
                <td><asp:Label ID="lblcpucores" runat="server" /></td>
                </tr>

                <tr>
                <td>CPU :</td>
                <td><asp:Label ID="lblcpu" runat="server" /></td>
                </tr>

                </table>

                <p style="color:Red">VM Consumed Resource Details</p>
                <img src="../images/h4.png" /><br />
                <table>
                <tr>
                <td>RAM :</td>
                <td>
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                    <asp:Label ID="lblcram" runat="server" />
                        <asp:Timer ID="RAM" runat="server" Enabled="true" Interval="60000" 
                            ontick="RAM_Tick">
                        </asp:Timer>
                    </ContentTemplate>
                    </asp:UpdatePanel>
                
                </td>
                </tr>
                <tr>
                <td>CPU :</td>
                <td>
                    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                    <ContentTemplate>
                <asp:Label ID="lblccpu" runat="server" />
                
                </ContentTemplate>
                </asp:UpdatePanel>
                
                </td>
                </tr>


                <tr>
                <td>Minutes Remaining:</td>
                <td>
                    <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                    <ContentTemplate>
                <asp:Label ID="lblminit" runat="server" />
                
                </ContentTemplate>
                </asp:UpdatePanel>
                
                </td>
                </tr>


                <tr>
                <td>Credits Remaining:</td>
                <td>
                    <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                    <ContentTemplate>
                <asp:Label ID="lblcredits" runat="server" />                
                </ContentTemplate>
                </asp:UpdatePanel>
                
                </td>
                </tr>


                </table>

            </div>
            </td>


            <td rowspan="2" align="center">
                Web Based SSH<br />
                <asp:TextBox ID="TextBox1" runat="server" TextMode="MultiLine" Height="400px" 
                    Width="550px"></asp:TextBox>
                    
                            <table>
            <tr>
            <td>
            <asp:LinkButton ID="LinkButton1" runat="server" onclick="LinkButton1_Click">Suspend VM</asp:LinkButton> </td>
            <td><asp:LinkButton ID="LinkButton2" runat="server" onclick="LinkButton2_Click">Resume VM</asp:LinkButton></td>            
            <td><asp:LinkButton ID="LinkButton4" runat="server" onclick="LinkButton4_Click">Reset VM</asp:LinkButton>
            <td><asp:LinkButton ID="LinkButton6" runat="server" onclick="LinkButton6_Click">Power Off VM</asp:LinkButton>
            </td>
            <td><asp:LinkButton ID="LinkButton3" runat="server" onclick="LinkButton3_Click">Reconfigure VM</asp:LinkButton>
            </td>
            </tr>
            </table>            
                </td>                                
                
            </tr>


            
            </table>
            

        </div>
        
    	<div class="clear"></div>
    </div>
</div>
    </form>
</body>
</html>