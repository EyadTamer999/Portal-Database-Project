<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Cordinator.aspx.cs" Inherits="cordinator.Cordinator" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>
        Cordinator profile
    </title>
    <style>
        body{
            background-image: url('GUCeraBkgFinal.png');
            background-repeat: no-repeat;
            background-size: cover;
            color: white;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0px;
            margin-top: -10px;

        }
        .headerpanel{
            background: rgba(0, 0, 0, 0.3);
            padding:10px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Panel ID="Panel1" class="headerpanel" runat="server" Width="100%" Height="55px">
            <asp:Label runat="server" style="font-size:45px ;font-weight: bold; color:black; opacity: 1; -webkit-text-stroke: 1px white; margin-top:-10px">Home</asp:Label>
                
                <div style="margin-top: -60px; padding-right: 20px">
                    <asp:Button ID="Button2" runat="server" BackColor="Teal" BorderColor="Teal" BorderStyle="Ridge" BorderWidth="4px" Font-Bold="True" Font-Names="Algerian" ForeColor="White" OnClick="Button2_Click" style="float:right; margin-top:20px" Text="Sign Out" />
                    <asp:Label ID="UserLabel" runat="server" style="font-size:30px ;font-weight: bold; color:black; opacity: 1; margin-top:10px; margin-right: 200px; float:right" Text="Teachinng Assistant"></asp:Label>
                </div>
       </asp:Panel>
            <div style="margin:30px; float:left">
        <div>
             
            
            
            <asp:LinkButton ID="LinkButton3" runat="server"  BackColor="Teal" BorderColor="Teal" BorderStyle="Ridge" BorderWidth="4px" style="text-decoration: none; padding:5px; float:left" Font-Names="Cursive" ForeColor="#f0f5f4" OnClick="LinkButton3_Click"><i class="fas fa-eye"></i> Create progress report for a specific student.</asp:LinkButton><br /><br />
            <asp:LinkButton ID="LinkButton4" runat="server"  BackColor="Teal" BorderColor="Teal" BorderStyle="Ridge" BorderWidth="4px" style="text-decoration: none; padding:5px; float:left" Font-Names="Cursive" ForeColor="#f0f5f4" OnClick="LinkButton4_Click"><i class="fas fa-file-signature"></i> Add to the to-do list in meetings. </asp:LinkButton><br /><br />
            
            
        </div>
               
    </form>
</body>
</html>
