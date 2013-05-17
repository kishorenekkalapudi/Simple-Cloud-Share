<%@ Page Title="" Language="C#" MasterPageFile="~/User/UserMaster.master" AutoEventWireup="true" CodeFile="CreateVirtualMachine.aspx.cs" Inherits="User_CreateVirtualMachine" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Register" Runat="Server">

    
    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
    </asp:ToolkitScriptManager>


<table>
<tr>
<td>Template </td>
<td>
    <asp:DropDownList ID="DropDownList1" runat="server">
    </asp:DropDownList> </td>
    <td>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
            ErrorMessage="Select Template" ControlToValidate="DropDownList1" 
            InitialValue="Select">*</asp:RequiredFieldValidator> </td>
</tr>


<tr>
<td>Virtual Machine Name</td>
<td>
    <asp:TextBox ID="txtvmname" runat="server"></asp:TextBox> </td>
    <td>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
            ErrorMessage="Enter Virtual Machine Name" ControlToValidate="txtvmname">*</asp:RequiredFieldValidator> </td>
</tr>



<tr>
<td>No Of Minutes</td>
<td>
    <asp:TextBox ID="txtminutes" runat="server" AutoPostBack="true" 
        ontextchanged="txtminutes_TextChanged"></asp:TextBox> </td>
    <td>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
            ErrorMessage="Enter No Of Minutes You Want To Use" 
            ControlToValidate="txtminutes">*</asp:RequiredFieldValidator> </td>
</tr>

<tr>
<td>Cost</td>
<td>
    <asp:UpdatePanel ID="updtpnl" runat="server">
    <ContentTemplate>
    <asp:TextBox ID="txtcost" runat="server" Enabled="false"></asp:TextBox> 
    </ContentTemplate>
    <Triggers>
    <asp:AsyncPostBackTrigger ControlID="txtminutes" EventName="TextChanged" />
    </Triggers>
    </asp:UpdatePanel>
    </td>
    
    <td>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
            ErrorMessage="Enter No Of Minutes You Want To Use" ControlToValidate="txtcost">*</asp:RequiredFieldValidator> </td>
</tr>


<tr>
<th colspan="3" align="center">Payment And Billing Information</th></tr>

<tr>

<td colspan="3" align="center"> 
    &nbsp;<asp:Image ID="Image1" runat="server" Height="70px" 
        ImageUrl="~/images/Credit Card Logo.jpg" Width="250px" />
    </td>
</tr>

<tr>

<td>Card Holder First Name</td>
<td>
    <asp:TextBox ID="txtfn" runat="server"></asp:TextBox> </td>
    <td>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
            ErrorMessage="Enter First Name" ControlToValidate="txtfn">*</asp:RequiredFieldValidator> </td>
</tr>

<tr>
<td>Card Holder Last Name</td>
<td>
    <asp:TextBox ID="txtln" runat="server"></asp:TextBox> </td>
    <td>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
            ErrorMessage="Enter Last Name" ControlToValidate="txtln">*</asp:RequiredFieldValidator> </td>
</tr>


<tr>
<td>E-Mail Address</td>
<td>
    <asp:TextBox ID="txtemail" runat="server"></asp:TextBox> </td>
    <td>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
            ErrorMessage="Enter Email Address" Display="Dynamic" 
            ControlToValidate="txtemail">*</asp:RequiredFieldValidator> </td>
        <td>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                ErrorMessage="Enter Valid EMail Address" ControlToValidate="txtemail" 
                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator> </td>
</tr>


<tr>
<td>Address</td>
<td>
    <asp:TextBox ID="txtaddress" runat="server" TextMode="MultiLine"></asp:TextBox> </td>
    <td>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
            ErrorMessage="Enter Address" ControlToValidate="txtaddress">*</asp:RequiredFieldValidator> </td>
</tr>


<tr>
<td>City</td>
<td>
    <asp:TextBox ID="txtcity" runat="server"></asp:TextBox> </td>
    <td>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" 
            ErrorMessage="Enter City" ControlToValidate="txtcity">*</asp:RequiredFieldValidator> </td>
</tr>

<tr>
<td>State</td>
<td>
    <asp:TextBox ID="txtstate" runat="server"></asp:TextBox> </td>
    <td>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" 
            ErrorMessage="Enter State" ControlToValidate="txtstate">*</asp:RequiredFieldValidator> </td>
</tr>

<tr>
<td>Zip Code</td>
<td>
    <asp:TextBox ID="txtzip" runat="server"></asp:TextBox> </td>
    <td>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" 
            ErrorMessage="Enter ZIP Code" ControlToValidate="txtzip">*</asp:RequiredFieldValidator> </td>
</tr>

<tr>
<td>Credit Card Number</td>
<td>
    <asp:TextBox ID="txtcreditcardnumber" runat="server" MaxLength="16"></asp:TextBox> </td>
    <td>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" 
            ErrorMessage="Enter Credit Card Number" ControlToValidate="txtzip">*</asp:RequiredFieldValidator> </td>
            <td> 
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Enter 16 Digit Credit Card Nuber" ControlToValidate="txtcreditcardnumber" ValidationExpression=".{16}.*"></asp:RegularExpressionValidator> </td>
</tr>


<tr>
<td>Start Date</td>
<td>
    <asp:TextBox ID="txtstartdate" runat="server"></asp:TextBox> </td>
    <td>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" 
            ErrorMessage="Enter Starting Date" ControlToValidate="txtstartdate">*</asp:RequiredFieldValidator> </td>
</tr>

<tr>
<td>Expiration Date</td>
<td>
    <asp:TextBox ID="txtexpdate" runat="server"></asp:TextBox> </td>
    <td>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" 
            ErrorMessage="Enter Expriration Date" ControlToValidate="txtexpdate">*</asp:RequiredFieldValidator> </td>
</tr>


<tr>
<td>CVV</td>
<td>
    <asp:TextBox ID="txtcvv" runat="server"></asp:TextBox> </td>
    <td>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" 
            ErrorMessage="Enter CVV Number" ControlToValidate="txtcvv">*</asp:RequiredFieldValidator> </td>
</tr>

<tr>
<td></td>
<td align="center">
    <asp:Button ID="Button1" runat="server" Text="Buy" onclick="Button1_Click" /> </td>

</tr>

</table>

<table>
<tr>
<td>
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" />
</td>
</tr>
</table>


    <asp:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="txtstartdate" DefaultView="Days"> 
    </asp:CalendarExtender>

    <asp:CalendarExtender ID="CalendarExtender2" runat="server" TargetControlID="txtexpdate" Animated="true"> 
    </asp:CalendarExtender>


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
</asp:Content>

