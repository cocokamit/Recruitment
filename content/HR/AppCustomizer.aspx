<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AppCustomizer.aspx.cs" Inherits="content_HR_AppCustomizer" MasterPageFile="~/content/NewMasterPage.master" %>
<%@ Import Namespace="System.Data" %>

<asp:Content ID="accounting_hide" ContentPlaceHolderID="head" runat="server">
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
    <h1>Application Form Additional Fields</h1>
    <ol class="breadcrumb">
    <li><a href="dashboard"><i class="fa fa-dashboard"></i> Home</a></li>
    <li class="active">Field Customizer</li>
    </ol>
</section>

<section class="content">
     <div class="row">
        <div class="col-xs-12">
            
    
        </div>
     </div>
 </section>


</asp:Content>




<asp:Content ID="footer" runat="server" ContentPlaceHolderID="footer">

    <script type="text/javascript" src="vendors/select2/dist/js/select2.full.js"></script>
</asp:Content>