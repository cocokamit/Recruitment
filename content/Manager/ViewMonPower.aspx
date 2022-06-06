<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ViewMonPower.aspx.cs" Inherits="content_Manager_ViewMonPower"
    MasterPageFile="~/content/NewMasterPage.master" %>
    <%@ Import Namespace="System.Data" %>

<asp:Content ID="head" runat="server" ContentPlaceHolderID="head">
    <link href="style/css/tablechkbx.css" rel="stylesheet" type="text/css" />
    <link href="vendors/select2/dist/css/select2.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .PopUpPanel
        {
            left: 50%;
            margin-left: -200px;
        }
        .PopUpPanel textarea
        {
            width: 97%;
            font-size: 12px;
        }
        .table
        {
            margin: 0 0 5px 0;
        }
        .pcs-sub
        {
            float: left;
        }
        .tablea
        {
            border: 1px solid gray;
            padding: 5px 10px;
        }
        #chcklist1 label, #chcklist2 label, #chcklist3 label
        {
            margin-right: 50px;
        }
    </style>
</asp:Content>
<asp:Content ContentPlaceHolderID="content" runat="server" ID="view_mp">
    <section class="content-header">
    <h1>Manpower Request</h1>
    <ol class="breadcrumb">
    <li><a href="dashboard"><i class="fa fa-dashboard"></i> Home</a></li>
    <li class="active">Manpower Request</li>
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
            </div>
             <div class="box-body table-responsive padding no-pad-top">
                 <div id="alert" runat="server" class="alert alert-info alert-dismissible">
                    <h4><i class="icon fa fa-check-circle"></i> No record found</h4>
                 </div>
               <asp:GridView ID="grid_data" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered table-hover dataTable" AllowSorting="true">
                    <Columns>
                        <asp:BoundField DataField="id" HeaderText="Form No." ItemStyle-CssClass="label-default"/>
                         <asp:BoundField DataField="date" HeaderText="Dated Filed" DataFormatString="{0:MM/dd/yyyy}" />
                        <asp:BoundField DataField="position" SortExpression="Position" HeaderText="Position"/>
                        <asp:BoundField DataField="Department" HeaderText="Department"/>
                        <asp:BoundField DataField="Branch"  HeaderText="Location"/>
                         <asp:BoundField DataField="Fullname"  HeaderText="Request By"/>
                         <asp:BoundField DataField="no_pax"  HeaderStyle-CssClass="hide" ItemStyle-CssClass="hide"/>
                         <asp:BoundField DataField="appliNo"  HeaderStyle-CssClass="hide" ItemStyle-CssClass="hide"/>
                         <asp:BoundField DataField="status"  HeaderStyle-CssClass="hide" ItemStyle-CssClass="hide"/>
                        <asp:TemplateField HeaderText="Status">
                            <ItemTemplate>
                                <asp:LinkButton runat="server" ID="lnk_status" Text='<%# Bind("status") %>' OnClick="view_ko" ForeColor='<%# Eval("status").ToString()=="Pending"?System.Drawing.ColorTranslator.FromHtml("#808080"):Eval("status").ToString()=="On-going"?System.Drawing.ColorTranslator.FromHtml("#FF0000"):System.Drawing.ColorTranslator.FromHtml("#00FF66") %>'></asp:LinkButton>
                            </ItemTemplate>
                            <HeaderStyle Width="100" />
                        </asp:TemplateField>  
                           
                           <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Label runat="server" ID="lb_pax" Visible='<%# Eval("status").ToString()=="On-going"? true :Eval("status").ToString()=="Done"? true :false %>'><%# Eval("appliNo").ToString()%>/<%# Eval("no_pax").ToString()%></asp:Label>
                                <asp:LinkButton runat="server" ID="lnk_set" OnClick="view_App"><i class="fa fa-group" ></i></asp:LinkButton> <%--Visible='<%# Eval("status").ToString()=="On-going"? true :false %>'--%>
                            </ItemTemplate>
                            <HeaderStyle Width="70" />
                        </asp:TemplateField>  
                           <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Label runat="server" ID="asd">&nbsp;</asp:Label>
                                <asp:LinkButton runat="server" ID="lnk_eye" OnClick="view_ko" ><i class="fa fa-eye"></i></asp:LinkButton>
                            </ItemTemplate>
                            <HeaderStyle Width="50" />
                        </asp:TemplateField>  
                        <asp:TemplateField>
                            <ItemTemplate>
                                    <asp:Label ID="pwpwpw" runat="server" CssClass="label label-success" Text=" " Visible='<%# Eval("mark").ToString()=="1"? true :false %>'> </asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                           <asp:TemplateField Visible="false">
                            <ItemTemplate>
                                <asp:LinkButton runat="server" ID="lnk_view" OnClick="view_ko" Text="View" ForeColor="Red" ></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>   
                    </Columns>
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
                    <asp:LinkButton ID="LinkButton1" runat="server" OnClick="add_close" class="close"
                        aria-hidden="true"><span aria-hidden="true">&times;</span></asp:LinkButton>
                    <h4 class="modal-title">
                        Request Details</h4>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <h4 class="pull-left label label-info">
                            Date Filed: &nbsp;<asp:Label ID="txtdate" class="" runat="server"></asp:Label></h4>
                        <h4 class="label label-default pull-right">
                            Form No. &nbsp;<asp:Label ID="txtfnum" ClientIDMode="Static" class="" runat="server"></asp:Label></h4>
                    </div>
                    <hr />
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label>
                                    Site/Branch</label>
                                <asp:Label ID="dorp_b" CssClass="form-control" runat="server">
                                </asp:Label>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label>
                            Department/Division Name</label>
                        <asp:Label ID="drop_d" CssClass="form-control" runat="server">
                        </asp:Label>
                    </div>
                    <hr />
                    <h5>
                        <strong>REQUESTED JOB INFORMATION</strong></h5>
                    <hr />
                    <div class="form-group">
                        <label>
                            Position Title</label>
                        <asp:Label ID="txt_p" runat="server" CssClass="form-control"></asp:Label>
                    </div>
                    <div class="form-group">
                        <label>
                            Position Reports to</label>
                        <asp:Label ID="drop_rep" CssClass="form-control" runat="server">
                        </asp:Label>
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label>
                                    Job level</label>
                                <asp:Label ID="drop_l" CssClass="form-control" runat="server">
                                </asp:Label>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label>
                                    Position Type</label>
                                <asp:Label ID="drop_n" CssClass="form-control" ClientIDMode="Static" runat="server">
                                </asp:Label>
                            </div>
                        </div>
                    </div>
                    <div class="row" id="Div3" style="display: none;">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label>
                                    Contractual:</label>
                                <asp:Label ID="drop_con" runat="server" CssClass="form-control">
                                </asp:Label>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label>
                                    Duration</label>
                                <asp:Label ID="txt_du" runat="server" CssClass="form-control"></asp:Label>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label>
                                    Reason for Vacancy</label>
                                <asp:Label ID="drop_r" CssClass="form-control" runat="server">
                                </asp:Label>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label>
                                    Budget Allocation</label>
                                <asp:Label ID="drop_all" runat="server" CssClass="form-control">
                                </asp:Label>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label>
                                    No. of Manpower Requested</label>
                                <asp:Label ID="txt_np" runat="server" CssClass="form-control"></asp:Label>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label>
                                    Date of start</label>
                                <asp:Label ID="txt_dn" ClientIDMode="Static" runat="server" CssClass="datee form-control"></asp:Label>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label>
                            Summary of function</label>
                        <asp:TextBox ID="txt_s" runat="server" ReadOnly="true" TextMode="MultiLine" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label>
                            Qualification requirement or equivalent</label>
                        <asp:TextBox ID="txt_q" runat="server" ReadOnly="true" TextMode="MultiLine" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label>
                            Specific experience required</label>
                        <asp:TextBox ID="txt_sp" runat="server" ReadOnly="true" TextMode="MultiLine" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label>
                            Expected system knowledge</label>
                        <asp:TextBox ID="txt_ex" runat="server" ReadOnly="true" TextMode="MultiLine" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label>
                            Justification for new position / additional manpower request</label>
                        <asp:TextBox ID="txt_just" runat="server" ReadOnly="true" CssClass="form-control"
                            TextMode="MultiLine"></asp:TextBox>
                    </div>
                    <div class="form-group" style="display: none;">
                        <label>
                            Reason</label>
                        <asp:TextBox ID="txt_r" runat="server" ReadOnly="true" CssClass="form-control" TextMode="MultiLine"></asp:TextBox>
                    </div>
                    <hr />
                    <div class="row">
                        <div class="col-md-12">
                            <label>
                                Tools Requisition:</label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <asp:CheckBoxList ID="chcklist2" onclick="javascript: return false;" runat="server"
                                CssClass="checkbox checkbox-inline" RepeatLayout="table" RepeatColumns="2" RepeatDirection="vertical"
                                ClientIDMode="Static">
                                <asp:ListItem Value="Filing Cabinet">Filing Cabinet</asp:ListItem>
                                <asp:ListItem Value="Scotch Tape">Scotch Tape</asp:ListItem>
                                <asp:ListItem Value="Tape Dispense">Tape Dispense</asp:ListItem>
                                <asp:ListItem Value="Post-it">Post-it</asp:ListItem>
                                <asp:ListItem Value="Ballpen">Ballpen</asp:ListItem>
                                <asp:ListItem Value="Pentel Pen">Pentel Pen</asp:ListItem>
                                <asp:ListItem Value="Tapler">Tapler</asp:ListItem>
                                <asp:ListItem Value="Calculator">Calculator</asp:ListItem>
                            </asp:CheckBoxList>
                        </div>
                    </div>
                    <%-------------------------------Enumerate pending items-----------------------------------------%>
                    <div class="row">
                        <div class="col-md-6">
                            <table id="tblItems2" class="table" style="width: 100%" cellpadding="0" cellspacing="0">
                                <thead>
                                    <tr>
                                        <th>
                                            OTHERS
                                        </th>
                                        <th>
                                        </th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%if (spl.Count() > 1)
                                      {
                                          for (int i = 0; i < spl.Count() - 1; i++)
                                          { %>
                                    <tr>
                                        <td>
                                            <input type="text" style='border-color: transparent; outline: none; border-style: none;'
                                                value='<%=spl[i] %>' />
                                        </td>
                                    </tr>
                                    <%}
                                      } %>
                                </tbody>
                                <tfoot>
                                </tfoot>
                            </table>
                            <br />
                        </div>
                    </div>
                    <div class="row" id="hrcolor1" runat="server">
                        <div class="col-md-8">
                            <div class="form-group">
                                <label>
                                    HR and IT:(Tool Requisition)</label>
                                <asp:CheckBoxList ID="chcklist3" runat="server" onclick="javascript: return false;"
                                    CssClass="checkbox checkbox-inline" RepeatLayout="table" RepeatColumns="2" RepeatDirection="vertical"
                                    ClientIDMode="Static">
                                    <asp:ListItem Value="PC Desktop Set">PC Desktop Set</asp:ListItem>
                                    <asp:ListItem Value="Laptop Set">Laptop Set</asp:ListItem>
                                    <asp:ListItem Value="Table and Chair">Table and Chair</asp:ListItem>
                                    <asp:ListItem Value="Extension Line">Extension Line</asp:ListItem>
                                    <asp:ListItem Value="Mobile Phone">Mobile Phone</asp:ListItem>
                                    <asp:ListItem Value="Business Card">Business Card</asp:ListItem>
                                </asp:CheckBoxList>
                                <br />
                                <%-------------------------------Enumerate pending items-----------------------------------------%>
                                <div class="row">
                                    <div class="col-md-6">
                                        <table id="dadsa" class="table" style="width: 100%" cellpadding="0" cellspacing="0">
                                            <thead>
                                                <tr>
                                                    <th>
                                                        OTHERS
                                                    </th>
                                                    <th>
                                                    </th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <%if (spl2.Count() > 1)
                                                  {
                                                      for (int i = 0; i < spl2.Count() - 1; i++)
                                                      { %>
                                                <tr>
                                                    <td>
                                                        <input text='text' style='border-color: transparent; outline: none; border-style: none;'
                                                            value='<%=spl2[i] %>' />
                                                    </td>
                                                </tr>
                                                <%}
                                                  } %>
                                            </tbody>
                                            <tfoot>
                                            </tfoot>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <br />
                    <div class="row">
                        <div class="col-md-12">
                            <label>
                                Supporting Document for New Position:</label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <asp:GridView ID="grid_req" runat="server" AutoGenerateColumns="false" CssClass="table table-striped table-bordered">
                                <Columns>
                                    <asp:BoundField DataField="filename" HeaderText="File Name" />
                                    <asp:TemplateField HeaderText="Action">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="lnk_download" runat="server" CommandName='<%# Eval("id") %>'
                                                Text="download" OnClick="download"><i class="fa fa-download"></i></asp:LinkButton>
                                        </ItemTemplate>
                                        <ItemStyle Width="100px" />
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                            <div id="div_msg" runat="server" class="alert alert-empty">
                                <i class="fa fa-info-circle"></i><span>No record found</span>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="form-group">
                                <label>
                                    Requested by:</label>
                                <asp:Label runat="server" ID="txt_req" CssClass="form-control"> </asp:Label>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="form-group">
                                <label>
                                    Approver (Department Head):</label>
                                <%--<input type="button" id="Button7" aria-hidden="true" value="&plus;" />--%>
                                <asp:Label ID="approvername" ClientIDMode="Static" runat="server" Style="width: 100%">
                                </asp:Label>
                                <asp:Label ID="drop_appr" ClientIDMode="Static" CssClass="form-control" runat="server"
                                    Style="width: 50%">
                                </asp:Label>
                                <div class="form-group">
                                    <label>
                                        Remarks</label>
                                    <asp:TextBox ID="txt_appr" ReadOnly="true" runat="server" ForeColor="Red" CssClass="form-control"
                                        TextMode="MultiLine"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                    </div>
                    <hr />
                    <h5>
                        <strong>FOR HR RECRUITMENT INFORMATION ONLY</strong></h5>
                    <div class="row" id="hrcolor2" runat="server" style="background: rgb(220,220,220);
                        padding-top: 20px;">
                        <div class="col-md-5">
                            <div class="form-group">
                                <label>
                                    Eligibility</label>
                                <asp:RadioButtonList ID="radiolist1" runat="server" ClientIDMode="Static" CssClass="checkbox">
                                    <asp:ListItem Value="Internal Only">Internal Only</asp:ListItem>
                                    <asp:ListItem Value="External Only">External Only</asp:ListItem>
                                    <asp:ListItem Value="Internal and External Only">Internal and External Only</asp:ListItem>
                                    <asp:ListItem Value="NA - Already Filled">NA - Already Filled</asp:ListItem>
                                </asp:RadioButtonList>
                            </div>
                        </div>
                        <div class="col-md-7">
                            <div class="form-group">
                                <label>
                                    REMARKS</label>
                                <asp:TextBox ID="TextBox1" runat="server" TextMode="MultiLine" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                    <div class="row" runat="server" id="hrstatus" style="display: none">
                        <div class="col-md-8">
                            <div class="row">
                                <div class="col-md-12">
                                    <label>
                                        HUMAN RESOURCE and ADMIN</label>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <asp:Label ID="Label3" runat="server"></asp:Label>
                                    <asp:Label ID="Label4" CssClass=" form-control" runat="server"></asp:Label>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row" runat="server" id="Div2" style="background: rgb(220,220,220); padding-bottom: 10px;">
                        <div class="col-md-8">
                            <br />
                            <label>
                                EXECUTIVE</label>
                            <asp:DropDownList ID="drop_it2" ClientIDMode="Static" AutoComplete="off" runat="server"
                                CssClass="select2" Style="width: 100%">
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="row" runat="server" id="Div1" style="display: none;">
                        <div class="col-md-8">
                            <br />
                            <div class="row">
                                <div class="col-md-12">
                                    <label>
                                        EXECUTIVE</label>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <asp:Label ID="Label5" runat="server"></asp:Label>
                                    <asp:Label ID="Label6" CssClass=" form-control" runat="server"></asp:Label>
                                </div>
                            </div>
                        </div>
                    </div>
                    <hr />
                </div>
                <div class="modal-footer">
                    <asp:Button ID="Button1" runat="server" Text="APPROVE" OnClick="save_status" CssClass="btn btn-primary" />
                    <asp:Button ID="Button2" runat="server" Text="DECLINE" OnClick="save_status" CssClass="btn btn-success" />
                    <asp:Button ID="Button4" runat="server" Text="DONE" OnClick="save_status" Style="display: none;"
                        CssClass="btn btn-success pull-right" />
                    <asp:Button ID="Button5" runat="server" Text="ON-GOING" OnClick="save_status" Style="display: none;"
                        CssClass="btn btn-danger pull-right" />
                </div>
            </div>
        </div>
    </div>

    <div id="Div4" runat="server" class="modal fade in">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <asp:LinkButton ID="LinkButton2" runat="server" OnClick="add_close" class="close"
                        aria-hidden="true"><span aria-hidden="true">&times;</span></asp:LinkButton>
                    <h4 class="modal-title">
                        Assign New Applicants</h4>
                </div>
                <div class="modal-body">
                    <div class="row"> 
                        <div class="col-md-12">
                        
                            <asp:Label ID="lbl_del_notify" runat="server" style=" position:absolute; right:50px; margin-top:-30px; font-size:20px; "></asp:Label>
                            <asp:GridView ID="grid_view" runat="server" OnRowDataBound="grid_app_RowDataBound" AutoGenerateColumns="false" CssClass="table table-striped table-bordered">
                                <Columns>
                                
                                    <asp:BoundField DataField="id" HeaderStyle-CssClass="hide" ItemStyle-CssClass="hide"/>
                                    <asp:BoundField DataField="checkers" HeaderStyle-CssClass="hide" ItemStyle-CssClass="hide"/>
                                    <asp:BoundField DataField="Fullname" HeaderText="Name" />
                                    <asp:BoundField DataField="pos_desire" HeaderText="Position Desire" />
                                    <asp:BoundField DataField="status" HeaderStyle-CssClass="hide" ItemStyle-CssClass="hide" />
                                    <asp:TemplateField HeaderText="View">
                                        <ItemTemplate>
                                            <asp:LinkButton runat="server" ID="lnk_viewapp" OnClick="click_view" ><i class="fa fa-eye"></i></asp:LinkButton>
                                        </ItemTemplate>
                                        <ItemStyle Width="100px" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Action">
                                        <ItemTemplate>
                                            <asp:CheckBox ID="chkEmp" runat="server" ClientIDMode="Static" onclick="CheckBoxCount(this);" ></asp:CheckBox>
                                        </ItemTemplate>
                                        <ItemStyle Width="100px" />
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <input id="btnsave" type="button" class="btn btn-success" value="SAVE CHANGES" onclick="saveapplicants()" />
                </div>
            </div>
        </div>
    </div>


<div id="modalinfo" runat="server" class="modal fade in" >
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
            <button type="button" id="modalcloser" class="close" onclick="closemodalinfo();"><span aria-hidden="true">&times;</span></button>
               <h4 class="modal-title">Applicant Information</h4>
            </div>
            <div class="modal-body" >
            <div class="box box-widget widget-user">
                <div class="widget-user-header bg-aqua-active">
                  <h3 class="widget-user-username"><a href="appldet?app_id=<%= ViewState["app_id"]%>" style="color:#fff"><%= ViewState["applicant"]%></a></h3>
                  <h5 class="widget-user-desc"><%= ViewState["position"]%></h5>
                </div>
                <div class="widget-user-image">
                  <img class="img-circle" src="<%= ViewState["profile"] %>" alt="User Avatar">
                </div>
            </div>
            <div class="form-group">
                <label  class="col-sm-5 control-label ">Applicant Code</label>
                <label  class="col-sm-7 control-label text-primary font-normal">
                 <asp:LinkButton ID="lb_download" runat="server" CssClass="text-primary text-bold" OnClick="click_dl"><%= ViewState["app_no"]%></asp:LinkButton>
                </label>
            </div> <div class="clearfix"></div>
            <div class="form-group">
                <label  class="col-sm-5 control-label ">Gender</label>
                <label  class="col-sm-7 control-label text-primary font-normal"><%= ViewState["gender"] %></label>
            </div> <div class="clearfix"></div>
            <div class="form-group">
                <label  class="col-sm-5 control-label ">Birthday</label>
                <label  class="col-sm-7 control-label text-primary font-normal"><%= ViewState["birth"]%></label>
            </div> <div class="clearfix"></div>
            <div class="form-group">
                <label  class="col-sm-5 control-label ">Address</label>
                <label  class="col-sm-7 control-label text-primary text-capitalize font-normal"><%= ViewState["address"]%></label>
            </div> <div class="clearfix"></div>
            <div class="form-group">
                <label  class="col-sm-5 control-label ">Cellphone No.</label>
                <label  class="col-sm-7 control-label text-primary font-normal"><%= ViewState["contact"]%></label>
            </div> <div class="clearfix"></div>
            <div class="form-group">
                <label  class="col-sm-5 control-label ">E-mail</label>
                <label  class="col-sm-7 control-label text-primary font-normal"><%= ViewState["email"]%></label>
            </div> <div class="clearfix"></div>
            <div class="form-group">
                <label  class="col-sm-5 control-label ">Educational Attainment</label>
                <label  class="col-sm-7 control-label text-primary font-normal"><%= ViewState["school"]%></label>
            </div> <div class="clearfix"></div>
             <div class="form-group">
                <label  class="col-sm-5 control-label ">Degree</label>
                <label  class="col-sm-7 control-label text-primary font-normal"><%= ViewState["degree"]%></label>
            </div> <div class="clearfix"></div>
            <div class="form-group">
                <label  class="col-sm-5 control-label ">Latest Employment</label>
                <label  class="col-sm-7 control-label text-primary font-normal"><%= ViewState["employeement"]%></label>
            </div> <div class="clearfix"></div>
            <div class="form-group">
                <label  class="col-sm-5 control-label ">Special Skills</label>
                <label  class="col-sm-7 control-label text-primary font-normal text-capitalize"><%= ViewState["skills"]%></label>
            </div> <div class="clearfix"></div>
            <div id="div_referral" runat="server" class="form-group">
                <label  class="col-sm-5 control-label ">Referral Details</label>
                <label  class="col-sm-7 control-label text-primary font-normal">referral</label>
            </div> <div class="clearfix"></div>
            <br />
            <h4 class="modal-title text-bold pad">Applicant Acivity</h4>
            <table class="table no-margin">
            <tr>
                <td>Application</td>
                <td style="width: 40px"><asp:Label ID="l_app" runat="server" CssClass="badge bg-green pull-right"></asp:Label></td>
            </tr>
            <% 
               DataTable dt = (DataTable)ViewState["act_log"];
               if (dt != null)
               {
                   foreach (DataRow row in dt.Rows)
                   {
                       string badge = null;
                       switch (row["action"].ToString())
                       {
                           case "Acknowledgment":
                               badge = "primary";
                               break;
                           case "Interview":
                               badge = "orange";
                               break;
                           case "Examination":
                               badge = "warning";
                               break;
                           case "Final interview":
                               badge = "danger";
                               break;
                       }
            %>
                <tr>
                    <td><%= row["action"]%></td>
                    <td><span class="badge label-<%= badge %> pull-right"><%= DateTime.Parse(row["date"].ToString()).ToString("MMMM dd, yyyy")%></span></td>
                </tr>
            <%
                    }
               }
            %>
            </table>
            </div>
           
        </div>
    </div>
</div> 
    <asp:HiddenField ID="hftoolreq" ClientIDMode="Static" runat="server" />
    <asp:HiddenField ID="hfcount" ClientIDMode="Static" runat="server" />
    <asp:HiddenField ID="hfmanid" Value="0" ClientIDMode="Static" runat="server" />
    <asp:HiddenField ID="hfappids" Value="0" ClientIDMode="Static" runat="server" />
    <asp:HiddenField ID="hfmanstatus" Value="0" ClientIDMode="Static" runat="server" />
</asp:Content>
<asp:Content ID="footer" runat="server" ContentPlaceHolderID="footer">
    <script type="text/javascript" src="vendors/select2/dist/js/select2.full.min.js"></script>
    <script type="text/javascript">
        (function ($) {
            $('.select2').select2()
        })(jQuery);


        function CheckBoxCount(evs) {
            var counts = $("[id$=hfcount]").val();
            var gv = document.getElementById("<%= grid_view.ClientID %>");
            var lbl_del_notify = document.getElementById("<%= lbl_del_notify.ClientID %>");
            var lbl_del_notify_val = document.getElementById('lbl_del_notify');
            var inputList = gv.getElementsByTagName("input");
            var numChecked = 0;
            var appids="";
            for (var i = 0; i < inputList.length; i++) {
                if (inputList[i].type == "checkbox" && inputList[i].checked) {
                        numChecked = numChecked + 1;

                        if (counts >= numChecked) {
                            appids += inputList[i].parentNode.parentNode.firstElementChild.innerHTML + ",";
                        }
                        console.log(appids);
                }
            }
             

                if (counts < numChecked) {
                    numChecked = counts;
                    $(evs).prop("checked", false);
                   
                }

                $("[id$=hfappids]").val(appids);
            lbl_del_notify.textContent = numChecked + "/"+counts;
        }

        
        function closemodalinfo()
        {
            $("[id$=modalinfo]").hide();
        }

        function saveapplicants() {

            if ($("[id$=hfmanstatus]").val() != "Done") {
                var manid = $("[id$=hfmanid]").val();
                var appids = $("[id$=hfappids]").val();
                console.log(manid);
                console.log(appids);
                $.ajax({
                    type: "POST",
                    url: "content/Manager/ViewMonPower.aspx/saveapps",
                    data: JSON.stringify({ id: manid, appid: appids }),
                    contentType: "application/json; chartset=utf-8",
                    dataType: "json",
                    success: function (data) {
                        alert("Saved successfully.");
                    },
                    error: function (xhr, status, error) {
                        alert(xhr.responseText);
                    }

                });
            }
            else {
                alert("Change status to 'On-going' to edit.");
            }
        }
    </script>
</asp:Content>
