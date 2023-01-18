<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ScheduleDefence.aspx.cs" Inherits="cordinator.ScheduleDefence" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>

            <h3>student id:</h3>
            <input  runat="server" id="SID" type="text" />
            <h3>Date :</h3>
            <input runat="server" id="DATE" type="text" />
           
            <h3>Location :</h3>
            <input runat="server" id="LOCATION" type="text" />
            <h3>Time :</h3>
            <input runat="server" id="TIME" type="text" />
            <br />
            <br />
                           <asp:Button ID="Grade" runat="server" OnClick="Button1_Click" Text="Grade" />

        </div>
    </form>
</body>
</html>
