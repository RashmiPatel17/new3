<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="viewdetails.aspx.cs" Inherits="fruits.WebForm13" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 99%;
            height: 141px;
            background-color:#fae2e2;
        }
        .auto-style2 {
            height: 44px;
        }
        .auto-style3 {
            height: 57px;
            text-align: center;
        }
        .auto-style5 {
            height: 49px;
            text-align: center;
        }
        .auto-style6 {
            width: 231px;
        }
        .auto-style7 {
            height: 46px;
            text-align: center;
        }
        .auto-style8 {
            background-color: #66CCFF;
        }
        .auto-style9 {
            height: 45px;
            text-align: center;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:DataList ID="DataList1" runat="server" align="center" DataKeyField="productid" DataSourceID="SqlDataSource1" RepeatColumns="1" RepeatDirection="Horizontal" OnItemCommand="DataList1_ItemCommand" OnSelectedIndexChanged="DataList1_SelectedIndexChanged" OnItemDataBound="DataList1_ItemDataBound">
        <ItemTemplate>
            <table border="4px" class="auto-style1" align="center" style="width:500PX">
                <tr>
                    <td class="auto-style2" colspan="2" style="text-align: center">
                        <asp:Label ID="Label1" runat="server" style="font-weight: 700" Text='<%# Eval("productname") %>'></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style6" rowspan="5" style="text-align: center">
                        <asp:Image ID="Image1" runat="server" Height="200px" ImageUrl='<%# Eval("productimage") %>' Width="200px" />
                    </td>
                    <td class="auto-style3">Product Id:<asp:Label ID="Label2" runat="server" Text='<%# Eval("productid") %>'></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style9">Description:<asp:Label ID="Label3" runat="server" Text='<%# Eval("description") %>'></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style9">Price/Rs:<asp:Label ID="Label4" runat="server" Text='<%# Eval("price") %>'></asp:Label>
                    </td>
                </tr>
                <tr>
                   <td class="auto-style5">Available Quantity:<asp:Label ID="quantity" runat="server" Text='<%# Eval("available") %>'></asp:Label>
                    </td>
                                        <%--<td class="auto-style9">Quantity:
                                 <asp:TextBox ID="TextBox" runat="server" type="number"></asp:TextBox>
                             </td>
                                  <td>
                    <asp:RangeValidator ID="RangeValidator1" ControlToValidate="Textbox" runat="server" ErrorMessage="Enter your class(0-10)" MaximumValue="10" MinimumValue="0" Type="Integer"></asp:RangeValidator>
                   </td>--%>

                        </tr>
                <tr>
                    <td>
                        Quantity : <asp:DropDownList ID="ddqty" runat="server"></asp:DropDownList>
                    </td>
                </tr>
                 <tr>
                                <td>
                                    <br />
                                    <asp:Label ID="lblmsg" runat="server" style="color:red;font-size:18pt"></asp:Label>
                                </td>
                            </tr>
                 
                <tr>
                    <td class="auto-style7">
                        <asp:Button ID="Button1" runat="server" CssClass="auto-style8" Height="34px" Text="Add To Cart" Width="142px" CommandArgument='<%#Eval("productid")%>' CommandName="addtocart" />
                    </td>
                </tr>
            </table>
            <br />
        </ItemTemplate>
    </asp:DataList>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:StudentConnectionString %>" SelectCommand="SELECT * FROM [fruitaddproduct] WHERE ([productid] = @productid)">
        <SelectParameters>
            <asp:QueryStringParameter Name="productid" QueryStringField="id" Type="Int32" />
            
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
