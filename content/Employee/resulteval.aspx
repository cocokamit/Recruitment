<%@ Page Language="C#" AutoEventWireup="true" CodeFile="resulteval.aspx.cs" Inherits="content_Employee_resulteval" MasterPageFile="~/content/NewMasterPage.master" %>

<asp:Content ID="head" runat="server" ContentPlaceHolderID="head">
    <style type="text/css">
        .rating{ float:right; width:100px; margin-top:-20px; }
        .rating span {border:1px solid red;   }
        .rating:not(:checked) > input {position:absolute;top:-9999px;clip:rect(0,0,0,0);}
        .rating:not(:checked) > label {float:right;width:1em;padding:0 .1em;overflow:hidden;white-space:nowrap;cursor:pointer;font-size:100%;line-height:1.2;color:#ddd;}
        .rating:not(:checked) > label:before {content: '★ ';}
        .rating> input:checked ~ label {color: #82b3d5;/** text-shadow:1px 1px goldenrod, 2px 2px #B57340, .1em .1em .2em rgba(0,0,0,.5);**/}
        .rating> label:active {position:relative;top:2px;left:2px;}
    </style>
</asp:Content>

<asp:Content ContentPlaceHolderID="content" ID="content_location" runat="server">
<section class="content-header">
    <h1>Evaluation Result</h1>
    <ol class="breadcrumb">
    <li><a href="dashboard"><i class="fa fa-dashboard"></i> Home</a></li>
    <li class="active">Evaluation Result</li>
    </ol>
</section>
<section class="content">
 <div class="row">
        <div class="col-xs-12">
          <div class="box box-primary">
            <div class="box-header">
                <div class="input-group input-group-sm" style="width: 300px;">
                     <asp:TextBox ID="txt_search" runat="server" class="form-control pull-right" OnTextChanged="search" AutoPostBack="true" placeholder="Search"></asp:TextBox>
                      <div class="input-group-btn">
                        <asp:LinkButton ID="lb_search" runat="server" OnClick="search" class="btn btn-default"><i class="fa fa-search"></i></asp:LinkButton>
                      </div>
                </div>
            </div>
            <div class="box-body table-responsive padding no-pad-top">
                <asp:Label ID="lbl_del_notify" runat="server" style=" position:absolute; right:120px; margin:15px; font-size:11px; " ></asp:Label>
                 <div id="alert" runat="server" class="alert alert-info alert-dismissible">
                    <h4><i class="icon fa fa-check-circle"></i> No record found</h4>
                 </div>
                <asp:GridView ID="grid_view" CssClass="table table-bordered table-hover dataTable" runat="server" AutoGenerateColumns="false" >
                    <Columns>
                        <asp:BoundField DataField="id" HeaderStyle-CssClass="hide" ItemStyle-CssClass="hide"/>
                        <asp:BoundField DataField="name" HeaderText="Applicants"/>
                        <asp:BoundField DataField="pos_desire" HeaderText="Position Desired"/>
                        <asp:TemplateField HeaderText="">
                            <ItemTemplate>
                                <asp:LinkButton ID="lnk_view"  runat="server" OnClick="viewresult" CssClass="fa fa-sliders no-border no-pad-right"></asp:LinkButton>
                            </ItemTemplate>
                            <ItemStyle Width="20px" />
                        </asp:TemplateField>
                    </Columns>
                    <HeaderStyle CssClass="GridviewScrollHeader" /> 
                    <RowStyle CssClass="GridviewScrollItem" /> 
                    <PagerStyle CssClass="GridviewScrollPager" /> 
                </asp:GridView>
            </div>
          </div>
        </div>
      </div>
</section>

<div id="modalview" runat="server" class="modal fade in">
    <div class="modal-dialog">  
        <div class="modal-content">
            <div class="modal-header">
                <asp:LinkButton ID="LinkButton1" runat="server" OnClick="add_close" class="close" aria-hidden="true"><span aria-hidden="true">&times;</span></asp:LinkButton>
                <h4 class="modal-title">Evaluation</h4>
            </div>
            <div class="modal-body">
            <div style="border-bottom:solid #7faec2; margin-bottom:10px"></div>
            <asp:ListView ID="lv_pii" runat="server" class="rating">
            </asp:ListView>
            </div>
             
        </div>
    </div>
</div>
 

 
</asp:Content>