<%@ Page Title="" Language="C#" MasterPageFile="~/User/UserMaster.master" AutoEventWireup="true" CodeFile="ChangePassword.aspx.cs" Inherits="User_ChangePassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Register" Runat="Server">

    <table>
<tr>
<td>Old Password</td>
<td><asp:TextBox ID="txtoldpwd" runat="server" TextMode="Password"></asp:TextBox> </td>
<td><asp:RequiredFieldValidator ID="req1" runat="server" ControlToValidate="txtoldpwd" ErrorMessage="Enter Old Password" Text="*"></asp:RequiredFieldValidator> </td>
</tr>

<tr>
<td>New Password</td>
<td><asp:TextBox ID="txtnewpwd" runat="server" TextMode="Password"></asp:TextBox> </td>
<td><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtnewpwd" ErrorMessage="Enter New Password" Text="*"></asp:RequiredFieldValidator> </td>
</tr>

<tr>
<td>Confirm New Password</td>
<td><asp:TextBox ID="txtconfirmpwd" runat="server" TextMode="Password"></asp:TextBox> </td>
<td><asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Enter Confirm Password" Text="*" ControlToValidate="txtconfirmpwd" Display="Dynamic"></asp:RequiredFieldValidator> </td>
<td><asp:CompareValidator ID="RequiredFieldValidator2" runat="server" 
        ControlToValidate="txtconfirmpwd" ControlToCompare="txtnewpwd" 
        ErrorMessage="Password Do not Match" Text="*" Display="Dynamic"></asp:CompareValidator> </td>
</tr>

<tr>
<td align="center" colspan="2"><asp:Button ID="btn" Text="Change Password" 
        runat="server" onclick="btn_Click"/> </td>
</tr>
<tr>
<td colspan="3" align="center"><asp:Label ID="lblmessage" runat="server" ForeColor="Red"></asp:Label> </td>
</tr>

<tr>
<td colspan="3">
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" />
</td>
</tr>

</table>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
</asp:Content>

