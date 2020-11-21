<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="userregstatus.aspx.cs" Inherits="fruits.WebForm17" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <center>   <div> 
        <h1 style="font-family:Arial;font-size:25px">Accept Reject User Table</h1>
    <asp:GridView ID="GridView1" runat="server" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4" Width="165px">

            <Columns>
                            <asp:TemplateField HeaderText="Accept">
                                <ItemTemplate>
                                    <a href="?id=<%#Eval("Id") %>">
                                    <input type="button" name="button" value="Accept" class="btn" onclick="return chke();"/></a>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Reject">
                                <ItemTemplate>
                                   <a href="?rid=<%#Eval("Id") %>">
                                   <input type="button" name="button" value="Reject" class="btn" onclick="return chkrej();" /></a>
                                </ItemTemplate>
                            </asp:TemplateField>
                </Columns>
            <FooterStyle BackColor="#FFFFCC" ForeColor="#330099"  />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="#FFFFCC" />
            <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
            <RowStyle BackColor="White" ForeColor="#330099" />
            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
            <SortedAscendingCellStyle BackColor="#FEFCEB" />
            <SortedAscendingHeaderStyle BackColor="#AF0101" />
            <SortedDescendingCellStyle BackColor="#F6F0C0" />
            <SortedDescendingHeaderStyle BackColor="#7E0000" />
        </asp:GridView>
       
    </div>
        </center>
 
<script>
    function chke()
    {
        if (confirm("Are You Sure?"))
            return true;
        else
            return false;
    }
    function chkrej() {
        if (confirm("Are You Sure Reject?"))
            return true;
        else
            return false;
    }
</script>






</asp:Content>
