<%@ Page Language="C#" AutoEventWireup="true" CodeFile="JobsList.aspx.cs" Inherits="content_HR_JobsList" ValidateRequest = "false" MasterPageFile="~/content/NewMasterPage.master"%>

<asp:Content ID="head" runat="server" ContentPlaceHolderID="head">
    <script type="text/javascript" src="style/plugins/jquery/jquery.min.js"></script>
    <script type="text/javascript" src="style/plugins/tinymce/tinymce.min.js"></script>
    <script type="text/javascript">

        function Confirm(elem, msg) {
            if (elem.getAttribute("title") == 'pending' || elem.getAttribute("title") == 'delete') {
                var confirm_value = document.getElementById("<%= TextBox1.ClientID %>")
                if (confirm("Are you sure to "+ msg +" this job?"))
                { confirm_value.value = "Yes"; } else { confirm_value.value = "No"; }
            }
        }

        function CheckBoxCount() {
            var gv = document.getElementById("<%= grid_job.ClientID %>");
            var lbl_del_notify = document.getElementById("<%= lbl_del_notify.ClientID %>");
            var lbl_del_notify_val = document.getElementById('lbl_del_notify');
            var inputList = gv.getElementsByTagName("input");
            var numChecked = 0;

            for (var i = 0; i < inputList.length; i++) {
                if (inputList[i].type == "checkbox" && inputList[i].checked) {
                    numChecked = numChecked + 1;
                }
            }

            if (numChecked > 0) {
                if (numChecked == 1)
                    lbl_del_notify.textContent = numChecked + " row selected";
                else
                    lbl_del_notify.textContent = numChecked + " rows selected";
                document.getElementById("<%= ib_del.ClientID %>").style.display = "block";
            }
            else {
                lbl_del_notify.textContent = "";
                document.getElementById("<%= ib_del.ClientID %>").style.display = "none"; 
            }
        }
    </script>
</asp:Content>

<asp:Content ContentPlaceHolderID="content" ID="content_joblist" runat="server">
<asp:ScriptManager ID="myScriptManager" runat="server"></asp:ScriptManager>
<section class="content-header">
    <h1>Position</h1>
    <ol class="breadcrumb">
    <li><a href="dashboard"><i class="fa fa-dashboard"></i> Home</a></li>
    <li class="active">Position</li>
    </ol>
</section>
<section class="content">
 <div class="row">
        <div class="col-xs-12">
          <div class="box box-primary">
            <div class="box-header">
                <div class="input-group input-group-sm" style="width: 300px;">
                    <asp:DropDownList ID="drop_loc" runat="server" CssClass="select pull-right" DataSourceID="SqlDataSource2" AppendDataBoundItems="true" DataTextField="description" DataValueField="id" AutoPostBack="true" OnTextChanged="search">
                        <asp:ListItem Value="0" Selected disabled> Select Property</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="box-tools box-tool-add">
                    <asp:LinkButton ID="lb_add" runat="server" OnClick="click_add" CssClass="btn btn-block btn-primary">Add</asp:LinkButton>
                </div>
            </div>
            <div class="box-body table-responsive padding no-pad-top">
                <asp:Label ID="lbl_del_notify" runat="server" style=" position:absolute; right:120px; margin:15px; font-size:11px; " ></asp:Label>
                 <div id="alert" runat="server" class="alert alert-info alert-dismissible">
                    <h4><i class="icon fa fa-check-circle"></i> No record found</h4>
                 </div>
                <asp:GridView ID="grid_job" runat="server" AutoGenerateColumns="False" onrowdatabound="grid_app_RowDataBound" CssClass="table table-bordered table-hover dataTable" AllowSorting="true" OnSorting="gridItemSorting">
                    <Columns>
                        <asp:BoundField DataField="id" HeaderStyle-CssClass="hide" ItemStyle-CssClass="hide"/>
                        <asp:TemplateField ItemStyle-Width="30px">
                            <HeaderTemplate>
                                <asp:CheckBox ID="chkboxSelectAll" runat="server"  OnCheckedChanged="chkboxSelectAll_CheckedChanged"  AutoPostBack="true"  />
                            </HeaderTemplate>
                            <ItemTemplate>
                                <asp:CheckBox ID="chkEmp" runat="server" onclick="CheckBoxCount();" ></asp:CheckBox>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="date" SortExpression="date" HeaderText="Date" DataFormatString="{0:MM/dd/yyyy}" ReadOnly="True" HeaderStyle-CssClass="hide" ItemStyle-CssClass="hide"/>
                        <asp:BoundField DataField="job_subject" SortExpression="job_subject" HeaderText="Job Title"/>
                        <asp:BoundField DataField="description" SortExpression="description" HeaderStyle-CssClass="hide" ItemStyle-CssClass="hide"/>
                        <asp:BoundField DataField="status" SortExpression="status" HeaderStyle-CssClass="hide" ItemStyle-CssClass="hide"/>
                        <asp:TemplateField HeaderText="Action">
                            <ItemTemplate>
                                <asp:LinkButton ID="lnkEdit" runat="server" OnClick="view" class="fa fa-pencil"></asp:LinkButton>
                                <asp:LinkButton ID="LinkButton1" runat="server" OnClientClick="Confirm(this,'delete',1)" OnClick="delete" ToolTip="delete" class="fa fa-trash"></asp:LinkButton> <%----%>
                                <asp:LinkButton ID="lnk_approve" runat="server" ToolTip='<%# Bind("status") %>' OnClick="Approved"  OnClientClick="Confirm(this,'approve',1)" ></asp:LinkButton> <%----%>
                            </ItemTemplate>
                            <ItemStyle Width="100px" CssClass="action" />
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
                <label>Department <asp:Label ID="Label1" runat="server" ForeColor="Red"></asp:Label></label>
                <asp:DropDownList ID="drop_type" runat="server"></asp:DropDownList>
            </div>
            <div class="form-group">
                <label>Property <asp:Label ID="Label2" runat="server" ForeColor="Red"></asp:Label></label>
                <asp:DropDownList ID="dro_loc" runat="server"></asp:DropDownList>
            </div>
            <div class="form-group">
                <label>Job Title <asp:Label ID="lbl_title" runat="server" ForeColor="Red"></asp:Label></label>
                <asp:TextBox ID="txt_subject" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="form-group">
                <label>Section <asp:Label ID="lbl_section" runat="server" ForeColor="Red"></asp:Label></label>
                <asp:TextBox ID="txt_section" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
             <div class="form-group no-margin">
                <label>Qualifications <asp:Label ID="lbl_qualification" runat="server" ForeColor="Red"></asp:Label></label>
                <asp:TextBox ID="txt_qualification" runat="server" ClientIDMode="Static" TextMode="MultiLine" CssClass="form-control"></asp:TextBox>
            </div>
        </div>
        <div class="modal-footer modal-left">
            <asp:Button ID="Button2" runat="server"  OnClick="click_action"  class="btn btn-primary" Text="Submit"/>
            <asp:Button ID="Button1" runat="server" OnClick="savedraft" Text="Draft" CssClass="dft pull-right" />
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


<div class="page-header hidden">
    <div class="pcs">
        <div class="pcs-a">
            <asp:ImageButton ID="ib_del" runat="server"  ImageUrl="~/style/img/icon/i-delete.png" OnClick="delete2" style="margin-top:-2px;  float:left; display:none" />
        </div>
        <asp:Button ID="btn_search" runat="server" OnClick="search" Text="GO" CssClass="btn" Visible="false" />
        <div class="pcs-sub">
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                ConnectionString="<%$ ConnectionStrings:dbconnection %>" 
                SelectCommand="SELECT [description], [id] FROM [location] where status is null">
            </asp:SqlDataSource>
        </div>
    </div>
</div>

 
  
<div class="hide"> 
<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>   
</div>

<div id="panelOverlay" visible="false" runat="server" class="Overlay"></div>
<div id="panelPopUpPanel" visible="false" runat="server" class="PopUpPanel">
    <asp:ImageButton ID="can" runat="server" CausesValidation="false" OnClick="add_close" CssClass="close" CommandName="Delete" ImageUrl="~/style/img/closeb.png" />
    <ul>
        
        <li style=" display:none;">Job Description <asp:Label ID="lbl_details" ForeColor="Red" runat="server" Text=""></asp:Label></li>
        <li style=" display:none;"><asp:TextBox ID="txt_details" runat="server" Height="300px" TextMode="MultiLine"></asp:TextBox></li>
    </ul>
</div>


</asp:Content>

