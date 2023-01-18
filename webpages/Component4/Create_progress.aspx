<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Create progress.aspx.cs" Inherits="cordinator.Create_progress" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
             <div class="field padding-bottom--24">
             TA ID<br />
            <asp:TextBox ID="TAID" runat="server" TextMode="Number" BorderStyle="Ridge" BorderWidth="4px" required="required"></asp:TextBox>
            <br />
            SID<br />
            <asp:TextBox ID="sid" runat="server" TextMode="Number" BorderStyle="Ridge" BorderWidth="4px" required="required"></asp:TextBox>
            <br />
            Date<br/>           
            <asp:TextBox ID="date"  TextMode="Date" runat="server"  BorderStyle="Ridge" BorderWidth="4px" required="required"></asp:TextBox>
        <br/>
            Content<br />
            <asp:TextBox ID="con" MaxLength="1000" runat="server"  BorderStyle="Ridge" BorderWidth="4px" required="required"></asp:TextBox>
            <br />
           
                 </div>
        </div>
         <div class="field padding-bottom--24">
        <asp:Button ID="Create" runat="server"  Text="Create" OnClick="Button_Click" Height="26px" />
             </div>
    </form>
</body>
</html>
