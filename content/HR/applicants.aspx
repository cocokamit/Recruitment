<%@ Page Language="C#" AutoEventWireup="true" CodeFile="applicants.aspx.cs" Inherits="content_HR_applicants" ValidateRequest = "false" MasterPageFile="~/content/NewMasterPage.master" %>
<%@ Import Namespace="System.Data" %>
<asp:Content ID="accounting_hide" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="vendors/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css"/>
    <link href="vendors/select2/dist/css/select2.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
    .widget-user-2 .widget-user-image > img { width:115px !important}
    .widget-user-2 .widget-user-username, .widget-user-2 .widget-user-desc {margin-left: 140px;}
     #modal_email { border:1px solid red !important}
    </style>
</asp:Content>

<asp:Content ContentPlaceHolderID="content" runat="server" ID="content_user">
<asp:ScriptManager ID="myScriptManager" runat="server"></asp:ScriptManager>
<section class="content-header">
    <h1>Applicant</h1>
    <ol class="breadcrumb">
    <li><a href="dashboard"><i class="fa fa-dashboard"></i> Home</a></li>
    <li class="active">Applicant</li>
    </ol>
</section>
<section class="content">
 <div class="row">
    <div class="col-xs-12">
        <div class="box box-primary">
        <div class="box-header">
            <div class="input-group input-group-sm" style="width: 300px;">
                <asp:TextBox ID="txt_name" runat="server" class="form-control pull-right" OnTextChanged="search" AutoPostBack="true" placeholder="Search"></asp:TextBox>
                <div class="input-group-btn">
                <asp:LinkButton ID="lb_search" runat="server" OnClick="search" class="btn btn-default"><i class="fa fa-search"></i></asp:LinkButton>
                </div>
            </div>
            <div class="box-tools box-tool-add">
                <asp:LinkButton ID="lb_advance" runat="server" OnClick="click_advance" CssClass="fa fa-sliders" ToolTip="Advance search" style="margin:8px"></asp:LinkButton>
                <asp:LinkButton ID="lb_refresh" runat="server" OnClick="click_refresh" CssClass="fa fa-refresh" ToolTip="Refresh" style="margin:8px"></asp:LinkButton>
                <asp:LinkButton ID="lnk_delete" runat="server" OnClientClick="Confirm(this,'delete')" OnClick="delete" CssClass="fa fa-trash-o" ToolTip="Delete" style="margin:8px"></asp:LinkButton>
            </div>
        </div>
        <div class="box-body table-responsive padding no-pad-top">
            <div id="alert" runat="server" class="alert alert-info alert-dismissible">
                <h4><i class="icon fa fa-check-circle"></i> No record found</h4>
            </div>
            <div id="advance" runat="server" visible="false" clientidmode="Static" class="row alert alert-info alert-dismissible advance">
                <div class="col-md-4 ">
                    <div class="form-group">
                        <label>Status</label>
                        <asp:DropDownList ID="drop_stat" runat="server"  AutoPostBack="true" OnTextChanged="search" style="color:#000">
                        </asp:DropDownList>
                    </div>
                    <div class="form-group">
                        <label>Position</label>
                        <asp:DropDownList ID="drop_typee" runat="server" DataSourceID="SqlDataSource3" AppendDataBoundItems="true"  AutoPostBack="true" OnTextChanged="search" DataTextField="job_subject" DataValueField="job_subject">
                            <asp:ListItem></asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group">
                        <label>Property</label>
                            <asp:DropDownList ID="drop_proper" runat="server" DataSourceID="SqlDataSource5" AutoPostBack="true" OnTextChanged="search" AppendDataBoundItems="true" DataTextField="description" DataValueField="id">
                            <asp:ListItem ></asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="form-group">
                        <label>Special Skills</label>
                        <asp:TextBox ID="txt_skills" runat="server" AutoPostBack="true" OnTextChanged="search"  CssClass="form-control"></asp:TextBox>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group">
                        <label>From</label>
                        <asp:TextBox ID="txt_from" runat="server" type="date" AutoPostBack="true" OnTextChanged="search" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label>To</label>
                        <asp:TextBox ID="txt_to" runat="server"  type="date" AutoPostBack="true" OnTextChanged="search" CssClass="form-control"></asp:TextBox>
                    </div>
                </div>
                </div>
            <asp:GridView ID="grid_app" runat="server" AutoGenerateColumns="False" EmptyDataText="No record found" onrowdatabound="grid_app_RowDataBound" CssClass="table table-bordered table-hover dataTable" AllowSorting="True" OnSorting="gridItemSorting" AllowPaging="true" OnPageIndexChanging="OnPageIndexChanging" PageSize="15">
                <Columns>
                    <asp:BoundField DataField="id" HeaderStyle-CssClass="hide" ItemStyle-CssClass="hide"/>
                    <asp:TemplateField ItemStyle-Width="30px">
                        <HeaderTemplate>
                            <asp:CheckBox ID="chkboxSelectAll" runat="server" AutoPostBack="true" OnCheckedChanged="chkboxSelectAll_CheckedChanged" />
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:CheckBox ID="chkEmp" runat="server" onclick="CheckBoxCount();"></asp:CheckBox>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="date_app" SortExpression="date_app" HeaderText="Date" dataformatstring="{0:MM/dd/yyyy}" />
                    <asp:TemplateField HeaderText="Name" SortExpression="name">
                        <ItemTemplate>
                            <asp:LinkButton ID="lnk_editStat" runat="server" OnClick="click_view" Text='<%# Bind("name") %>'></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Position Desired" SortExpression="pos_desire">
                        <ItemTemplate>
                            <a class="addpos" data-id="<%# Eval("id") %>" data-toggle="modal" data-target="#modal-default" href="javascript:void(0)"><%# Eval("pos_desire") %></a>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Property" SortExpression="property">
                        <ItemTemplate>
                            <asp:LinkButton ID="lb_pro" runat="server" OnClick="single_trans" Text='<%# Bind("property") %>'></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField SortExpression="status" HeaderText="Status">
                        <ItemTemplate>
                            <asp:LinkButton ID="lnk_st" runat="server" CssClass=" text-lowercase label pull-right label-" Text='<%# Bind("status") %>'></asp:LinkButton>
                        </ItemTemplate>
                        <ItemStyle Width="80px" />
                    </asp:TemplateField>
                    <asp:BoundField DataField="recommendation"  HeaderStyle-CssClass="hide" ItemStyle-CssClass="hide"/>
                    <asp:TemplateField  HeaderStyle-CssClass="hide" ItemStyle-CssClass="hide">
                        <ItemTemplate> 
                            <asp:LinkButton ID="lnk_con" CssClass="label label-info" runat="server" OnClick="check_chk" OnClientClick="ConfirmRem()" Text="Recommendation"></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                      <asp:TemplateField>
                        <ItemTemplate>
                            <asp:LinkButton ID="lnk_allow" runat="server" OnClick="click_allow"><i class="fa fa-group"></i></asp:LinkButton>
                        </ItemTemplate>
                        <ItemStyle Width="30px" />
                    </asp:TemplateField>
                </Columns>
                <HeaderStyle CssClass="GridviewScrollHeader" /> 
                <RowStyle CssClass="GridviewScrollItem" /> 
                <PagerSettings FirstPageText="First" LastPageText="Last" NextPageText="Next" PreviousPageText="Previous" />
                <PagerStyle CssClass="GridviewScrollPager" HorizontalAlign="Right" /> 
            </asp:GridView>
            <asp:Label ID="lbl_del_notify" runat="server" style=" position:absolute; margin:-16px 0 0 0px"></asp:Label> 
        </div>
        </div>
    </div>
 </div>
</section>

<div id="modalinfo" runat="server" class="modal fade in" >
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
            <asp:LinkButton ID="LinkButton3" runat="server" OnClick="note_close" class="close" aria-hidden="true"><span aria-hidden="true">&times;</span></asp:LinkButton>
                <h4 class="modal-title">Applicant Information</h4>
            </div>
            <div class="modal-body" >
            <div class="box box-widget widget-user">
                <div class="widget-user-header bg-aqua-active">
                  <h3 class="widget-user-username"><a href="appldet?app_id=<%= ViewState["app_id"]%>" style="color:#fff"><%= ViewState["applicant"]%></a></h3>
                  <h5 class="widget-user-desc"><%= ViewState["position"]%></h5>
                </div>
                <div class="widget-user-image">
                  <img class="img-circle" src="<%= ViewState["profile"] %>" alt="User Avatar">
                </div>
            </div>
            <div class="form-group">
                <label  class="col-sm-5 control-label ">Applicant Code</label>
                <label  class="col-sm-7 control-label text-primary font-normal">
                 <asp:LinkButton ID="lb_download" runat="server" CssClass="text-primary text-bold" OnClick="click_dl"><%= ViewState["app_no"]%></asp:LinkButton>
                </label>
            </div> <div class="clearfix"></div>
            <div class="form-group">
                <label  class="col-sm-5 control-label ">Gender</label>
                <label  class="col-sm-7 control-label text-primary font-normal"><%= ViewState["gender"] %></label>
            </div> <div class="clearfix"></div>
            <div class="form-group">
                <label  class="col-sm-5 control-label ">Birthday</label>
                <label  class="col-sm-7 control-label text-primary font-normal"><%= ViewState["birth"]%></label>
            </div> <div class="clearfix"></div>
            <div class="form-group">
                <label  class="col-sm-5 control-label ">Address</label>
                <label  class="col-sm-7 control-label text-primary text-capitalize font-normal"><%= ViewState["address"]%></label>
            </div> <div class="clearfix"></div>
            <div class="form-group">
                <label  class="col-sm-5 control-label ">Cellphone No.</label>
                <label  class="col-sm-7 control-label text-primary font-normal"><%= ViewState["contact"]%></label>
            </div> <div class="clearfix"></div>
            <div class="form-group">
                <label  class="col-sm-5 control-label ">E-mail</label>
                <label  class="col-sm-7 control-label text-primary font-normal"><%= ViewState["email"]%></label>
            </div> <div class="clearfix"></div>
            <div class="form-group">
                <label  class="col-sm-5 control-label ">Educational Attainment</label>
                <label  class="col-sm-7 control-label text-primary font-normal"><%= ViewState["school"]%></label>
            </div> <div class="clearfix"></div>
             <div class="form-group">
                <label  class="col-sm-5 control-label ">Degree</label>
                <label  class="col-sm-7 control-label text-primary font-normal"><%= ViewState["degree"]%></label>
            </div> <div class="clearfix"></div>
            <div class="form-group">
                <label  class="col-sm-5 control-label ">Latest Employment</label>
                <label  class="col-sm-7 control-label text-primary font-normal"><%= ViewState["employeement"]%></label>
            </div> <div class="clearfix"></div>
            <div class="form-group">
                <label  class="col-sm-5 control-label ">Special Skills</label>
                <label  class="col-sm-7 control-label text-primary font-normal text-capitalize"><%= ViewState["skills"]%></label>
            </div> <div class="clearfix"></div>
            <div class="form-group">
                <label  class="col-sm-5 control-label ">Link</label>
                <label  class="col-sm-7 control-label text-primary font-normal text-capitalize"><a id="emplinker" href='<%= ViewState["emplink"]%>' target="_blank"><%= ViewState["emplink"]%></a></label>
            </div> <div class="clearfix"></div>
            <div id="div_referral" runat="server" class="form-group">
                <label  class="col-sm-5 control-label ">Referral Details</label>
                <label  class="col-sm-7 control-label text-primary font-normal">referral</label>
            </div> <div class="clearfix"></div>
            <br />
            <h4 class="modal-title text-bold pad">Applicant Acivity</h4>
            <table class="table no-margin">
            <tr>
                <td>Application</td>
                <td style="width: 40px"><asp:Label ID="l_app" runat="server" CssClass="badge bg-green pull-right"></asp:Label></td>
            </tr>
            <% 
               DataTable dt = (DataTable)ViewState["act_log"];
               if (dt != null)
               {
                   foreach (DataRow row in dt.Rows)
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
            </div>
            <div class="clearfix"></div>
            <div class="modal-footer">
                <div id="sub-footer">
                    <asp:LinkButton ID="lb_mail" runat="server" OnClick="click_mail" CssClass="btn btn-primary pull-left">E-Mail</asp:LinkButton>
                    <a id="forward-open" ToolTip="Forward" href="javascript:void(0)" class="btn fa fa-mail-forward (alias)"></a>
                </div>
                <div id="forward" class="hide">
                    <div class="clearfix"></div> 
                    <div class="form-group with-border">
                        <label class="pull-left" >Send to</label>
                        <button id="forward-close" type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
                        <asp:TextBox ID="tb_mail" runat="server" type="Email" CssClass="form-control"></asp:TextBox>
                        <asp:Button ID="b_forward" runat="server" ClientIDMode="Static" OnClick="click_forwardmail" CssClass="btn btn-primary pull-left" Text="Send" style=" margin-top:5px"/>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div> 

<div class="modal fade in" id="modal_email" runat="server" >
    <div class="modal-dialog">
    <div class="modal-content">
        <div class="modal-header">
        <asp:LinkButton ID="LinkButton4" runat="server" OnClick="note_close" class="close" aria-hidden="true" style=" margin:10px 5px"><span aria-hidden="true">&times;</span></asp:LinkButton>
        <h4 class="modal-title"><asp:Label ID="l_name" runat="server"></asp:Label> <small><i>(<asp:Label ID="l_pos" runat="server"></asp:Label>)</i></small></h4>
        <small>(<%= ViewState["email"] %>)</small>
        </div>
        <div class="modal-body">
            <div class="row">
            <div class="col-lg-6"> 
                <div class="form-group">
                    <label>Action</label> <asp:Label ID="l_MailAction" runat="server" CssClass="text-danger"></asp:Label>
                    <asp:DropDownList ID="ddl_action" runat="server"></asp:DropDownList>
                </div>
            </div>
            <div class="col-lg-6"> 
                <div class="form-group">
                    <label>Template</label>
                    <asp:DropDownList ID="ddl_template" runat="server" AutoPostBack="true" OnTextChanged="onchange_mail"> </asp:DropDownList>
                </div>
            </div>
            </div>
         <asp:Label ID="l_MailMessage" runat="server" CssClass="text-danger"></asp:Label>    
        <asp:TextBox ID="compose_textarea" ClientIDMode="Static" TextMode="MultiLine" runat="server" CssClass="form-control editor" Height="500px"></asp:TextBox>
        </div>
        <div class="modal-footer">
            <div id="mail_footer">
                <asp:LinkButton ID="LinkButton5" runat="server" OnClick="click_closemail" class="btn btn-default pull-left" aria-hidden="true">Back</asp:LinkButton>
                <asp:Button ID="b_SubmitMail" ClientIDMode="Static" runat="server" CssClass="btn btn-primary" Text="Save Changes" OnClick="Click_SubmitMail"/>
            </div>
            <div id="mail_loader" style=" display: none">
                <img src="dist/img/loader.gif" alt="Alternate Text" />
            </div>
        </div>
    </div>
    </div>
</div>
 
<div class="modal fade in" id="modal-default" >
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">Default Modal</h4>
            </div>
            <div class="modal-body">
                <asp:ListBox runat="server" ID="drop_type" ClientIDMode="Static" SelectionMode="multiple" CssClass="select2" data-placeholder="Select a position" Width="100%">
                </asp:ListBox> 
            </div>
            <div class="modal-footer">
                <button id="btn_submit" type="button" class="btn btn-primary" data-dismiss="modal" aria-label="Close">Save changes</button>
            </div>
        </div>
    </div>
</div> 

<div id="modalremarks" runat="server" class="modal fade in">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <asp:LinkButton ID="lb_closenote" runat="server" OnClick="note_close" class="close" aria-hidden="true"><span aria-hidden="true">&times;</span></asp:LinkButton>
                <h4 class="modal-title">Remarks</h4>
            </div>
            <div class="modal-body">
                <asp:TextBox ID="txt_note" CssClass="form-control" Rows="10" TextMode="MultiLine" runat="server"></asp:TextBox>
            </div>
            <div class="modal-footer">
                <asp:Button ID="Button3" runat="server" OnClick="save_remarks" Text="Save changes" CssClass="btn btn-primary" />
            </div>
        </div>
    </div>
</div> 

<div class="modal fade in" id="Div1" >
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
            <button type="button" class="close" onclick="emailback()" aria-label="Close">
                <span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">Address Not Found</h4>
            </div>
            <div class="modal-body">
                <textarea class="form-control" rows="2" readonly="readonly" style="resize:none;"  cols="max">Your message wasn't delivered. It seems the user's email address was not provided in HRIS.</textarea>
                <br />
                <label>You can try other email address:</label>
                <asp:TextBox runat="server" ID="txtemailer" TextMode="Email" ClientIDMode="Static"  CssClass="form-control"></asp:TextBox>
            </div>
            <div class="modal-footer">
                <button id="Button1" type="button" class="btn btn-primary" onclick="sendallowed()">Send</button>
            </div>
        </div>
    </div>
</div> 


<div id="modalallower" runat="server" class="modal fade in">
    <div class="modal-dialog" style="width:700px;">
        <div class="modal-content">
            <div class="modal-header">
                <asp:LinkButton ID="LinkButton7" runat="server" OnClick="note_close" class="close" aria-hidden="true"><span aria-hidden="true">&times;</span></asp:LinkButton>
                <h4 class="modal-title">Form Access</h4>
            </div>
            <div class="modal-body">
                
                <div class="row">
                    <div class="col-md-12">
                        <table id="tblItems" class="table" style="width: 100%" cellpadding="0" cellspacing="0">
                            <thead>
                                <tr>
                                    <th>
                                        Name
                                    </th>
                                    <th style="width:50%;">
                                        Allow
                                    </th>
                                    <th>
                                    </th>
                                    <th>
                                    </th>
                                    <th>
                                        No. Sent
                                    </th>
                                </tr>
                            </thead>
                            <tbody><%if (spl.Count() > 0)
                                    {
                                        for (int i = 0; i < spl.Count(); i++)
                                        { %>
                                    <tr>
                                        <td>
                                            <label style='border-color:transparent;outline:none;border-style:none;' id='<%=spl3[i] %>'><%=spl[i] %></label> 
                                        </td>
                                         <td>
                                            <%if (spl2[i].Split('&').Count() > 0)
                                               {
                                                   string[] d = spl2[i].Split('&');
                                                   string[] dr = spl4[i].Split('&');
                                                   for (int j = 0; j < d.Count()-1; j++)
                                                   { %>
                                                        <div class="row"><div class='col-md-12' style='padding:0px 10px 10px 20px;' ><label class='label label-primary' style='margin-bottom:10px;' name='<%=d[j] %>'><%=dr[j]%></label></div></div>
                                                <% }
                                               } %>
                                        </td>
                                        <td>
                                            <a href="javascript:void(0)" onclick="sendallowed(this)"><i class="fa fa-send"></i></a>  
                                        </td>
                                        <td>
                                            <%if (afterit == "")
                                                { %>
                                                <input type="button" value="Remove" onclick="Remove(this);" />
                                                <%} %>
                                        </td>
                                        <td>
                                        <% if (spl5[i] == null) {
                                               spl5[i] = "0";
                                           } %> 
                                            
                                            <label ><%=spl5[i] %></label>
                                        </td>
                                    </tr>

                                <%}
                                    } %>
                            </tbody>
                            <tfoot>
                                <%if (afterit == "")
                                    { %>
                                <tr>
                                    <td>
                                        <asp:DropDownList ID="ddl_emp" AutoComplete="off" runat="server" ClientIDMode="Static" CssClass="dropdown select2">
                                        </asp:DropDownList>
                                    </td>
                                    <td>
                                        <div style="border:1px solid;">
                                        <asp:ListBox ID="listallow" AutoComplete="off" SelectionMode="Multiple" CssClass="select2" style="width:100%;" ClientIDMode="Static" runat="server" >
                                            <asp:ListItem Value="1">IE Form</asp:ListItem>
                                            <asp:ListItem Value="2">Reference Check Form</asp:ListItem>
                                            <asp:ListItem Value="3">BI-CLI Connection Form</asp:ListItem>
                                            <asp:ListItem Value="4">Overview</asp:ListItem>
                                        </asp:ListBox>  
                                        </div>
                                    </td>
                                    <td>
                                        <input type="button" id="btnAdds" value="ADD" class="btn btn-success btn-rounded mb-4 pull-right" />
                                    </td>
                                </tr>
                                <%} %>
                            </tfoot>
                        </table>
                        <br />
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <input type="button" id="btnadder" class="btn btn-primary" onclick="saveallower()" value="Save Changes" />
            </div>
        </div>
    </div>
</div> 


<div id="modalproperty" runat="server" class="modal fade in">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <asp:LinkButton ID="LinkButton1" runat="server" OnClick="note_close" class="close" aria-hidden="true"><span aria-hidden="true">&times;</span></asp:LinkButton>
                <h4 class="modal-title">Property Transfer</h4>
            </div>
            <div class="modal-body">
                <asp:DropDownList ID="drop_prop" runat="server" CssClass="form-control select" DataSourceID="SqlDataSource4" DataTextField="description" DataValueField="id" ClientIDMode="Static" AppendDataBoundItems="true" style=" height:40px">
                    <asp:ListItem></asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="modal-footer">
            <asp:Button ID="Button4" runat="server" OnClick="save_trans" Text="Save" CssClass="btn btn-primary hidden" /><!--Mutiple-->
            <asp:Button ID="Button5" runat="server" OnClick="save_single_trans" Text="Saves" CssClass="btn btn-primary" /><!--Singel-->
            <asp:Label ID="l_msg" runat="server" ForeColor="Red"></asp:Label>
            </div>
        </div>
    </div>
</div> 

<div id="modalstatus" runat="server" class="modal fade in">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <asp:LinkButton ID="LinkButton2" runat="server" OnClick="note_close" class="close" aria-hidden="true"><span aria-hidden="true">&times;</span></asp:LinkButton>
                <h4 class="modal-title">Action</h4>
            </div>
            <div class="modal-body">
                <div class="form-group no-margin">
                    <label>Status</label> <asp:Label ID="lbl_status" runat="server" ForeColor="Red"></asp:Label>
                    <asp:DropDownList ID="ddl_status" runat="server"></asp:DropDownList> <!--OnTextChanged="select_exam_type"-->
                </div>
                <div class="hide">
                <div id="s" runat="server">
                    <div class="form-group">
                        <label>Date</label> <asp:Label ID="lbl_date" runat="server" ForeColor="Red"></asp:Label>
                        <asp:TextBox ID="txt_date"  ClientIDMode="Static" CssClass="form-control" type="date" runat="server"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label>Time</label> <asp:Label ID="lbl_time" runat="server" ForeColor="Red"></asp:Label>
                        <asp:TextBox ID="tb_time" ClientIDMode="Static" CssClass="form-control" type="time" runat="server"></asp:TextBox>
                    </div>
                </div>
                <div id="li_2" runat="server">
                     <div class="form-group">
                         <label>Exam Type</label>
                         <asp:DropDownList ID="ddl_typeofexam" DataSourceID="SqlDataSource2" AppendDataBoundItems="true" DataTextField="description" DataValueField="id" runat="server">
                         </asp:DropDownList>
                    </div>
                 </div>
                <div class="form-group">
                    <label>Message</label> <asp:Label ID="lbl_message" runat="server" ForeColor="Red"></asp:Label>
                    <asp:TextBox ID="txt_messge" runat="server" CssClass="form-control" Rows="5" TextMode="MultiLine"></asp:TextBox>
                </div>
                </div>
            </div>
            <div class="modal-footer">
                <asp:Button ID="Button2" runat="server" OnClick="click_send" Text="Save" CssClass="btn btn-primary" />
            </div>
        </div>
    </div>
</div>

<div class="modal modal-danger fade in" id="modaldanger" runat="server">
    <div class="modal-dialog">
    <div class="modal-content">
        <div class="modal-header">
         <a onclick="closeEmailError()" class="close"><span aria-hidden="true">&times;</span></a>
        <h4 class="modal-title"><asp:Label ID="lblDangerTitle" runat="server"></asp:Label></h4>
        </div>
        <div class="modal-body">
        <p><asp:Label ID="lblDangerContent" runat="server"></asp:Label></p>
        </div>
    </div>
    </div>
</div>



<asp:HiddenField ID="hf_id" runat="server" />
<asp:HiddenField ID="hf_pos" runat="server" />
<asp:HiddenField ID="hfallows" ClientIDMode="Static" runat="server" /> 
<asp:TextBox ID="TextBox1" runat="server" CssClass="hide"></asp:TextBox> 


<asp:SqlDataSource ID="SqlDataSource1" runat="server" 
ConnectionString="<%$ ConnectionStrings:dbconnection %>" 
SelectCommand="SELECT [job_type], [jobtype_id] FROM [JobType] where status is null"> 
</asp:SqlDataSource>
<asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:dbconnection %>" 
SelectCommand="select CAST(job_subject as varchar(max)) job_subject from jobs where status='1' 
group by CAST(job_subject as varchar(max))
order by CAST(job_subject as varchar(max))">
</asp:SqlDataSource>
<asp:SqlDataSource ID="SqlDataSource2" runat="server" 
ConnectionString="<%$ ConnectionStrings:dbconnection %>" 
SelectCommand="SELECT [description], [id] FROM [examinition] where status='1'">
</asp:SqlDataSource>
<asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:dbconnection %>" SelectCommand="select * from location where status is null"></asp:SqlDataSource>
<asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:dbconnection %>" SelectCommand="select * from location where status is null"></asp:SqlDataSource>


<asp:ImageButton ID="lnk_trans" runat="server" CssClass="hidden" ImageUrl="~/style/img/icon/i-tranfer.png"  OnClick="trans"  />

</asp:Content>

<asp:Content ID="footer" runat="server" ContentPlaceHolderID="footer">
    <script type="text/javascript" src="vendors/select2/dist/js/select2.full.js"></script>
    <script type="text/javascript">
        $('#forward-open').click(function () {
            $('#forward').removeClass("hide");
            $('#sub-footer').addClass("hide");
        });

        $('#forward-close').click(function () {
            $('#forward').addClass("hide");
            $('#sub-footer').removeClass("hide");
        });

        $(function () {
            $('.select2').select2();
        })

        $("#sdf").click(function () {
            trig = $(this).html();
            if (trig.includes("Advance")) {
                $(this).html("<i class='fa fa-times-circle' style='margin-right:5px'></i> Close");
                $("#advance").css("display", "block");
            }
            else {
                $(this).html("<i class='fa fa-sliders' style='margin-right:5px'></i> Advance");
                $("#advance").css("display", "none");
            }
        });

        $(".close").click(function () {
            $('#drop_type > option').remove();
        });

        $(".addpos").click(function () {
            $('#drop_type > option').remove();
            $(".modal-title").html("Add Position");
            $('#<%=hf_id.ClientID %>').val($(this).attr("data-id"));
            $('#<%=hf_pos.ClientID %>').val($(this).html());
            $.ajax({
                type: "POST",
                data: '{"id":"' + $(this).attr("data-id") + '"}',
                url: "content/hr/applicants.aspx/addpostion",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    var ret = response.d;
                    var values = ret.split("|");
                    $.each(values[0].split(","), function (i, e) {
                        sel = e.includes("~");
                        sel = sel ? "selected" : "";
                        $("#drop_type").append("<option " + sel + ">" + e.replace("~", "") + "</option>");
                    });
                },
                failure: function (response) {
                    alert(response.d);
                }
            });
        });

        $('#btn_submit').click(function () {
            $.ajax({
                type: "POST",
                data: '{"id":"' + $('#<%=hf_id.ClientID %>').val() + '", "val" : "' + $('#drop_type').val() + '", "com" : "' + $('#<%=hf_pos.ClientID %>').val() + '"}',
                url: "content/hr/applicants.aspx/savepostion",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    alert("record successfully saved");
                    location.reload(false);
                },
                failure: function (response) {
                    alert(response.d);
                }
            });
        });

        $('#b_SubmitMail').click(function () {
            $('#mail_loader').css("display", "block");
            $('#mail_footer').css("display", "none");
        });

       
        
    </script>
    <script src="vendors/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js"></script>
    
    <script type="text/javascript">


        function CheckBoxCount() {
            var gv = document.getElementById("<%= grid_app.ClientID %>");
            var lbl_del_notify = document.getElementById("<%= lbl_del_notify.ClientID %>");
            var lbl_del_notify_val = document.getElementById('lbl_del_notify');
            var inputList = gv.getElementsByTagName("input");
            var numChecked = 0;

            for (var i = 0; i < inputList.length - 1; i++) {
                if (inputList[i].type == "checkbox" && inputList[i].checked) {
                    numChecked = numChecked + 1;
                }

            }

            lbl_del_notify.textContent = numChecked + " rows";
        }

        function Confirm() {
            var confirm_value = document.getElementById("<%= TextBox1.ClientID %>")
            if (confirm("Are You Sure You Want To Delete This Applicant ?"))
            { confirm_value.value = "Yes"; } else { confirm_value.value = "No"; }
        }

        $(function () {
            $("#compose_textarea").wysihtml5();
        });


        function onviewmodal() {
            $.ajax({
                type: "POST",
                url: "",
                data: JSON.stringify({}),
                contenttype: "application/json; charset=utf-8",
                datatype: "json",
                success: function (data) {

                },
                error: function (xhr, status, error) {
                    alert(xhr.responseText);
                }
            });
        }

        function toolreq() {
            var num = "";
            $("#tblItems TBODY TR").each(function () {
                var row = $(this);
                num += row.find("TD").eq(0).find("label").eq(0).attr('id') + "*";
                var d = "";
                d +=row.find("TD").eq(4).find("label").eq(0).text()+"*";
                row.find("TD").eq(1).find("label").each(function () {
                    var row2 = $(this);
                    d += row2.attr('name') + "&";
                });
                num += d + "-";
            });
            console.log(num);
            
            $("[id$=hfallows]").val(num);
        }
        $("#btnAdds").on("click", function () {

            var txtEnum = $("#ddl_emp");
            var liallow = document.getElementById('<% = listallow.ClientID %>').options;
            console.log(liallow);
            var selectedItem="";
            for (var i = 0; i < liallow.length; i++) {
                if (liallow[i].selected == true) {
                    selectedItem +="<div class='row'><div class='col-md-12' style='padding:0px 10px 10px 20px;' ><label class='label label-primary' style='margin-bottom:10px;' name='"+liallow[i].value+"'>"+ liallow[i].innerHTML + "</label></div></div> ";
                    console.log(liallow[i].innerHTML);
                }
            }

            var tBody = $("#tblItems > TBODY")[0];

            //Add Row.
            var row = tBody.insertRow(-1);

            var cell = $(row.insertCell(-1));
            cell.html("<label style='border-color:transparent;outline:none;border-style:none;' id='" + txtEnum.find("option:selected").val() + "'>" + txtEnum.find("option:selected").text() + "</label>");
            
            var cell = $(row.insertCell(-1));
            cell.html("" + selectedItem + "");
            
            var cell = $(row.insertCell(-1));
            cell.html("");

            //Add Button cell.
            cell = $(row.insertCell(-1));
            var btnRemove = $("<input />");
            btnRemove.attr("type", "button");
            btnRemove.attr("onclick", "Remove(this);");
            btnRemove.val("Remove");
            cell.append(btnRemove);

             var cell = $(row.insertCell(-1));
            cell.html("<label>0</label>");

            //Clear the TextBoxes.
            toolreq();
        });

        function Remove(button) {
            var row = $(button).closest("TR");
            if (confirm("Do you want to delete this item?")) {
                var table = $("#tblItems")[0];
                table.deleteRow(row[0].rowIndex);
                toolreq();
            }
        };

        function saveallower() {
            var appId =<%=this.appid %>;
            var hfemp=$("[id$=hfallows]").val();

            $.ajax({
                type: "POST",
                url: "content/HR/applicants.aspx/saveallow",
                data: JSON.stringify({appId:appId,hfemp:hfemp}),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    $("[id$=modalallower]").hide();
                    alert("Saved Successfully!");

                },
                error: function (xhr, status, error) {
                    console.log(xhr.responseText);
                }

            });
        }

        
        function sendallowed(evs)
        {
         var appId =<%=this.appid %>;
         var empId=$(evs).parent().parent().find("td").eq(0).find("label").eq(0).attr("id");
         var proxemail=$("[id$=txtemailer]").val();
         var nosent=$(evs).parent().parent().find("td").eq(4).find("label").eq(0).html();
         console.log(empId);
         console.log(proxemail);
         console.log(nosent);

         if(empId===undefined)
         {
            empId=$("[id$=Button1]").attr("name");
         }

         console.log(empId);
          
            $.ajax({
                type:"POST",
                url: "content/HR/applicants.aspx/saveallowed",
                data:JSON.stringify({appIds:appId,empId:empId,proxemail:proxemail,nosent:nosent}),
                contentType:"application/json; charset=utf-8",
                dataType:"json",
                success:function(data){
                    var result =data.d.toString();
                    $("[id$=txtemailer]").val("");
                    
                    if(result=="pass")
                    {
                        var num= parseInt($(evs).parent().parent().find("td").eq(4).find("label").eq(0).html())+1;
                        $(evs).parent().parent().find("td").eq(4).find("label").eq(0).html(num);
                        alert("Email sent successfully");
                    }
                    else if(result=="emailnot")
                    {
                        $("[id$=modalallower]").hide();
                        $("[id$=Div1]").show();
                        $("[id$=Button1]").attr("name",empId);
                    }
                    else
                    {
                        $("[id$=modaldanger]").show();
                        
                        $("[id$=lblDangerTitle]").text("Email Authentication");
                        $("[id$=lblDangerContent]").text("Please check email credential.");
                    
                    }

                },
                error:function(xhr,status,error){
                    console.log(xhr.responseText);
                }
            });
        }
        
        function emailback()
        {
            $("[id$=txtemailer]").val("");
            $("[id$=modalallower]").show();
            $("[id$=Div1]").hide();
       }

       function closeEmailError()
       {
            $("[id$=b_forward]").attr("Visible","false");
            $("[id$=modaldanger]").hide();
       }
    </script>
    

</asp:Content>