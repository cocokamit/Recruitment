<%@ Page Language="C#" AutoEventWireup="true" CodeFile="user.aspx.cs" Inherits="content_Employee_user" MasterPageFile="~/content/NewMasterPage.master" %>

<asp:Content ID="head" runat="server" ContentPlaceHolderID="head">
<style type="text/css">
    .pcs-sub { float:left;}
    .PopUpPanel {left: 50%; margin-left:-200px}
    span.tag {-moz-border-radius: 2px;-webkit-border-radius: 2px;display: block;float: left;padding: 5px 9px;background: #1ABB9C;color: #F1F6F7;margin-right: 5px;font-weight: 500;margin-bottom: 5px;font-family: helvetica;}
    span.tag small{color:#eee}
    span.tag a { color:#fff; padding:0 3px 0 5px}
    span.tagx {-moz-border-radius: 2px;-webkit-border-radius: 2px;display: block;float: left;padding: 5px 9px;background: #BB251A;color: #F1F6F7;margin-right: 5px;font-weight: 500;margin-bottom: 5px;font-family: helvetica;}
    span.tagx    small{color:#eee}
    span.tagx a { color:#fff; padding:0 3px 0 5px}
    .hide { display:none}
</style>
<script type="text/javascript">

    function change_type() {
        document.getElementById("div_con").innerHTML = "";
        document.getElementById("tb_desig").value = "";
        document.getElementById("tb_desig_text").value ="";
        document.getElementById("div_con_b").innerHTML = "";
        document.getElementById("TextBox2").value = "";
        document.getElementById("TextBox3").value ="";
    }

    function click_add() {
        var type = document.getElementById("ddl_usertype").value;
        var elem = document.getElementById("drop_type");
        var sel = elem.options[elem.selectedIndex].text;
        string = document.getElementById("tb_desig").value;
        if (type != "select") {
            if (string.search(elem.value + " ") < 0) {
                if (type == "Manager") {
                    document.getElementById("div_con").innerHTML += "<span id='" + elem.value + "' title='" + sel + "' class='tag'><span>" + sel + "</span><small> | </small><a href='javascript:void(0)' onclick='click_remove(" + elem.value + ")'>x</a></span>";
                    document.getElementById("tb_desig").value += elem.value + " ";
                    document.getElementById("tb_desig_text").value += sel + "_";
                }

                if (type == "Hr") {
                    document.getElementById("div_con").innerHTML = "<span id='" + elem.value + "' title='" + sel + "' class='tag'><span>" + sel + "</span><small> | </small><a href='javascript:void(0)' onclick='click_remove(" + elem.value + ")'>x</a></span>";
                    document.getElementById("tb_desig").value = elem.value + " ";
                    document.getElementById("tb_desig_text").value = sel + "_";
                }
            } 
        }
        else
            alert("Please Select UserType!!!");
    }

    function click_aa() {
        var type = document.getElementById("TextBox4").value;
        var elem = document.getElementById("drop_deg");
        var sel = elem.options[elem.selectedIndex].text;
        string = document.getElementById("TextBox2").value;
        if (string.search(elem.value + " ") < 0 && elem.value.length > 0) {
            if (type == "Manager") {
                document.getElementById("div_con_b").innerHTML += "<span id='" + elem.value + "' title='" + sel + "' class='tag'><span>" + sel + "</span><small> | </small><a href='javascript:void(0)' onclick='click_ar(" + elem.value + ")'>x</a></span>";
                document.getElementById("TextBox2").value += elem.value + " ";
                document.getElementById("TextBox3").value += sel + "_";
            }
            if (type == "HR_sub") {
                document.getElementById("div_con_b").innerHTML = "<span id='" + elem.value + "' title='" + sel + "' class='tag'><span>" + sel + "</span><small> | </small><a href='javascript:void(0)' onclick='click_ar(" + elem.value + ")'>x</a></span>";
                document.getElementById("TextBox2").value = elem.value + " ";
                document.getElementById("TextBox3").value = sel + "_";
            }

        }
    }

    function click_remove(id) {
        var oi = document.getElementById(id).title;
        document.getElementById(id).remove();
        document.getElementById("tb_desig").value = document.getElementById("tb_desig").value.replace(id + " ", "");
        document.getElementById("tb_desig_text").value = document.getElementById("tb_desig_text").value.replace(oi + "_", "");
    }

    function click_ar(id) {
        var oi = document.getElementById(id).title;
        document.getElementById(id).remove();
        document.getElementById("TextBox2").value = document.getElementById("TextBox2").value.replace(id + " ", "");
        document.getElementById("TextBox3").value = document.getElementById("TextBox3").value.replace(oi + "_", "");
    }
</script>
</asp:Content>
<asp:Content ContentPlaceHolderID="content" ID="content_user" runat="server">
<section class="content-header">
    <h1>User Management</h1>
    <ol class="breadcrumb">
    <li><a href="dashboard"><i class="fa fa-dashboard"></i> Home</a></li>
    <li class="active">User Management</li>
    </ol>
</section>
<section class="content">
 <div class="row">
        <div class="col-xs-12">
          <div class="box box-primary">
            <div class="box-header">
                <div class="input-group input-group-sm" style="width: 300px;">
                  <asp:TextBox ID="TextBox5" runat="server" class="form-control pull-right" AutoPostBack="true" placeholder="Search"></asp:TextBox>
                  <div class="input-group-btn">
                    <asp:LinkButton ID="lb_search" OnClick="searchUser" runat="server" class="btn btn-default"><i class="fa fa-search"></i></asp:LinkButton>
                  </div>
                </div>
                <div class="box-tools box-tool-add">
                    <asp:LinkButton ID="lb_add" runat="server" OnClick="click_add" CssClass="btn btn-block btn-primary">Add</asp:LinkButton>
                </div>
            </div>
            <div class="box-body table-responsive padding no-pad-top">
                <asp:Label ID="lbl_del_notify" runat="server" style=" position:absolute; right:120px; margin:15px; font-size:11px; " ></asp:Label>
                 <div id="alert" runat="server" class="alert alert-info alert-dismissible">
                    <h4><i class="icon fa fa-check-circle"></i> No record found</h4>
                 </div>
                 <asp:GridView ID="grid_view" runat="server" CssClass="table table-bordered table-hover dataTable" AutoGenerateColumns="false">
                    <Columns>
                        <asp:BoundField DataField="id" HeaderStyle-CssClass="hide" ItemStyle-CssClass="hide"/>
                        <asp:BoundField DataField="ngalan" HeaderText="Name" SortExpression="ngalan" />
                        <asp:BoundField DataField="username" HeaderText="Username" SortExpression="username" />
                        <asp:BoundField DataField="password" HeaderText="Password" SortExpression="password" />
                        <asp:BoundField DataField="designation" HeaderText="Designation" SortExpression="designation" />
                        <asp:BoundField DataField="description" HeaderText="Property" SortExpression="description" />
                        <asp:TemplateField HeaderText="Action">
                            <ItemTemplate>
                                <asp:LinkButton ID="lnk_edit" OnClick="view" runat="server" CssClass="fa fa-pencil"></asp:LinkButton>
                                <asp:LinkButton ID="lnk_delete" OnClientClick="Confirm(this,'delete')" OnClick="delete" runat="server" CssClass="fa fa-trash no-border no-pad-right"></asp:LinkButton>
                            </ItemTemplate>
                            <ItemStyle Width="70px" CssClass="action" />
                        </asp:TemplateField>
                    </Columns>
                 </asp:GridView>
            </div>
          </div>
        </div>
      </div>
</section>

<div id="modaladd" runat="server" class="modal fade in">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <asp:LinkButton ID="LinkButton1" runat="server" OnClick="click_close" class="close" aria-hidden="true"><span aria-hidden="true">&times;</span></asp:LinkButton>
                <h4 class="modal-title">Add New User</h4>
            </div>
            <div class="modal-body">
                <div class="form-group">
                    <label>Name</label> <asp:Label ID="lbl_name" runat="server"  ForeColor="Red"></asp:Label>
                    <asp:TextBox ID="txt_name" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label>Username</label> <asp:Label ID="lbl_user" runat="server"  ForeColor="Red"></asp:Label>
                    <asp:TextBox ID="txt_uname" runat="server"  CssClass="form-control"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label>Password</label> <asp:Label ID="lbl_pass" runat="server"  ForeColor="Red"></asp:Label>
                    <asp:TextBox ID="txt_pwd" runat="server"  CssClass="form-control"></asp:TextBox>
                </div>
                 <div class="form-group">
                    <label>User Type</label><asp:Label ID="lbl_type" runat="server"  ForeColor="Red"></asp:Label>
                    <asp:DropDownList ID="ddl_usertype"  ClientIDMode="Static"  Height="40px" onchange="change_type()" runat="server"  CssClass="form-control">
                        <asp:ListItem Selected disabled>select</asp:ListItem>
                        <asp:ListItem>Manager</asp:ListItem>
                        <asp:ListItem>HR</asp:ListItem>
                     </asp:DropDownList>
                </div>
                <div class="form-group">
                    <label>Property</label><asp:Label ID="lbl_loc" runat="server"  ForeColor="Red"></asp:Label>
                    <asp:DropDownList ID="drop_loc"  CssClass="form-control" Height="40px" runat="server" DataSourceID="SqlDataSource2" AppendDataBoundItems="true" DataTextField="description" DataValueField="id">
                        <asp:ListItem Selected disabled></asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="form-group">
                    <label>Designation</label><asp:Label ID="lbl_des" runat="server"  ForeColor="Red"></asp:Label>
                    <div ID="div_con" runat="server" ClientIDMode="Static" style=" width: 100%"></div>
                    <asp:DropDownList ID="drop_type" ClientIDMode="Static" Height="40px" runat="server" CssClass="form-control"
                    DataSourceID="SqlDataSource1" AppendDataBoundItems="true" DataTextField="job_type" 
                    DataValueField="jobtype_id">
                    <asp:ListItem Selected disabled></asp:ListItem>
                    </asp:DropDownList>
                    <a class="btn pull-left" onclick="click_add()" >Add</a>
                </div>
            </div>
            <div class="modal-footer">
                <asp:Button ID="Button3" runat="server" Text="Save" OnClick="save" CssClass="btn btn-primary" />
            </div>
        </div>
    </div>
</div> 

<div id="modaledit" runat="server" class="modal fade in">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <asp:LinkButton ID="LinkButton2" runat="server" OnClick="click_close" class="close" aria-hidden="true"><span aria-hidden="true">&times;</span></asp:LinkButton>
                <h4 class="modal-title">Property Transfer</h4>
            </div>
            <div class="modal-body">
                <div class="form-group">
                    <label>Name</label> <asp:Label ID="l_name" runat="server" ForeColor="Red"></asp:Label>
                    <asp:TextBox ID="txt_namee" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label>Username</label> <asp:Label ID="l_user" runat="server" ForeColor="Red"></asp:Label>
                    <asp:TextBox ID="txt_username" runat="server"  CssClass="form-control"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label>Password</label> <asp:Label ID="l_pass" runat="server" ForeColor="Red"></asp:Label>
                    <asp:TextBox ID="txt_password" runat="server"  CssClass="form-control"></asp:TextBox>
                </div>
                <div id="panel_location" runat="server" class="form-group">
                    <label>Location</label> <asp:Label ID="l_loc" runat="server" ForeColor="Red"></asp:Label>
                    <asp:DropDownList ID="drop_location" AppendDataBoundItems="true" Height="40px"  CssClass="form-control" runat="server"></asp:DropDownList>
                </div>
                <div id="panel_designation" runat="server" class="form-group">
                    <label>Designation</label> <asp:Label ID="l_desig" runat="server" ForeColor="Red"></asp:Label>
                    <div ID="div_con_b" runat="server" ClientIDMode="Static" style ="width:340px"></div>
                    <asp:DropDownList ID="drop_deg" ClientIDMode="Static" Height="40px"  CssClass="form-control" runat="server" AppendDataBoundItems="true"></asp:DropDownList>
                    <a class="btn" onclick="click_aa()" style="font-size:10px; float:right; margin-top:-2px; margin-right:0px;">Add</a>
                </div>
            </div>
            <div class="modal-footer">
                <asp:Button ID="Button2" runat="server" Text="Update" OnClick="edit" CssClass="btn btn-primary" />
                <asp:Label ID="l_e_m" runat="server" ForeColor="Red" CssClass="pull-left"></asp:Label>
            </div>
        </div>
    </div>
</div> 
 
<asp:HiddenField ID="hf_id" runat="server" />
<asp:HiddenField ID="hf_designation" runat="server" />
<asp:TextBox ID="TextBox1" runat="server" CssClass="hide"></asp:TextBox>   
<asp:TextBox ID="tb_desig" runat="server" ClientIDMode="Static"  CssClass="hide"></asp:TextBox>
<asp:TextBox ID="tb_desig_text" runat="server" ClientIDMode="Static" CssClass="hide"></asp:TextBox>
<asp:TextBox ID="TextBox2" runat="server" ClientIDMode="Static" CssClass="hide"></asp:TextBox>
<asp:TextBox ID="TextBox3" runat="server" ClientIDMode="Static" CssClass="hide"></asp:TextBox>
<asp:TextBox ID="TextBox4" ClientIDMode="Static" runat="server" CssClass="hide"></asp:TextBox>

<asp:SqlDataSource ID="SqlDataSource1" runat="server" 
ConnectionString="<%$ ConnectionStrings:dbconnection %>" 
SelectCommand="SELECT [job_type], [jobtype_id] FROM [JobType] where status is null">
</asp:SqlDataSource>

<asp:SqlDataSource ID="SqlDataSource2" runat="server" 
ConnectionString="<%$ ConnectionStrings:dbconnection %>" 
SelectCommand="SELECT [description],[id] FROM location where status is null">
</asp:SqlDataSource>

<script type="text/javascript">
    function Confirm(msg) {
        var confirm_value = document.getElementById("<%= TextBox1.ClientID %>")
        if (confirm("Are you sure to delete user?"))
            confirm_value.value = "Yes";
        else
            confirm_value.value = "No";
    }
</script>
</asp:Content>


