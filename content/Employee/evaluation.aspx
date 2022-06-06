<%@ Page Language="C#" AutoEventWireup="true" CodeFile="evaluation.aspx.cs" Inherits="content_Employee_evaluation" MasterPageFile="~/content/NewMasterPage.master" %>

<asp:Content ID="head" runat="server" ContentPlaceHolderID="head">
</asp:Content>

<asp:Content ContentPlaceHolderID="content" ID="content_location" runat="server">
<section class="content-header">
    <h1>Evaluation</h1>
    <ol class="breadcrumb">
    <li><a href="dashboard"><i class="fa fa-dashboard"></i> Home</a></li>
    <li class="active">Evaluation</li>
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
                        <asp:LinkButton ID="lb_search" runat="server" class="btn btn-default"><i class="fa fa-search"></i></asp:LinkButton>
                      </div>
                </div>
                <div class="box-tools box-tool-add">
                    <asp:LinkButton ID="lb_add" runat="server" OnClick="view_save" CssClass="btn btn-block btn-primary">Add</asp:LinkButton>
                </div>
            </div>
            <div class="box-body table-responsive padding no-pad-top">
                <asp:Label ID="lbl_del_notify" runat="server" style=" position:absolute; right:120px; margin:15px; font-size:11px; " ></asp:Label>
                 <div id="alert" runat="server" class="alert alert-info alert-dismissible">
                    <h4><i class="icon fa fa-check-circle"></i> No record found</h4>
                 </div>
                <asp:GridView ID="grid_view" CssClass="table table-bordered table-hover dataTable" runat="server" AutoGenerateColumns="false">
                    <Columns>
                        <asp:BoundField DataField="id" HeaderStyle-CssClass="hide" ItemStyle-CssClass="hide"/>
                        <asp:BoundField DataField="quest" HeaderText="Question" SortExpression="quest" />
                        <asp:TemplateField HeaderText="">
                            <ItemTemplate>
                                <asp:LinkButton ID="lnk_edit" OnClick="view" runat="server" CssClass="fa fa-edit"></asp:LinkButton>
                                <asp:LinkButton ID="lnk_delete" OnClientClick="Confirm(this,'delete')" OnClick="delete" runat="server" CssClass="fa fa-trash no-border no-border no-pad-right"></asp:LinkButton>
                            </ItemTemplate>
                        <ItemStyle Width="50px" />
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
                <asp:LinkButton ID="LinkButton1" runat="server" OnClick="add_close" class="close" aria-hidden="true"><span aria-hidden="true">&times;</span></asp:LinkButton>
                <h4 class="modal-title">Add Questionaire</h4>
            </div>
            <div class="modal-body">
                <div class="form-group no-margin">
                    <label>Questionaire</label> <asp:Label ID="lbl_loc" ForeColor="Red" runat="server" Text=""></asp:Label>
                    <asp:TextBox ID="txt_type" runat="server" CssClass="form-control" ></asp:TextBox>
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
                <asp:LinkButton ID="LinkButton2" runat="server" OnClick="add_close" class="close" aria-hidden="true"><span aria-hidden="true">&times;</span></asp:LinkButton>
                <h4 class="modal-title">Add Questionaire</h4>
            </div>
            <div class="modal-body">
                <div class="form-group no-margin">
                    <label>Questionaire</label> <asp:Label ID="lbl_class" ForeColor="Red" runat="server" Text=""></asp:Label>
                    <asp:TextBox ID="txt_class" runat="server" CssClass="form-control"  TextMode="MultiLine"></asp:TextBox>
                </div>
            </div>
            <div class="modal-footer">
                <asp:Button ID="Button2" runat="server" Text="Save" OnClick="edit" CssClass="btn btn-primary" />
            </div>
        </div>
    </div>
</div>

<asp:TextBox ID="TextBox1" runat="server" CssClass="hide"></asp:TextBox>   
<script type="text/javascript">
    function Confirm(msg) {
        var confirm_value = document.getElementById("<%= TextBox1.ClientID %>")
        if (confirm("Are you sure to delete examination?"))
            confirm_value.value = "Yes";
        else
            confirm_value.value = "No";
    }
</script>
</asp:Content>


