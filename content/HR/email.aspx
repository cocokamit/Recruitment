<%@ Page Language="C#" AutoEventWireup="true" CodeFile="email.aspx.cs" Inherits="content_HR_email" MasterPageFile="~/content/NewMasterPage.master"%>

<asp:Content ID="head" runat="server" ContentPlaceHolderID="head">
</asp:Content>

<asp:Content ID="content" runat="server" ContentPlaceHolderID="content">
<section class="content-header">
    <h1>E-mail template</h1>
    <ol class="breadcrumb">
    <li><a href="dashboard"><i class="fa fa-dashboard"></i> Home</a></li>
    <li class="active">E-mail template</li>
    </ol>
</section>
<section class="content">
<div class="row">
    <div class="col-xs-12">
        <div class="box box-primary">
            <div class="box-header">
                <div class="input-group input-group-sm" style="width: 300px;">
                    <asp:TextBox ID="tb_search" runat="server" class="form-control pull-right" placeholder="Search"></asp:TextBox>
                    <div class="input-group-btn">
                    <asp:LinkButton ID="lb_search" runat="server" class="btn btn-default"><i class="fa fa-search"></i></asp:LinkButton>
                    </div>
                </div>
                <div class="box-tools box-tool-add">
                    <a href="compose-email" class="btn btn-block btn-primary">Add</a>
                </div>
            </div>
            <div class="box-body table-responsive no-pad-top">
                <div id="alert" runat="server" class="alert alert-info alert-dismissible">
                    <h4><i class="icon fa fa-check-circle"></i> No record found</h4>
                </div>
                <asp:GridView ID="grid_view" OnRowDataBound="gv_RowDataBound" CssClass="table table-bordered table-hover dataTable" runat="server" AutoGenerateColumns="false">
                    <Columns>
                        <asp:BoundField DataField="id" HeaderStyle-CssClass="hide" ItemStyle-CssClass="hide" />
                        <asp:BoundField DataField="status" HeaderStyle-CssClass="hide" ItemStyle-CssClass="hide" />
                        <asp:TemplateField>
                            <ItemTemplate>
                                 <asp:Label ID="Label1" runat="server"  Text='<%# Eval("title") %>'></asp:Label>
                                <asp:Label ID="l_status" runat="server" Visible="false" CssClass="label label-primary pull-right" Text="draft"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Action">
                            <ItemTemplate>
                                <a href="compose-email?id=<%# Eval("id") %>" class="fa fa-pencil"></a>
                                <asp:LinkButton ID="lnk_delete" OnClientClick="Confirm('departments')" runat="server" class="fa fa-trash no-border no-pad-right"></asp:LinkButton>
                            </ItemTemplate>
                            <ItemStyle Width="70px" CssClass="action"/>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </div>
</div>
</section>
</asp:Content>