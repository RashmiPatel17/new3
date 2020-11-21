<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="addproduct.aspx.cs" Inherits="fruits.WebForm8" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style3 {
            width: 610px;
        }
        .auto-style4 {
            text-align: left;
            font-size: large;
            font-weight: normal;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div >
    <table style="border:2px solid black; width: 360px; height: 360px; background-color:#f8ac3f; margin-left:500px">
        <%--<tr>
            <td>
                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/fruitcategory.aspx">Add Categories</asp:HyperLink></td>
            <td></td>
        </tr>
      --%> <%-- <tr>
            <td>Category Name:</td>
            <td>
                <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource2" DataTextField="category" DataValueField="category" ></asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:StudentConnectionString %>" SelectCommand="SELECT * FROM [fruitcategory]" OnSelecting="SqlDataSource2_Selecting"></asp:SqlDataSource>
            </td>
        </tr>
       --%> 
                
        <tr>
            <th class="auto-style4"colspan="2" style="text-align:center">
                <strong>Add Product
            </strong>
            </th>
        </tr>
        <tr>
            <td>
                <b>PRODUCT NAME:</b>
            </td>
            <td class="auto-style3">
                <asp:TextBox ID="productname" runat="server" required="required"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <b>IMAGE</b>
            </td>
            <td class="auto-style3">
                <asp:FileUpload ID="f2" runat="server" />
            </td>
        </tr>
        <tr>
            <td>
                <b>DESCRIPTION</b>
            </td>
            <td class="auto-style3">
                <asp:TextBox ID="description" runat="server" TextMode="MultiLine" required="required"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <b>PRICE/Rs:</b>
            </td>
            <td class="auto-style3">
                <asp:TextBox ID="price" runat="server" required="required" MaxLength="3"></asp:TextBox>
            </td>
        </tr>
                
        <%--<tr>
                  
            <td>
                <b>Search</b>
            </td>
            <td class="auto-style3">
                <asp:TextBox ID="keywordsearch" runat="server" required="required"></asp:TextBox>
            </td>
        </tr>
 --%>       
        <tr>
            <td>
                <b>QUANTITY:</b>
           </td>
            <td class="auto-style3">
                <asp:TextBox ID="quantity" runat="server" required="required"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td colspan="2" style="font-size:18px">
                <b>
                    <asp:Button ID="Button1" runat="server" Text="ADD" OnClick="Button1_Click" /></b>
                <%--<asp:Label ID="Label1" runat="server"></asp:Label>--%>
            </td>
        </tr>
    </table>
        <table>
            <tr>
                <td>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:rashmi %>" DeleteCommand="DELETE FROM [fruitaddproduct] WHERE [productid] = @original_productid AND [productname] = @original_productname AND [productimage] = @original_productimage AND [price] = @original_price AND [description] = @original_description" InsertCommand="INSERT INTO [fruitaddproduct] ([productname], [productimage], [price], [description]) VALUES (@productname, @productimage, @price,@description)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [fruitaddproduct]" UpdateCommand="UPDATE [fruitnaddproduct] SET [productname] = @productname, [productimage] = @productimage, [price] = @price, [description] = @description WHERE [productid] = @original_productid AND [productname] = @original_productname AND [productimage] = @original_productimage AND [price] = @original_price AND [description] = @original_description">
                        <DeleteParameters>
                            <asp:Parameter Name="original_productid" Type="Int32" />
                            <asp:Parameter Name="original_productname" Type="String" />
                            <asp:Parameter Name="original_productimage" Type="String" />
                            <asp:Parameter Name="original_price" Type="Int32" />
                            <%--<asp:Parameter Name="original_qty" Type="Int32" />
 --%>                           <asp:Parameter Name="original_description" Type="String" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="productname" Type="String" />
                            <asp:Parameter Name="productimage" Type="String" />
                            <asp:Parameter Name="price" Type="Int32" />
                            <%--<asp:Parameter Name="qty" Type="Int32" />
      --%>                      <asp:Parameter Name="description" Type="String" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="productname" Type="String" />
                            <asp:Parameter Name="productimage" Type="String" />
                            <asp:Parameter Name="price" Type="Int32" />
                          <%--  <asp:Parameter Name="qty" Type="Int32" />--%>
                            <asp:Parameter Name="description" Type="String" />
                            <asp:Parameter Name="original_productid" Type="Int32" />
                            <asp:Parameter Name="original_productname" Type="String" />
                            <asp:Parameter Name="original_productimage" Type="String" />
                            <asp:Parameter Name="original_price" Type="Int32" />
                           <%-- <asp:Parameter Name="original_qty" Type="Int32" />
    --%>                        <asp:Parameter Name="original_description" Type="String" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                </td>
            </tr>
        </table>
</div>
    <div>
    </div>
</asp:Content>
