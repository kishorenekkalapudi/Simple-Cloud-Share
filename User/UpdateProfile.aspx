<%@ Page Title="" Language="C#" MasterPageFile="~/User/UserMaster.master" AutoEventWireup="true" CodeFile="UpdateProfile.aspx.cs" Inherits="User_UpdateProfile" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Register" Runat="Server">

    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
    </asp:ToolkitScriptManager>

<table>			
					<tr>
                    <td>FirstName </td>
						<td><asp:TextBox ID="txtfn" runat="server"></asp:TextBox>
                            </td><td>
                            <asp:RequiredFieldValidator 
                                ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtfn" 
                                ErrorMessage="Please! Enter the First Name" Font-Bold="False" Font-Size="Small" 
                                ForeColor="#990000">*</asp:RequiredFieldValidator>
						</td>
					</tr>

					<tr>
						<td>LastName </td>
						<td>
                            <asp:TextBox ID="txtln" runat="server"></asp:TextBox>
                            </td><td>
<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                ControlToValidate="txtln" ErrorMessage="Please! Enter Last Name" 
                                Font-Size="Small" ForeColor="#990000">*</asp:RequiredFieldValidator>
						</td>
					</tr>

					<tr>
						<td>UserName </td>
						<td>
                            <asp:TextBox ID="txtun" runat="server"></asp:TextBox>                            

</td><td>
<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                ControlToValidate="txtun" ErrorMessage="Please! Enter Username" 
                                Font-Size="Small" ForeColor="#990000" Display="Dynamic">*</asp:RequiredFieldValidator>
</td><td>
<asp:CustomValidator ID="CustomValidator1" runat="server" ControlToValidate="txtun" 
                                ErrorMessage="Username must be atleast 6 characters" Font-Size="Small" 
                                ForeColor="#990000" Display="Dynamic"></asp:CustomValidator>
						</td>
					</tr>

					<tr>
						<td>Date of Birth</td>
						<td><asp:TextBox ID="txtdob" runat="server" 
                               ></asp:TextBox>
                            </td><td>
<asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                                ErrorMessage="Please Enter your Date of Birth Correctly!" Font-Size="Small" 
                                ForeColor="#990000" ControlToValidate="txtdob" Display="Dynamic">*</asp:RequiredFieldValidator>
                            </td>
					</tr>
					
					<tr>
					<td>Gender </td>
					<td>
                        <asp:RadioButtonList ID="RadioButtonList1" runat="server" RepeatDirection="Horizontal">
                        <asp:ListItem Value="Male" Text="Male"></asp:ListItem>
                        <asp:ListItem Value="FeMale" Text="Fe Male"></asp:ListItem>
                        </asp:RadioButtonList> </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="RadioButtonList1" ErrorMessage="Select Gender">*</asp:RequiredFieldValidator>
                             </td>
					 
					</tr>
					
					<tr>
						<td>E-Mail</td>
						<td><asp:TextBox ID="txtmail" runat="server" 
                               ></asp:TextBox>
                            </td><td>
<asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                                ErrorMessage="Please Enter your Email Address!" Font-Size="Small" 
                                ForeColor="#990000" ControlToValidate="txtmail" Display="Dynamic">*</asp:RequiredFieldValidator>
</td>
<td> 
    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
        ErrorMessage="Enter Valid E-Mail Address" ControlToValidate="txtmail" 
        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Display="Dynamic"></asp:RegularExpressionValidator>
</td>
					</tr>
					

					<tr>
						<td>Address</td>
							<td>
                                <asp:TextBox ID="txtadd" runat="server" Height="57px" TextMode="MultiLine" 
                                   ></asp:TextBox>
                                </td><td>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                                    ErrorMessage="Please Enter The Address Details" Font-Size="Small" 
                                    ForeColor="#990000" ControlToValidate="txtadd">*</asp:RequiredFieldValidator>
						</td>
					</tr>
					
					<tr>
						<td>Phone Number</td>
						<td>
                            <asp:TextBox ID="txtphno" runat="server"></asp:TextBox>
                            </td><td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" 
                                ErrorMessage="Please Enter your Mobile Number" Font-Size="Small" 
                                ForeColor="#990000" ControlToValidate="txtphno" Display="Dynamic">*</asp:RequiredFieldValidator>
						</td>

                        <td>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" 
                                ErrorMessage="Enter Valid Phone Number" ControlToValidate="txtphno" 
                                ValidationExpression="((\(\d{3}\) ?)|(\d{3}-))?\d{3}-\d{4}"></asp:RegularExpressionValidator>
                        </td>

					</tr>
					
																							

					<tr>
						<td align="center">
                            <asp:Button ID="Button2" runat="server" onclick="Button2_Click" 
                                Text="Edit Data" CausesValidation="true"/>
						</td>

						<td align="center">
                            <asp:Button ID="Button1" runat="server" Text="Update" CausesValidation="false" 
                                onclick="Button1_Click"/>
                        </td>
                            
					</tr>
                    <tr>
                    <td colspan="2">
                        <asp:Label ID="lblmessage" runat="server" ForeColor="Red"></asp:Label> </td>
                    </tr>
                    <tr>
                    <td colspan="3">                    
                        <asp:ValidationSummary ID="ValidationSummary1" runat="server" Visible="true"/>
                    </td>
                    </tr>    
				</table>


    <asp:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="txtdob">
    </asp:CalendarExtender>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
</asp:Content>

