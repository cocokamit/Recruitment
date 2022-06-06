<%@ Page Language="C#" AutoEventWireup="true" CodeFile="examresult.aspx.cs" Inherits="content_HR_examresult" MasterPageFile="~/content/NewMasterPage.master" %>

<asp:Content ID="accounting_hide" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ContentPlaceHolderID="content" runat="server" ID="content_user">
<asp:ScriptManager ID="myScriptManager" runat="server"></asp:ScriptManager>
<section class="content-header">
    <h1>Examination Result</h1>
    <ol class="breadcrumb">
    <li><a href="dashboard"><i class="fa fa-dashboard"></i> Home</a></li>
    <li class="active">Examination Result</li>
    </ol>
</section>
<section class="content">
 <div class="row">
        <div class="col-xs-12">
          <div class="box box-primary">
            <div class="box-header">
                <div class="input-group input-group-sm" style="width: 300px;">
                     <asp:TextBox ID="txt_search" runat="server" class="form-control pull-right" AutoPostBack="true" placeholder="Search"></asp:TextBox>
                      <div class="input-group-btn">
                        <asp:LinkButton ID="lb_search" runat="server" class="btn btn-default"><i class="fa fa-search"></i></asp:LinkButton>
                      </div>
                </div>
            </div>
            <div class="box-body table-responsive padding no-pad-top">
                <asp:Label ID="lbl_del_notify" runat="server" style=" position:absolute; right:120px; margin:15px; font-size:11px; " ></asp:Label>
                 <div id="alert" runat="server" class="alert alert-info alert-dismissible">
                    <h4><i class="icon fa fa-check-circle"></i> No record found</h4>
                 </div>
                <asp:GridView ID="grid_app" runat="server" AutoGenerateColumns="False" onrowdatabound="grid_app_RowDataBound" CssClass="table table-bordered table-hover dataTable" AllowSorting="True">
                    <Columns>
                         <asp:BoundField DataField="app_id"  HeaderStyle-CssClass="hide" ItemStyle-CssClass="hide"/>
                         <asp:BoundField DataField="id"  HeaderStyle-CssClass="hide" ItemStyle-CssClass="hide"/>
                         <asp:BoundField DataField="e_id" HeaderStyle-CssClass="hide" ItemStyle-CssClass="hide"/>
                         <asp:BoundField DataField="date" HeaderText="Date" dataformatstring="{0:MM/dd/yyyy}" />
                         <asp:BoundField DataField="name" HeaderText="Name" />
                         <asp:TemplateField HeaderText="Position Desire">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lnk_pd" runat="server" OnClick="click_pd"  ForeColor="red"  style="  text-transform:none;" Text='<%# Bind("pos_desire") %>' ></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="score" HeaderText="Score" />
                            <asp:BoundField DataField="noofitems" HeaderText="Items" />
                            <asp:TemplateField HeaderText="Status">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lnk_st" runat="server" ></asp:LinkButton> 
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:LinkButton ID="lnk_editStat" runat="server" Text='view' OnClick="view" ><img src="style/img/icon/i-detail.PNG" width="18px" alt="delete" /></asp:LinkButton>
                                </ItemTemplate>
                                <ItemStyle Width="20px" />
                            </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
          </div>
        </div>
      </div>
</section>


<div id="panelOverlay" visible="false" runat="server" class="Overlay"></div>
<div id="panelPopUpPanel" visible="false" runat="server" class="PopUpPanel">
   <asp:ImageButton ID="can"  runat="server" CausesValidation="false" OnClick="add_close" CssClass="close" ImageUrl="~/style/img/closeb.png" />
    <asp:ListView ID="lv" runat="server">
    </asp:ListView>
</div>
</asp:Content>