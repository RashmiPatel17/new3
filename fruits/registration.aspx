<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="registration.aspx.cs" Inherits="fruits.WebForm3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div>
        <style>
   /*body {
        background-color:aquamarine;    
       }*/
          
    .box{
      /*position: absolute;*/
    /*/*top:45%;*/*/
    left:50%;
    /*transform:translate(-50%,-50%);*/

    width:400px;
    height:750px;
    padding: 0px 20px;
    box-sizing:border-box;
    border:1px solid;
    border-color:black;
    font-family:'Gill Sans MT';
    /*background:rgba(0,0,0,0.5)*/
}

/*.h2{
    margin: 0;
    padding: 0 0 0px;
    color :#efed40;
    text-align: center;

}*/
.box p{
    margin: 0;
    padding: 0;
    font-weight: bold;
    color: #000000;
    font-size:18px;
    

}
.box input
{
    margin-bottom:3px;
    color:#ff0000;
}
 
.box input[type="text"],
.box input[type="password"]
{
  margin-top:3px;
  border-bottom: 1px solid #fff;
  background: transparent;
  outline:none;
  color: #000000;
  font-size: 18px;
                border-left-style: none;
                border-left-color: inherit;
                border-left-width: medium;
                border-right-style: none;
                border-right-color: inherit;
                border-right-width: medium;
                border-top-style: none;
                border-top-color: inherit;
                border-top-width: medium;
            }
.placeholder
{
    color: rgba(250,250,250,0.5);
}
.box input[type="submit"],
.box input[type="submit"]
{
            border-style: none;
                border-color:black;
                border-width: medium;
                outline: none;
                color:#663300;
                font-size: 16px;
                background:gray;
                cursor: pointer;
                border-radius:15px;
                width:45%;
                left:10px;

}
.box input[type="submit"]:hover,
.box input[type="subcnc"]:hover
 {
     background:#808080;
     color:darkgray;

 }
.box a{
    color:#000000;
    font-size:14px;
    font-weight:bold;
    text-decoration-color:none;
}
            .auto-style1 {
                width: 244px;
                height: 43px;
            }
            .auto-style2 {
                height: 43px;
            }
            .auto-style3 {
                width: 500px;
            }
        </style>

       <div class="auto-style3"   style="margin-left:400px; margin-bottom:20px; background-color:#f8ac3f;padding: 16px; ">                 
             
           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;                 
             
           <tr>
   
       <td colspan="2" class="auto-style7"><span class="auto-style6" style="font-size: xx-large; font-weight: bold">Registration</span>
           <br /><%--<br />--%>
   </td></tr>

                         
                    <p>First Name:</p>
                    <asp:TextBox ID="first_name" CssClass="well well-sm" Height="40px" Width="465px"  runat="server" BorderWidth="0px" BorderStyle="Groove" BackColor="White"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"  ControlToValidate="first_name" ErrorMessage="please enter name" ForeColor="Red"></asp:RequiredFieldValidator>
                    
                    <p>Last Name:</p>
                    <asp:TextBox ID="last_name" CssClass="well well-sm" Height="40px" Width="465px" runat="server" BorderWidth="0px" BackColor="White" BorderStyle="Groove"></asp:TextBox>
                   <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="enter last name" ForeColor="Red" ControlToValidate="last_name"></asp:RequiredFieldValidator>
            
           <p>E-mail:</p>
                      <asp:TextBox ID="email" Height="40px" Width="465px" CssClass="well well-sm" runat="server" BorderStyle="Groove" BackColor="white" BorderWidth="0px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Required" ControlToValidate="email" ForeColor="Red"></asp:RequiredFieldValidator>
           <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="enter a valid Email id" ControlToValidate="email" ForeColor="Red" BorderStyle="NotSet" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
           
           
           
           
           <p> Address:</p>
                      <asp:TextBox ID="address" Width="465px" CssClass="well well-sm" runat="server" BorderWidth="0px" BackColor="White" BorderStyle="Groove" TextMode="MultiLine"></asp:TextBox>
                               <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Required" ControlToValidate="address" ForeColor="Red"></asp:RequiredFieldValidator>
            
           <p>Contact no:</p>
                      <asp:TextBox ID="contact_no" CssClass="well well-sm" Height="40px" Width="465px" runat="server" BorderWidth="0px" BackColor="White" BorderStyle="Groove" MaxLength="10"></asp:TextBox>
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Required" ForeColor="Red" ControlToValidate="contact_no"></asp:RequiredFieldValidator>
           <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Not valid" Display="Dynamic" ControlToValidate="contact_no" ForeColor="Red" ValidationExpression="^([6-9]{1})([0-9]{9})$"></asp:RegularExpressionValidator>          
           
       
           
           
           
           <p>Username:</p>
                    <asp:TextBox ID="user_name" Height="40px" CssClass="well well-sm" Width="465px" runat="server" BorderWidth="0px" BackColor="White" BorderStyle="Groove" TextMode="SingleLine"></asp:TextBox>
           <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Required" ControlToValidate="user_name" ForeColor="Red"></asp:RequiredFieldValidator>
                     
           
      <%--     <script  type="text/javascript">
               function ValidateAlpha(evt)
               {
                        var keyCode = (evt.which) ? evt.which : evt.keyCode
                        if ((keyCode < 65 || keyCode > 90) && (keyCode < 97 || keyCode > 123) && keyCode != 32 && keyCode != 8 && keyCode!=11)

                            return false;
                        return true;
                    }
                </script>
          --%>



                     <p>Password:</p>
                    <asp:TextBox ID="password" Height="40px" CssClass="well well-sm" Width="465px"  runat="server" BorderWidth="0px" BackColor="White" BorderStyle="Groove" TextMode="Password" ></asp:TextBox>
           
           <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="enter your password" ForeColor="Red" ControlToValidate="password"></asp:RequiredFieldValidator>
           <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="Password must contain: Minimum 8 characters atleast 1 Alphabet and 1 Number" ForeColor="Red" ControlToValidate="password" ValidationExpression="^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$"></asp:RegularExpressionValidator>       
           
           <p>Conform Password:</p>             
                    <asp:TextBox ID="cpassword" Height="40px" Width="465px" CssClass="well well-sm" runat="server" BorderWidth="0px" BackColor="White" BorderStyle="Groove" TextMode="Password">*</asp:TextBox>
           
           <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="Required" ForeColor="Red" ControlToValidate="cpassword"></asp:RequiredFieldValidator>
           <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="password does not match" ForeColor="Red" ControlToValidate="cpassword" ControlToCompare="password" Font-Bold="true" SetFocusOnError="true"></asp:CompareValidator>
           <table style="width: 465px; height: 45px">
                        <tr>
                            <td class="auto-style1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:Button CssClass="btn" ID="Button1" runat="server" Text="SUBMIT" OnClick="Button1_Click" Height="32px" Width="96px"  /></td>
                            <td class="auto-style2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:Button CssClass="btn" ID="Button2" runat="server" Text="CANCEL" OnClick="Button2_Click" Height="32px" Width="96px" /></td>

                        </tr>
                          
                          
      <tr>
    <td colspan="2" style=" color:red"><asp:Label ID="lbltxt" runat="server" style="text-align: center"/></td>
       </tr>    
   

                    </table>
                      
           </div>
        </div>
    

</asp:Content>
