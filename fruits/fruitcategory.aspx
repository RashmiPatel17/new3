<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="fruitcategory.aspx.cs" Inherits="fruits.WebForm9" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <div><table>

        <tr>
            <td>
                Add category 
            </td>
            <td>
                <asp:TextBox ID="t1" runat="server" ></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="width:50%" align:"left"> 
                <asp:Button  ID="btn" runat="server"  Text="Button"  />
            </td>
        </tr>
         </table>

    </div>

</asp:Content>
