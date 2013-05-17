<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.master" AutoEventWireup="true" CodeFile="DeactivateUser.aspx.cs" Inherits="Admin_DeactivateUser" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Register" Runat="Server">
    <table>
<tr>
<td><asp:Label ID="lblmessage" runat="server"></asp:Label> </td>
</tr>
<tr><td>
    <asp:GridView ID="GridView1" runat="server" EnableModelValidation="True" 
        AutoGenerateColumns="false" onrowcommand="GridView1_RowCommand">
        <Columns>
            <asp:TemplateField HeaderText="First Name">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("FirstName") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("FirstName") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Last Name">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("LastName") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("LastName") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="User Name">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("UserName") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("UserName") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="E-Mail">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("EMailAddress") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("EMailAddress") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="View">
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CommandName="View" CommandArgument='<%#Bind("UserId") %>'>View</asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Deactivate">
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton2" runat="server" CommandName="Deactivate" CommandArgument='<%#Bind("UserId") %>'>De-Activate</asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    </td></tr>
    </table>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
</asp:Content>

