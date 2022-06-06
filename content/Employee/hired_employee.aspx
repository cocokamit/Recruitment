<%@ Page Language="C#" AutoEventWireup="true" CodeFile="hired_employee.aspx.cs" Inherits="content_Employee_hired_employee" MasterPageFile="~/content/NewMasterPage.master" %>

<asp:Content ID="accounting_hide" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ContentPlaceHolderID="content" ID="content_hired_employees" runat="server">
<asp:ScriptManager ID="myScriptManager" runat="server"></asp:ScriptManager>
<section class="content-header">
    <h1>Hired Applicant</h1>
    <ol class="breadcrumb">
    <li><a href="dashboard"><i class="fa fa-dashboard"></i> Home</a></li>
    <li class="active">Hired Applicant</li>
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
                            <asp:DropDownList ID="drop_type" runat="server" CssClass="form-control" DataSourceID="SqlDataSource3" AppendDataBoundItems="true" DataTextField="job_subject" DataValueField="job_subject">
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

                 <asp:GridView ID="grid_app" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered table-hover dataTable" AllowSorting="True">
                    <Columns>
                        <asp:BoundField DataField="app_id" HeaderStyle-CssClass="hide" ItemStyle-CssClass="hide"/>
                        <asp:BoundField DataField="date" HeaderText="Dated Hired" DataFormatString="{0:MM/dd/yyyy}" />
                        <asp:BoundField DataField="name" HeaderText="Name" />
                        <asp:BoundField DataField="job_id" HeaderText="Position Desired" />
                            <asp:TemplateField HeaderText="Resume">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lnk_download" runat="server" OnClick="download" style=" text-decoration:underline; text-transform:none;" Text='Download' ></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField >
                                <ItemTemplate>
                                    <asp:LinkButton ID="lnk_editStat"   runat="server" OnClick="click_view" Text='view' ></asp:LinkButton>
                                </ItemTemplate>
                                <ItemStyle Width="30px" />
                            </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
          </div>
        </div>
      </div>
</section>

<asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:dbconnection %>" SelectCommand="select * from jobs where status='1'"></asp:SqlDataSource>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dbconnection %>" SelectCommand="SELECT [job_type], [jobtype_id] FROM [JobType] where status is null"></asp:SqlDataSource>
</asp:Content>

