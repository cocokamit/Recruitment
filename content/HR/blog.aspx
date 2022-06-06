<%@ Page Language="C#" AutoEventWireup="true" CodeFile="blog.aspx.cs" Inherits="content_HR_blog" ValidateRequest = "false" MasterPageFile="~/content/NewMasterPage.master"%>

<asp:Content ID="head" runat="server" ContentPlaceHolderID="head">
    <script type="text/javascript" src="style/plugins/jquery/jquery.min.js"></script>
    <script type="text/javascript" src="style/plugins/tinymce/tinymce.min.js"></script>
</asp:Content>

<asp:Content ContentPlaceHolderID="content" runat="server" ID="content_blog">
<section class="content-header">
    <h1><asp:Label ID="lbl_header" runat="server" Text="Create Post"></asp:Label></h1>
    <ol class="breadcrumb">
        <li><a href="dashboard"><i class="fa fa-dashboard"></i> Dashboard</a></li>
        <li><a href="post">Blog</a></li>
        <li class="active"><asp:Label ID="lbl_breadcrub" runat="server" Text="Create Post"></asp:Label></li>
    </ol>
</section>

<section class="content">
<div class="row">
    <div class="col-xs-12">
        <div class="box box-primary">
            <div class="box-body table-responsive">
                <div class="form-group">
                    <label>Title <asp:Label ID="lbl_title" runat="server" ForeColor="Red"></asp:Label></label>
                    <asp:TextBox ID="txt_subject" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label>Category <asp:Label ID="Label3" runat="server" ForeColor="Red"></asp:Label></label>
                    <asp:DropDownList ID="ddl_category" runat="server" CssClass="form-control">
                        <asp:ListItem>Employee Events</asp:ListItem>
                        <asp:ListItem>Referral Program</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="form-group">
                    <label>Content <asp:Label ID="lbl_qualification" runat="server" ForeColor="Red"></asp:Label></label>
                    <asp:TextBox ID="txt_qualification" runat="server" ClientIDMode="Static" TextMode="MultiLine" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label>Featured Article <asp:Label ID="Label2" runat="server" ForeColor="Red"></asp:Label></label>
                    <asp:TextBox ID="tb_featured" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="4"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label>Featured Image<asp:Label ID="Label1" runat="server" ForeColor="Red"></asp:Label></label>
                    <asp:Panel ID="p_edit_img" runat="server" Visible="false">
                        <div class="clearfix"></div>
                        <asp:ImageButton ID="ib_freatured" runat="server" style=" margin-bottom:5px" />
                    </asp:Panel>
                    <asp:FileUpload ID="fu_featured" runat="server"  accept="image/*"/>
                </div>
            </div>
            <div class="box-footer">
                <asp:Button ID="b_submit" runat="server" ClientIDMode="Static" class="btn btn-primary" Text="Submit" onclick="Button2_Click"/>
                <div id="loader" class="hide">
                    <img src="dist/img/loader.gif" alt="Alternate Text" /> 
                    <i class="sm" style=" position:absolute; margin:3px 5px">Please wait&hellip;</i>
                </div>
            </div>
        </div>
    </div>
</div>
</section>
<div id="modalproperty" runat="server" clientidmode="Static" class="modal fade in"></div> 
<asp:HiddenField ID="hf_action" runat="server" Value="0" />
<script type="text/javascript">
    $(document).ready(function () {
        TinyMCEStart('#txt_qualification', null);
    });

    $("#b_submit").click(function () {
        $(this).addClass("hide");
        $("#loader").removeClass("hide");
        $("#modalproperty").addClass("active-flow");
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
</asp:Content>

<asp:Content ID="footer" runat="server" ContentPlaceHolderID="footer">
</asp:Content>