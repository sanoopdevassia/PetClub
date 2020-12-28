<%@ Page Title="" Language="C#" MasterPageFile="~/adminmasterPage.master" AutoEventWireup="true" CodeFile="additem.aspx.cs" Inherits="additem" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style36
        {
            width: 362px;
        }
        .style37
        {
            width: 93px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div>
    <br /> <br /><br /> <br /><br /> <br />
      <h2> Add Product</h2> <br />
        
    
    </div>
    <table bgcolor="#FFFFCC" class="style1" cellpadding="10" cellspacing="10" >
        <tr>
            <td class="style37">
                Product ID</td>
            <td class="style36">
                <asp:Label ID="Label1" runat="server" Font-Bold="True"></asp:Label>
            </td>
        </tr><br />
        <tr>
            <td class="style37">
                Product Name</td>
            <td class="style36">
                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>  <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                ControlToValidate="TextBox1" ErrorMessage="Product Name is required." 
                ForeColor="#CC0000"></asp:RequiredFieldValidator>
            </td>
        </tr><br />
        <tr>
            <td class="style37">
                Price</td>
            <td class="style36">
                <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                ControlToValidate="TextBox2" ErrorMessage="Price required." 
                ForeColor="#CC0000"></asp:RequiredFieldValidator>
            </td>
        </tr><br />
        <tr>
            <td class="style37">
                Upload Product Image</td>
            <td class="style36">
                <asp:FileUpload ID="FileUpload1" runat="server" /><asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                ControlToValidate="FileUpload1" ErrorMessage="Please upload an Image." 
                ForeColor="#CC0000"></asp:RequiredFieldValidator>
            </td>
        </tr><br />
      <br />
        <br /><br />
        
    </table>
    <asp:Button ID="Button1" runat="server" BackColor="#CCCC00" ForeColor="#FF3300" 
                    onclick="Button1_Click" Text="Save Product" />
                <asp:Label ID="Label2" runat="server"></asp:Label>
    
     <br /> <br /> <br /> <br /> <br />    <br /> <br /> <br /> <br /> <br />    <br /> <br /> <br /> <br /> <br /> <br /> <br /> <br /> <br /> <br /> <br /> <br /> <br /> <br /> <br /> <br /> <br /> <br /> <br /> <br />
</asp:Content>

