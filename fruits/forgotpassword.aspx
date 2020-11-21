<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="forgotpassword.aspx.cs" Inherits="fruits.WebForm5" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

     <style type="text/css">
        .auto-style5 {
            width: 500px;
            text-align: center;
            font-size: large;
            font-weight: bold;
        }
        .auto-style6 {
            font-size: large;
            font-weight: bold;
        }
        .auto-style7 {
            text-align: center;
            width: 507px;
            height: 62px;
        }
         .auto-style8 {
             width: 500px;
             text-align: center;
             font-size: large;
             font-weight: bold;
             height: 43px;
         }
         .auto-style9 {
             width: 500px;
             height: 43px;
         }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

  <div style="margin-left:400px; background-color:#f8ac3f; width: 500px; margin-top:50px;margin-bottom:40px;border:2px none black; font-family:'Gill Sans MT'">
        <table  border="0" style="width: 500px; height: 170px">
<tr>
   
       <td colspan="2" class="auto-style7"><span class="auto-style6">Forgot Password</span>
           <br /><br />
   </td></tr>

       <tr>
       <td class="auto-style8">Enter Your username:</td><td class="auto-style9">
      <asp:TextBox ID="uname" runat="server" /></td></tr>

 

 <tr>
       <td class="auto-style5">Enter Your Email:</td><td style="width: 500px">
      <asp:TextBox ID="email" runat="server" /></td></tr>

   <tr>
       <td style="width: 507px; height: 43px" class="text-center" colspan="2">
        <asp:button ID="btnSubmit" Text="Submit"  runat="server" CssClass="Button" ForeColor="Black" OnClick="btnSubmit_Click" /><%--OnClick="btnSubmit_Click"--%> 
   </td></tr>
   <tr>
    <td colspan="2" style=" color:red"><asp:Label ID="lbltxt" runat="server" style="text-align: center"/></td>
       </tr>    
     </table>
    </div>







</asp:Content>
