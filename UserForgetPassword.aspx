<%@ Page Title="" Language="C#" MasterPageFile="~/MainHome.master" AutoEventWireup="true" CodeFile="UserForgetPassword.aspx.cs" Inherits="UserForgetPassword" %>

<%-- Add content controls here --%>
<asp:Content ID="Content1" runat="server" contentplaceholderid="Register">
<table>
<tr>
<td>E-Mail Address</td>
<td>
    <asp:TextBox ID="txtmail" runat="server"></asp:TextBox> </td>
    <td>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Enter E-Mail Address" ControlToValidate="txtmail"></asp:RequiredFieldValidator> </td>
    <td>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
            ErrorMessage="Enter Valid E-Mail Address" ControlToValidate="txtmail" 
            ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
     </td>
</tr>
<tr>
<td>
    <asp:Button ID="Button1" runat="server" Text="Reset" onclick="Button1_Click" /> </td>
    <td>
        <asp:Label ID="lblmessage" runat="server" ForeColor="Red"></asp:Label> </td>
</tr>
</table>
</asp:Content>

