<%@ Page Language="C#" AutoEventWireup="true" CodeFile="JobTypeList.aspx.cs" Inherits="content_HR_JobTypeList" MasterPageFile="~/content/NewMasterPage.master" %>

<asp:Content ID="head" runat="server" ContentPlaceHolderID="head">
</asp:Content>

<asp:Content ContentPlaceHolderID="content" ID="content_jobtypelist" runat="server">
<section class="content-header">
    <h1>Department</h1>
    <ol class="breadcrumb">
    <li><a href="dashboard"><i class="fa fa-dashboard"></i> Home</a></li>
    <li class="active">Department</li>
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
                <asp:LinkButton ID="lb_add" runat="server" OnClick="click_add" CssClass="btn btn-block btn-primary" Text="Add" ></asp:LinkButton>
            </div>
        </div>
        <div class="box-body table-responsive padding no-pad-top">
                <div id="alert" runat="server" class="alert alert-info alert-dismissible">
                <h4><i class="icon fa fa-check-circle"></i> No record found</h4>
                </div>
                <asp:GridView ID="grid_view" CssClass="table table-bordered table-hover dataTable" runat="server" AutoGenerateColumns="false">
                <Columns>
                    <asp:BoundField DataField="jobtype_id" HeaderStyle-CssClass="hide" ItemStyle-CssClass="hide" />
                    <asp:BoundField DataField="job_type" HeaderText="Departments" SortExpression="job_type" />
                    <asp:TemplateField HeaderText="Action">
                        <ItemTemplate>
                            <asp:LinkButton ID="lnk_edit" OnClick="click_edit" runat="server" CssClass="fa fa-pencil"></asp:LinkButton>
                            <asp:LinkButton ID="lnk_delete" OnClick="delete" OnClientClick="Confirm('departments')" runat="server" class="fa fa-trash no-border no-pad-right" ></asp:LinkButton>
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
<div id="modal" runat="server" class="modal fade in">
    <div class="modal-dialog">
    <div class="modal-content">
        <div class="modal-header">
            <asp:LinkButton ID="lb_close" runat="server" OnClick="close_modal" CssClass="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></asp:LinkButton>
            <h4 id="modaltitle" runat="server" class="modal-title"></h4>
        </div>
        <div class="modal-body">
            <div class="form-group no-margin">
                <label>Department <asp:Label ID="l_dept" runat="server" ForeColor="Red"></asp:Label></label>
                <asp:TextBox ID="tb_dept" CssClass="form-control" runat="server"></asp:TextBox>
            </div>
        </div>
        <div class="modal-footer modal-left">
            <asp:Button ID="btn_modal" runat="server" OnClick="click_action" class="btn btn-primary" Text="Submit"/>
        </div>
    </div>
    </div>
</div>
<asp:HiddenField ID="hf_action" runat="server" />
<asp:TextBox ID="TextBox1" runat="server" CssClass="hidden"></asp:TextBox>  
<script type="text/javascript">
    function Confirm(msg) {
        var confirm_value = document.getElementById("<%= TextBox1.ClientID %>")
        if (confirm("Are you sure to delete " + msg + "?"))
            confirm_value.value = "Yes";
        else
            confirm_value.value = "No";
    }
</script>
</asp:Content>

