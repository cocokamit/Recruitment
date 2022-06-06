<%@ Page Language="C#" AutoEventWireup="true" CodeFile="error.aspx.cs" Inherits="error" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Bluewater</title>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <link href="style/css/recruitment.css" rel="Stylesheet" type="text/css" />
    <style type="text/css">
        .error { text-align:center; margin: 200px auto; }
        .button {background-color: #4CAF50; /* Green */border: none;color: white;padding: 15px 32px;text-align: center;text-decoration: none;display: inline-block;font-size: 16px;margin: 4px 2px;cursor: pointer;}
    </style>
   <script type="text/javascript" language="javascript">
       function disableBackButton() {
           window.history.forward()
       }
       disableBackButton();
       window.onload = disableBackButton();
       window.onpageshow = function (evt) { if (evt.persisted) disableBackButton() }
       window.onunload = function () { void (0) } 
</script>
</head>
<body onload="noBack();" onpageshow="if (event.persisted) noBack();" onunload="">
    <form id="form1" runat="server">
    <div class="error">
        <img src="style/img/icon/i-Info.png" alt="Alternate Text" />
        <h1><asp:Label ID="l_msg" runat="server" ForeColor="Maroon"></asp:Label></h1>
        <h4><asp:Label ID="l_sub" runat="server" ForeColor="Black"></asp:Label></h4>
        <br />
        <a href="recruitment" class="button">Try Again</a>
    </div>
    </form>
</body>
</html>
