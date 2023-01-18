<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewRecommendation.aspx.cs" Inherits="cordinator.ViewRecommendation" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="Label1" runat="server" Text="LID"></asp:Label>
            <br />
            <br />
            <asp:TextBox ID="TextBox1" runat="server" TextMode="Number"></asp:TextBox>
            <br />
            <br />
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="View" />
        </div>
    </form>
</body>
</html>
