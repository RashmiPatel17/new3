<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="placeorder.aspx.cs" Inherits="fruits.WebForm15" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <style type="text/css">
        .auto-style1 {
            width: 44%;
            height: 135px;
        }
        .auto-style3 {
            width: 170px;
            font-size: large;
        }
        .auto-style4 {
            margin-top: 21px;
        }
        .auto-style5 {
            width: 43%;
            height: 171px;
        }
        .auto-style6 {
            width: 147px;
        }
         .auto-style7 {
             font-weight: bold;
             font-size: large;
             background-color: #CCFFFF;
         }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   
      
    <table class="auto-style1">
        <tr>
            <td class="auto-style3">Order Id:</td>
            <td>
                <asp:Label ID="Label1" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">Order Date:</td>
            <td>
                <asp:Label ID="Label2" runat="server"></asp:Label>
            </td>
        </tr>
    </table>

    <asp:GridView ID="GridView1" runat="server" align="center" AutoGenerateColumns="False" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" CssClass="auto-style4" Height="232px" ShowFooter="True" Width="801px">
        <Columns>
            <asp:BoundField DataField="sno" HeaderText="S.No" />
            <asp:BoundField DataField="productid" HeaderText="Product Id" />
            <asp:BoundField DataField="productname" HeaderText="Product Name" />
            <asp:BoundField DataField="description" HeaderText="Description" />
            <asp:BoundField DataField="quantity" HeaderText="Quantity" />
            <asp:ImageField DataImageUrlField="productimage" HeaderText="Product Image" ControlStyle-Height="200px" ControlStyle-Width="200px">
            </asp:ImageField>
            <asp:BoundField DataField="price" HeaderText="Price" />
            <asp:BoundField DataField="totalprice" HeaderText="Total Price" />
        </Columns>
        <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
        <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" Height="40px" />
        <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
        <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
        <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#FFF1D4" />
        <SortedAscendingHeaderStyle BackColor="#B95C30" />
        <SortedDescendingCellStyle BackColor="#F1E5CE" />
        <SortedDescendingHeaderStyle BackColor="#93451F" />
    </asp:GridView>

    <br />
    <table class="auto-style5" align="center">
        <tr>
            <td class="auto-style6">FULL NAME :</td>
            <td>
                <asp:TextBox ID="TextBox1" runat="server" Height="36px" Width="307px" class="form-control"></asp:TextBox><br />
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="enter full name" ForeColor="Red" ControlToValidate="TextBox1"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            
            <td class="auto-style6">YOUR ADDRESS :</td>
            <td>
                <asp:TextBox ID="TextBox2" runat="server" Height="36px" TextMode="MultiLine" Width="307px" class="form-control"></asp:TextBox><br />
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="enter address" ForeColor="Red" ControlToValidate="TextBox2"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <%--<tr>
            <td class="auto-style6">CITY :</td>
            <td>
                <asp:TextBox ID="TextBox3" runat="server" Height="36px" Width="307px"></asp:TextBox><br />
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="enter city" ForeColor="Red" ControlToValidate="TextBox3"></asp:RequiredFieldValidator>
            </td>
        </tr>
        --%><tr>
            <td class="auto-style6">E-MAIL :</td>
            <td>
                <asp:TextBox ID="TextBox4" runat="server" Height="36px" Width="307px" class="form-control"></asp:TextBox><br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Required" ControlToValidate="TextBox4" ForeColor="Red"></asp:RequiredFieldValidator>
           <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="enter a valid Email id" ControlToValidate="TextBox4" ForeColor="Red" BorderStyle="NotSet" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style6">CONTACT NO :</td>
            <td>
                <asp:TextBox ID="TextBox5" runat="server" Height="36px" Width="307px" class="form-control"></asp:TextBox><br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Required" ForeColor="Red" ControlToValidate="TextBox5"></asp:RequiredFieldValidator>
           <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Not valid" ControlToValidate="TextBox5" ForeColor="Red" ValidationExpression="^([6-9]{1})([0-9]{9})$"></asp:RegularExpressionValidator>          
            </td>
        </tr>
    </table>
    
    <%--<br />
    <br />
    <br />
    <br />--%>
    <div>    <asp:Label ID="Label3" style="center" runat="server" Text="Label">Payment Mode : Only cash on delevery accepted</asp:Label></div>
    <strong>
    <asp:Button ID="Button1" style="center" runat="server" Text="Place Order" CssClass="auto-style7" Height="43px" OnClick="Button1_Click" Width="158px" />
    
    </strong>
    
    
       
</asp:Content>
