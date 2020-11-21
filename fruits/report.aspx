<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="report.aspx.cs" Inherits="fruits.report" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Report</title>
    <p style="font-size: large; font-weight: bold; text-align: center; font-size:40px; " > Quantity Report</p>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="Content/bootstrap.css" rel="stylesheet" />
    <script src="Scripts/bootstrap.js"></script>
    <script src="Scripts/jquery-1.9.1.js"></script>
</head>
<body>
    <form id="form1" runat="server">

        <div>
            <div class="row">
                <table align="center">
                    <td>

                  
        <div class="col-md-8 col-sm-11" style="text-align:center;padding-left:10%;font-size:25pt">
              <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="productid" DataSourceID="SqlDataSource1">
                  <Columns>
                      <asp:BoundField DataField="productid" HeaderText="productid" InsertVisible="False" ReadOnly="True" SortExpression="productid" />
                      <asp:BoundField DataField="productname" HeaderText="product Name" SortExpression="productname" />
                      <asp:BoundField DataField="price" HeaderText="Price" SortExpression="price" />
                      <asp:BoundField DataField="quantity" HeaderText="Totale Quantity" SortExpression="quantity" />
                      <asp:BoundField DataField="available" HeaderText="Available" SortExpression="available" />
                      <asp:BoundField DataField="soldout" HeaderText="Sold Out" SortExpression="soldout" />
                  </Columns>
              </asp:GridView>
              <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:rashmi %>" SelectCommand="SELECT * FROM [fruitaddproduct]"></asp:SqlDataSource>
           </div>
                          </td>
                </table>
    </div>
        </div>
    </form>
</body>
</html>
