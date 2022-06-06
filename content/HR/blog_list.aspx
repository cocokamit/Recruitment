<%@ Page Language="C#" AutoEventWireup="true" CodeFile="blog_list.aspx.cs" Inherits="content_HR_blog_list" ValidateRequest = "false" MasterPageFile="~/content/NewMasterPage.master" %>

<asp:Content ID="head" runat="server" ContentPlaceHolderID="head">
    <script type="text/javascript" src="style/plugins/jquery/jquery.min.js"></script>
    <script type="text/javascript" src="style/plugins/tinymce/tinymce.min.js"></script>

     <script type="text/javascript">

         function Confirm(elem, msg) {
             if (elem.getAttribute("title") == 'pending' || elem.getAttribute("title") == 'delete') {
                 var confirm_value = document.getElementById("<%= TextBox1.ClientID %>")
                 if (confirm("Are you sure to " + msg + " this?"))
                 { confirm_value.value = "Yes"; } else { confirm_value.value = "No"; }
             }
         }
         function Confirm1() {
             var confirm_value = document.getElementById("<%= TextBox1.ClientID %>")
             if (confirm("Are you sure to post this job?"))
             { confirm_value.value = "Yes"; } else { confirm_value.value = "No"; }
         }
      
    </script>
</asp:Content>

<asp:Content ContentPlaceHolderID="content" runat="server" ID="content_bloglist">
<section class="content-header">
    <h1>Blog</h1>
    <ol class="breadcrumb">
    <li><a href="dashboard"><i class="fa fa-dashboard"></i> Home</a></li>
    <li class="active">Blog</li>
    </ol>
</section>
<section class="content">
 <div class="row">
        <div class="col-xs-12">
          <div class="box box-primary">
            <div class="box-header">
                <a href="create-post" class="btn btn-primary">Add</a>
                <div class="box-tools pad">
                    <a href="blog" target="_blank" class="label label-orange" style=" line-height:20px"><i class="fa fa-globe" style="margin-right:5px"></i> Site Content</a>
                </div>
            </div>
            <div class="box-body table-responsive padding no-pad-top">
                <div id="alert" runat="server" class="alert alert-info">
                    <i class="fa fa-info-circle"></i>
                    No record found
                </div>
                <asp:GridView ID="grid_job" runat="server" AutoGenerateColumns="False" OnRowDataBound="rowbound" CssClass="table table-bordered table-hover dataTable no-margin" >
                    <Columns>
                        <asp:BoundField DataField="id" HeaderStyle-CssClass="hide" ItemStyle-CssClass="hide"/>
                        <asp:BoundField DataField="status" HeaderStyle-CssClass="hide" ItemStyle-CssClass="hide"/>
                        <asp:BoundField DataField="subject" HeaderText="Post"/>
                        <asp:TemplateField HeaderText="Action">
                            <ItemTemplate>
                                <a href="blog?title=<%# Eval("subject").ToString().Trim().Replace(" ","-") %>" class="fa fa-eye" target="_blank" title="View Post"></a>
                                <a href="edit-post?key=<%# Eval("id") %>" class="fa fa-pencil" title="Edit Post"></a>
                                <asp:LinkButton ID="lb_publish" runat="server" OnClick="post" class="fa fa-toggle-on"></asp:LinkButton>  
                                <asp:LinkButton ID="LinkButton1" runat="server" OnClick="delete" OnClientClick="Confirm(this,'delete',1)" ToolTip="delete" class="fa fa-trash-o no-pad-right no-border"></asp:LinkButton> 
                            </ItemTemplate>
                            <ItemStyle Width="140px" CssClass="action" />
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
            <div class="form-group">
                <label>Subject <asp:Label ID="lbl_title" runat="server" ForeColor="Red"></asp:Label></label>
                <asp:TextBox ID="txt_subject" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
             <div class="form-group no-margin">
                <label>Description <asp:Label ID="lbl_qualification" runat="server" ForeColor="Red"></asp:Label></label>
                <asp:TextBox ID="txt_qualification" runat="server" ClientIDMode="Static" TextMode="MultiLine" CssClass="form-control"></asp:TextBox>
            </div>
        </div>
        <div class="modal-footer modal-left">
            <asp:Button ID="Button2" runat="server" OnClick="update" class="btn btn-primary" Text="Update"/>
           
        </div>
    </div>
    </div>
</div>
<asp:HiddenField ID="hf_id" runat="server" />
<asp:HiddenField ID="hf_action" runat="server" />
<script type="text/javascript">
    $(document).ready(function () {
        TinyMCEStart('#txt_qualification', null);
    });

    function TinyMCEStart(elem, mode) {
        var plugins = [];
        if (mode == 'extreme') {
            plugins = [""]
        }
        tinymce.init({ selector: elem,
            theme: "modern",
            plugins: plugins,
            //content_css: "css/style.css",
            toolbar: "insertfile undo redo | styleselect | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | link image | print preview media fullpage | forecolor backcolor emoticons",
            style_formats: [
			{ title: 'Header 2', block: 'h2', classes: 'page-header' },
			{ title: 'Header 3', block: 'h3', classes: 'page-header' },
			{ title: 'Header 4', block: 'h4', classes: 'page-header' },
			{ title: 'Header 5', block: 'h5', classes: 'page-header' },
			{ title: 'Header 6', block: 'h6', classes: 'page-header' },
			{ title: 'Bold text', inline: 'b' },
			{ title: 'Red text', inline: 'span', styles: { color: '#ff0000'} },
			{ title: 'Red header', block: 'h1', styles: { color: '#ff0000'} },
			{ title: 'Example 1', inline: 'span', classes: 'example1' },
			{ title: 'Example 2', inline: 'span', classes: 'example2' },
			{ title: 'Table styles' },
			{ title: 'Table row 1', selector: 'tr', classes: 'tablerow1' }
		]
        });
    }
</script>
<asp:TextBox ID="TextBox1" style=" display: none;" runat="server"></asp:TextBox>
</asp:Content>