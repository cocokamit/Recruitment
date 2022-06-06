<%@ Page Language="C#" AutoEventWireup="true" CodeFile="location.aspx.cs" Inherits="content_Employee_location"  MaintainScrollPositionOnPostback="true" MasterPageFile="~/content/NewMasterPage.master" %>

<asp:Content ID="head" runat="server" ContentPlaceHolderID="head">
</asp:Content>

<asp:Content ContentPlaceHolderID="content" ID="content_location" runat="server">
<section class="content-header">
    <h1>Properties</h1>
    <ol class="breadcrumb">
    <li><a href="dashboard"><i class="fa fa-dashboard"></i> Home</a></li>
    <li class="active">Properties</li>
    </ol>
</section>
<section class="content">
 <div class="row">
        <div class="col-xs-12">
          <div class="box box-primary">
            <div class="box-header">
                <div class="input-group input-group-sm" style="width: 300px;">
                     <asp:TextBox ID="txt_location" runat="server" class="form-control pull-right" AutoPostBack="true" placeholder="Search"></asp:TextBox>
                      <div class="input-group-btn">
                        <asp:LinkButton ID="lb_search" runat="server" OnClick="searchlocation" class="btn btn-default"><i class="fa fa-search"></i></asp:LinkButton>
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
                        <asp:BoundField DataField="description" HeaderText="Properties" SortExpression="description" />
                        <asp:TemplateField HeaderText="" Visible="true">
                            <ItemTemplate>
                                <asp:LinkButton ID="lnk_edit" OnClick="view" runat="server" CssClass="fa fa-edit"></asp:LinkButton>
                                <asp:LinkButton ID="lnk_delete" OnClientClick="Confirm(this,'delete')" OnClick="delete" runat="server" CssClass="fa fa-trash no-border no-border no-pad-right"></asp:LinkButton>
                            </ItemTemplate>
                            <ItemStyle Width="70px" CssClass="action" />
                        </asp:TemplateField>
                    </Columns>
               </asp:GridView>
            </div>
          </div>
        </div>
      </div>
</section>


      <hr />
<section class="content">
 <div class="row">
        <div class="col-xs-12">
          <div class="box box-primary">
            <div class="box-header">
                <div class="input-group input-group-sm" style="width: 300px;">
                     <asp:TextBox ID="txt_location2" runat="server" class="form-control pull-right" AutoPostBack="true" placeholder="Search"></asp:TextBox>
                      <div class="input-group-btn">
                        <asp:LinkButton ID="lb_search2" runat="server" OnClick="searchlocation2" class="btn btn-default"><i class="fa fa-search"></i></asp:LinkButton>
                      </div>
                </div>
                <div class="box-tools box-tool-add">
                    <asp:LinkButton ID="lb_add2" runat="server" OnClick="view_save2" CssClass="btn btn-block btn-primary">Add</asp:LinkButton>
                </div>
            </div>
            <div class="box-body table-responsive padding no-pad-top">
                <asp:Label ID="lbl_del_notify2" runat="server" style=" position:absolute; right:120px; margin:15px; font-size:11px; " ></asp:Label>
                 <div id="alert2" runat="server" class="alert alert-info alert-dismissible">
                    <h4><i class="icon fa fa-check-circle"></i> No record found</h4>
                 </div>
                 <asp:GridView ID="grid_view2" CssClass="table table-bordered table-hover dataTable" runat="server" AutoGenerateColumns="false">
                    <Columns>
                        <asp:BoundField DataField="id" HeaderStyle-CssClass="hide" ItemStyle-CssClass="hide"/>
                        <asp:BoundField DataField="description" HeaderText="Company" SortExpression="description" />
                        <asp:TemplateField HeaderText="" Visible="true">
                            <ItemTemplate>
                                <asp:LinkButton ID="lnk_edit" OnClick="view2" runat="server" CssClass="fa fa-edit"></asp:LinkButton>
                                <asp:LinkButton ID="lnk_delete" OnClientClick="Confirm2(this,'delete')" OnClick="delete2" runat="server" CssClass="fa fa-trash no-border no-border no-pad-right"></asp:LinkButton>
                            </ItemTemplate>
                            <ItemStyle Width="70px" CssClass="action" />
                        </asp:TemplateField>
                    </Columns>
               </asp:GridView>
            </div>
          </div>
        </div>
      </div>

</section>


<div id="modaladd" runat="server" class="modal fade in">
    <div class="modal-dialog" style="position:fixed; margin-left:30%;">
        <div class="modal-content">
            <div class="modal-header">
                <asp:LinkButton ID="LinkButton1" runat="server" OnClick="add_close" class="close" aria-hidden="true"><span aria-hidden="true">&times;</span></asp:LinkButton>
                <h4 class="modal-title">Create Property</h4>
            </div>
            <div class="modal-body">
                <div class="form-group no-margin">
                    <label>Location</label> <asp:Label ID="lbl_loc" ForeColor="Red" runat="server" Text=""></asp:Label>
                    <asp:TextBox ID="txt_type" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
            </div>
            <div class="modal-footer">
                <asp:Button ID="Button3" runat="server" Text="Save" OnClick="save" CssClass="btn btn-primary" />
            </div>
        </div>
    </div>
</div> 



<div id="modaladd2" runat="server" class="modal fade in">
    <div class="modal-dialog" style="position:fixed; margin-left:30%;">
        <div class="modal-content">
            <div class="modal-header">
                <asp:LinkButton ID="LinkButton3" runat="server" OnClick="add_close" class="close" aria-hidden="true"><span aria-hidden="true">&times;</span></asp:LinkButton>
                <h4 class="modal-title">Create Company</h4>
            </div>
            <div class="modal-body">
                <div class="form-group no-margin">
                    <label>Company Name</label> <asp:Label ID="lbl_loc2" ForeColor="Red" runat="server" Text=""></asp:Label>
                    <asp:TextBox ID="txt_type2" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
            </div>
            <div class="modal-footer">
                <asp:Button ID="Button1" runat="server" Text="Save" OnClick="save2" CssClass="btn btn-primary" />
            </div>
        </div>
    </div>
</div> 

<div id="modaledit" runat="server" class="modal fade in">
    <div class="modal-dialog" style="position:fixed; margin-left:30%;">
        <div class="modal-content">
            <div class="modal-header">
                <asp:LinkButton ID="LinkButton2" runat="server" OnClick="add_close" class="close" aria-hidden="true"><span aria-hidden="true">&times;</span></asp:LinkButton>
                <h4 class="modal-title">Edit Property</h4>
            </div>
            <div class="modal-body">
                <div class="form-group no-margin">
                    <label>Location</label> <asp:Label ID="lbl_class" ForeColor="Red" runat="server" Text=""></asp:Label>
                    <asp:TextBox ID="txt_class" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
            </div>
            <div class="modal-footer">
                <asp:Button ID="Button2" runat="server" Text="Edit" OnClick="edit" CssClass="btn btn-primary" />
            </div>
        </div>
    </div>
</div> 


<div id="modaledit2" runat="server" class="modal fade in">
    <div class="modal-dialog" style="position:fixed; margin-left:30%;">
        <div class="modal-content">
            <div class="modal-header">
                <asp:LinkButton ID="LinkButton4" runat="server" OnClick="add_close" class="close" aria-hidden="true"><span aria-hidden="true">&times;</span></asp:LinkButton>
                <h4 class="modal-title">Edit Company Name</h4>
            </div>
            <div class="modal-body">
                <div class="form-group no-margin">
                    <label>Location</label> <asp:Label ID="lbl_class2" ForeColor="Red" runat="server" Text=""></asp:Label>
                    <asp:TextBox ID="txt_class2" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
            </div>
            <div class="modal-footer">
                <asp:Button ID="Button4" runat="server" Text="Edit" OnClick="edit2" CssClass="btn btn-primary" />
            </div>
        </div>
    </div>
</div> 

<asp:TextBox ID="TextBox1" runat="server" CssClass="hide"></asp:TextBox>   

<asp:TextBox ID="TextBox2" runat="server" CssClass="hide"></asp:TextBox>   
<script type="text/javascript">
    function Confirm(msg) {
        var confirm_value = document.getElementById("<%= TextBox1.ClientID %>")
        if (confirm("Are you sure you want to delete this location?"))
            confirm_value.value = "Yes";
        else
            confirm_value.value = "No";
    }

    function Confirm2(msg) {
        var confirm_value = document.getElementById("<%= TextBox2.ClientID %>")
        if (confirm("Are you sure you want to delete this company?"))
            confirm_value.value = "Yes";
        else
            confirm_value.value = "No";
    }
</script>
</asp:Content>

