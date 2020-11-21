<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="fruitproduct.aspx.cs" Inherits="fruits.WebForm11" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    cc</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="auto-style10">
        <br /><style type="text/css">
        .auto-style1 {
            width: 100%;
            height: 243px;
            background-color:lavenderblush;

        }
        .auto-style2 {
            text-align: center;
            /*background-color: #FFFFCC;*/
        }
        .auto-style4 {
            text-align: center;
            height: 59px;
            /*background-color: #FFFFCC;*/
        }
        .auto-style5 {
            /*background-color: #FFFFCC;*/
        }
        .auto-style6 {
            /*background-color: #75CEF0;*/
        }
        .auto-style7 {
            width: 44%;
            height: 46px;
            margin-bottom: 0px;
        }
        .auto-style8 {
            text-align: left;
            width: 179px;
        }
        .auto-style9 {
            width: 179px;
        }
        .auto-style10 {
            text-align: left;
        }
        </style>

        <br />

<%--        <table class="auto-style7">
            <tr>
                <td class="auto-style8">search data:</td>
                <td>
                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style9">&nbsp;</td>
                <td><asp:Button ID="Button3" runat="server" Text="Search" Height="22px" Width="91px" OnClick="Button3_Click" />
                    
                </td>
            </tr>
        </table>
        <br />
        <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">View all Product</asp:LinkButton>--%>


    <asp:DataList ID="DataList1" runat="server" align="center" DataKeyField="productid" DataSourceID="SqlDataSource1" RepeatColumns="4" RepeatDirection="Horizontal"  CssClass="auto-style5" Width="1110px" OnItemCommand="DataList1_ItemCommand" OnSelectedIndexChanged="DataList1_SelectedIndexChanged">
        <ItemTemplate>
            <div class="col-sm-3">

            <table class="auto-style1" border="3" style="border:4px solid;width:300px">
                
                
              <%-- <tr>
                    <td class="auto-style2">Product ID :<asp:Label ID="Label1" runat="server" Text='<%# Eval("productid") %>'></asp:Label>
                    </td>
                </tr>
              --%>  
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("productname") %>'></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Image ID="Image1" runat="server" Height="200px" ImageUrl='<%# Eval("productimage") %>' Width="200px" />
                    </td>
                </tr>
           <%--    <tr>
                    <td class="auto-style2">
                        <asp:Label ID="Label3" runat="server" Text='<%# Eval("description") %>'></asp:Label>
                    </td>
                </tr>
    --%>
                
               <%-- <tr>
                    <td class="auto-style2">Price/Rs:<asLabel ID="Label4" runat="server" Text='<%# Eval("price") %>'></asLabel>
                    </td>
                </tr>
                <tr>
   --%>                 <td class="auto-style4">
                        <asp:Button ID="Button2" runat="server" Height="44px" Text="Viewdetails" Width="131px" CommandArgument='<%# Eval("productid")%>' CommandName="viewdetails" BackColor="#66CCFF" CssClass="auto-style6" Font-Bold="True"  />
                    </td>
                </tr>
            </table>
                 <br />
            <br />
            </div><br>
        </ItemTemplate>
    </asp:DataList>

   
        <br />
    
   <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:StudentConnectionString %>" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [fruitaddproduct]">
   </asp:SqlDataSource>
        
        <%--<asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:StudentConnectionString %>" SelectCommand="SELECT * FROM [fruitaddproduct] WHERE ([keywordsearch] LIKE '%' + @keywordsearch + '%')">
            <SelectParameters>
                <asp:ControlParameter ControlID="TextBox1" Name="keywordsearch" PropertyName="Text" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>--%>
    </asp:Content>
