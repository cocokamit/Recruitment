<%@ Page Language="C#" AutoEventWireup="true" CodeFile="examinition.aspx.cs" Inherits="content_HR_Exam_examinition" MasterPageFile="~/content/NewMasterPage.master" %>

<asp:Content ID="head" runat="server" ContentPlaceHolderID="head">
    <script type="text/javascript">
        function fixedlength(textboxID, keyEvent, maxlength) {
            var re = new RegExp("^[0-9]*[.][0-9]+$");
            if (textboxID.value <= 100) {
                if (textboxID.value.length > maxlength) {
                    textboxID.value = textboxID.value.substr(0, maxlength);
                }
                else if (textboxID.value.length < maxlength || textboxID.value.length == maxlength) {
                    textboxID.value = textboxID.value != re ? textboxID.value.replace(/[^\d.]+/g, '') : textboxID.value;
                    return true;
                }
                else
                    return false;
            }
            else {
                textboxID.value ='';
            }
        }
</script>
</asp:Content>

<asp:Content ContentPlaceHolderID="content" ID="content_examinition" runat="server">
<asp:ScriptManager ID="myScriptManager" runat="server"></asp:ScriptManager>
<section class="content-header">
    <h1>Examination</h1>
    <ol class="breadcrumb">
    <li><a href="dashboard"><i class="fa fa-dashboard"></i> Home</a></li>
    <li class="active">Examination</li>
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
                    <asp:LinkButton ID="lb_add" runat="server" OnClick="exam_view" CssClass="btn btn-block btn-primary">Add</asp:LinkButton>
                </div>
            </div>
            <div class="box-body table-responsive padding no-pad-top">
                <asp:Label ID="lbl_del_notify" runat="server" style=" position:absolute; right:120px; margin:15px; font-size:11px; " ></asp:Label>
                 <div id="alert" runat="server" class="alert alert-info alert-dismissible">
                    <h4><i class="icon fa fa-check-circle"></i> No record found</h4>
                 </div>
                <asp:GridView ID="grid_view" runat="server" AutoGenerateColumns="false"  CssClass="table table-bordered table-hover dataTable">
                    <Columns>
                        <asp:BoundField DataField="id"  HeaderStyle-CssClass="hide" ItemStyle-CssClass="hide" />
                        <asp:BoundField DataField="description" HeaderText="Title" SortExpression="description" />
                        <asp:BoundField DataField="time_limit" HeaderText="Time Limit" SortExpression="time_limit" />
                         <asp:BoundField DataField="passing" HeaderText="Passing Rate" SortExpression="time_limit" />
                        <asp:TemplateField HeaderText="Action">
                            <ItemTemplate>
                                <asp:LinkButton ID="lnk_edit" runat="server" OnClick="update_view" CssClass="fa fa-pencil"></asp:LinkButton>
                                <asp:LinkButton ID="lnk_customize" runat="server" OnClick="customize_view" CssClass="fa fa-list-ol "></asp:LinkButton>
                                <asp:LinkButton ID="lnk_delete" runat="server"  OnClientClick="Confirm(this,'examinition')"  OnClick="delete" CssClass="fa fa-trash no-border no-pad-right"></asp:LinkButton>
                            </ItemTemplate>
                            <ItemStyle Width="102px" CssClass="action" />
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
                <asp:LinkButton ID="LinkButton1" runat="server" OnClick="click_close" class="close" aria-hidden="true"><span aria-hidden="true">&times;</span></asp:LinkButton>
                <h4 class="modal-title">Create Examination</h4>
            </div>
            <div class="modal-body">
                <div class="form-group">
                    <label>Title</label> <asp:Label ID="lbl_exam" ForeColor="Red" runat="server" Text=""></asp:Label>
                    <asp:TextBox ID="txt_exam" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label>Time Limit <i style=" font-size:10px">(HH:MM:SS)</i></label> <asp:Label ID="lbl_limit" ForeColor="Red" runat="server" Text=""></asp:Label>
                    <asp:TextBox ID="txt_limit" runat="server"  CssClass="form-control"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label>Passing Rate</label> <asp:Label ID="lbl_passing" runat="server" ForeColor="Red"></asp:Label>
                    <asp:TextBox ID="txt_passing"  CssClass="form-control"  onblur="return fixedlength(this, event, 6);" onkeypress="return fixedlength(this, event, 6);" onkeyup="return fixedlength(this, event, 6);"  onpaste="return false" autocomplete="off" runat="server" ></asp:TextBox>
                </div>
            </div>
            <div class="modal-footer">
                <asp:Button ID="Button2" runat="server" Text="ADD" OnClick="add" CssClass="btn btn-primary" />
            </div>
        </div>
    </div>
</div> 


<div id="modaledit" runat="server" class="modal fade in">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <asp:LinkButton ID="LinkButton2" runat="server" OnClick="click_close" class="close" aria-hidden="true"><span aria-hidden="true">&times;</span></asp:LinkButton>
                <h4 class="modal-title">Edit Examination</h4>
            </div>
            <div class="modal-body">
                <div class="form-group">
                    <label>Description</label> <asp:Label ID="Label2" ForeColor="Red" runat="server" Text=""></asp:Label>
                    <asp:TextBox ID="txt_typee" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label>Time Limit <i style=" font-size:10px">(HH:MM:SS)</i></label> <asp:Label ID="Label3" ForeColor="Red" runat="server" Text=""></asp:Label>
                    <asp:TextBox ID="txt_t" runat="server"  CssClass="form-control"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label>Passing Rate</label> <asp:Label ID="Label6" runat="server" ForeColor="Red"></asp:Label>
                    <asp:TextBox ID="TextBox4"  CssClass="form-control"  onblur="return fixedlength(this, event, 6);" onkeypress="return fixedlength(this, event, 6);" onkeyup="return fixedlength(this, event, 6);"  onpaste="return false" autocomplete="off" runat="server" ></asp:TextBox>
                </div>
            </div>
            <div class="modal-footer">
                <asp:Button ID="Button3" runat="server" Text="Update" OnClick="update" CssClass="btn btn-primary" />
            </div>
        </div>
    </div>
</div> 


<div id="panelOverlay" visible="false" runat="server" class="Overlay"></div>
<div id="panelPopUpPanel" visible="false" runat="server" class="PopUpPanel">
    <div class="fileuploadDiv" id="customize" runat="server">
        <ul class="ul">
             <li>Description</li>
            <li><asp:Label ID="lbl_type" ForeColor="Red" runat="server" Text=""></asp:Label></li>
            <li>Question</li>
            <li><asp:TextBox ID="txt_question" Width="300px" Height="30px" runat="server" ></asp:TextBox>
                <asp:Label ID="lbl_question" ForeColor="Red" runat="server" Text=""></asp:Label>
            </li>
                   <asp:GridView ID="grid_item" AutoGenerateColumns="false" ShowFooter="True" CssClass="table" onrowdeleting="grid_item_RowDeleting" runat="server">
                <Columns>
                    <asp:TemplateField> 
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("RowNumber") %>'></asp:Label>.
                        </ItemTemplate>
                        <FooterTemplate >             
                            <asp:ImageButton ID="btn"  runat="server" OnClick="ButtonAdd_Click" ImageUrl="~/style/img/add.png"/> 
                        </FooterTemplate>
                    </asp:TemplateField>
                        <asp:TemplateField HeaderText="Choices">
                        <ItemTemplate>
                            <asp:Label ID="lbl_discription" runat="server" CssClass="na" Text=""></asp:Label>
                            <asp:Label ID="lbl_2nd_discription"  runat="server" Text=""></asp:Label>
                            <asp:textbox ID="txt_discription" runat="server" Text="" ></asp:textbox>
                        </ItemTemplate>
                    </asp:TemplateField>
                   <asp:TemplateField HeaderText="Answer">
                        <ItemTemplate>
                            <asp:CheckBox ID="cb_ib" runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ShowHeader="False">
                        <ItemTemplate>
                            <asp:ImageButton ID="can" runat="server" CausesValidation="false" CommandName="Delete" ImageUrl="~/style/img/delete.png" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            
        </ul>
        <hr />        
        <center>
        <asp:Button ID="Button1" runat="server" Text="SAVE" OnClick="save" CssClass="btn" />
        </center>
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
