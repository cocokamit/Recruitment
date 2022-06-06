<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Recruitment</title>
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <link rel="stylesheet" href="vendors/bootstrap/dist/css/bootstrap.min.css" />
    <link rel="stylesheet" href="vendors/font-awesome/css/font-awesome.min.css" />
    <link rel="stylesheet" href="dist/css/content.css" />
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic"/>
</head>
<body class="hold-transition login-page">
<%--<body class="hold-transition login-page" style="background-image:url('dist/img/CLISwoosh.png');background-repeat:no-repeat;background-attachment:fixed; background-position:center">--%>
    <form id="form1" runat="server">
        <div class="login-box">
          <div class="login-box-body">
            <%--<img src="style/img/myCLIRecruitmentAdminPortalLogin.jpg" class="login-logo" />--%>
            <img src="dist/img/hrislogo.png" class="login-logo" />
              <div class="form-group has-feedback">
                <asp:TextBox ID="txt_user" runat="server" CssClass="form-control" placeholder="Username"></asp:TextBox>
                <span class="glyphicon glyphicon-user form-control-feedback"></span>
              </div>
              <div class="form-group has-feedback">
                <asp:TextBox ID="txt_pass" runat="server" CssClass="form-control" TextMode="Password" placeholder="Password"></asp:TextBox>
                <span class="glyphicon glyphicon-lock form-control-feedback"></span>
              </div>
              <div class="row">
                <div class="col-xs-12">
                 <asp:Button ID="btn_login" runat="server" OnClick="click_go" class="btn btn-primary btn-block btn-flat" Text="Sign In" />
                </div>
                <div class="col-xs-12 text-center">
                 <asp:Label ID="lbl_msg" runat="server" ForeColor="Red" Font-Bold="true"></asp:Label>
                </div>
              </div>
          </div>
        </div>
    </form>
    <script type="text/javascript">
         function preventBack() {
             window.history.forward();
             window.history.backward();
         }
         setTimeout("preventBack()", 0);
         window.onunload = function () { null };
    </script>
</body>
</html>
