<%@ Page Language="C#" AutoEventWireup="true" CodeFile="email_create.aspx.cs" Inherits="content_HR_email_create" ValidateRequest = "false" MasterPageFile="~/content/NewMasterPage.master"%>

<asp:Content ID="head" runat="server" ContentPlaceHolderID="head">
  <link rel="stylesheet" href="vendors/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css">
    <style type="text/css">
    </style>
</asp:Content>                                                                                                                                                          

<asp:Content ContentPlaceHolderID="content" ID="content_jobtypelist" runat="server">
<section class="content-header">                                                                                                 
    <h1>Compose E-mail</h1>
    <ol class="breadcrumb">
    <li><a href="dashboard"><i class="fa fa-dashboard"></i> Home</a></li>
     <li><a href="email"><i class="fa fa-envelope"></i> E-mail</a></li>
    <li class="active">Compose E-mail</li>
    </ol>
</section>
<section class="content">
<div class="row">
    <div class="col-md-12">
        <div class="box box-primary">
        <div class="box-body">
            <div id="alert" runat="server" visible="false" class="alert alert-danger" style=" margin-bottom:10px">
                <h4><i class="icon fa fa-info-circle"></i> <asp:Label ID="lb_alert" runat="server"></asp:Label></h4>
            </div>
            <div class="form-group">
                <asp:TextBox ID="tb_title" runat="server" CssClass="form-control" placeholder="Title"></asp:TextBox>
            </div>
            <div class="form-group no-margin">
                <asp:TextBox ID="compose_textarea" ClientIDMode="Static" TextMode="MultiLine" runat="server" CssClass="form-control" Height="500px"></asp:TextBox>
            </div>
            <div class="form-group hidden">
            <div class="btn btn-default btn-file">
                <i class="fa fa-paperclip"></i> Attachment
                <input type="file" name="attachment">
            </div>
            <p class="help-block">Max. 32MB</p>
            </div>
        </div>
        <div class="box-footer">
            <div class="pull-right">
            <asp:LinkButton ID="lb_draf" runat="server" OnClick="click_save" CssClass="btn btn-default"><i class="fa fa-pencil"></i> Draft</asp:LinkButton>
            <asp:LinkButton ID="lb_save" runat="server" OnClick="click_save" CssClass="btn btn-primary"><i class="fa fa-save (alias)"></i> Save</asp:LinkButton>
            </div>
            <asp:LinkButton ID="lb_discard" runat="server" OnClick="click_discard" CssClass="btn btn-default"><i class="fa fa-times"></i> Discard</asp:LinkButton>
        </div>
        </div>
    </div>
</div>
</section>
</asp:Content>

<asp:Content ID="footer" runat="server" ContentPlaceHolderID="footer">
<script src="vendors/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js"></script>
<script>
    $(function () {
        $("#compose_textarea").wysihtml5();
    });
</script>
</asp:Content>

 