<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Rejected.aspx.cs" Inherits="content_HR_Rejected" MasterPageFile="~/content/NewMasterPage.master" %>
<asp:Content ID="accounting_hide" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ContentPlaceHolderID="content" runat="server" ID="content_user">
<asp:ScriptManager ID="myScriptManager" runat="server"></asp:ScriptManager>
<section class="content-header">
    <h1>Not Qualified</h1>
    <ol class="breadcrumb">
    <li><a href="dashboard"><i class="fa fa-dashboard"></i> Home</a></li>
    <li class="active">Not Qualified</li>
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
                </div>
            </div>
            <div class="box-body table-responsive padding no-pad-top">
                <div id="advance" runat="server" visible="false" clientidmode="Static" class="row alert alert-info alert-dismissible advance">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label>Position</label>
                            <asp:DropDownList ID="drop_type" runat="server" CssClass="form-control" DataSourceID="SqlDataSource1" AppendDataBoundItems="true" DataTextField="job_type" DataValueField="job_type">
                                <asp:ListItem></asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div class="form-group">
                            <label>Special Skills</label>
                            <asp:TextBox ID="txt_skills" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>
                     <div class="col-md-6">
                        <div class="form-group">
                            <label>From</label>
                            <asp:TextBox ID="txt_from" runat="server" CssClass="form-control" type="date"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label>From</label>
                            <asp:TextBox ID="txt_to" runat="server" CssClass="form-control" type="date"></asp:TextBox>
                        </div>
                    </div>
                </div>

                 <div id="alert" runat="server" class="alert alert-info alert-dismissible">
                    <h4><i class="icon fa fa-check-circle"></i> No record found</h4>
                 </div>
                 
                <asp:GridView ID="grid_app" runat="server" AutoGenerateColumns="False" onrowdatabound="grid_app_RowDataBound" CssClass="table table-bordered table-hover dataTable" AllowSorting="True">
                    <Columns>
                        <asp:BoundField DataField="id" HeaderStyle-CssClass="hide" ItemStyle-CssClass="hide" /> 
                        <asp:BoundField DataField="applydate" HeaderText="Date" />
                        <asp:BoundField DataField="name" HeaderText="Name" />
                        <asp:TemplateField HeaderText="Position Desire">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lnk_pd" runat="server" OnClick="click_pd"  ForeColor="red"  style="  text-transform:none;" Text='<%# Bind("Position") %>' ></asp:LinkButton>
                                </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Application">
                            <ItemTemplate>
                                <asp:LinkButton ID="lnk_v"   runat="server" OnClick="click_view"  Text='view' ></asp:LinkButton>
                            </ItemTemplate>
                            <ItemStyle Width="20px" />
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
          </div>
        </div>
      </div>
</section>
 

<div class="page-content">
    
</div>

<div id="panelOverlay" visible="false" runat="server" class="Overlay"></div>
<div id="panelPopUpPanel" visible="false" runat="server" class="PopUpPanel">
   <asp:ImageButton ID="can"  runat="server" CausesValidation="false" OnClick="add_close" CssClass="close" ImageUrl="~/style/img/closeb.png" />
    <asp:ListView ID="lvl" runat="server">
    </asp:ListView>
</div>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dbconnection %>" SelectCommand="SELECT [job_type], [jobtype_id] FROM [JobType] where status is null"></asp:SqlDataSource>


<div class="modal fade in" id="joblist" runat="server">
<div class="modal-dialog">
    <div class="modal-content">
        <div class="modal-header">
          <div align="right">
            <asp:LinkButton ID="lnkclose" OnClick="close" runat="server"><i class="glyphicon glyphicon-remove"></i></asp:LinkButton>
          </div>
          <h4 class="modal-title">Job Position</h4>
        </div>
        <div class="modal-body">
          <asp:ListView ID="lv" runat="server"></asp:ListView>
        </div>
    </div>
</div>
</div>

    
</asp:Content>