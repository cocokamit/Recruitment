<%@ Page Language="C#" AutoEventWireup="true" CodeFile="IEvaluationForm.aspx.cs"
    Inherits="form1_IEvaluationForm" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
        name="viewport" />
    <link href="../vendors/select2/dist/css/select2.css" rel="stylesheet" type="text/css" />
    <!-- Bootstrap 3.3.7 -->
    <link rel="stylesheet" href="../vendors/bootstrap/dist/css/bootstrap.min.css">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="../vendors/font-awesome/css/font-awesome.min.css">
    <!-- daterange picker -->
    <!-- Ionicons -->
    <link rel="stylesheet" href="../vendors/Ionicons/css/ionicons.min.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="../dist/css/AdminLTE.min.css">
    <!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
    <link rel="stylesheet" href="../dist/css/skins/_all-skins.min.css">
    <!-- Google Font -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
    <title>Interview Evaluation Form</title>
    <style>
        .lister
        {
            padding: 10px 15px;
            margin-bottom: -1px;
            border: 1px solid #ddd;
            background-color: #fff;
        }
        
        textarea
        {
            resize: none;
            overflow: hidden;
            min-height: 50px;
            max-height: 100px;
        }
        
        .dnone
        {
            display: none;
        }
    </style>
    <script src="vendors/jquery/dist/jquery.min.js"></script>
    <script type="text/javascript">
        function MyFunction(users, pass) {
            console.log(users);
            var appIDD=<%=this.appid %>;
            $.ajax({
                type: "POST",
                url: "form1/IEvaluationForm.aspx/loginer",
                data: JSON.stringify({ username: users, password: pass,appIDD:appIDD }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    var result = data.d.split("*")[0].split("~");

                    if (result[0] != "" && result[1] != "") {
                        console.log("asd");
                        $("[id$=div1]").attr("style", "display:none;");
                        $("[id$=deelr]").attr("style", "display:block;");
                        $("[id$=dlem]").attr("style", "display:none;");
                        $("[id$=dlef]").attr("style", "display:block;");
                        $("[id$=dlep]").attr("style", "display:none;");
                        $("[id$=dleo]").attr("style", "display:block;");
                        $("[id$=divCLIcon]").attr("style", "display:none;");
                        $("[id$=divCLIconf]").attr("style", "display:block;");
                        $("[id$=hdepod]").val(result[2]);
                        $("[id$=itvb]").val(result[0]);
                        $("[id$=postitionb]").val(result[1]);
                        $("[id$=Text3]").val(result[0]);
                        $("[id$=loginer]").attr("style", "display:none;");
                        $("[id$=Button2]").attr("style", "margin-top:10px; display:block;");

                         var result2 =data.d.split("*")[1].split("&");
                         if(result2[0]!="")
                         {
                            if(result2.includes("1"))
                            {
                                $("[id$=IEF]").attr("style","display:block");
                            }
                            if(result2.includes("2"))
                            {
                                $("[id$=REF]").attr("style","display:block");
                            }
                            if(result2.includes("3"))
                            {
                                $("[id$=CLI]").attr("style","display:block");
                            }
                            if(result2.includes("4"))
                            {
                                $("[id$=OVER]").attr("style","display:block");
                            }
                         }
                    }
                },
                error: function (xhr, status, error) {
                    alert(xhr.responseText);
                }
            });


        }

        function loginers() {
            var users = $("[id$=txt_user]").val();
            var pass = $("[id$=txt_pass]").val();
            var appIDD=<%=this.appid %>;
            console.log(users);
            $.ajax({
                type: "POST",
                url: "form1/IEvaluationForm.aspx/loginer",
                data: JSON.stringify({ username: users, password: pass,appIDD:appIDD }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    var result = data.d.split("*")[0].split("~");

                        console.log(result[0]);
                    console.log(result[1]);
                    if (result[0] != "" && result[1] != "") {
                        console.log("asd");
                        $("[id$=div1]").attr("style", "display:none;");
                        $("[id$=deelr]").attr("style", "display:block;");
                        $("[id$=dlem]").attr("style", "display:none;");
                        $("[id$=dlef]").attr("style", "display:block;");
                        $("[id$=dlep]").attr("style", "display:none;");
                        $("[id$=dleo]").attr("style", "display:block;");
                        $("[id$=divCLIcon]").attr("style", "display:none;");
                        $("[id$=divCLIconf]").attr("style", "display:block;");
                        $("[id$=hdepod]").val(result[2]);
                        $("[id$=itvb]").val(result[0]);
                        $("[id$=postitionb]").val(result[1]);

                        $("[id$=Text3]").val(result[0]);
                        $("[id$=conEmpname]").val(result[0]);
                        $("[id$=conDept]").val(result[3]);
                        $("[id$=Button1]").click();
                        $("[id$=loginer]").attr("style", "display:none;");
                        $("[id$=Button2]").attr("style", "margin-top:10px; display:block;");

                         var result2 =data.d.split("*")[1].split("&");
                         
                            console.log(result2+"aaaaa");
                            
                         if(result2[0]!="")
                         {
                            if(result2.includes("4"))
                            {
                                console.log("bbbb");
                                $("[id$=Overkuyaw]").attr("style","display:block");
                            }

                            if(result2.includes("1"))
                            {
                                $("[id$=IEF]").attr("style","display:block");
                            }
                            if(result2.includes("2"))
                            {
                                $("[id$=REF]").attr("style","display:block");
                            }
                            if(result2.includes("3"))
                            {
                                $("[id$=CLI]").attr("style","display:block");
                            }

                          
                         }
                    }

                },
                error: function (xhr, status, error) {
                    alert(xhr.responseText);
                }
            });


        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <header class="main-header">

    <nav class="navbar navbar-static-top" style=" margin-left:0px;">
      <div class="container">
        <div class="navbar-header">  <img class="mns" src="dist/img/myCLIRecruitmentAdminPortal.png" alt="CLI" style="width:130px; height:55px; margin-top:-1px"/>
          
        </div>
        
    <asp:TextBox ID="TextBox1" runat="server" Visible="false"></asp:TextBox>
        <!-- Collect the nav links, forms, and other content for toggling -->
    <%--    <div class="collapse navbar-collapse pull-left" id="navbar-collapse">
          <ul class="nav navbar-nav">
            <li><a href="#">Link</a></li>
           
          </ul>
        </div>--%>
        <!-- /.navbar-collapse -->
        <!-- Navbar Right Menu -->
        <div class="navbar-custom-menu">
          <ul class="nav navbar-nav">
           
            <!-- User Account Menu -->
            <li >
                <input type="button" value="Login" id="loginer"  class="btn btn-default" style="margin-top:10px; border-radius:30%;" data-toggle="modal" data-target="#Div2"/>
                 <asp:Button ID="Button2" runat="server" ClientIDMode="Static" CausesValidation="false" UseSubmitBehavior="false"   OnClick="logouter" style="margin-top:20px; display:none;"  class="btn btn-danger" Text="Logout" />
            </li>
          </ul>
        </div>
        <!-- /.navbar-custom-menu -->
      </div>
      <!-- /.container-fluid -->
    </nav>
  </header>
    <section class="content-header">
      <h1>Applicant's Info
      </h1><label>#</label><label id="lbid"><%= appid %></label>
    </section>
    <div>
        <!-- Main content -->
        <section class="content">

      <div class="row">
        <div class="col-md-3">

          <!-- Profile Image -->
          <div class="box box-primary">
            <div class="box-body box-profile">
              <img class="profile-user-img img-responsive img-circle" src="<%= ViewState["profile"] %>" alt="User profile picture"/>

              <h3 class="profile-username text-center"><%= ViewState["applicant"]%></h3>

              <p class="text-muted text-center"><%= ViewState["position"]%></p>

              <ul class="list-group list-group-unbordered">
                <li class="list-group-item">
                  <b>Gender</b> <a class="pull-right"><%= ViewState["gender"] %></a>
                </li>
                <li class="list-group-item">
                  <b>Contact No.</b> <a class="pull-right"><%= ViewState["contact"]%></a>
                </li>
                <li class="list-group-item">
                  <b>Email</b> <a class="pull-right"><%= ViewState["email"]%></a>
                </li>
                <li class="list-group-item"> <table class="table no-margin">
            <tr>
                <td>Application</td>
                <td style="width: 40px"><asp:Label ID="l_app" runat="server" CssClass="badge bg-green pull-right"></asp:Label></td>
            </tr>
            <% 
                System.Data.DataTable dt = (System.Data.DataTable)ViewState["act_log"];
                if (dt != null)
                {
                    foreach (System.Data.DataRow row in dt.Rows)
                    {
                        string badge = null;
                        switch (row["action"].ToString())
                        {
                            case "Acknowledgment":
                                badge = "primary";
                                break;
                            case "Interview":
                                badge = "orange";
                                break;
                            case "Examination":
                                badge = "warning";
                                break;
                            case "Final interview":
                                badge = "danger";
                                break;
                        }
            %>
                <tr>
                    <td><%= row["action"]%></td>
                    <td><span class="badge label-<%= badge %> pull-right"><%= DateTime.Parse(row["date"].ToString()).ToString("MMMM dd, yyyy")%></span></td>
                </tr>
            <%
}
                }
            %>
            </table>
                </li>
              </ul>
<%--
              <a href="#" class="btn btn-primary btn-block"><b>Follow</b></a>--%>
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->

          <!-- About Me Box -->
          <div class="box box-primary">
            <div class="box-header with-border">
              <h3 class="box-title">About Me</h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
             <strong><i class="fa fa-map-marker margin-r-5"></i> Address</strong>

              <p class="text-muted"><%= ViewState["address"]%></p>

              <hr/>

              <strong><i class="fa fa-book margin-r-5"></i> Education Attainment</strong>

              <p class="text-muted">
                <%= ViewState["school"]%>
              </p>
               <hr/>

              <strong><i class="fa fa-file-text-o margin-r-5"></i> Degree</strong>

              <p><%=ViewState["degree"] %></p>
              <hr/>

              <strong><i class="fa fa-pencil margin-r-5"></i> Skills</strong>

           <%--   <p><% var d = ViewState["skills"].ToString().Split(',');
                    string[] dd = { "danger", "success", "info", "warning", "primary" };
                    int counter = 0;
                    for (int i = 0; i < d.Length; i++)
                    {
                        if (counter > 5)
                        {
                            counter = 0;
                        }
                        
                     %>
                <span class="label label-<%=dd[counter] %>"><%=d[i]%></span>
                
              <%    counter += 1;

                    } %>
              </p>--%>
             
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
        </div>
        <!-- /.col -->
        <div class="col-md-9">
          <div class="nav-tabs-custom">
            <ul class="nav nav-tabs " id="myTab" >
              <li class="active"><a data-target="#activity" data-toggle="tab">Attachments</a></li>
              <li><a data-target="#personalinfo" data-toggle="tab">Personal Information</a></li>
              <li><a data-target="#timeline" data-toggle="tab" id="IEF" style="display:none;">Interview Evaluation Form</a></li>
              <li><a data-target="#reference" data-toggle="tab" id="REF" style="display:none;" >Reference Check</a></li>
              <li><a data-target="#connection" data-toggle="tab" id="CLI" style="display:none;">CLI Connections</a></li>
              <li><a data-target="#settings" data-toggle="tab" id="Overkuyaw" style="display:none;">Overview</a></li>
            </ul>
            <div class="tab-content">
            

                   <div class="active tab-pane" id="activity">
                  <%-- %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%--%>

                  <div class="row">
                    <div class="col-md-4">
                      <div class="info-box" data-toggle="modal" data-target="#modalForm2">
                        <span class="info-box-icon bg-blue-sky" style="padding-top:20px;"><i class="fa fa-paperclip"></i></span>
                        <div class="info-box-content">
                          <span class="info-box-text">ADD ATTACHMENTS</span>
                      </div>
                        </div>
                    </div>
                    <div class="col-md-2">
                    
                    </div>
                    <div class="col-md-6">
                        <%if (ViewState["missingreq"].ToString() != "")
                          { %>
                        <div style="color:red;">
                            <div runat="server" id="divreqs"><h5>* Missing Required Documents </h5>
                               <div>
                                   <ul>
                                      <% 
                                             string[] d = ViewState["missingreq"].ToString().Split(',');
                                             foreach (string ds in d)
                                             {%>
                                            <li><%=ds%></li>
                                             <%}
                                          %>
                                   </ul>
                               </div>
                               </div>
                        </div>
                        <%}
                          else
                          {%>
                               <div>
                                    <label class="label label-success"><i class="fa fa-check-circle"></i>&nbsp; Requirements Completed</label>
                               
                               </div>

                          <%} %>
                    </div>
                   </div>
                   <hr />

                   <div class="row">
                    <div class="col-md-12">
                      <asp:GridView ID="grid_req" runat="server" AutoGenerateColumns="false" CssClass="table table-striped table-bordered">
                        <Columns>
                            <asp:BoundField DataField="filename" HeaderText="File Name" />
                            <asp:TemplateField HeaderText="Action">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lnk_download" runat="server" CommandName='<%# Eval("id") %>'
                                        Text="download" OnClick="download"><i class="fa fa-download"></i></asp:LinkButton>
                                    <%--<asp:LinkButton ID="lnk_can" runat="server" OnClientClick="return confirm('Are you sure you want to remove this file?')" OnClick="candetails"
                                        CommandName='<%# Eval("id") %>' Text="cancel"><i class="fa fa-trash"></i></asp:LinkButton>--%>
                                </ItemTemplate>
                                <ItemStyle Width="100px" />
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                    
                <div id="div_msg" runat="server" class="alert alert-empty">
                    <i class="fa fa-info-circle"></i><span>No record found</span>
                </div>
                    </div>
                   </div>

                   
        <div class="modal fade" id="modalForm2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
            aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content x_panel" >
                    <div class="modal-header text-center">
                        <button type="button" id="btnClose2" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                        <h3>Add attachments</h3>
                    </div>
                    <div class="modal-body">
                    <div class="row">
                        <div class="col-md-12" style="padding-left:30px; padding-right:30px;">
                           <div class="row">
                            <div class="col-md-12" ><asp:FileUpload ID="FileUpload1" ClientIDMode="Static" multiple="multiple" runat="server" /></div>
                            </div>
                            <div class="row" style="margin-top:10px;">
                                <div class="col-md-12" >
                                    <asp:DropDownList runat="server" ID="ddl_attachclass" ClientIDMode="Static" CssClass="form-control select2" style="width:50%;">
                                        <asp:ListItem Value="">--SELECT DOCUMENT TYPE--</asp:ListItem>
                                        <asp:ListItem Value="NBI Clearance (Latest)">NBI Clearance (Latest)</asp:ListItem>
                                        <asp:ListItem Value="NSO Birth Certificate">NSO Birth Certificate</asp:ListItem>
                                        <asp:ListItem Value="Certificate of Employment">Certificate of Employment</asp:ListItem>
                                        <asp:ListItem Value="Transcript of Records">Transcript of Records</asp:ListItem>
                                        <asp:ListItem Value="Diploma">Diploma</asp:ListItem>
                                        <asp:ListItem Value="House Sketch">House Sketch (Use Google Map)</asp:ListItem>
                                        <asp:ListItem Value="Medical Results">Medical Results</asp:ListItem>
                                    </asp:DropDownList>
                                    
                                </div>
                            </div>
                            <asp:Label ID="lb_error" style="display:none;" runat="server" ForeColor="Red">*Please Select Document Type.</asp:Label>
                        </div>
                    </div>
                    </div>
                    <div class="modal-footer">
                      <div class="row">
                                <div class="col-md-12">
                                                <asp:LinkButton CssClass="btn btn-success pull-right" ID="btnsubmit" runat="server" Text="SAVE" ClientIDMode="Static" OnClientClick="if(!checkempty()) return false;" OnClick="saveattach"></asp:LinkButton>
                                </div>
                            </div>
                    </div>
                </div>
            </div>
        </div>
                  <%-- %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%--%>
              </div>

                  <div class="tab-pane" id="personalinfo">
                  <h4 class="page-header">Personal Information</h4>
                            <div class="row">
								 <div class="col-lg-4">
                                    <div class="form-group">
                                        <label>Last Name</label>
                                        <span class="text-red">*</span>
                                        <asp:TextBox ID="txt_lname" AutoComplete="off" runat="server" ClientIDMode="Static"  CssClass="form-control"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-lg-4">
                                    <div class="form-group">
                                        <label>First Name</label>
                                        <span class="text-red">*</span>
                                        <asp:TextBox ID="txt_fname" AutoComplete="off" runat="server" ClientIDMode="Static" CssClass="form-control" ></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-lg-4">
                                    <div class="form-group">
                                    <label>Middle Name</label>
                                    <asp:TextBox ID="txt_mname" AutoComplete="off" runat="server" ClientIDMode="Static"  CssClass="form-control"></asp:TextBox>
                                    </div>
                                </div>
                                
                            </div>
                            <div class="row">
                                <div class="col-lg-2">
                                    <div class="form-group">
                                        <label>Gender</label>
                                        <asp:dropdownlist ID="ddl_sex" AutoComplete="off" runat="server" CssClass="form-control">
                                            <asp:ListItem Value="Male">Male</asp:ListItem>
                                            <asp:ListItem Value="Female">Female</asp:ListItem>
                                        </asp:dropdownlist>
                                    </div>
                                </div>
                                <div class="col-lg-2">
                                    <div class="form-group">
                                        <label>Date of Birth <span class="text-red">*</span></label>
                                        <asp:TextBox ID="txt_dob" TextMode="Date"  runat="server" CssClass="form-control datee"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="form-group">
                                        <label>Place of Birth</label>
                                        <asp:TextBox ID="txt_pob" AutoComplete="off" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-lg-2">
                                     <div class="form-group">
                                    <label>Birth Zip Code</label>
                                    <asp:dropdownlist ID="ddl_bzc" AutoComplete="off" runat="server"  CssClass="form-control select2" style="width:100%;"></asp:dropdownlist>
                                    </div>
                                </div>
                                </div>
                                <div class="row">
                                 <div class="col-lg-12">
                                     <div class="form-group">
                                    <label>Permanent Address</label>
                                    <asp:TextBox ID="txt_permanentadress" AutoComplete="off"   runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-lg-9">
                                    <div class="form-group">
                                        <label>Present Address</label>
                                        <asp:TextBox ID="txt_presentaddres" AutoComplete="off" runat="server" CssClass="form-control"></asp:TextBox>
                                     </div>
                                </div>
                                <div class="col-lg-3">
                                    <div class="form-group">
                                        <label>Zip Code</label>
                                        <asp:dropdownlist ID="ddl_zipcode" AutoComplete="off" runat="server" CssClass="form-control select2" style="width:100%;"></asp:dropdownlist>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                               <div class="col-lg-4">
                                    <div class="form-group">
                                    <label>Cellphone Number</label>
                                    <asp:TextBox ID="txt_cnumber" AutoComplete="off" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-lg-4">
                                    <div class="form-group">
                                        <label>Phone Number</label>
                                        <asp:TextBox ID="txt_pnumber" AutoComplete="off" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                </div>
                               <div class="col-lg-4">
                                    <div class="form-group">
                                        <label>Email Address</label>
                                        <asp:TextBox ID="txt_email" AutoComplete="off" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                   
                                </div>
                                <div class="col-lg-4">
                                    <div class="form-group">
                                        <label>Civil Status</label>
                                        <asp:dropdownlist ID="ddl_cs" AutoComplete="off" runat="server" CssClass="form-control select2" style="width:100%;">
                                        </asp:dropdownlist>
                                    </div>
                                </div>
                                <div class="col-lg-4">
                                    <div class="form-group">
                                        <label>Citizenship</label>
                                        <asp:dropdownlist ID="ddl_citizenship" AutoComplete="off" runat="server" CssClass="form-control select2" style="width:100%;"></asp:dropdownlist>
                                    </div>
                                </div>
                                <div class="col-lg-4">
                                    <div class="form-group">
                                        <label>Religion</label>
                                        <asp:dropdownlist ID="ddl_relegion" AutoComplete="off" runat="server" CssClass="form-control select2" style="width:100%;"></asp:dropdownlist>
                                    </div>
                                </div>
                                <div class="col-lg-3">
                                    <div class="form-group">
                                        <label>Height</label>
                                        <asp:TextBox ID="txt_height" AutoComplete="off" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-lg-3">
                                    <div class="form-group">
                                        <label>Weight</label>
                                        <asp:TextBox ID="txt_weight" AutoComplete="off" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-lg-3">
                                    <div class="form-group">
                                        <label>Blood Type</label>
                                        <asp:dropdownlist ID="ddl_bloodtype" AutoComplete="off" runat="server" CssClass="form-control select2" style="width:100%;"></asp:dropdownlist>
                                    </div>
                                </div>
                                <div class="col-lg-3">
                                    <div class="form-group">
                                        <label>Health Card Expiration</label>
                                        <asp:TextBox ID="txt_health" TextMode="Date" AutoComplete="off" runat="server" CssClass="form-control datee"></asp:TextBox>
                                    </div>
                                </div>

                                
                                <div class="col-lg-4">
                                 <div class="form-group">
                                        <label>SSS </label>
                                        <asp:TextBox ID="txt_sssno" AutoComplete="off" runat="server" CssClass="form-control" ></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-lg-4">
                                    <div class="form-group">
                                        <label>HDMF </label>
                                        <asp:TextBox ID="txt_hdmfno" AutoComplete="off" runat="server" CssClass="form-control" ></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-lg-4">
                                    <div class="form-group">
                                        <label>PHIC </label>
                                        <asp:TextBox ID="txt_phicno" AutoComplete="off" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-lg-4">
                                    <div class="form-group">
                                        <label>TIN </label>
                                        <asp:TextBox ID="txt_tin" AutoComplete="off" runat="server" CssClass="form-control"  oncopy="return false;" onpaste="return false;" oncut="return false;"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-lg-4">
                                    <div class="form-group">
                                        <label>GSIS </label>
                                        <asp:TextBox ID="txt_gsisno" AutoComplete="off" runat="server" CssClass="form-control" ></asp:TextBox>
                                    </div>   
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                     <button type="button" onclick="saveupdate();" class="btn btn-success pull-right"> UPDATE</button>    
                                </div>
                            </div>
                            <hr />
                            <h4 class="page-header">Educational Attainment</h4>
                            <asp:GridView ID="grid_educhistory1" runat="server"  AutoGenerateColumns="False"  CssClass="table table-striped table-bordered">
                                <Columns>
                                    <asp:BoundField DataField="id" ItemStyle-CssClass="dnone" HeaderStyle-CssClass="dnone" />
                                    <asp:BoundField DataField="level" HeaderText="Level"  />
                                    <asp:BoundField DataField="school" HeaderText="School"  />
                                    <asp:BoundField DataField="address" HeaderText="Address"  />
                                    <asp:BoundField DataField="yearf" HeaderText="From"  />
                                    <asp:BoundField DataField="yeart" HeaderText="To"  />
                                    <asp:TemplateField ShowHeader="False">
                                        <ItemTemplate>
                                            <a onclick='Remove(this);' title='Delete' id='<%# Eval("Id") %>' href='javascript:void(0)'><i class='fa fa-trash'></i></a>
                                          <%-- <asp:LinkButton ID="cancel" runat="server" CommandName='<%# Eval("Id") %>' ToolTip="Delete" OnClick="delete_edhistory" OnClientClick="Confirm()"><i class="fa fa-trash"></i></asp:LinkButton>--%>
                                        </ItemTemplate>
                                        <ItemStyle Width="80px" />
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                            <button type="button" class="btn btn-default" data-toggle="modal" data-target="#modal-attainment">Add</button>

                            <h4 class="page-header">Job History</h4>
                            <asp:GridView ID="grid_jobhistory1" runat="server"   AutoGenerateColumns="False"  CssClass="table table-striped table-bordered">
                                <Columns>
                                    <%--<asp:TemplateField ItemStyle-Width="15px"> 
                                        <ItemTemplate>
                                            <%# Container.DataItemIndex + 1%>.
                                        </ItemTemplate>
                                    </asp:TemplateField>--%>
                                    <asp:BoundField DataField="id" ItemStyle-CssClass="dnone" HeaderStyle-CssClass="dnone" />
                                    <asp:BoundField DataField="position" HeaderText="Position"  />
                                    <asp:BoundField DataField="company" HeaderText="Company"  />
                                    <asp:BoundField DataField="froms" HeaderText="Date From"  />
                                    <asp:BoundField DataField="tos" HeaderText="Date To"  />
                                    <asp:TemplateField ShowHeader="False">
                                        <ItemTemplate>
                                           <a onclick='Remove2(this);' title='Delete' id='<%# Eval("id") %>' href='javascript:void(0)'><i class='fa fa-trash'></i></a>
                                           <%-- <asp:LinkButton ID="lbeditor" runat="server" CommandName='<%# Eval("id") %>' Text="Remove" ToolTip="Edit" OnClick="openjobhist" style=" margin:3px;" ><i class="fa fa-pencil"></i></asp:LinkButton>--%>
                                           <%-- <asp:LinkButton ID="cancel" runat="server" CommandName='<%# Eval("Id") %>' ToolTip="Delete" OnClientClick="Confirm()" OnClick="delete_jobhistory"><i class="fa fa-trash"></i></asp:LinkButton>--%>
                                        </ItemTemplate>
                                        <ItemStyle Width="80px" />
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                            <button type="button" class="btn btn-default readupdate" data-toggle="modal" data-target="#modal-jobhistory">Add</button>
                            <h4 class="page-header">Seminars Attended</h4>
                            <asp:GridView ID="grid_seminarsattended1" runat="server"  OnRowDataBound="saDatabound" AutoGenerateColumns="False" CssClass="table table-striped table-bordered">
                                <Columns>
                                    <asp:BoundField DataField="id" ItemStyle-CssClass="dnone" HeaderStyle-CssClass="dnone"/>
                                    <asp:BoundField DataField="fileid" ItemStyle-CssClass="dnone" HeaderStyle-CssClass="dnone"/>
                                    <asp:BoundField DataField="seminarsattended" HeaderText="Seminar's Attended"/>
                                    <asp:BoundField DataField="seminarsheld" HeaderText="Held At"/>
                                    <asp:BoundField DataField="dateconducted" HeaderText="Date Conducted"/>
                                    <asp:TemplateField  HeaderText="Action">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="lbeditor" runat="server" CommandName='<%# Eval("id") %>' Text="Remove" ToolTip="Edit" OnClick="openseminar" style=" margin:3px;" ><i class="fa fa-pencil"></i></asp:LinkButton>
                                            <asp:linkbutton ID="lbdownloadsem" CommandName='<%#Eval("id") %>' runat="server" Visible="false" ToolTip="Download Certificate" OnClick="downloadseminarsfile"><i class="fa fa-download"></i></asp:linkbutton>
                                            <asp:LinkButton ID="cancel" runat="server" CommandName='<%# Eval("Id") %>' ToolTip="Delete" OnClientClick="Confirm()" OnClick="deleteseminarsattended"><i class="fa fa-trash"></i></asp:LinkButton>
                                        </ItemTemplate>
                                        <ItemStyle Width="130px" />
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                            <button type="button" class="btn btn-default readupdate" data-toggle="modal" data-target="#modal-seminar">Add</button>

                            <h4 class="page-header">Training Attended</h4>
                             <asp:GridView ID="grid_preparatory" runat="server" AutoGenerateColumns="False" CssClass="table table-striped table-bordered">
                              <Columns>
                                <asp:BoundField DataField="Id" ItemStyle-CssClass="dnone" HeaderStyle-CssClass="dnone" />
                                <asp:TemplateField HeaderText="License Number">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lnkbtnprep" runat="server" CommandName='<%# Eval("Id") %>' ToolTip="List" Text='<%# Eval("LicenseNum") %>' OnClick="opendownloadprep"></asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="ValidUntil" HeaderText="Validity" />
                                <asp:BoundField DataField="Location" HeaderText="Location" />
                                <asp:BoundField DataField="Cost" HeaderText="Amount Cost" />
                                <asp:BoundField DataField="DF" HeaderText="Duration From" />
                                <asp:BoundField DataField="DT" HeaderText="Duration To" />
                                <asp:BoundField DataField="Provider" HeaderText="Provider" />
                                <asp:BoundField DataField="About" HeaderText="About" />
                                <asp:BoundField DataField="Resources" HeaderText="Resources" />
                                <asp:TemplateField HeaderText="Action"  ItemStyle-CssClass="readupdate" HeaderStyle-CssClass="readupdate" >
                                 <ItemTemplate>
                                    <asp:LinkButton ID="lbeditor" runat="server" CommandName='<%# Eval("id") %>' Text="Remove" ToolTip="Edit" OnClick="opentraining" style=" margin:3px;" ><i class="fa fa-pencil"></i></asp:LinkButton>
                                    <asp:LinkButton ID="cancel" runat="server" CommandName='<%# Eval("Id") %>' ToolTip="Delete" OnClientClick="Confirm()" OnClick="cancelprep"><i class="fa fa-trash"></i></asp:LinkButton>
                                 </ItemTemplate>
                                 <ItemStyle Width="100px" />
                                </asp:TemplateField>
                              </Columns>
                            </asp:GridView>
                            <button type="button" class="btn btn-default readupdate" data-toggle="modal" data-target="#modal-preparatory">Add</button>

                            <h4 class="page-header">Employee Special Skills</h4>
                            <asp:GridView ID="grid_skill1" runat="server"  AutoGenerateColumns="False"  CssClass="table table-striped table-bordered">
                                <Columns>
                                        <asp:BoundField DataField="ID" ItemStyle-CssClass="dnone" HeaderStyle-CssClass="dnone"/>
                                        <asp:BoundField DataField="skills" HeaderText="Skill" />
                                        <asp:TemplateField ShowHeader="False">
                                          <ItemTemplate>
                                               <a onclick='Remove5(this);' title='Delete' id='<%# Eval("ID") %>' href='javascript:void(0)'><i class='fa fa-trash'></i></a>
                                           <%-- <asp:LinkButton ID="lbeditor" runat="server" CommandName='<%# Eval("id") %>' Text="Remove" ToolTip="Edit" OnClick="openskills" style=" margin:3px;" ><i class="fa fa-pencil"></i></asp:LinkButton>
                                            <asp:LinkButton ID="lnkbtndel" runat="server" CommandName='<%# Eval("Id") %>' Text="Remove" OnClientClick="Confirm()"  ClientIDMode="Static" OnClick="deleteskill" style=" margin:3px;" ><i class="fa fa-trash"></i></asp:LinkButton>--%>
                                          </ItemTemplate>
                                        <ItemStyle Width="80px" />
                                        </asp:TemplateField>
                                </Columns>
                                </asp:GridView>
                            <button type="button" class="btn btn-default readupdate" data-toggle="modal" data-target="#modal-skill">Add</button>

                            <h4 class="page-header">Emergency Contact</h4>
                                <asp:GridView ID="grid_emergencycontact" runat="server"   AutoGenerateColumns="False"  CssClass="table table-striped table-bordered">
                                  <Columns>
                                        <asp:BoundField DataField="Id" ItemStyle-CssClass="dnone" HeaderStyle-CssClass="dnone"/>
                                        <asp:BoundField DataField="Name" HeaderText="Name" />
                                        <asp:BoundField DataField="Address" HeaderText="Address" />
                                        <asp:BoundField DataField="Contact" HeaderText="Contact Number" />
                                       <asp:TemplateField HeaderText="Action">
                                        <ItemTemplate>        
                                            <a onclick='Remove6(this);' title='Delete' id='<%# Eval("ID") %>' href='javascript:void(0)'><i class='fa fa-trash'></i></a>
                                       <%--     <asp:LinkButton ID="lbeditor" runat="server" CommandName='<%# Eval("id") %>' Text="Remove" ToolTip="Edit" OnClick="openemcontact" style=" margin:3px;" ><i class="fa fa-pencil"></i></asp:LinkButton>
                                            <asp:LinkButton ID="lnkbtndel" runat="server" CommandName='<%# Eval("Id") %>' Text="Remove" OnClientClick="Confirm()"  ClientIDMode="Static" OnClick="deleteContact" style=" margin:3px;" ><i class="fa fa-trash"></i></asp:LinkButton>--%>
                                        </ItemTemplate>
                                        <ItemStyle Width="80px" />
                                        </asp:TemplateField>
                                  </Columns>
                                </asp:GridView>
                            <button type="button" class="btn btn-default readupdate" data-toggle="modal" data-target="#modal-emergency">Add</button>

                            <h4 class="page-header">Medical History</h4>
                            <asp:GridView ID="gridmedrics" OnRowDataBound="medrecscell"  runat="server" AutoGenerateColumns="false" CssClass="table table-striped table-bordered">
                            <Columns>
                                <asp:BoundField DataField="Id" ItemStyle-CssClass="dnone" HeaderStyle-CssClass="dnone" />
                                <asp:BoundField DataField="meddate" HeaderText="Date"/>
                                 <asp:BoundField DataField="illness" HeaderText="Illness"/>
                                <asp:BoundField DataField="hospital" HeaderText="Hospital"/>
                                <asp:BoundField DataField="doctor" HeaderText="Physician"/>
                                <asp:BoundField DataField="findings" HeaderText="Findings"/>
                                <asp:BoundField DataField="condition" HeaderText="Admitted"/>
                                <asp:TemplateField HeaderText="Action">
                                    <ItemTemplate >
                                        <asp:LinkButton ID="lbeditor" runat="server" CommandName='<%# Eval("id") %>' Text="Remove" ToolTip="Edit" OnClick="openemmedrec" style=" margin:3px;" ><i class="fa fa-pencil"></i></asp:LinkButton>
                                        <asp:LinkButton ID="lbdwnmedrecs" runat="server" Visible="false" CommandName='<%# Eval("id") %>' OnClick="dwnmedrecs" ToolTip="Download" style="margin:3px;" ><i class="fa fa-download"></i></asp:LinkButton>
                                        <asp:LinkButton ID="lbaction" runat="server" CommandName='<%# Eval("id") %>' OnClick="rmvmedrecord" ToolTip="Remove" OnClientClick="Confirm()"  ClientIDMode="Static" style="margin:3px;" ><i class="fa fa-trash"></i></asp:LinkButton>
                                    </ItemTemplate>
                                    <ItemStyle Width="125px" />
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                            <button type="button" class="btn btn-default readupdate" data-toggle="modal" data-target="#modal-medical">Add</button>

                  </div>
              
              <!-- /.tab-pane -->
              <div class=" tab-pane" id="timeline">
               <%--@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--%>
               
                <div class="row">
                    <div class="col-md-12">
                        <div id="div1" class="alert alert-empty" >
                                <i class="fa fa-info-circle"></i> <span>Please login to access.</span>
                        </div>
                        <div id="deelr" style="display:none;">
                        <div class="row" style="margin-top:10px; margin-bottom:10px;" >
                            <div class="col-md-6"></div>
                            <div class="col-md-6"><span class="pull-right">DATE:&nbsp;<span class="label label-info"><%=DateTime.Now.ToString("MM/dd/yyyy") %></span></span> </div>
                        </div>
                        <%--<div class="row">
                            <div class="col-md-12"> PROFILED FOR:</div>
                        </div>--%>
                        <div class="row lister">
                            <div class="col-md-12">Please check the appropriate level for each of the competencies below.</div>
                        </div>
                        <div class="row lister">
                            <div class="col-md-2"></div>
                            
                            <div class="col-md-2"><strong>RATING</strong></div>
                            <div class="col-md-2"><strong>1-NOT EVIDENT</strong></div>
                            <div class="col-md-2"><strong>2-SLIGHTLY EVIDENT</strong></div>
                            <div class="col-md-2"><strong>3-EVIDENT</strong></div>
                            <div class="col-md-2"><strong>4-HIGHLY EVIDENT</strong></div>
                        </div>
                        <div class="row">
                            <div class="col-md-12"> 
                                <div class="row lister" >
                                    <div class="col-md-8" style="text-align:center;">COMPETENCY
                                    </div>
                                    <div class="col-md-4">
                                      <div class="row">
                                        <div class="col-md-12" style="text-align:center;"> RATING</div>
                                      </div>
                                    <div class="row">
                                        <div class="col-md-3">1</div>
                                        <div class="col-md-3">2</div>
                                        <div class="col-md-3">3</div>
                                        <div class="col-md-3">4</div>
                                    </div>
                                    </div>
                                </div> 
                                <div class="row lister">
                                    <div class="col-md-8"><strong>Education/Training Skills-</strong> Doeas the candidate have the appropriate educational qualification(s) or training(s) for this position?</div>
                                    <div class="col-md-4">
                                    <div class="row">
                                        <div class="col-md-3">
                                            <input type="radio" name="quest1" value="1" required/>
                                        </div>
                                        <div class="col-md-3">
                                            <input type="radio" name="quest1" value="2"/>
                                        </div>
                                        <div class="col-md-3">
                                            <input type="radio" name="quest1" value="3"/> 
                                        </div>
                                        <div class="col-md-3">
                                            <input type="radio" name="quest1" value="4"/> 
                                        </div>
                                </div>
                                    </div>
                                </div> 
                                <div class="row lister">
                                    <div class="col-md-8"><strong>Work Experience-</strong>Has the candidate acquired similar skills or qualifications through past work experience(s)?</div>
                                    <div class="col-md-4"><div class="row">
                                        <div class="col-md-3">
                                            <input type="radio" name="quest2" value="1" required/>
                                        </div>
                                        <div class="col-md-3">
                                            <input type="radio" name="quest2" value="2"/>
                                        </div>
                                        <div class="col-md-3">
                                            <input type="radio" name="quest2" value="3"/> 
                                        </div>
                                        <div class="col-md-3">
                                            <input type="radio" name="quest2" value="4"/> 
                                        </div>
                                </div></div>
                                </div> 
                                <div class="row lister">
                                    <div class="col-md-8"><strong>Technical Qualifcations/Job Related Skills-</strong> Does the candidate have the technical skills necessary for this position?</div>
                                    <div class="col-md-4"><div class="row">
                                        <div class="col-md-3">
                                            <input type="radio" name="quest3" value="1" required/>
                                        </div>
                                        <div class="col-md-3">
                                            <input type="radio" name="quest3" value="2"/>
                                        </div>
                                        <div class="col-md-3">
                                            <input type="radio" name="quest3" value="3"/> 
                                        </div>
                                        <div class="col-md-3">
                                            <input type="radio" name="quest3" value="4"/> 
                                        </div>
                                </div></div>
                                </div> 
                                <div class="row lister">
                                    <div class="col-md-8"><strong>Problem Solving Skills-</strong>How did candidate hancle challenges at work?</div>
                                    <div class="col-md-4"><div class="row">
                                        <div class="col-md-3">
                                            <input type="radio" name="quest4" value="1" required/>
                                        </div>
                                        <div class="col-md-3">
                                            <input type="radio" name="quest4" value="2"/>
                                        </div>
                                        <div class="col-md-3">
                                            <input type="radio" name="quest4" value="3"/> 
                                        </div>
                                        <div class="col-md-3">
                                            <input type="radio" name="quest4" value="4"/> 
                                        </div>
                                </div></div>
                                </div> 
                                <div class="row lister">
                                    <div class="col-md-8"><strong>Decision Making Skills-</strong>How did candidate make the best possible decisions in the shortest amount of time?</div>
                                    <div class="col-md-4"><div class="row">
                                        <div class="col-md-3">
                                            <input type="radio" name="quest5" value="1" required/>
                                        </div>
                                        <div class="col-md-3">
                                            <input type="radio" name="quest5" value="2"/>
                                        </div>
                                        <div class="col-md-3">
                                            <input type="radio" name="quest5" value="3"/> 
                                        </div>
                                        <div class="col-md-3">
                                            <input type="radio" name="quest5" value="4"/> 
                                        </div>
                                </div></div>
                                </div> 
                                <div class="row lister">
                                    <div class="col-md-8"><strong>Motivation/Initiative-</strong>Analyze candidate's ability to think and act independently, and goal orientation. Why does this person want to work at CLI?</div>
                                    <div class="col-md-4"><div class="row">
                                        <div class="col-md-3">
                                            <input type="radio" name="quest6" value="1" required/>
                                        </div>
                                        <div class="col-md-3">
                                            <input type="radio" name="quest6" value="2"/>
                                        </div>
                                        <div class="col-md-3">
                                            <input type="radio" name="quest6" value="3"/> 
                                        </div>
                                        <div class="col-md-3">
                                            <input type="radio" name="quest6" value="4"/> 
                                        </div>
                                </div></div>
                                </div> 
                                <div class="row lister">
                                    <div class="col-md-8"><strong>Professional Impression:</strong> Consider self-confidence, maturity and assess candidate's level if professionalism.</div>
                                    <div class="col-md-4"><div class="row">
                                        <div class="col-md-3">
                                            <input type="radio" name="quest7" value="1" required/>
                                        </div>
                                        <div class="col-md-3">
                                            <input type="radio" name="quest7" value="2"/>
                                        </div>
                                        <div class="col-md-3">
                                            <input type="radio" name="quest7" value="3"/> 
                                        </div>
                                        <div class="col-md-3">
                                            <input type="radio" name="quest7" value="4"/> 
                                        </div>
                                </div></div>
                                </div>
                            </div>
                       
                        </div>

                        <div class="row lister" style="text-align:center;">
                            <div class="col-md-12">
                                <strong>OVERALL IMPRESSION</strong>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-7">
                                <div class="row"  style="margin-top:5px;">
                                    <div class="col-md-12">
                                        <strong>REMARKS and RECOMMENDATION</strong> - Final comments and recommendations for proceeding with the candidate.
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12">
                                        <label>(+)</label>
                                        <textarea id="tAreaPositive" oninput="auto_grow(this)" rows="2" class="form-control" cols="max"></textarea>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12">
                                        <label>(-)</label>
                                        <textarea id="tAreaNegative" oninput="auto_grow(this)" rows="2" class="form-control" cols="max"></textarea>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12">
                                        <label>CLI Connections</label>
                                        <textarea id="tAreaCon" oninput="auto_grow(this)" rows="2" class="form-control" cols="max"></textarea>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-5">
                                <div class="row" style="margin-top:5px;">
                                    <div class="col-md-3">
                                            <input type="radio" id="radio1" name="hireon" value="Hire" required /><label for="radio1">&nbsp;Hire</label>
                                    </div>
                                    <div class="col-md-6">
                                            <input type="radio" id="radio2" name="hireon" value="For Further Interview"/><label for="radio2">&nbsp;For Further Interview</label>
                                    </div>
                                    <div class="col-md-3">
                                            <input type="radio" id="radio3" name="hireon" value="Not Hire"/> <label for="radio3">&nbsp;Not Hire</label>
                                    </div>
                                </div>
                                
                                <div class="row">
                                    <div class="col-md-12">
                                              <textarea id="Textarea1" oninput="auto_grow(this)" rows="2" class="form-control" cols="max"></textarea>
                                    </div>
                                </div>

                                <div class="row" style="margin-top:10px;"> 
                                    <div class="col-md-12">
                                        <label><strong>INTERVIEWED BY:</strong></label>
                                           <input type="text" id="itvb" class="form-control" readonly="readonly" />
                                    </div>
                                </div>
                                <div class="row"> 
                                    <div class="col-md-12">
                                        <label><strong>POSITION:</strong></label> 
                                           <input type="text" id="postitionb" class="form-control" readonly="readonly"/>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <hr />
                        <div class="row" style="margin-top:10px;">
                            <div class="col-md-12">
                                <input type="submit" class="btn btn-success pull-right" value="SAVE" onclick="saveform()" />
                            </div>
                        </div>
                        </div>
                    </div>
                 </div>
    

              </div>


              <!-- /.tab-pane -->
                <%--0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000--%>
              <div class="tab-pane" id="reference">
                   <div class="row">
                      <div class="col-md-12">
                          <div id="dlep" class="alert alert-empty" >
                               <i class="fa fa-info-circle"></i> <span>Please login to access.</span>
                          </div>
                          <div id="dleo" style="display:none;">
                                <div class="row lister">
                                    <div class="col-md-2">
                                        Reference's Name &nbsp;:
                                    </div>
                                    <div class="col-md-10">
                                        <input type="text" class="form-control" id="txtref" required />
                                    </div>
                                </div>
                                <div class="row lister">
                                    <div class="col-md-2">
                                        Company &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:
                                    </div>
                                    <div class="col-md-10">
                                        <input type="text" class="form-control" id="txtcomp" required />
                                    </div>
                                </div>
                                <div class="row lister">
                                    <div class="col-md-2">
                                        Current Position&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:
                                    </div>
                                    <div class="col-md-10">
                                        <input type="text" class="form-control" id="txtpos" required />
                                    </div>
                                </div>
                                <div class="row lister">
                                    <div class="col-md-12">
                                        <i>Please provide the necessary information below:</i>
                                    </div>
                                </div>
                                <div class="row lister">
                                    <div class="col-md-8">
                                        Start Date of Employement
                                    </div>
                                    <div class="col-md-4">
                                       <%-- <input type="text" class="form-control" id="txtstartemp" />--%>
                                          <asp:TextBox ID="txtstartemp" runat="server" ClientIDMode="Static" type="date" CssClass="form-control"></asp:TextBox>
                    
                                    </div>
                                </div>
                                <div class="row lister">
                                    <div class="col-md-8">
                                        Separation Date of Employement
                                    </div>
                                    <div class="col-md-4">
                                       <%-- <input type="text" class="form-control" id="txtsepemp" />--%>
                                          <asp:TextBox ID="txtsepemp" runat="server" ClientIDMode="Static" type="date" CssClass="form-control" ></asp:TextBox>
                    
                                    </div>
                                </div>
                                <div class="row lister">
                                    <div class="col-md-8">
                                        Last Position held before separation
                                    </div>
                                    <div class="col-md-4">
                                        <input type="text" class="form-control" id="txtlastpos" required />
                                    </div>
                                </div>
                                <div class="row lister">
                                    <div class="col-md-8">
                                        Was the nature of his/her separation from the company VOLUNTARY or INVOLUNTARY
                                    </div>
                                    <div class="col-md-4">
                                        <input type="text" class="form-control" id="txtvol"  required/>
                                    </div>
                                </div>
                                <div class="row lister">
                                    <div class="col-md-8">
                                        Is he/she cleared in your Company?
                                    </div>
                                    <div class="col-md-4">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <input type="radio" name="rquest1" value="1" id="radio7" required /><label for="radio7"> &nbsp; Yes</label>
                                            </div>
                                            <div class="col-md-6">
                                                <input type="radio" name="rquest1" value="2" id="radio8" /><label for="radio8"> &nbsp; No</label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row lister">
                                    <div class="col-md-8">
                                        Did he/she have integrity issues?
                                    </div>
                                    <div class="col-md-4">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <input type="radio" name="rquest2" value="1" id="radio9" required /><label for="radio9"> &nbsp; Yes</label>
                                            </div>
                                            <div class="col-md-6">
                                                <input type="radio" name="rquest2" value="2" id="radio10" /><label for="radio10"> &nbsp; No</label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row lister">
                                    <div class="col-md-8">
                                        Did he/she have performance issues?
                                    </div>
                                    <div class="col-md-4">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <input type="radio" name="rquest3" value="1" id="radio11" required /><label for="radio11"> &nbsp; Yes</label>
                                            </div>
                                            <div class="col-md-6">
                                                <input type="radio" name="rquest3" value="2" id="radio12" /><label for="radio12"> &nbsp; No</label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row lister">
                                    <div class="col-md-8">
                                        Did he/she file a labor case against your company?
                                    </div>
                                    <div class="col-md-4">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <input type="radio" name="rquest4" value="1" id="radio13" required /><label for="radio13"> &nbsp; Yes</label>
                                            </div>
                                            <div class="col-md-6">
                                                <input type="radio" name="rquest4" value="2" id="radio14" /><label for="radio14"> &nbsp; No</label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row lister">
                                    <div class="col-md-8">
                                        Did he/she have any criminal or civil case while in your company?
                                    </div>
                                    <div class="col-md-4">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <input type="radio" name="rquest5" value="1" id="radio15" required/><label for="radio15"> &nbsp; Yes</label>
                                            </div>
                                            <div class="col-md-6">
                                                <input type="radio" name="rquest5" value="2" id="radio16" /><label for="radio16"> &nbsp; No</label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row lister">
                                    <div class="col-md-8">
                                        Did he/she have health concerns while in your Company?
                                    </div>
                                    <div class="col-md-4">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <input type="radio" name="rquest6" value="1" id="radio17" required /><label for="radio17"> &nbsp; Yes</label>
                                            </div>
                                            <div class="col-md-6">
                                                <input type="radio" name="rquest6" value="2" id="radio18" /><label for="radio18"> &nbsp; No</label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row lister">
                                    <div class="col-md-8">
                                        Is applicant eligible for re-hire in your company?
                                    </div>
                                    <div class="col-md-4">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <input type="radio" name="rquest7" value="1" id="radio19" required/><label for="radio19"> &nbsp; Yes</label>
                                            </div>
                                            <div class="col-md-6">
                                                <input type="radio" name="rquest7" value="2" id="radio20" /><label for="radio20"> &nbsp; No</label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row lister">
                                    <div class="col-md-8">
                                        Would you recommend him to be hired in our Company?
                                    </div>
                                    <div class="col-md-4">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <input type="radio" name="rquest8" value="1" id="radio21" required/><label for="radio21"> &nbsp; Yes</label>
                                            </div>
                                            <div class="col-md-6">
                                                <input type="radio" name="rquest8" value="2" id="radio22" /><label for="radio22"> &nbsp; No</label>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-md-12">
                                        <label> REMARKS:</label>
                                              <textarea id="Textarea5" oninput="auto_grow(this)" rows="2" class="form-control" cols="max"></textarea>
                                    </div>
                                </div>
                                <div class="row" style="margin-top:10px;"> 
                                    <div class="col-md-12">
                                        <label><strong>Completed by:</strong></label>
                                           <input type="text" id="Text3" class="form-control" readonly="readonly" />
                                    </div>
                                </div>
                                <div class="row"> 
                                    <div class="col-md-12">
                                        <label><strong>Date:</strong></label> 
                                           <input type="text" id="Text4" class="form-control" value="<%=DateTime.Now.ToString("MM/dd/yyyy") %>" readonly="readonly"/>
                                    </div>
                                </div>

                                 <hr />
                        <div class="row" style="margin-top:10px;">
                            <div class="col-md-12">
                                <input type="submit" class="btn btn-success pull-right" value="SAVE" onclick="saverefform()" />
                            </div>
                        </div>

                          </div>
                      </div>
                   </div>
              </div>

               <%--0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000--%>
                <div class="tab-pane" id="connection">
                <!-- Post -->
                  <div id="divCLIcon" class="alert alert-empty" >
                       <i class="fa fa-info-circle"></i> <span>Please login to access.</span>
                  </div>
                    <div id="divCLIconf" style="display:none;">
                       <div class="row" style="margin-top:10px; margin-bottom:10px;" > 
                            <div class="col-md-6"></div>
                            <div class="col-md-6"><span class="pull-right">DATE:&nbsp;<span class="label label-info"><%=DateTime.Now.ToString("MM/dd/yyyy") %></span></span> </div>
                        </div>
                        <div class="row lister">
                            <div class="col-md-2">
                                Employee's Name &nbsp; :
                            </div>
                            <div class="col-md-10">
                                <input type="text" class="form-control" readonly="readonly" id="conEmpname"  />
                            </div>
                        </div>
                         <div class="row lister">
                            <div class="col-md-2">
                                Department &nbsp; :
                            </div>
                            <div class="col-md-10">
                                <input type="text" class="form-control" readonly="readonly" id="conDept"  />
                            </div>
                        </div>
                        <div class="row lister">
                            <div class="col-md-2">
                                Relationship &nbsp; :
                            </div>
                            <div class="col-md-10">
                                <div class="row">
                                    <div class="col-md-2"><input type="radio" name="chkreq" value="1" checked="checked" id="Checkbox1" required /><label for="Checkbox1"> &nbsp; Colleague</label></div>
                                    <div class="col-md-2"><input type="radio" name="chkreq" value="2" id="Checkbox2" /><label for="Checkbox2"> &nbsp; Schoolmate</label></div>
                                    <div class="col-md-2"><input type="radio" name="chkreq" value="3" id="Checkbox3" /><label for="Checkbox3"> &nbsp; Relative</label></div>
                                    <div class="col-md-6"><div class="row"><div class="col-md-3"><input type="radio" name="chkreq" value="4" id="Checkbox4" /><label for="Checkbox4"> &nbsp; Others:</label></div><div class="col-md-9"><input type="text" class="form-control" id="conOthers" /></div></div></div>
                                </div>
                            </div>
                        </div>
                        <div class="row lister">
                            <div class="col-md-12">
                                Please answer the question below :
                            </div>
                        </div>
                        <div class="row lister">
                            <div class="col-md-12">
                            <label>1. Where and how long do you know each other?</label>
                             <textarea id="conquest1" oninput="auto_grow(this)" rows="2" class="form-control" cols="max" required></textarea>
                            </div>
                        </div>
                        <div class="row lister">
                            <div class="col-md-12">
                            <label>2. What can you say about the applicant's attitude/ personality?</label>
                             <textarea id="conquest2" oninput="auto_grow(this)" rows="2" class="form-control" cols="max" required></textarea>
                            </div>
                        </div>
                          <div class="row lister">
                            <div class="col-md-12">
                            <label>3. What can you say about the applicant's work performance?</label>
                             <textarea id="conquest3" oninput="auto_grow(this)" rows="2" class="form-control" cols="max" required></textarea>
                            </div>
                        </div>
                          <div class="row lister">
                            <div class="col-md-12">
                            <label>4. Would you recommend him/her to be hired in Cebu Landmasters, Inc? And why</label>
                             <textarea id="conquest4" oninput="auto_grow(this)" rows="2" class="form-control" cols="max" required></textarea>
                            </div>
                        </div>
                                    <hr />
                        <div class="row" style="margin-top:10px;">
                            <div class="col-md-12">
                                <input type="submit" class="btn btn-success pull-right" value="SAVE" onclick="saveconform()" />
                            </div>
                        </div>

                   </div>
                </div>
                    


                <%--0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000--%>
                <div class="tab-pane" id="settings">
                <!-- Post -->
                  <div id="dlem" class="alert alert-empty" >
                       <i class="fa fa-info-circle"></i> <span>Please login to access.</span>
                  </div>
                <div id="dlef" style="display:none;">
                    <div class="row lister" style="margin-bottom:20px;">
                        <div class="col-md-12">
                            <h4>Interview Evaluations</h4>
                        </div>
                    </div>
                <% System.Data.DataTable dtt = dbhelper.getdata("Select * from IEF where AppId=" + this.appid + " order by Id desc");
                   if (dtt.Rows.Count > 0)
                   {
                       foreach (System.Data.DataRow row in dtt.Rows)
                       {   
                     %>


                <div class="post">
                  <div class="user-block">
                   <%-- <img class="img-circle img-bordered-sm" src="dist/img/user1-128x128.jpg" alt="user image">--%>
                        <span class="username" style="margin-left:0px;" >
                          <a href="#"><%=row["UserFname"]%></a>
                      <%--    <a href="#" class="pull-right btn-box-tool" ><i class="fa fa-times"></i></a>--%>
                        </span>
                    <span class="description"  style="margin-left:0px;"><%=row["UserPosition"]%> - <%=row["Date"]%></span>
                  </div>
                  <!-- /.user-block -->
                    <div class="input-group margin">
                        <div class="input-group-btn">
                          <a class="btn btn-default" href="IEFForm?onprint=<%=butyok.Encrypt(row["Id"].ToString(),true) %>"  target="_blank" ><i class="fa fa-print"></i> &nbsp; PRINT</a>
                        </div>
                        <!-- /btn-group -->
                        <button type="button" id="ssd<%=row["Id"] %>" class="btn btn-default" onclick="viewer(<%=row["Id"] %>)" >VIEW</button>
                        <button type="button" id="modalief<%=row["Id"] %>" style="display:none;" data-toggle="modal" data-target="#Div5"></button>
                      </div>

                </div>

                <%  }
                   }
                   else
                   {%>
                      <div id="fasf" class="alert alert-info alert-dismissible" >
                                <i class="fa fa-times-circle"></i> <span> No record found</span>
                        </div>
                   <%} %>

                   <div class="row lister" style="margin-bottom:20px;">
                        <div class="col-md-12">
                            <h4>Character References</h4>
                        </div>
                    </div>

                   <% System.Data.DataTable dttt = dbhelper.getdata("Select * from RefCheck where AppId=" + this.appid + " order by Id desc");
                      if (dttt.Rows.Count > 0)
                      {
                          foreach (System.Data.DataRow row in dttt.Rows)
                          {   
                     %>


                <div class="post">
                  <div class="user-block">
                        <span class="username" style="margin-left:0px;" >
                          <a href="#"><%=row["Userfname"]%></a>
                        </span>
                    <span class="description"  style="margin-left:0px;"> <%=row["Date"]%></span>
                  </div>
                  <!-- /.user-block -->
                    <div class="input-group margin">
                        <div class="input-group-btn">
                                <a class="btn btn-default" href="RefCheckForm?onprint=<%=butyok.Encrypt(row["Id"].ToString(),true) %>"  target="_blank" ><i class="fa fa-print"></i> &nbsp; PRINT</a>
                        </div>
                        <!-- /btn-group -->
                        <button type="button" id="Button4" class="btn btn-default" onclick="viewerref(<%=row["Id"] %>)" >VIEW</button>
                        <button type="button" id="btnref<%=row["Id"] %>" style="display:none;" data-toggle="modal" data-target="#Divref"></button>
                      </div>

                </div>

                <%  }
                      }
                      else
                      {%>
                      <div id="fafss" class="alert alert-info alert-dismissible" >
                                <i class="fa fa-times-circle"></i> <span> No record found</span>
                        </div>
                   <%} %>


                   <div class="row lister" style="margin-bottom:20px;">
                        <div class="col-md-12">
                            <h4>CLI Connections</h4>
                        </div>
                    </div>

                   <% System.Data.DataTable dtttt = dbhelper.getdata("Select * from ConForm where AppId=" + this.appid + " order by Id desc");
                      if (dtttt.Rows.Count > 0)
                      {
                          foreach (System.Data.DataRow row in dtttt.Rows)
                          {   
                     %>


                <div class="post">
                  <div class="user-block">
                        <span class="username" style="margin-left:0px;" >
                          <a href="#"><%=row["UserName"]%></a>
                        </span>
                    <span class="description"  style="margin-left:0px;"> <%=row["sysdate"]%></span>
                  </div>
                  <!-- /.user-block -->
                    <div class="input-group margin">
                        <div class="input-group-btn">
                                <a class="btn btn-default" href="CLIConnection?onprint=<%=butyok.Encrypt(row["Id"].ToString(),true) %>"  target="_blank" ><i class="fa fa-print"></i> &nbsp; PRINT</a>
                        </div>
                        <!-- /btn-group -->
                        <button type="button" id="Button5" class="btn btn-default" onclick="viewercon(<%=row["Id"] %>)" >VIEW</button>
                        <button type="button" id="btncon<%=row["Id"] %>" style="display:none;" data-toggle="modal" data-target="#DivCon"></button>
                      </div>

                </div>

                <%  }
                      }
                      else
                      {%>
                      <div id="Div3" class="alert alert-info alert-dismissible" >
                                <i class="fa fa-times-circle"></i> <span> No record found</span>
                        </div>
                   <%} %>



                   </div>
                <!-- /.post -->
              </div>
              <!-- /.tab-pane -->
            </div>
            <!-- /.tab-content -->
          </div>
          <!-- /.nav-tabs-custom -->
        </div>
        <!-- /.col -->
      </div>
      <!-- /.row -->


           <div class="modal fade" id="Div2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
            aria-hidden="true">
            <div class="modal-dialog" role="document" style="max-width:400px;">
                <div class="modal-content x_panel" >
                    <div class="modal-header text-center">
                        <button type="button" id="Button1" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>

                    <div class="row">
                        <div class="col-md-12" style="padding-left:30px; padding-right:30px;">
                           <div class="login-box">
                              <div class="login-box-body"><img class="mns" src="dist/img/myCLIRecruitmentAdminPortal.png" alt="CLI" style="width:100%; height:100%; margin-top:-1px"/>
                                  <div class="form-group has-feedback">
                                    <asp:TextBox ID="txt_user" runat="server" ClientIDMode="Static" CssClass="form-control" placeholder="Username"></asp:TextBox>
                                    <span class="glyphicon glyphicon-user form-control-feedback"></span>
                                  </div>
                                  <div class="form-group has-feedback">
                                    <asp:TextBox ID="txt_pass" runat="server" ClientIDMode="Static" CssClass="form-control" TextMode="Password" placeholder="Password"></asp:TextBox>
                                    <span class="glyphicon glyphicon-lock form-control-feedback"></span>
                                  </div>
                                  <div class="row">
                                    <div class="col-xs-12">
                                   <%--  <asp:Button ID="btn_login" runat="server" OnClick="logingo"  class="btn btn-primary btn-block btn-flat" Text="Sign In" />
                                    --%> 
                                     <input type="button" id="btn_login" onclick="loginers()" class="btn btn-primary btn-block btn-flat" value="Sign In" />
                                    </div>
                                    <div class="col-xs-12 text-center">
                                     <asp:Label ID="lbl_msg" runat="server" ForeColor="Red" Font-Bold="true"></asp:Label>
                                    </div>
                                  </div>
                              </div>
                            </div>
                        
                        </div>
                    </div>
                 
                     
                    <hr />
                </div>
            </div>
        </div>


        
           <div class="modal fade" id="Div5" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document" style="width:1000px;" >
                <div class="modal-content x_panel" >
                    <div class="modal-header text-center">
                        <button type="button" id="Button3" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>

                   <div class="row" >
                    <div class="col-md-12" style="padding-left:30px; padding-right:30px;">
                        <div class="row" style="margin-top:10px; margin-bottom:10px;" >
                            <div class="col-md-6"></div>
                            <div class="col-md-6"><span class="pull-right">DATE:&nbsp;<span class="label label-info" id="gdate"></span></span> </div>
                        </div>
                        <div class="row lister">
                            <div class="col-md-12">Please check the appropriate level for each of the competencies below.</div>
                        </div>
                        <div class="row lister">
                            <div class="col-md-2"></div>
                            
                            <div class="col-md-2"><strong>RATING</strong></div>
                            <div class="col-md-2"><strong>1-NOT EVIDENT</strong></div>
                            <div class="col-md-2"><strong>2-SLIGHTLY EVIDENT</strong></div>
                            <div class="col-md-2"><strong>3-EVIDENT</strong></div>
                            <div class="col-md-2"><strong>4-HIGHLY EVIDENT</strong></div>
                        </div>
                        <div class="row">
                            <div class="col-md-12"> 
                                <div class="row lister" >
                                    <div class="col-md-8" style="text-align:center;">COMPETENCY
                                    </div>
                                    <div class="col-md-4">
                                      <div class="row">
                                        <div class="col-md-12" style="text-align:center;"> RATING</div>
                                      </div>
                                    <div class="row">
                                        <div class="col-md-3">1</div>
                                        <div class="col-md-3">2</div>
                                        <div class="col-md-3">3</div>
                                        <div class="col-md-3">4</div>
                                    </div>
                                    </div>
                                </div> 
                                <div class="row lister">
                                    <div class="col-md-8"><strong>Education/Training Skills-</strong> Doeas the candidate have the appropriate educational qualification(s) or training(s) for this position?</div>
                                    <div class="col-md-4">
                                    <div class="row">
                                        <div class="col-md-3">
                                            <input type="radio" name="gquest1" value="1" onclick="javascript: return false;" />
                                        </div>
                                        <div class="col-md-3">
                                            <input type="radio" name="gquest1" value="2" onclick="javascript: return false;"/>
                                        </div>
                                        <div class="col-md-3">
                                            <input type="radio" name="gquest1" value="3" onclick="javascript: return false;"/> 
                                        </div>
                                        <div class="col-md-3">
                                            <input type="radio" name="gquest1" value="4" onclick="javascript: return false;"/> 
                                        </div>
                                </div>
                                    </div>
                                </div> 
                                <div class="row lister">
                                    <div class="col-md-8"><strong>Work Experience-</strong>Has the candidate acquired similar skills or qualifications through past work experience(s)?</div>
                                    <div class="col-md-4"><div class="row">
                                        <div class="col-md-3">
                                            <input type="radio" name="gquest2" value="1" onclick="javascript: return false;"/>
                                        </div>
                                        <div class="col-md-3">
                                            <input type="radio" name="gquest2" value="2" onclick="javascript: return false;"/>
                                        </div>
                                        <div class="col-md-3">
                                            <input type="radio" name="gquest2" value="3" onclick="javascript: return false;"/> 
                                        </div>
                                        <div class="col-md-3">
                                            <input type="radio" name="gquest2" value="4" onclick="javascript: return false;"/> 
                                        </div>
                                </div></div>
                                </div> 
                                <div class="row lister">
                                    <div class="col-md-8"><strong>Technical Qualifcations/Job Related Skills-</strong> Does the candidate have the technical skills necessary for this position?</div>
                                    <div class="col-md-4"><div class="row">
                                        <div class="col-md-3">
                                            <input type="radio" name="gquest3" value="1" onclick="javascript: return false;"/>
                                        </div>
                                        <div class="col-md-3">
                                            <input type="radio" name="gquest3" value="2" onclick="javascript: return false;"/>
                                        </div>
                                        <div class="col-md-3">
                                            <input type="radio" name="gquest3" value="3" onclick="javascript: return false;"/> 
                                        </div>
                                        <div class="col-md-3">
                                            <input type="radio" name="gquest3" value="4" onclick="javascript: return false;"/> 
                                        </div>
                                </div></div>
                                </div> 
                                <div class="row lister">
                                    <div class="col-md-8"><strong>Problem Solving Skills-</strong>How did candidate hancle challenges at work?</div>
                                    <div class="col-md-4"><div class="row">
                                        <div class="col-md-3">
                                            <input type="radio" name="gquest4" value="1" onclick="javascript: return false;"/>
                                        </div>
                                        <div class="col-md-3">
                                            <input type="radio" name="gquest4" value="2" onclick="javascript: return false;"/>
                                        </div>
                                        <div class="col-md-3">
                                            <input type="radio" name="gquest4" value="3" onclick="javascript: return false;"/> 
                                        </div>
                                        <div class="col-md-3">
                                            <input type="radio" name="gquest4" value="4" onclick="javascript: return false;"/> 
                                        </div>
                                </div></div>
                                </div> 
                                <div class="row lister">
                                    <div class="col-md-8"><strong>Decision Making Skills-</strong>How did candidate make the best possible decisions in the shortest amount of time?</div>
                                    <div class="col-md-4"><div class="row">
                                        <div class="col-md-3">
                                            <input type="radio" name="gquest5" value="1" onclick="javascript: return false;"/>
                                        </div>
                                        <div class="col-md-3">
                                            <input type="radio" name="gquest5" value="2" onclick="javascript: return false;"/>
                                        </div>
                                        <div class="col-md-3">
                                            <input type="radio" name="gquest5" value="3" onclick="javascript: return false;"/> 
                                        </div>
                                        <div class="col-md-3">
                                            <input type="radio" name="gquest5" value="4" onclick="javascript: return false;"/> 
                                        </div>
                                </div></div>
                                </div> 
                                <div class="row lister">
                                    <div class="col-md-8"><strong>Motivation/Initiative-</strong>Analyze candidate's ability to think and act independently, and goal orientation. Why does this person want to work at CLI?</div>
                                    <div class="col-md-4"><div class="row">
                                        <div class="col-md-3">
                                            <input type="radio" name="gquest6" value="1" onclick="javascript: return false;"/>
                                        </div>
                                        <div class="col-md-3">
                                            <input type="radio" name="gquest6" value="2" onclick="javascript: return false;"/>
                                        </div>
                                        <div class="col-md-3">
                                            <input type="radio" name="gquest6" value="3" onclick="javascript: return false;"/> 
                                        </div>
                                        <div class="col-md-3">
                                            <input type="radio" name="gquest6" value="4" onclick="javascript: return false;"/> 
                                        </div>
                                </div></div>
                                </div> 
                                <div class="row lister">
                                    <div class="col-md-8"><strong>Professional Impression:</strong> Consider self-confidence, maturity and assess candidate's level if professionalism.</div>
                                    <div class="col-md-4"><div class="row">
                                        <div class="col-md-3">
                                            <input type="radio" name="gquest7" value="1" onclick="javascript: return false;"/>
                                        </div>
                                        <div class="col-md-3">
                                            <input type="radio" name="gquest7" value="2" onclick="javascript: return false;"/>
                                        </div>
                                        <div class="col-md-3">
                                            <input type="radio" name="gquest7" value="3" onclick="javascript: return false;"/> 
                                        </div>
                                        <div class="col-md-3">
                                            <input type="radio" name="gquest7" value="4" onclick="javascript: return false;"/> 
                                        </div>
                                </div></div>
                                </div>
                            </div>
                       
                        </div>

                        <div class="row lister" style="text-align:center;">
                            <div class="col-md-12">
                                <strong>OVERALL IMPRESSION</strong>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-7">
                                <div class="row"  style="margin-top:5px;">
                                    <div class="col-md-12">
                                        <strong>REMARKS and RECOMMENDATION</strong> - Final comments and recommendations for proceeding with the candidate.
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12">
                                        <label>(+)</label>
                                        <textarea id="Textarea2" oninput="auto_grow(this)" rows="2" class="form-control" cols="max" readonly="readonly"></textarea>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12">
                                        <label>(-)</label>
                                        <textarea id="Textarea3" oninput="auto_grow(this)" rows="2" class="form-control" cols="max" readonly="readonly"></textarea>
                                    </div>
                                </div>
                                 <div class="row">
                                    <div class="col-md-12">
                                        <label>(-)</label>
                                        <textarea id="Textarea6" oninput="auto_grow(this)" rows="2" class="form-control" cols="max" readonly="readonly"></textarea>
                                    </div>
                                </div>
                            </div> <div class="row">
                                    <div class="col-md-12">
                                        <label>(-)</label>
                                        <textarea id="Textarea7" oninput="auto_grow(this)" rows="2" class="form-control" cols="max" readonly="readonly"></textarea>
                                    </div>
                                </div>
                            <div class="col-md-5">
                                <div class="row" style="margin-top:5px;">
                                    <div class="col-md-3">
                                            <input type="radio" id="radio4" name="ghireon" value="Hire"  onclick="javascript: return false;" /><label for="radio1">&nbsp;Hire</label>
                                    </div>
                                    <div class="col-md-6">
                                            <input type="radio" id="radio5" name="ghireon" value="For Further Interview"  onclick="javascript: return false;"/><label for="radio2">&nbsp;For Further Interview</label>
                                    </div>
                                    <div class="col-md-3">
                                            <input type="radio" id="radio6" name="ghireon" value="Not Hire"  onclick="javascript: return false;"/> <label for="radio3">&nbsp;Not Hire</label>
                                    </div>
                                </div>
                                
                                <div class="row">
                                    <div class="col-md-12">
                                              <textarea id="Textarea4" oninput="auto_grow(this)" rows="2" class="form-control" cols="max" readonly="readonly"></textarea>
                                    </div>
                                </div>

                                <div class="row" style="margin-top:10px;"> 
                                    <div class="col-md-12">
                                        <label><strong>INTERVIEWED BY:</strong></label>
                                           <input type="text" id="Text1" class="form-control" readonly="readonly" />
                                    </div>
                                </div>
                                <div class="row"> 
                                    <div class="col-md-12">
                                        <label><strong>POSITION:</strong></label> 
                                           <input type="text" id="Text2" class="form-control" readonly="readonly"/>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        <hr />
                    </div>
                 </div>
                 
                     
                </div>
            </div>
        </div>

        
           <div class="modal fade" id="Divref" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document" style="width:1000px;" >
                <div class="modal-content x_panel" >
                    <div class="modal-header text-center">
                        <button type="button" id="Button6" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>

                   <div class="row" >
                    <div class="col-md-12" style="padding-left:30px; padding-right:30px;">
                       

                         <div class="row lister">
                                    <div class="col-md-2">
                                        Reference's Name &nbsp;:
                                    </div>
                                    <div class="col-md-10">
                                        <input type="text" class="form-control" id="tref" readonly="readonly" />
                                    </div>
                                </div>
                                <div class="row lister">
                                    <div class="col-md-2">
                                        Company &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:
                                    </div>
                                    <div class="col-md-10">
                                        <input type="text" class="form-control" id="tcomp" readonly="readonly" />
                                    </div>
                                </div>
                                <div class="row lister">
                                    <div class="col-md-2">
                                        Current Position&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:
                                    </div>
                                    <div class="col-md-10">
                                        <input type="text" class="form-control" id="tpos" readonly="readonly" />
                                    </div>
                                </div>
                                <div class="row lister">
                                    <div class="col-md-12">
                                        <i>Please provide ALL the necessary information below:</i>
                                    </div>
                                </div>
                                <div class="row lister">
                                    <div class="col-md-8">
                                        Start Date of Employement
                                    </div>
                                    <div class="col-md-4">
                                        <input type="text" class="form-control" id="tstartemp" readonly="readonly" />
                          
                                    </div>
                                </div>
                                <div class="row lister">
                                    <div class="col-md-8">
                                        Separation Date of Employement
                                    </div>
                                    <div class="col-md-4">
                                        <input type="text" class="form-control" id="tsepemp" readonly="readonly"/>
                          
                                    </div>
                                </div>
                                <div class="row lister">
                                    <div class="col-md-8">
                                        Last Position held before separation
                                    </div>
                                    <div class="col-md-4">
                                        <input type="text" class="form-control" id="tlastpos" readonly="readonly" />
                                    </div>
                                </div>
                                <div class="row lister">
                                    <div class="col-md-8">
                                        Was the nature of his/her separation from the company VOLUNTARY or INVOLUNTARY
                                    </div>
                                    <div class="col-md-4">
                                        <input type="text" class="form-control" id="tvol"  readonly="readonly"/>
                                    </div>
                                </div>
                                <div class="row lister">
                                    <div class="col-md-8">
                                        Is he/she cleared in your Company?
                                    </div>
                                    <div class="col-md-4">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <input type="radio" name="fquest1" value="1" id="radio23" onclick="javascript: return false;"/> &nbsp; Yes
                                            </div>
                                            <div class="col-md-6">
                                                <input type="radio" name="fquest1" value="2" id="radio24" onclick="javascript: return false;"/>&nbsp; No
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row lister">
                                    <div class="col-md-8">
                                        Did he/she have integrity issues?
                                    </div>
                                    <div class="col-md-4">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <input type="radio" name="fquest2" value="1" id="radio25" onclick="javascript: return false;"/> &nbsp; Yes
                                            </div>
                                            <div class="col-md-6">
                                                <input type="radio" name="fquest2" value="2" id="radio26" onclick="javascript: return false;"/> &nbsp; No
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row lister">
                                    <div class="col-md-8">
                                        Did he/she have performance issues?
                                    </div>
                                    <div class="col-md-4">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <input type="radio" name="fquest3" value="1" id="radio27" onclick="javascript: return false;"/> &nbsp; Yes
                                            </div>
                                            <div class="col-md-6">
                                                <input type="radio" name="fquest3" value="2" id="radio28" onclick="javascript: return false;"/> &nbsp; No
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row lister">
                                    <div class="col-md-8">
                                        Did he/she file a labor case against your company?
                                    </div>
                                    <div class="col-md-4">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <input type="radio" name="fquest4" value="1" id="radio29" onclick="javascript: return false;" />&nbsp; Yes
                                            </div>
                                            <div class="col-md-6">
                                                <input type="radio" name="fquest4" value="2" id="radio30" onclick="javascript: return false;"/> &nbsp; No
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row lister">
                                    <div class="col-md-8">
                                        Did he/she have any criminal or civil case while in your company?
                                    </div>
                                    <div class="col-md-4">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <input type="radio" name="fquest5" value="1" id="radio31" onclick="javascript: return false;"/> &nbsp; Yes
                                            </div>
                                            <div class="col-md-6">
                                                <input type="radio" name="fquest5" value="2" id="radio32" onclick="javascript: return false;"/> &nbsp; No
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row lister">
                                    <div class="col-md-8">
                                        Did he/she have health concerns while in your Company?
                                    </div>
                                    <div class="col-md-4">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <input type="radio" name="fquest6" value="1" id="radio33" onclick="javascript: return false;" /> &nbsp; Yes
                                            </div>
                                            <div class="col-md-6">
                                                <input type="radio" name="fquest6" value="2" id="radio34" onclick="javascript: return false;"/> &nbsp; No
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row lister">
                                    <div class="col-md-8">
                                        Is applicant eligible for re-hire in your company?
                                    </div>
                                    <div class="col-md-4">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <input type="radio" name="fquest7" value="1" id="radio35" onclick="javascript: return false;"/> &nbsp; Yes
                                            </div>
                                            <div class="col-md-6">
                                                <input type="radio" name="fquest7" value="2" id="radio36" onclick="javascript: return false;"/>&nbsp; No
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row lister">
                                    <div class="col-md-8">
                                        Would you recommend him to be hired in our Company?
                                    </div>
                                    <div class="col-md-4">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <input type="radio" name="frquest8" value="1" id="radio37" onclick="javascript: return false;"/> &nbsp; Yes
                                            </div>
                                            <div class="col-md-6">
                                                <input type="radio" name="frquest8" value="2" id="radio38" onclick="javascript: return false;"/> &nbsp; No
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-md-12">
                                        <label> REMARKS:</label>
                                              <textarea id="tremark" oninput="auto_grow(this)" rows="2" class="form-control" cols="max"  readonly="readonly"></textarea>
                                    </div>
                                </div>
                                <div class="row" style="margin-top:10px;"> 
                                    <div class="col-md-12">
                                        <label><strong>Completed by:</strong></label>
                                           <input type="text" id="Text10" class="form-control" readonly="readonly" />
                                    </div>
                                </div>
                                <div class="row"> 
                                    <div class="col-md-12">
                                        <label><strong>Date:</strong></label> 
                                           <input type="text" id="Text11" class="form-control"  readonly="readonly"/>
                                    </div>
                                </div>


                            
                        <hr />
                    </div>
                 </div>
                 
                     
                </div>
            </div>
        </div>


 
           <div class="modal fade" id="DivCon" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document" style="width:1000px;" >
                <div class="modal-content x_panel" >
                    <div class="modal-header text-center">
                        <button type="button" id="Button8" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>

                   <div class="row" >
                    <div class="col-md-12" style="padding-left:30px; padding-right:30px;">
                       
                          <div class="row" style="margin-top:10px; margin-bottom:10px;" > 
                            <div class="col-md-6"></div>
                            <div class="col-md-6"><span class="pull-right">DATE:&nbsp;<span class="label label-info" id="cdate"></span></span> </div>
                        </div>
                        <div class="row lister">
                            <div class="col-md-2">
                                Employee's Name &nbsp; :
                            </div>
                            <div class="col-md-10">
                                <input type="text" class="form-control" id="cempname"  readonly="readonly" />
                            </div>
                        </div>
                         <div class="row lister">
                            <div class="col-md-2">
                                Department &nbsp; :
                            </div>
                            <div class="col-md-10">
                                <input type="text" class="form-control" id="cdept" readonly="readonly" />
                            </div>
                        </div>
                        <div class="row lister">
                            <div class="col-md-2">
                                Relationship &nbsp; :
                            </div>
                            <div class="col-md-10">
                                <div class="row">
                                    <div class="col-md-2"><input type="radio" name="cchkreq" value="1" id="Radio39" onclick="javascript: return false;"/><label for="Checkbox1"> &nbsp; Colleague</label></div>
                                    <div class="col-md-2"><input type="radio" name="cchkreq" value="2" id="Radio40" onclick="javascript: return false;"/><label for="Checkbox2"> &nbsp; Schoolmate</label></div>
                                    <div class="col-md-2"><input type="radio" name="cchkreq" value="3" id="Radio41" onclick="javascript: return false;"/><label for="Checkbox3"> &nbsp; Relative</label></div>
                                    <div class="col-md-6"><div class="row"><div class="col-md-3"><input type="radio" name="cchkreq" value="4" id="Radio42" onclick="javascript: return false;" /><label for="Checkbox4"> &nbsp; Others:</label></div><div class="col-md-9"><input type="text" class="form-control" id="cothers" /></div></div></div>
                                </div>
                            </div>
                        </div>
                        <div class="row lister">
                            <div class="col-md-12">
                                Please answer the question below :
                            </div>
                        </div>
                        <div class="row lister">
                            <div class="col-md-12">
                            <label>1. Where and how long do you know each other?</label>
                             <textarea id="cconquest1" oninput="auto_grow(this)" readonly="readonly" rows="2" class="form-control" cols="max"></textarea>
                            </div>
                        </div>
                        <div class="row lister">
                            <div class="col-md-12">
                            <label>2. What can you say about the applicant's attitude/ personality?</label>
                             <textarea id="cconquest2" oninput="auto_grow(this)" readonly="readonly" rows="2" class="form-control" cols="max"></textarea>
                            </div>
                        </div>
                          <div class="row lister">
                            <div class="col-md-12">
                            <label>3. What can you say about the applicant's work performance?</label>
                             <textarea id="cconquest3" oninput="auto_grow(this)" readonly="readonly" rows="2" class="form-control" cols="max"></textarea>
                            </div>
                        </div>
                          <div class="row lister">
                            <div class="col-md-12">
                            <label>4. Would you recommend him/her to be hired in Cebu Landmasters, Inc? And why</label>
                             <textarea id="cconquest4" oninput="auto_grow(this)" readonly="readonly" rows="2" class="form-control" cols="max"></textarea>
                            </div>
                        </div>
                            
                        <hr />
                    </div>
                 </div>
                 
                     
                </div>
            </div>
        </div>


        <%----##########################################PERSONAL INFORMATION MODAL######################################---%>

        <div class="modal fade in" id="modal-attainment" >
    <div class="modal-dialog">
    <div class="modal-content">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title">Add Educational Attainment</h4>
        </div>
        <div class="modal-body">
            <div class="form-group">
                <label>Level</label>
                <asp:dropdownlist id="ddl_level" CssClass="form-control" runat="server">
                    <asp:ListItem>Elementary</asp:ListItem>
                    <asp:ListItem>High School</asp:ListItem>
                    <asp:ListItem>College</asp:ListItem>
                    <asp:ListItem>Vocational</asp:ListItem>
                </asp:dropdownlist>
            </div>
        <div class="form-group">
            <label>School</label>
            <asp:Textbox ID="txt_school"  runat="server" CssClass="form-control"></asp:Textbox>
        </div>
        <div class="form-group">
            <label>Address</label>
            <asp:Textbox ID="txt_address"  runat="server" CssClass="form-control"></asp:Textbox>
        </div>
        <div class="form-group">
            <label>From</label>
            <asp:dropdownlist id="txt_yearf" CssClass="form-control" runat="server" ></asp:dropdownlist>
        </div>
        <div class="form-group">
        <label>To</label>
        <asp:dropdownlist id="txt_yeart" CssClass="form-control" runat="server"></asp:dropdownlist>
        </div>
        </div>
        <div class="modal-footer">
        <%--<asp:Button ID="Button7" runat="server" Text="ADD" CssClass="btn btn-primary" />--%>
        <button type="button" onclick="edhistory();" class="btn btn-primary">ADD</button>
         <%--OnClick="edhistory"--%>
        </div>
    </div>
    </div>
</div>
    
    
<div class="modal fade in" id="modal-jobhistory" >
    <div class="modal-dialog">
    <div class="modal-content">
        <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">Add Job History</h4>
        </div>
        <div class="modal-body">
            <div class="form-group">
                <label>Company</label>
                <asp:TextBox ID="txt_company" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="form-group">
                <label>Date from</label>
                <div class="row">
                    <div class="col-lg-6">
                        <div class="form-group">
                            <asp:dropdownlist id="txt_month" CssClass=" form-control" runat="server">
                                <asp:ListItem>Month</asp:ListItem>
                                <asp:ListItem>01</asp:ListItem>
                                <asp:ListItem>02</asp:ListItem>
                                <asp:ListItem>03</asp:ListItem>
                                <asp:ListItem>04</asp:ListItem>
                                <asp:ListItem>05</asp:ListItem>
                                <asp:ListItem>06</asp:ListItem>
                                <asp:ListItem>07</asp:ListItem>
                                <asp:ListItem>08</asp:ListItem>
                                <asp:ListItem>09</asp:ListItem>
                                <asp:ListItem>10</asp:ListItem>
                                <asp:ListItem>11</asp:ListItem>
                                <asp:ListItem>12</asp:ListItem>
                            </asp:dropdownlist>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="form-group">
                            <asp:dropdownlist id="txt_year" CssClass=" form-control" runat="server">
                            </asp:dropdownlist>
                        </div>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <label>Date To</label>
                <div class="row">
                    <div class="col-lg-6">
                        <div class="form-group">
                            <asp:dropdownlist id="txt_datetomonth" CssClass=" form-control" runat="server">
                                <asp:ListItem>Month</asp:ListItem>
                                <asp:ListItem>01</asp:ListItem>
                                <asp:ListItem>02</asp:ListItem>
                                <asp:ListItem>03</asp:ListItem>
                                <asp:ListItem>04</asp:ListItem>
                                <asp:ListItem>05</asp:ListItem>
                                <asp:ListItem>06</asp:ListItem>
                                <asp:ListItem>07</asp:ListItem>
                                <asp:ListItem>08</asp:ListItem>
                                <asp:ListItem>09</asp:ListItem>
                                <asp:ListItem>10</asp:ListItem>
                                <asp:ListItem>11</asp:ListItem>
                                <asp:ListItem>12</asp:ListItem>
                            </asp:dropdownlist>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="form-group">
                            <asp:dropdownlist id="txt_datetoyear" CssClass=" form-control" runat="server">
                            </asp:dropdownlist>
                        </div>
                    </div>
                </div>
            </div>
            <div class="form-group no-margin">
                <label>Position</label>
                <asp:TextBox ID="txt_position" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
        </div>
        <div class="modal-footer">
            <%--<asp:Button ID="Button5" runat="server"  Text="ADD" CssClass="btn btn-primary" />--%>
            <button type="button" onclick="openjobhist();" class="btn btn-primary">ADD</button>
            <%--OnClick="add_jobhistory"--%>
        </div>
    </div>
    </div>
</div>

<div class="modal fade in" id="modal-seminar" >
    <div class="modal-dialog">
    <div class="modal-content">
        <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">Add Seminar</h4>
        </div>
        <div class="modal-body">
            <div class="form-group">
                <label>Name</label>
                <asp:TextBox ID="txt_seminar" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="form-group">
                <label>Held</label>
                <asp:TextBox ID="txt_heldat" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="form-group">
                <label>Date</label>
                <asp:TextBox ID="txt_dateseminars" TextMode="Date"  runat="server" CssClass="form-control datee"></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:FileUpload ID="fuseminarsphoto" accept=".png,.jpg,.jpeg,.gif,.pdf,.tif,.bmp" runat="server"/>
            </div>
        </div>
        <div class="modal-footer">
            <asp:Button ID="btnseminarattended" runat="server"  Text="ADD" CssClass="btn btn-primary" />
            <%--OnClick="addseminarattended"--%>
        </div>
    </div>
    </div>
</div>



<div class="modal fade in" id="modal-preparatory" >
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title">ADD TRAINING</h4>
            </div>
            <div class="modal-body">
                <div class="form-group">
                  <div class="col-lg-9">
                      <div class="form-group">
                        <label>License Number</label>
                        <asp:TextBox ID="txt_license" runat="server" CssClass="form-control"></asp:TextBox>
                     </div>
                  </div>
                  <div class="col-lg-3">
                    <div class="form-group">
                     <label>Valid Until</label>
                    <asp:TextBox ID="txt_validity" TextMode="Date" runat="server" CssClass="form-control datee"></asp:TextBox>
                    </div>
                  </div>
                </div>
                <div class="form-group">
                  <div class="col-lg-9">
                    <div class="form-group">
                    <label>Location</label>
                    <asp:TextBox ID="txt_location" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                  </div>
                  <div class="col-lg-3">
                    <div class="form-group">
                    <label>Cost</label>
                    <asp:TextBox ID="txt_cost" runat="server" CssClass="form-control" onkeyup="decimalinput(this)"></asp:TextBox>
                    </div>
                  </div>
                </div>
                <div class="form-group">
                  <div class="col-lg-5">
                  <div class="form-group">
                    <label>Duration From</label>
                    <asp:TextBox ID="txt_durationfrom" TextMode="Date" ClientIDMode="Static" onchange="result();" runat="server" CssClass="form-control datee"></asp:TextBox>
                    </div>
                  </div>
                  <div class="col-lg-5">
                    <div class="form-group">
                    <label>Duration To</label>
                    <asp:TextBox ID="txt_durationto" TextMode="Date" ClientIDMode="Static" onchange="result();" runat="server"  CssClass="form-control datee"></asp:TextBox>
                    </div>
                  </div>
                  <div class="col-lg-2">
                    <div class="form-group">
                    <label>Day/s</label>
                    <asp:TextBox ID="txt_days" ClientIDMode="Static" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                  </div>
                </div>
                <div class="form-group">
                  <div class="col-lg-12">
                  <div class="form-group">
                    <label>Provider</label>
                    <asp:TextBox ID="txt_provider" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                  </div>
                </div>
                <div class="form-group">
                  <div class="col-lg-12">
                    <div class="form-group">
                    <label>Abouts</label>
                    <asp:TextBox ID="txt_about" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                  </div>
                </div>
                <div class="form-group">
                  <div class="col-lg-12">
                  <div class="form-group">
                    <label>Resources</label>
                    <asp:TextBox ID="txt_resources" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                  </div>
                </div>
                <div class="form-group">
                  <div class="col-lg-12">
                    <asp:FileUpload ID="fupreparatory" runat="server"/>
                  </div>
                </div>
            </div>
            <div class="modal-footer">
                <asp:Button ID="btntrining"  runat="server" Text="Add" CssClass="btn btn-default" />
               <%-- OnClick="preparatoryentry"--%>
            </div>
        </div>
    </div>
</div>
<div class="modal fade in" id="modal-skill" >
    <div class="modal-dialog">
    <div class="modal-content">
        <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">Add skill</h4>
        </div>
        <div class="modal-body">
             <div class="form-group">
                <label>Name</label>
                <asp:TextBox ID="txt_skill" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
        </div>
        <div class="modal-footer">
            <%--<asp:Button ID="Button8" runat="server" Text="ADD" CssClass="btn btn-primary" />--%>
            <button type="button" onclick="addskill();" class="btn btn-primary">ADD</button>
           <%-- OnClick="addss"--%>
        </div>
    </div>
    </div>
</div>

<div class="modal fade in" id="modal-emergency" >
    <div class="modal-dialog">
    <div class="modal-content">
        <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">Add Emergency Contact</h4>
        </div>
        <div class="modal-body">
             <div class="form-group">
                <label>Name</label>
                <asp:TextBox ID="txtnameemergency" runat="server" CssClass="form-control"></asp:TextBox>
             </div>
             <div class="form-group">
                <label>Address</label>
                <asp:TextBox ID="txtaddressemergency" runat="server" CssClass="form-control"></asp:TextBox>
             </div>
             <div class="form-group">
                <label>Contact Number/s</label>
                <asp:TextBox ID="txtcontactemergency" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
        </div>
        <div class="modal-footer">
            <%--<asp:Button ID="Button12" runat="server" Text="ADD" CssClass="btn btn-primary" />--%>
            <button type="button" onclick="addcontact();" class="btn btn-primary">ADD</button>
            <%-- OnClick="addemergencycontact"--%>
        </div>
    </div>
    </div>
</div>



<div class="modal fade in" id="modal-medical" >
    <div class="modal-dialog">
    <div class="modal-content">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title">Add Medical History</h4>
        </div>
        <div class="modal-body">
            <div class="form-group">
                <label>Hospital</label> <asp:LinkButton ID="lnkhost" runat="server" ToolTip="Add" CommandName='<%# Eval("Id") %>' Text="Add" data-toggle="modal" data-target="#modal-medical-hospital"><i class="fa fa-plus"></i></asp:LinkButton>
                <asp:DropDownList ID="ddl_medical" runat="server" CssClass="form-control"></asp:DropDownList>
            </div>
            <div class="form-group">
                <label>Illness</label> <asp:LinkButton ID="lnkill" runat="server" ToolTip="Add" CommandName='<%# Eval("Id") %>' Text="Add" data-toggle="modal" data-target="#modal-medical-illness"><i class="fa fa-plus"></i></asp:LinkButton>
                <asp:DropDownList ID="ddl_illness" runat="server" CssClass="form-control" ></asp:DropDownList>
            </div>
            <div class="form-group">
                <asp:TextBox ID="txt_meddate" Placeholder="Date" TextMode="Date" runat="server" CssClass="form-control datee"></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:TextBox ID="txt_medphysician" Placeholder="Physician" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="form-group">
                 <asp:Dropdownlist ID="ddlcondition" runat="server" Width="120px" CssClass="form-control">
                    <asp:ListItem Value="">Admitted</asp:ListItem><asp:ListItem Value="0">Yes</asp:ListItem><asp:ListItem Value="1">No</asp:ListItem>
                 </asp:Dropdownlist>
            </div>
            <div class="form-group">
                 <asp:Dropdownlist ID="ddlfindings" runat="server" Width="120px" CssClass="form-control">
                    <asp:ListItem Value="">Findings</asp:ListItem><asp:ListItem Value="0">Postive</asp:ListItem><asp:ListItem Value="1">Negative</asp:ListItem>
                 </asp:Dropdownlist>
            </div>
            <div class="form-group">
                <asp:TextBox ID="txt_mednote" Placeholder="Note..." runat="server" TextMode="MultiLine" CssClass="form-control datee"></asp:TextBox>
            </div>
            <asp:FileUpload ID="fuhostdoc" multiple runat="server" />
        </div>
        <div class="modal-footer">
            <%--<asp:Button ID="Button14" runat="server" Text="ADD"  CssClass="btn btn-primary" />--%>
            
            <button type="button" onclick="addmedicals();" class="btn btn-primary">ADD</button>
            <%--OnClick="savemedrec"--%>
        </div>
    </div>
    </div>
</div>



<div class="modal fade in" id="modal-medical-hospital" >
    <div class="modal-dialog">
    <div class="modal-content">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title">Hospital Details</h4>
        </div>
        <div class="modal-body">
            <div class="form-group">
                <label>Hospital</label> <asp:Label ID="Label15" runat="server" ForeColor="Red"></asp:Label>
                <asp:TextBox ID="txthostdesc" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="form-group">
                <label>Address</label>
                <asp:TextBox ID="txthostadd" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="form-group">
                <label>Contact</label>
                <asp:TextBox ID="txt_hostcont" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
        </div>
        <div class="modal-footer">
            <asp:Button ID="Button15" runat="server" Text="ADD"  CssClass="btn btn-primary" />
             <%--OnClick="savehost"--%>
        </div>
    </div>
    </div>
</div>

<div class="modal fade in" id="modal-medical-illness" >
    <div class="modal-dialog">
    <div class="modal-content">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title">Illness Details</h4>
        </div>
        <div class="modal-body">
            <div class="form-group">
                <label>Illness</label> <asp:Label ID="Label16" runat="server" ForeColor="Red"></asp:Label>
                <asp:TextBox ID="txtillness" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
        </div>
        <div class="modal-footer">
            <asp:Button ID="Button16" runat="server" Text="ADD"  CssClass="btn btn-primary" />
             <%--OnClick="addillness"--%>
        </div>
    </div>
    </div>
</div>


    </section>
    </div>
    <input type="hidden" id="hdepod" value="0" />
    <input type="hidden" id="hddpass" runat="server" value="0" />
    <input type="hidden" id="hduname" runat="server" value="0" />
    </form>
    <!-- jQuery 3 -->
    <script src="vendors/jquery/dist/jquery.min.js"></script>
    <!-- Bootstrap 3.3.7 -->
    <script src="vendors/bootstrap/dist/js/bootstrap.min.js"></script>
    <!-- FastClick -->
    <script src="vendors/fastclick/lib/fastclick.js"></script>
    <!-- AdminLTE App -->
    <script src="dist/js/adminlte.min.js"></script>
    <!-- AdminLTE for demo purposes -->
    <script src="dist/js/demo.js"></script>
    <script type="text/javascript" src="vendors/select2/dist/js/select2.full.min.js"></script>
    <script type="text/javascript">
      (function ($) {
        $('.select2').select2();
    })(jQuery);

    function auto_grow(element) {
        element.style.height = "5px";
        element.style.height = (element.scrollHeight) + "px";
    }

    function saveform() {

        var hireon = document.querySelector('input[name="hireon"]:checked').value;
        var quest1 = document.querySelector('input[name="quest1"]:checked').value;
        var quest2 = document.querySelector('input[name="quest2"]:checked').value;
        var quest3 = document.querySelector('input[name="quest3"]:checked').value;
        var quest4 = document.querySelector('input[name="quest4"]:checked').value;
        var quest5 = document.querySelector('input[name="quest5"]:checked').value;
        var quest6 = document.querySelector('input[name="quest6"]:checked').value;
        var quest7 = document.querySelector('input[name="quest7"]:checked').value;
        
        var quest=quest1+","+quest2+","+quest3+","+quest4+","+quest5+","+quest6+","+quest7;

        var positive = $("[id$=tAreaPositive]").val();
        var negative = $("[id$=tAreaNegative]").val();
        var forfurther = $("[id$=Textarea1]").val();
        var clicon=$("[id$=tAreaCon]").val();

        var appid=<%=this.appid %>;
        var userid=$("[id$=hdepod]").val();

        var userfname=$("[id$=itvb]").val();
        var userposition=$("[id$=postitionb]").val();

        console.log(hireon);
        console.log(quest1);
        console.log(quest2);
        console.log(quest3);
        console.log(quest4);
        console.log(quest5);
        console.log(quest6);
        console.log(quest7);
        
        console.log(positive);
        console.log(negative);
        console.log(forfurther);
        console.log(appid);
        console.log(userid);

         $.ajax({
            type: "POST",
            url: "form1/IEvaluationForm.aspx/savers",
            data: JSON.stringify({ appid:appid,hireon:hireon, quest:quest,positive:positive,negative:negative,forfurther:forfurther,userid:userid,userfname:userfname,userposition:userposition,clicon:clicon}),
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (data) {
                if(data.d.toString()=="")
                {
                    window.location.reload(false);
                }
                else
                {
                    alert("You don't have permission to access.The action has been recorded.");    
                }
            },
            error: function (xhr, status, error) {
                 alert(xhr.responseText);
            }
        });

        
    }

    function viewer(evs)
    {
    
         $.ajax({
            type: "POST",
            url: "form1/IEvaluationForm.aspx/viewers",
            data: JSON.stringify({ Id:evs}),
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (data) {
                if(data.d.toString()!=""){
                console.log("lad");
                    var result=data.d.split("~");
                    
                    var splitter=result[3].split(",");

                    $("input[name=gquest1][value=" + splitter[0] + "]").attr('checked', 'checked');
                    $("input[name=gquest2][value=" + splitter[1] + "]").attr('checked', 'checked');
                    $("input[name=gquest3][value=" + splitter[2] + "]").attr('checked', 'checked');
                    $("input[name=gquest4][value=" + splitter[3] + "]").attr('checked', 'checked');
                    $("input[name=gquest5][value=" + splitter[4] + "]").attr('checked', 'checked');
                    $("input[name=gquest6][value=" + splitter[5] + "]").attr('checked', 'checked');
                    $("input[name=gquest7][value=" + splitter[6] + "]").attr('checked', 'checked');
                    $("input[name=ghireon][value='" + result[0] + "']").attr('checked', 'checked');

                    $("[id$=gdate]").html(result[4]);
                    $("[id$=Textarea2]").val(result[1]);
                    $("[id$=Textarea3]").val(result[2]);
                    $("[id$=Textarea6]").val(result[8]);

                    $("[id$=Textarea4]").val(result[7]);
                    
                    $("[id$=Text1]").val(result[5]);
                    $("[id$=Text2]").val(result[6]);
                    
                   auto_grow(document.getElementById("Textarea4"));
                   auto_grow(document.getElementById("Textarea2"));
                   auto_grow(document.getElementById("Textarea3"));
                   auto_grow(document.getElementById("Textarea6"));

                    $("[id$=modalief"+evs+"]").click();
                }

            },
            error: function (xhr, status, error) {
                 alert(xhr.responseText);
            }
        });
        
        
    }

    function saverefform()
    {
        var quest1 = document.querySelector('input[name="rquest1"]:checked').value;
        var quest2 = document.querySelector('input[name="rquest2"]:checked').value;
        var quest3 = document.querySelector('input[name="rquest3"]:checked').value;
        var quest4 = document.querySelector('input[name="rquest4"]:checked').value;
        var quest5 = document.querySelector('input[name="rquest5"]:checked').value;
        var quest6 = document.querySelector('input[name="rquest6"]:checked').value;
        var quest7 = document.querySelector('input[name="rquest7"]:checked').value;
        var quest8 = document.querySelector('input[name="rquest8"]:checked').value;

        var quest=quest1+","+quest2+","+quest3+","+quest4+","+quest5+","+quest6+","+quest7+","+quest8;

        var txtref = $("[id$=txtref]").val();
        var txtcomp = $("[id$=txtcomp]").val();
        var txtpos = $("[id$=txtpos]").val();
        var txtstartemp = $("[id$=txtstartemp]").val();
        var txtsepemp = $("[id$=txtsepemp]").val();
        var txtlastpos = $("[id$=txtlastpos]").val();
        var txtvol = $("[id$=txtvol]").val();
        var txtremark = $("[id$=Textarea5]").val();

        var appid=<%=this.appid %>;
        var userid=$("[id$=hdepod]").val();

        var userfname=$("[id$=Text3]").val();
        var userdate=$("[id$=Text4]").val();


        $.ajax({
            type: "POST",
            url: "form1/IEvaluationForm.aspx/saversref",
            data: JSON.stringify({ appid:appid, quest:quest,txtref:txtref,txtcomp:txtcomp,txtpos:txtpos,txtstartemp:txtstartemp,txtsepemp:txtsepemp,txtlastpos:txtlastpos,txtvol:txtvol,txtremark:txtremark,userid:userid,userfname:userfname,userdate:userdate}),
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (data) {  
            
                if(data.d.toString()=="")
                {
                    window.location.reload(false);
                }
                else
                {
                    alert("You don't have permission to access.The action has been recorded.");    
                }
            },
            error: function (xhr, status, error) {
                 alert(xhr.responseText);
            }
        });
        console.log("dd");
    }

    function saveconform()
    { 
        var appid=<%=this.appid %>;
        var userid=$("[id$=hdepod]").val();
        var conEmpname=$("[id$=conEmpname]").val();
        var conDept=$("[id$=conDept]").val();
        var chkreq = document.querySelector('input[name="chkreq"]:checked').value;
        var conOthers = $("[id$=conOthers]").val();
        var conquest1 = $("[id$=conquest1]").val();
        var conquest2 = $("[id$=conquest2]").val();
        var conquest3 = $("[id$=conquest3]").val();
        var conquest4 = $("[id$=conquest4]").val();
        
        console.log(chkreq);

           $.ajax({
            type: "POST",
            url: "form1/IEvaluationForm.aspx/saverscon",
            data: JSON.stringify({ appid:appid, quest:chkreq,conOthers:conOthers,conquest1:conquest1,conquest2:conquest2,conquest3:conquest3,conquest4:conquest4,userid:userid,conEmpname:conEmpname,conDept:conDept}),
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (data) {
                if(data.d.toString()=="")
                {
                    window.location.reload(false);
                }
                else
                {
                    alert("You don't have permission to access.The action has been recorded.");    
                }
            },
            error: function (xhr, status, error) {
                 alert(xhr.responseText);
            }
        });

        
    }

  function viewerref(evs)
    {
         $.ajax({
            type: "POST",
            url: "form1/IEvaluationForm.aspx/viewersref",
            data: JSON.stringify({ Id:evs}),
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (data) {
                if(data.d.toString()!=""){
                    var result=data.d.split("~");
                    
                    var splitter=result[0].split(",");

                    $("input[name=fquest1][value=" + splitter[0] + "]").attr('checked', 'checked');
                    $("input[name=fquest2][value=" + splitter[1] + "]").attr('checked', 'checked');
                    $("input[name=fquest3][value=" + splitter[2] + "]").attr('checked', 'checked');
                    $("input[name=fquest4][value=" + splitter[3] + "]").attr('checked', 'checked');
                    $("input[name=fquest5][value=" + splitter[4] + "]").attr('checked', 'checked');
                    $("input[name=fquest6][value=" + splitter[5] + "]").attr('checked', 'checked');
                    $("input[name=fquest7][value=" + splitter[6] + "]").attr('checked', 'checked');
                    $("input[name=fquest8][value=" + splitter[7] + "]").attr('checked', 'checked');
                    
                    $("[id$=tref]").val(result[1]);
                    $("[id$=tcomp]").val(result[2]);
                    $("[id$=tpos]").val(result[3]);
                    $("[id$=tstartemp]").val(result[4]);
                    
                    $("[id$=tsepemp]").val(result[5]);
                    $("[id$=tlastpos]").val(result[6]);
                    $("[id$=tvol]").val(result[7]);
                    $("[id$=tremark]").val(result[8]);
                    $("[id$=Text10]").val(result[9]);
                    $("[id$=Text11]").val(result[10]);
                    
                   auto_grow(document.getElementById("tremark"));

                    $("[id$=btnref"+evs+"]").click();
                }

            },
            error: function (xhr, status, error) {
                 alert(xhr.responseText);
            }
        });
    }


    function viewercon(evs)
    {
         $.ajax({
            type: "POST",
            url: "form1/IEvaluationForm.aspx/viewerscon",
            data: JSON.stringify({ Id:evs}),
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (data) {
                if(data.d.toString()!=""){
                    var result=data.d.split("~");

                    $("input[name=cchkreq][value=" + result[0] + "]").attr('checked', 'checked');
                    
                    $("[id$=cdate]").html(result[1]);
                    $("[id$=cempname]").val(result[2]);
                    $("[id$=cdept]").val(result[3]);
                    $("[id$=cconquest1]").val(result[4]);
                    $("[id$=cconquest2]").val(result[5]);
                    $("[id$=cconquest3]").val(result[6]);
                    $("[id$=cconquest4]").val(result[7]);
                    
                   auto_grow(document.getElementById("cconquest1"));
                   auto_grow(document.getElementById("cconquest2"));
                   auto_grow(document.getElementById("cconquest3"));
                   auto_grow(document.getElementById("cconquest4"));

                    $("[id$=btncon"+evs+"]").click();
                }

            },
            error: function (xhr, status, error) {
                 alert(xhr.responseText);
            }
        });
    }

     function Confirm() {
        var confirm_value = document.getElementById("<%= TextBox1.ClientID %>")
        if (confirm("Are you sure to cancel this transaction?"))
        { confirm_value.value = "Yes"; } else { confirm_value.value = "No"; }
    } 

        function decimalinput(elem) {

        var input = !(/^[0-9.]+$/).test(elem.value) ? elem.value = elem.value.replace(/[^0-9.]/ig, '') : null;
        input = elem.value.split(",").join("");
        if (!IfNumeric(input))
            elem.value = addCommas(input.substring(0, input.length - 1));
        else
            elem.value = addCommas(input);
    }


    function parseDate(str) {
        return new Date(str);
    }

    function datediff(first, second) {
        return Math.round((second-first)/(1000*60*60*24));
    }

    function result()
    {
        var a=$("[id$=txt_durationfrom]").val();
        var b=$("[id$=txt_durationto]").val();

        $("[id$=txt_days]").val(datediff(parseDate(a),parseDate(b)));
        console.log("asd");
        console.log(a);
        console.log(b);
        console.log(datediff(parseDate(a), parseDate(b)));
    }

    function saveupdate()
    {
        var lname=$("[id$=txt_lname]").val();
        var fname=$("[id$=txt_fname]").val();
        var mname=$("[id$=txt_mname]").val();
        var sex=$("[id$=ddl_sex]").val();
        var dob=$("[id$=txt_dob]").val();
        var pob=$("[id$=txt_pob]").val();
        var bzc=$("[id$=ddl_bzc]").val();
        var peraddress=$("[id$=txt_permanentadress]").val();
        var preaddress=$("[id$=txt_presentaddres]").val();
        var zipcode=$("[id$=ddl_zipcode]").val();
        var religion=$("[id$=ddl_relegion]").val();
        var height=$("[id$=txt_height]").val();
        var weight=$("[id$=txt_weight]").val();
        var btype=$("[id$=ddl_bloodtype]").val();
        var health=$("[id$=txt_health]").val();
        var email=$("[id$=txt_email]").val();
        var pnumber=$("[id$=txt_pnumber]").val();
        var cnumber=$("[id$=txt_cnumber]").val();
        var sssno=$("[id$=txt_sssno]").val();
        var hdmfno=$("[id$=txt_hdmfno]").val();
        var phicno=$("[id$=txt_phicno]").val();
        var tin=$("[id$=txt_tin]").val();
        var gsisno=$("[id$=txt_gsisno]").val();
        var evs=$("[id$=lbid]").html();
        var cs=$("[id$=ddl_cs]").val();
        var citizenship=$("[id$=ddl_citizenship]").val();

        console.log(lname);
        console.log(fname);
        console.log(mname);
        console.log(sex);
        console.log(dob);
        console.log(pob);
        console.log(bzc);
        console.log(peraddress);
        console.log(preaddress);
        console.log(zipcode);
        console.log(cnumber);
        console.log(pnumber);
        console.log(email);
        console.log(cs);
        console.log(citizenship);
        console.log(religion);
        console.log(height);
        console.log(weight);
        console.log(btype);
        console.log(health);
        console.log(sssno);
        console.log(hdmfno);
        console.log(phicno);
        console.log(tin);
        console.log(gsisno);
        console.log(evs);

         $.ajax({
            type: "POST",
            url: "form1/IEvaluationForm.aspx/savepersonalinfo",
            data: JSON.stringify({ Id:evs,lname:lname,fname:fname,mname:mname,sex:sex,dob:dob,pob:pob,bzc:bzc,
                                    peraddress:peraddress,preaddress:preaddress,zipcode:zipcode,cnumber:cnumber,
                                    pnumber:pnumber,email:email,cs:cs,citizenship:citizenship,religion:religion,
                                    height:height,weight:weight,btype:btype,health:health,sssno:sssno,hdmfno:hdmfno,
                                    phicno:phicno,tin:tin,gsisno:gsisno}),
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (data) {
                
                alert("Data Successfully Updated.");
            
            },
            error: function (xhr, status, error) {
                 alert(xhr.responseText);
            }
        });
    }

    //00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
    function edhistory()
    {
        var level=$("[id$=ddl_level]").val();
        var school=$("[id$=txt_school]").val();
        var address=$("[id$=txt_address]").val();
        var yearf=$("[id$=txt_yearf]").val();
        var yeart=$("[id$=txt_yeart]").val();
        var evs=$("[id$=lbid]").html();

        console.log(level);
        console.log(school);
        console.log(address);
        console.log(yearf);
        console.log(yeart);
        console.log(evs);

        $.ajax({
        type: "POST",
        url: "form1/IEvaluationForm.aspx/addedhistory",
        data: JSON.stringify({Id:evs,level:level,school:school,address:address,yearf:yearf,yeart:yeart}),
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (data) {
            if(data.d.toString()!=""){    
            
            var array = data.d.toString().split('~');

            var tBody = $("#grid_educhistory1 > TBODY")[0];

            //Add Row.
            var row = tBody.insertRow(-1);

            var cell = $(row.insertCell(-1));
            cell.attr("class","dnone");
            cell.html(array[0]);

            cell = $(row.insertCell(-1));
            cell.html(array[1]);
            
            cell = $(row.insertCell(-1));
            cell.html(array[2]);
            
            cell = $(row.insertCell(-1));
            cell.html(array[3]);
            
            cell = $(row.insertCell(-1));
            cell.html(array[4]);
            
            cell = $(row.insertCell(-1));
            cell.html(array[5]);

            cell = $(row.insertCell(-1));
            cell.html("<a onclick='Remove(this);' id='"+array[0]+"' title='Delete' href='javascript:void(0)'><i class='fa fa-trash'></i></a>");

                $(".close").click();
            
            }
        },
        error: function (xhr, status, error) {
                alert(xhr.responseText);
        }
        });
    }

        function Remove(button) {
                var row = $(button).closest("TR");

                var evs=$(button).attr("id");
                console.log(evs);

                    $.ajax({
                    type: "POST",
                    url: "form1/IEvaluationForm.aspx/deleteedhistory",
                    data: JSON.stringify({Id:evs}),
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (data) {

                            if (confirm("Do you want to delete this row?")) {
                                var table = $("#grid_educhistory1")[0];
                                table.deleteRow(row[0].rowIndex);
                          }    
                
                    },
                    error: function (xhr, status, error) {
                            alert(xhr.responseText);
                    }
                    });
        }

        //1111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
        function openjobhist()
        {
        
        var company=$("[id$=txt_company]").val();
        var month=$("[id$=txt_month]").val();
        var year=$("[id$=txt_year]").val();
        var datetomonth=$("[id$=txt_datetomonth]").val();
        var datetoyear=$("[id$=txt_datetoyear]").val();
        var position=$("[id$=txt_position]").val();
        var evs=$("[id$=lbid]").html();

        console.log(company);
        console.log(month);
        console.log(year);
        console.log(datetomonth);
        console.log(datetoyear);
        console.log(evs);

        $.ajax({
        type: "POST",
        url: "form1/IEvaluationForm.aspx/addjobhistory",
        data: JSON.stringify({Id:evs,company:company,month:month,year:year,datetomonth:datetomonth,datetoyear:datetoyear,position:position}),
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (data) {
            if(data.d.toString()!=""){    
            
            var array = data.d.toString().split('~');

            var tBody = $("#grid_jobhistory1 > TBODY")[0];

            //Add Row.
            var row = tBody.insertRow(-1);

            var cell = $(row.insertCell(-1));
            cell.attr("class","dnone");
            cell.html(array[0]);

            cell = $(row.insertCell(-1));
            cell.html(array[1]);
            
            cell = $(row.insertCell(-1));
            cell.html(array[2]);
            
            cell = $(row.insertCell(-1));
            cell.html(array[3]);
            
            cell = $(row.insertCell(-1));
            cell.html(array[4]);

            cell = $(row.insertCell(-1));
            cell.html("<a onclick='Remove2(this);' id='"+array[0]+"' title='Delete' href='javascript:void(0)'><i class='fa fa-trash'></i></a>");

                $(".close").click();
                }
            },
            error: function (xhr, status, error) {
                    alert(xhr.responseText);
            }
            });
        }

        function Remove2(button){
                var row = $(button).closest("TR");

                var evs=$(button).attr("id");
                console.log(evs);

                    $.ajax({
                    type: "POST",
                    url: "form1/IEvaluationForm.aspx/deletejobhistory",
                    data: JSON.stringify({Id:evs}),
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (data) {

                            if (confirm("Do you want to delete this row?")) {
                                var table = $("#grid_jobhistory1")[0];
                                table.deleteRow(row[0].rowIndex);
                          }    
                
                    },
                    error: function (xhr, status, error) {
                            alert(xhr.responseText);
                    }
                    });
        }
        //222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222
        //333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333
        //444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444
        function addskill()
        {
        
        var skill=$("[id$=txt_skill]").val();
        var evs=$("[id$=lbid]").html();

        console.log(skill);
        console.log(evs);

        $.ajax({
        type: "POST",
        url: "form1/IEvaluationForm.aspx/addskills",
        data: JSON.stringify({Id:evs,skill:skill}),
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (data) {
            if(data.d.toString()!=""){    
            
            var array = data.d.toString().split('~');

            var tBody = $("#grid_skill1 > TBODY")[0];

            //Add Row.
            var row = tBody.insertRow(-1);

            var cell = $(row.insertCell(-1));
            cell.attr("class","dnone");
            cell.html(array[0]);

            cell = $(row.insertCell(-1));
            cell.html(array[1]);

            cell = $(row.insertCell(-1));
            cell.html("<a onclick='Remove5(this);' id='"+array[0]+"' title='Delete' href='javascript:void(0)'><i class='fa fa-trash'></i></a>");

                $(".close").click();
                }
            },
            error: function (xhr, status, error) {
                    alert(xhr.responseText);
            }
            });
        }

        function Remove5(button){
                var row = $(button).closest("TR");

                var evs=$(button).attr("id");
                console.log(evs);

                    $.ajax({
                    type: "POST",
                    url: "form1/IEvaluationForm.aspx/deleteskill",
                    data: JSON.stringify({Id:evs}),
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (data) {

                            if (confirm("Do you want to delete this row?")) {
                                var table = $("#grid_skill1")[0];
                                table.deleteRow(row[0].rowIndex);
                          }    
                
                    },
                    error: function (xhr, status, error) {
                            alert(xhr.responseText);
                    }
                    });
        }
        //555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
          function addcontact()
        {
        
        var name=$("[id$=txtnameemergency]").val();
        var address=$("[id$=txtaddressemergency]").val();
        var contact=$("[id$=txtcontactemergency]").val();
        var evs=$("[id$=lbid]").html();

        console.log(name);
        console.log(address);
        console.log(contact);
        console.log(evs);

        $.ajax({
        type: "POST",
        url: "form1/IEvaluationForm.aspx/addcontacts",
        data: JSON.stringify({Id:evs,name:name,address:address,contact:contact}),
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (data) {
            if(data.d.toString()!=""){    
            
            var array = data.d.toString().split('~');

            var tBody = $("#grid_emergencycontact > TBODY")[0];

            //Add Row.
            var row = tBody.insertRow(-1);

            var cell = $(row.insertCell(-1));
            cell.attr("class","dnone");
            cell.html(array[0]);

            cell = $(row.insertCell(-1));
            cell.html(array[1]);
            
            cell = $(row.insertCell(-1));
            cell.html(array[2]);
            
            cell = $(row.insertCell(-1));
            cell.html(array[3]);

            cell = $(row.insertCell(-1));
            cell.html("<a onclick='Remove6(this);' id='"+array[0]+"' title='Delete' href='javascript:void(0)'><i class='fa fa-trash'></i></a>");

                $(".close").click();
                }
            },
            error: function (xhr, status, error) {
                    alert(xhr.responseText);
            }
            });
        }

        function Remove6(button){
                var row = $(button).closest("TR");

                var evs=$(button).attr("id");
                console.log(evs);

                    $.ajax({
                    type: "POST",
                    url: "form1/IEvaluationForm.aspx/deletecontacts",
                    data: JSON.stringify({Id:evs}),
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (data) {

                            if (confirm("Do you want to delete this row?")) {
                                var table = $("#grid_emergencycontact")[0];
                                table.deleteRow(row[0].rowIndex);
                          }    
                
                    },
                    error: function (xhr, status, error) {
                            alert(xhr.responseText);
                    }
                    });
        }

        //6666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666
        function addmedicals()
        {
        
        var medical=$("[id$=ddl_medical]").val();
        var illness=$("[id$=ddl_illness]").val();
        var meddate=$("[id$=txt_meddate]").val();
        var pedhysician=$("[id$=txt_medphysician]").val();
        var condition=$("[id$=ddlcondition]").val();
        var findings=$("[id$=ddlfindings]").val();
        var mednote=$("[id$=txt_mednote]").val();
        var doc=$("[id$=fuhostdoc]").val();
        var evs=$("[id$=lbid]").html();

        console.log(medical);
        console.log(illness);
        console.log(meddate);
        console.log(pedhysician);
        console.log(condition);
        console.log(findings);
        console.log(mednote);
        console.log(doc);
        console.log(evs);

          if (window.FormData !== undefined) {

            var fileUpload = $("#fuhostdoc").get(0);
            var files = fileUpload.files;
            console.log(files);
               // Create FormData object
            var filedata = new FormData();
            
            // Looping over all files and add it to FormData object
            for (var i = 0; i < files.length; i++) {
            
            filedata.append(files[i].name, files[i]);
                console.log(files[i].name);
                console.log(files[i]);
                console.log(JSON.stringify(filedata));
            }

            // Adding one more key to FormData object
           filedata.append('username', "Manas");
           
                console.log(JSON.stringify(filedata));


               $.ajax({
                    type: "POST",
                    url: "form1/IEvaluationForm.aspx/addseminarattended",
                    data: filedata,
                    contentType: false,
                    processData: false,
                    success: function (data) {
                        console.log(data.d);    
                    },
                    error: function (xhr, status, error) {
                            alert(xhr.responseText);
                    }
                    });



        } else {
            alert("FormData is not supported.");
        }


        }

        function Remove7(button){
                var row = $(button).closest("TR");

                var evs=$(button).attr("id");
                console.log(evs);

                    $.ajax({
                    type: "POST",
                    url: "form1/IEvaluationForm.aspx/deletecontacts",
                    data: JSON.stringify({Id:evs}),
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (data) {

                            if (confirm("Do you want to delete this row?")) {
                                var table = $("#grid_emergencycontact")[0];
                                table.deleteRow(row[0].rowIndex);
                          }    
                
                    },
                    error: function (xhr, status, error) {
                            alert(xhr.responseText);
                    }
                    });
        }

        function checkempty()
        {
            var d=false;
               if($("[id$=ddl_attachclass]").val()!="")
               {
                    d=true;
                    $("[id$=lb_error]").attr("style","display:none;");
               }
               else
               {
                    $("[id$=lb_error]").attr("style","display:block; color:red;");
               }
            return d;
        }
    </script>
</body>
</html>
