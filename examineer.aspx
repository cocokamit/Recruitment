<%@ Page Language="C#" AutoEventWireup="true" CodeFile="examineer.aspx.cs" Inherits="examineer"  %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>test</title>
    <link href="style/css/login.css" rel="stylesheet" type="text/css" />
       <script>
           function preventBack() {
               window.history.forward();
               window.history.backward();
           }
           setTimeout("preventBack()", 0);
           window.onunload = function () { null };

    </script>
</head>
<body >
    <form id="form1" runat="server">
         <div class="box">
          <%--  <img alt="logo" src="style/img/clog.png" />--%>
            <ul>
                <li>Input Given Password</li>
                <li><asp:TextBox ID="txt_appno" TextMode="Password" runat="server"   required></asp:TextBox></li>
                <li>
                    <asp:Button ID="btn_go" runat="server" Text="login" OnClick="click_login"   />
                    <asp:Label ID="lbl_msg" runat="server" ForeColor="red" Font-Bold="true" Text="" Font-Size="11px"></asp:Label>
                </li>
            </ul>
        </div>
    </form>
</body>
</html>
