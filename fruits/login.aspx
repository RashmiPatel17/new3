<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="fruits.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <style>
        .container5
        {
           height:400px;
           width:400px;
           padding:16px;
           background-color:burlywood;
           border:1px solid;
           margin-left:480px;
           font-family:'Gill Sans MT';
           font-size:20px;
           
        }
        


    </style>
    
 <div class="well well-lg"  style="margin-left:464px; margin-bottom:20px; background-color:#f8ac3f; width:400px;padding: 16px; text-align: center;">

      <tr>
   
       <td colspan="2" class="auto-style7"><span class="auto-style6" style="font-size: xx-large; font-weight: bold">Login</span>
           
   </td></tr>  
     <table class="nav-justified">

           


            <tr>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td style="text-align: left">&nbsp;&nbsp;&nbsp;Username :</td>
            </tr>
            <tr>
                <td>
                    <asp:TextBox CssClass="well well-sm" ID="user_name" BackColor="White" Height="40px" Width="360px" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please Enter username" ControlToValidate="user_name" ForeColor="Red" Font-Size="Medium"></asp:RequiredFieldValidator>

                </td>
            </tr>
           <%-- <tr>
                <td>&nbsp;</td>
            </tr>
           --%> <tr>
                <td style="text-align: left">&nbsp;&nbsp;&nbsp;Password:</td>
            </tr>
            <tr>
                <td>
                    <asp:TextBox CssClass="well well-sm" ID="password" BackColor="White" Height="40px" Width="360px" runat="server" TextMode="Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Please Enter password" ControlToValidate="password" ForeColor="Red" Font-Size="Medium"></asp:RequiredFieldValidator>
                    
                </td>
            </tr>
            <%--<tr>
                <td>&nbsp;</td>
            </tr>
            --%><tr>
                <td>
                    <asp:Button CssClass="btn" ID="Button1" runat="server" Text="LOGIN" OnClick="Button1_Click"  />
                    </br>
                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/forgotpassword.aspx">forgot password</asp:HyperLink>
                   </br>
                          <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/registration.aspx" ForeColor="#990000">sign up!!</asp:HyperLink>
                
                       </td>
            </tr>
        </table>

    </div>


</asp:Content>
