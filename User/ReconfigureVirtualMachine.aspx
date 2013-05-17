<%@ Page Title="" Language="C#" MasterPageFile="~/User/UserMaster.master" AutoEventWireup="true" CodeFile="ReconfigureVirtualMachine.aspx.cs" Inherits="User_ReconfigureVirtualMachine" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Register" Runat="Server">
<table>
<tr>
<td>RAM</td>
<td>
    <asp:TextBox ID="txtram" runat="server"></asp:TextBox> </td>
<td><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
        ErrorMessage="Enter RAM Size" ControlToValidate="txtram">*</asp:RequiredFieldValidator> </td>
<td><asp:RangeValidator ID="RangeValidator1" runat="server" 
        ErrorMessage="Value Must be Below 1536" ControlToValidate="txtram" 
        MaximumValue="1536" MinimumValue="256" Type="Integer"></asp:RangeValidator> </td>
</tr>

<tr>
<td>No Of CPU Cores</td>
<td>
    <asp:TextBox ID="txtcpu" runat="server"></asp:TextBox> </td>
<td><asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
        ErrorMessage="Enter No Of CPUS" ControlToValidate="txtcpu">*</asp:RequiredFieldValidator> </td>
<td><asp:RangeValidator ID="RangeValidator2" runat="server" 
        ErrorMessage="Enter Either 1 Or 2" ControlToValidate="txtcpu" MaximumValue="2" 
        MinimumValue="1" Type="Integer"></asp:RangeValidator> </td>
</tr>

<tr>
<td>
    <asp:Button ID="Button1" runat="server" Text="Re Configure" 
        onclick="Button1_Click" /> </td>
</tr>
</table>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
</asp:Content>

