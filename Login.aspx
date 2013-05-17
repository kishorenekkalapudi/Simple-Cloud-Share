<%@ Page Title="" Language="C#" MasterPageFile="~/MainHome.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>


<%-- Add content controls here --%>
<asp:Content ID="Content1" runat="server" 
    contentplaceholderid="ContentPlaceHolder1">    
            <ul>	
                
                <li>
                    <h4><span>Login <strong>Here</strong></span></h4>                    
                </li>
            </ul>

            
                <table>
                <tr>
                <td>UserName</td>
                <td><asp:TextBox ID="txtun" runat="server"></asp:TextBox> </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Enter User Name" ControlToValidate="txtun">*</asp:RequiredFieldValidator> </td>
                </tr>

                <tr>
                <td>Password</td>
                <td><asp:TextBox ID="txtpwd" runat="server" TextMode="Password"></asp:TextBox> </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Enter Password" ControlToValidate="txtpwd">*</asp:RequiredFieldValidator> </td>
                </tr>

                <tr>
                <td>Role</td>
                <td>
                    <asp:DropDownList ID="droprole" runat="server">
                    </asp:DropDownList> </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                        ErrorMessage="Select Role" ControlToValidate="droprole" InitialValue="Select">*</asp:RequiredFieldValidator> </td>
                </tr>
                <tr>
                <td><asp:Button ID="Button1" runat="server" Text="Login" 
                        onclick="Button1_Click"/> &nbsp;&nbsp;
                    
                    </td>
                    <td>
                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="false" 
                            PostBackUrl="~/UserForgetPassword.aspx">Forget Password ?</asp:LinkButton>
                    </td>
                </tr>
                <tr>
                <td colspan="3"><asp:Label ID="lblerr" runat="server" ForeColor="Red"></asp:Label></td>
                </tr>
                </table>
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
                DisplayMode="List" />
</asp:Content>

<asp:Content ID="Content2" runat="server" contentplaceholderid="Register">
</asp:Content>