<%@ Page Title="" Language="C#" MasterPageFile="~/User/UserMaster.master" AutoEventWireup="true" CodeFile="VirtualMachine.aspx.cs" Inherits="User_VirtualMachine" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Register" Runat="Server">
    List Of Virtual Machines 

    <asp:Repeater ID="Repeater1" runat="server" 
    onitemcommand="Repeater1_ItemCommand">
    <ItemTemplate>
    <table>
    <tr>
    <th>Virtual Machine</th>
    <th>Virtual Machine Name</th>
    <th>RAM</th>
    <th>CPU Cores</th>
    <th>Minutes</th>
    <th>View Details</th>
    <th>Start Machine</th>
    <th>Buy Credits</th>
    <th>Delete Machine</th>
    </tr><tr>
    <td>

        <asp:Image ID="Image1" runat="server" ImageUrl='<%#Bind("Image") %>'/> </td>
        <td>
            <asp:Label ID="Label1" runat="server" Text='<%#Bind("UserVirtualMachineName") %>'></asp:Label> </td>            
            <td>
            <asp:Label ID="Label3" runat="server" Text='<%#Bind("RAM") %>'></asp:Label> </td>
            <td>
            <asp:Label ID="Label4" runat="server" Text='<%#Bind("CPUCores") %>'></asp:Label> </td>
            <td>
            <asp:Label ID="Label5" runat="server" Text='<%#Bind("Minutes") %>'></asp:Label> </td>
            <td><asp:LinkButton ID="LinkButton1" runat="server" CommandName="View" CommandArgument='<%#Bind("VirtualMachineId") %>'>View</asp:LinkButton> </td>
            <td><asp:LinkButton ID="LinkButton2" runat="server" CommandName="Start" CommandArgument='<%#Bind("VirtualMachineId") %>'>Start Machine</asp:LinkButton> </td>
            <td><asp:LinkButton ID="LinkButton5" runat="server" CommandName="Buy" CommandArgument='<%#Bind("VirtualMachineId") %>'>Buy More Credits</asp:LinkButton> </td>
            <td><asp:LinkButton ID="LinkButton3" runat="server" CommandName="Delete" CommandArgument='<%#Bind("VirtualMachineId") %>'>Delete</asp:LinkButton> </td>
    </tr>
    </table>
    </ItemTemplate>
    </asp:Repeater>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table>
<tr>
<td>
    <asp:LinkButton ID="LinkButton4" runat="server" onclick="LinkButton4_Click">Create New Virtual Machine</asp:LinkButton> </td>
</tr>
</table>
</asp:Content>

