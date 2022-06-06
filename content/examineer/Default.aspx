<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="content_examineer_Default" %>
<%@ Import Namespace="System.Data" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Bluewater | Quiz</title>
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <link rel="stylesheet" href="../../vendors/bootstrap/dist/css/bootstrap.min.css" />
    <link rel="stylesheet" href="../../vendors/font-awesome/css/font-awesome.min.css" />
    <link rel="stylesheet" href="../../dist/css/content.css" />
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic"/>
    <style type="text/css">
        body{background: #d2d6de; }
        .login-box, .register-box {margin: 5% auto;}
        .alert {padding:7px 10px; margin:10px 0 0 !important}
        .profile-user-img{width: 200px;}
        .col-md-8 { float:none; margin: 0 auto}
    </style>
</head>
<body>
    <form id="form1" runat="server">
        
        <p id="demo"></p>
       

        <div class="login-box">
          <div class="login-box-body">
            <asp:Panel ID="p_verify" runat="server">
                  <img src="style/img/clogo.png" class="login-logo no-margin" /><hr />
                <div class="input-group" style=" margin:10px 0 5px">
                    <asp:TextBox ID="tb_code" runat="server" CssClass="form-control" placeholder="Code" autocomplete="off" required></asp:TextBox>
                    <span class="input-group-btn">
                        <asp:Button ID="btn_submit" runat="server" CssClass="btn btn-primary btn-flat" Text="Submit" OnClick="click_submit" />
                    </span>
                </div>
                <div id="alert" runat="server" visible="false" class="alert alert-danger alert-dismissible no-margin">
                    <i class="icon fa fa-info-circle"></i>Invalid code
                </div>
            </asp:Panel>
            <asp:Panel ID="p_profile" runat="server" Visible="false">
                <% DataTable dt = (DataTable)ViewState["data"]; %>
                <img class="profile-user-img img-responsive img-circle" src="UploadImages/prof_id_1142/1142.png" alt="User profile picture">
                <div class="box-body box-profile">
                  <h3 class="profile-username text-center"><%= dt.Rows[0]["name"] %></h3>
                  <p class="text-muted text-center">(<%= dt.Rows[0]["job_subject"] %>)</p>
                  <ul class="list-group list-group-unbordered">
                    <li class="list-group-item" style="border-top:2px solid #000">
                      <b>Birthday <a class="pull-right"><%= parsebirthdate(dt.Rows[0]["dateofbirth"].ToString()) %></a></b>
                    </li>
                    <li class="list-group-item" >
                      <b>E-mail <a class="pull-right"><%= dt.Rows[0]["email"] %></a></b>
                    </li>
                    <li class="list-group-item">
                      <b>Mobile No. <a class="pull-right"><%= dt.Rows[0]["cell_no"] %></a></b>
                    </li>
                    
                    <li class="list-group-item" >
                      <b>Gender <a class="pull-right"><%= dt.Rows[0]["gender"] %></a></b>
                    </li>
                  </ul>
                  <a href="#" class="btn btn-primary btn-block"><b>Start</b></a>
                </div>
            </asp:Panel>
           
          </div>
        </div>

         <asp:Panel ID="p_quiz" runat="server">
             <div class="row">
                <div class="col-md-8">
                  <div class="box box-widget">
                    <div class="col-md-12 text-center hide">
                        <div class="box-header with-border">
                            <img src="style/img/clogo.png" class="no-margin" style="padding-top:30px" />
                        </div>
                    </div>
                    <div class="box-header with-border">
                      <div class="user-block">
                        <img class="img-circle" src="UploadImages/prof_id_1141/1141.png" alt="User Image">
                        <span class="username"><a href="#">Riizul Amoroto</a></span>
                        <span class="description">Web Developer</span>
                      </div>
                      <!-- /.user-block -->
                      <div class="box-tools">
                        <span class="username"><a href="#" style="font-size:35px; font-weight:bold">58 : 45 : 12</a></span>
                      </div>
                    </div>
                    <!-- /.box-header -->
                    <div class="box-body">
                      <img class="img-responsive pad" src="../dist/img/photo2.png" alt="Photo">

                      <p>I took this photo this morning. What do you guys think?</p>
                      <button type="button" class="btn btn-default btn-xs"><i class="fa fa-share"></i> Share</button>
                      <button type="button" class="btn btn-default btn-xs"><i class="fa fa-thumbs-o-up"></i> Like</button>
                      <span class="pull-right text-muted">127 likes - 3 comments</span>
                    </div>
                    <!-- /.box-body -->
                    <div class="box-footer box-comments">
                      <div class="box-comment">
                        <!-- User image -->
                        <img class="img-circle img-sm" src="../dist/img/user3-128x128.jpg" alt="User Image">

                        <div class="comment-text">
                              <span class="username">
                                Maria Gonzales
                                <span class="text-muted pull-right">8:03 PM Today</span>
                              </span><!-- /.username -->
                          It is a long established fact that a reader will be distracted
                          by the readable content of a page when looking at its layout.
                        </div>
                        <!-- /.comment-text -->
                      </div>
                      <!-- /.box-comment -->
                      <div class="box-comment">
                        <!-- User image -->
                        <img class="img-circle img-sm" src="../dist/img/user4-128x128.jpg" alt="User Image">

                        <div class="comment-text">
                              <span class="username">
                                Luna Stark
                                <span class="text-muted pull-right">8:03 PM Today</span>
                              </span><!-- /.username -->
                          It is a long established fact that a reader will be distracted
                          by the readable content of a page when looking at its layout.
                        </div>
                        <!-- /.comment-text -->
                      </div>
                      <!-- /.box-comment -->
                    </div>
                    <!-- /.box-footer -->
                    <div class="box-footer">
                      <form action="#" method="post">
                        <img class="img-responsive img-circle img-sm" src="../dist/img/user4-128x128.jpg" alt="Alt Text">
                        <!-- .img-push is used to add margin to elements next to floating images -->
                        <div class="img-push">
                          <input type="text" class="form-control input-sm" placeholder="Press enter to post comment">
                        </div>
                      </form>
                    </div>
                    <!-- /.box-footer -->
                  </div>
                  <!-- /.box -->
                </div>
             </div>
                
            </asp:Panel>
    </form>
    
 
    <script type="text/javascript">
        // Set the date we're counting down to
        var countDownDate = new Date("Jan 5, 2019 15:37:25").getTime();

        // Update the count down every 1 second
        var x = setInterval(function () {

            // Get todays date and time
            var now = new Date().getTime();

            // Find the distance between now and the count down date
            var distance = countDownDate - now;

            // Time calculations for days, hours, minutes and seconds
            var days = Math.floor(distance / (1000 * 60 * 60 * 24));
            var hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
            var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
            var seconds = Math.floor((distance % (1000 * 60)) / 1000);

            // Output the result in an element with id="demo"
            document.getElementById("demo").innerHTML = days + "d " + hours + "h "
    + minutes + "m " + seconds + "s ";

            // If the count down is over, write some text 
            if (distance < 0) {
                clearInterval(x);
                document.getElementById("demo").innerHTML = "EXPIRED";
            }
        }, 1000);
    </script>
</body>
</html>
