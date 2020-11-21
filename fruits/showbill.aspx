<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="showbill.aspx.cs" Inherits="fruits.showbill" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            font-weight: normal;
            font-size: xx-large;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table align="center" border="0" style="border:2px solid;width:600px;">
        <tr>
                
            <th colspan="2" style="text-align:center;border:3px solid;"><img src="image/ait.jpg" style="width:50px;height:50px;float:left" /><span class="auto-style1" style="color:darkblue;" ><strong>Bill</strong></span><img src="image/aau.jpg" style="width:50px;height:50px;float:right" /></th>
        </tr>
        <tr>
            <td>Name   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: </td>
            <td><asp:Label ID="lblname" runat="server"></asp:Label></td>
        </tr>
        <tr>
            <td>Order No &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: </td>
            <td><asp:Label ID="lbloid" runat="server"></asp:Label></td>
        </tr>
        <tr>
            <td>Order Date &nbsp; : </td>
            <td><asp:Label ID="odate" runat="server"></asp:Label></td>
        </tr>
        <tr>
            <td>Address &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: </td>
            <td><asp:Label ID="lbladd" runat="server"></asp:Label></td>
        </tr>
        <tr>
            <td colspan="2" style="padding:0px">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" style="margin-left: 0px" Width="595px">
                    <Columns>
                        <asp:BoundField DataField="sno" HeaderText="Sr. No" />
                        <asp:BoundField DataField="productname" HeaderText="Product Name" />
                        <asp:BoundField DataField="quantity" HeaderText="Quantity" />
                        <asp:BoundField DataField="price" HeaderText="Price" />
                        <asp:BoundField DataField="totalprice" HeaderText="Total Price" />
                    </Columns>
                </asp:GridView>
            </td>
        </tr>
        <tr>
            <td colspan="2">Total Payment :     <asp:Label ID="gtot" runat="server"></asp:Label> </td>
            
      
    </table>
    
        </div>
    </form>
</body>
</html>