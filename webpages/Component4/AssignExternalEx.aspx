<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AssignExternalEx.aspx.cs" Inherits="cordinator.AssignExternalEx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
           <h3>EE id:</h3>
            <input  runat="server" id="Text1" type="text" />
            <h3>Coordinator ID:</h3>
            <input runat="server" id="Text2" type="text" />
            <br />
            <br />
            <h3>ProjectCode:</h3>
            <input runat="server" id="Text3" type="text" />
            <br />
            <br />
                           <asp:Button ID="Assign" runat="server" OnClick="Button1_Click" Text="Assign" style="margin-left: 43px" Width="73px" />
        </div>
    </form>
</body>
</html>
