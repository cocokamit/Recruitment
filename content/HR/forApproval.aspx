<%@ Page Language="C#" AutoEventWireup="true" CodeFile="forApproval.aspx.cs" Inherits="content_HR_forApproval" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <ul class="ul">
        <li>Job Type </li>
        <li><asp:Label ID="lbl_type" ForeColor="Red" runat="server" Text=""></asp:Label></li>

        <li>Location </li>
        <li><asp:Label ID="lbl_location" ForeColor="Red" runat="server" Text=""></asp:Label></li>

        <li>Job Title <asp:Label ID="lbl_title" ForeColor="Red" runat="server" Text=""></asp:Label></li>
        <li><asp:TextBox ID="txt_subject" runat="server"></asp:TextBox></li>
        <li>Job Details <asp:Label ID="lbl_details" ForeColor="Red" runat="server" Text=""></asp:Label></li>
        <li><asp:TextBox ID="txt_details" runat="server" Height="300px" TextMode="MultiLine" ></asp:TextBox></li>
        <li><hr /></li>
        <li><asp:Button ID="Button2" runat="server" OnClick="update" Text="Approve" CssClass="bttm" /></li>
    </ul>
    </div>
    </form>
</body>
</html>
