<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="billshow.aspx.cs" Inherits="fruits.WebForm18" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">


     <style type="text/css">
        .auto-style1 {
            height: 51px;
            text-align: center;
        }
        .auto-style2 {
            width: 100%;
            height: 496px;
        }
        .auto-style3 {
            height: 88px;
        }
        .auto-style4 {
            width: 100%;
            height: 171px;
        }
        .auto-style5 {
            height: 63px;
        }
        .auto-style7 {
            width: 152px;
            height: 99px;
        }
        .auto-style8 {
            height: 99px;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <p>Order ID:<asp:Label ID="Label1" runat="server"></asp:Label>
    </p>
    <p>
        <asp:Button ID="Button1" runat="server" Height="39px" OnClick="Button1_Click" Text="Download Invoice" Width="160px" />
    </p>
    <p>&nbsp;</p>
    <asp:Panel ID="Panel1" runat="server" BorderWidth="1px" Height="636px" >
        <table class="auto-style2" border="2">
            <tr>
                <td class="auto-style1">Retail Invoice</td>
            </tr>
            <tr>
                <td class="auto-style3">Order No. :<asp:Label ID="Label2" runat="server"></asp:Label>
                    <br />
                    <br />
                    Order Date :<asp:Label ID="Label3" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <table class="auto-style4" border="2">
                        <tr>
                            <td class="auto-style7">Buyer Address :<br />
                                <asp:Label ID="Label4" runat="server"></asp:Label>
                            </td>
                            <td class="auto-style8">Seller Address:<br />
                                fruit Products ,Anand</td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <asp:GridView ID="GridView1" runat="server" Height="174px" Width="1282px" AutoGenerateColumns="False">
                                    <Columns>
                                        <asp:BoundField DataField="sno" HeaderText="S.No">
                                        <HeaderStyle HorizontalAlign="Center" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="productid" HeaderText="Product Id">
                                        <HeaderStyle HorizontalAlign="Center" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="productname" HeaderText="Product Name">
                                        <HeaderStyle HorizontalAlign="Center" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="quantity" HeaderText="Quantity">
                                        <HeaderStyle HorizontalAlign="Center" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="price" HeaderText="Price">
                                        <HeaderStyle HorizontalAlign="Center" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="totalprice" HeaderText="Total Price">
                                        <HeaderStyle HorizontalAlign="Center" />
                                        </asp:BoundField>
                                    </Columns>
                                </asp:GridView>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td class="auto-style5">Grand Total :<asp:Label ID="Label6" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">Declaration :We declar that this invoice showes actucal price of the goods described inclusive of taxes and that all particulars are true and correct
                    <br />
                    Incase you find selling price on this invoice to be more than MRP mrntioned on product,Please inform ....<br />
                    <br />
                    THIS IS A COMPUTER GENERATED TNVOICE AND DOES NOT REQUIRED SIGNATURE</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
            </tr>
        </table>
    </asp:Panel>
    <p>
    </p>
   <%-- <br/>
    <asp:Button ID="Button2" runat="server" Text="Button"  />--%>

</asp:Content>
