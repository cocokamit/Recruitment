<%@ Page Title="" Language="C#" MasterPageFile="~/content/NewMasterPage.master" AutoEventWireup="true" CodeFile="email.aspx.cs" Inherits="content_config_email" %>

<asp:Content ID="head" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="content" ContentPlaceHolderID="content" Runat="Server">
<section class="content-header">
    <h1>E-Mail Setup</h1>
    <ol class="breadcrumb">
    <li><a href="dashboard"><i class="fa fa-dashboard"></i> Home</a></li>
    <li class="active">E-Mail</li>
    </ol>
</section>
<section class="content">

 <div class="row">
        <div class="col-xs-12">
          <div class="box box-primary">
            <div class="box-body table-responsive">
                 <div class="form-group">
                    <label>SMTP Server</label>
                    <asp:Label ID="lblSmtp" runat="server" CssClass="text-danger"></asp:Label>
                    <asp:TextBox ID="tbSMTP" runat="server" CssClass="form-control"></asp:TextBox>
                 </div>
                 <div class="form-group">
                    <label>Username</label>
                    <asp:Label ID="lblUsername" runat="server" CssClass="text-danger"></asp:Label>
                    <asp:TextBox ID="tbUser" runat="server" CssClass="form-control"></asp:TextBox>
                 </div>
                 <div class="form-group no-margin">
                    <label>Password</label>
                    <asp:Label ID="lblPassword" runat="server" CssClass="text-danger"></asp:Label>
                    <asp:TextBox ID="tbPassword" TextMode="Password" runat="server"  CssClass="form-control" autocomplete="off"></asp:TextBox>
                 </div>
            </div>
            <div class="box-footer">
                <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="click_SaveSetting" CssClass="btn btn-primary" />
            </div>
          </div>
        </div>
      </div>
</section>

</asp:Content>
<asp:Content ID="footer" ContentPlaceHolderID="footer" Runat="Server">
</asp:Content>

