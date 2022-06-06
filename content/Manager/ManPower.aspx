<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ManPower.aspx.cs" Inherits="content_Manager_ManPower" MasterPageFile="~/content/NewMasterPage.master" %>

<asp:Content ID="head" runat="server" ContentPlaceHolderID="head">

    <link href="style/css/tablechkbx.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="script/autocomplete/aaa/jquery.min.js"></script>
    
    <script src="script/datepicker/commonJScript.js" type="text/javascript"></script>
    <script src="script/datepicker/jquery-1.8.3.js" type="text/javascript"></script>     
    <script src="script/datepicker/jquery-ui.js" type="text/javascript"></script>
    <link href="script/datepicker/jquery-ui-1.8.16.custom.css" rel="Stylesheet" type="text/css" />
    <style type="text/css">
        .PopUpPanel {left: 50%; margin-left:-200px}
         .PopUpPanel textarea { width:97%; font-size:12px}
        .table { margin:0 0 5px 0}
        .pcs-sub { float:left;}
        .tablea {border:1px solid gray; padding:5px 10px}
        #chcklist1 label,#chcklist2 label
        {
                margin-right:50px;
            }
    </style>
   <script type="text/javascript">
       function Confirm() {
           var confirm_value = document.getElementById("<%= TextBox1.ClientID %>")

           if (confirm("Are you sure to delete this question?")) {
               confirm_value.value = "Yes";
           } else {
               confirm_value.value = "No";
           }
       }

       jQuery.noConflict();
       (function ($) {
           $(function () {
               $(".datee").datepicker({ changeMonth: true,
                   yearRange: "-100:+0",
                   changeYear: true
               });
           });
       })(jQuery);
 </script>

</asp:Content>
<asp:Content ContentPlaceHolderID="content" ID="content_mp" runat="server">
<asp:ScriptManager ID="myScriptManager" runat="server"></asp:ScriptManager>
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
                     <asp:TextBox ID="txt_search" runat="server" class="form-control pull-right" AutoPostBack="true" placeholder="Search"></asp:TextBox>
                      <div class="input-group-btn">
                        <asp:LinkButton ID="lb_search"  runat="server" class="btn btn-default"><i class="fa fa-search"></i></asp:LinkButton>
                      </div>
                </div>
                <div class="box-tools box-tool-add">
                    <button type="button" class="btn btn-default readupdate" data-toggle="modal" data-target="#modal-manpower-request">Add</button>
                </div>
            </div>
            <div class="box-body table-responsive padding no-pad-top">
                <asp:Label ID="lbl_del_notify" runat="server" style=" position:absolute; right:120px; margin:15px; font-size:11px; " ></asp:Label>
                 <div id="alert" runat="server" class="alert alert-info alert-dismissible">
                    <h4><i class="icon fa fa-check-circle"></i> No record found</h4>
                 </div>
                 <asp:GridView ID="grid_data" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered table-hover dataTable" AllowSorting="true" >
                    <Columns>
                        <asp:BoundField DataField="id" HeaderStyle-CssClass="hide" ItemStyle-CssClass="hide"/>
                        <asp:BoundField DataField="date" HeaderText="Filed" DataFormatString="{0:MM/dd/yyyy}" />
                        <asp:BoundField DataField="position" SortExpression="position" HeaderText="position"/>
                        <asp:BoundField DataField="nature_request" SortExpression="Request" HeaderText="Request"/>
                        <asp:BoundField DataField="qualifications" SortExpression="qualifications" HeaderText="qualifications"/>
                        <asp:BoundField DataField="no_pax" SortExpression="no_pax" HeaderText="pax"/>
                        <asp:BoundField DataField="status" SortExpression="status" HeaderText="Status"/>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:LinkButton runat="server" ID="lnk_status" OnClick="view_ko" Text="view" ForeColor="Blue"></asp:LinkButton> | 
                                <asp:LinkButton runat="server" ID="lnk_del" OnClientClick="Confirm()" ClientIDMode="Static" OnClick="continue_delete" Text="delete" ForeColor="Red"></asp:LinkButton>
                            </ItemTemplate>
                            <HeaderStyle Width="95px" />
                        </asp:TemplateField>   
                    </Columns>
                </asp:GridView>
            </div>
          </div>
        </div>
      </div>
</section>
 
<div class="modal fade" id="modal-manpower-request">
<div class="modal-dialog">
    <div class="modal-content">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title">Manpower Request</h4>
        </div>
        
        <div class="modal-body">
        <h5><strong>REQUESTING DEPARTMENT INFORMATION</strong></h5>
             <div class="form-group box">
              <h4 class="pull-left label label-info">Date Filed: &nbsp;<span class="  " ><%=DateTime.Now.ToString("MM/dd/yyyy") %></span></h4>
              <h4 class="label label-default pull-right"> Form No. &nbsp;<asp:Label ID="lb_formnum" class="" runat="server"></asp:Label></h4>
              </div>
            <hr />
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group">
                        <label>Company</label>
                        <asp:DropDownList ID="drop_company" runat="server">
                        </asp:DropDownList>
                    </div>    
                </div>
                <div class="col-md-6">
                    <div class="form-group">
                        <label>Site/Branch</label>
                        <asp:DropDownList ID="drop_branch" runat="server">
                        </asp:DropDownList>
                    </div>    
                </div>
            </div>
            
            <div class="form-group">
                <label>Department/Division Name</label>
                <asp:DropDownList ID="drop_department" runat="server">
                </asp:DropDownList>
            </div>
            <hr />
            <h5><strong>REQUESTED JOB INFORMATION</strong></h5>
            <hr />
            <div class="form-group">
                <label>Position Title</label>
                <asp:TextBox ID="txt_position" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            
             <div class="form-group">
                <label>Position Reports to</label>
                <asp:DropDownList ID="drop_reportsto" runat="server">
                    <asp:ListItem></asp:ListItem>
                </asp:DropDownList>
            </div>
            

             <div class="row">
                <div class="col-md-6">
                    <div class="form-group">
                        <label>Job level</label>
                        <asp:DropDownList ID="drop_level" runat="server">
                            <asp:ListItem></asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group">
                        <label>Position Type</label>
                        <asp:DropDownList ID="drop_status" ClientIDMode="Static" runat="server" onchange="changepos()">
                            <asp:ListItem></asp:ListItem>
                            <asp:ListItem>Regular</asp:ListItem>
                            <asp:ListItem>Probationary</asp:ListItem>
                            <asp:ListItem>Project</asp:ListItem>
                            <asp:ListItem>Contractual</asp:ListItem>
                            <asp:ListItem>Intern/OJT</asp:ListItem>
                            </asp:DropDownList>
                    </div>
                </div>
             </div>

             <div class="row" id="contractial" style="display:none;">
                <div class="col-md-6">
                   <div class="form-group">
                        <label>Contractual:</label>
                        <asp:DropDownList ID="drop_positiontype" runat="server">
                            <asp:ListItem></asp:ListItem>
                            <asp:ListItem>Direct Hire</asp:ListItem>
                            <asp:ListItem>Contractor</asp:ListItem>
                            </asp:DropDownList>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group">
                        <label>Duration</label>
                        <asp:TextBox ID="txt_duration" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>   
                </div>
            </div>
            
              <div class="row">
                <div class="col-md-6">
                <div class="form-group">
                        <label>Reason for Vacancy</label>
                        <asp:DropDownList ID="drop_nature" runat="server">
                            <asp:ListItem></asp:ListItem>
                            <asp:ListItem>Replacement</asp:ListItem>
                            <asp:ListItem>New Position</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group">
                        <label>Budget Allocation</label>
                        <asp:DropDownList ID="drop_allocation" runat="server">
                            <asp:ListItem></asp:ListItem>
                            <asp:ListItem >Cost Center Number</asp:ListItem>
                            <asp:ListItem>Internal Order Number</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>
                </div>
              <div class="row">
                <div class="col-md-6">
                      <div class="form-group">
                        <label>No. of Manpower Requested</label>
                        <asp:TextBox ID="txt_pax" runat="server" CssClass="form-control" onkeypress="return isNumberKey(event);"></asp:TextBox>
                    </div>
                </div>
                <div class="col-md-6">
                      <div class="form-group">
                        <label>Date of start</label>
                        <asp:TextBox ID="txt_date" ClientIDMode="Static" runat="server" CssClass="datee form-control" ></asp:TextBox>
                    </div>
                </div>
              </div>
             
            
            
            <div class="form-group">
                <label>Summary of function</label>
                <asp:TextBox ID="txt_sumfunction" runat="server" TextMode="MultiLine" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="form-group">
                <label>Qualification requirement or equivalent</label>
                <asp:TextBox ID="txt_qualification" runat="server" TextMode="MultiLine" CssClass="form-control"></asp:TextBox>
            </div>
             <div class="form-group">
                <label>Specific experience required</label>
                <asp:TextBox ID="txt_exreq" runat="server" TextMode="MultiLine" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="form-group">
                <label>Expected system knowledge</label>
                <asp:TextBox ID="txt_exknowledge" runat="server" TextMode="MultiLine" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="form-group" style="display:none;">
                <label>Reason</label>
                <asp:TextBox ID="txt_mp" runat="server" CssClass="form-control" TextMode="MultiLine"></asp:TextBox>
            </div>
            <hr />
            <div class="row">
                    <div class="col-md-12">
                     <label>Tools Requisition:</label>
                    </div>
                   </div>
            
            <div class="row">
                <div class="col-md-12">
                         <asp:CheckBoxList ID="chcklist1" onclick="toolreq();" runat="server"  CssClass="checkbox checkbox-inline" RepeatLayout="table" RepeatColumns="2" RepeatDirection="vertical"  ClientIDMode="Static">
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
                                            <table id="tblItems" class="table" style="width: 100%" cellpadding="0" cellspacing="0">
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
                                                </tbody>
                                                <tfoot>
                                                    <tr>
                                                        <td>
                                                            <asp:TextBox ID="txt_Enum" AutoPostBack="false" AutoComplete="off" runat="server" class="form-control"
                                                                Style="width: 300px;" ValidationGroup="fat" ClientIDMode="Static"></asp:TextBox>
                                                        </td>
                                                      
                                                        <td>
                                                            <input type="button" id="btnAdd" value="ADD" class="btn btn-success btn-rounded mb-4 pull-right" />
                                                        </td>
                                                    </tr>
                                                </tfoot>
                                            </table>
                                            <br />
                                        </div>
                                    </div>
                                    <br />

            <div class="row">
                <div class="col-md-12">
                   <div class="form-group">
                    <label>
                            Requested by:</label>
                         <asp:Label runat="server" ID="lb_reqby" CssClass="form-control"> </asp:Label>
                    </div>                      
                </div>
            </div>
            <div class="row">
                <%--<div class="col-md-6">
                    <div class="form-group">
                    <label>
                            Reviewed by: </label> <input type="button" id="Button1" aria-hidden="true" value="&plus;" />
                        <asp:DropDownList ID="ddl_reviewed" ClientIDMode="Static" AutoComplete="off" runat="server" CssClass="select2" style="width:100%">
                        </asp:DropDownList>
                                                
                    </div>
                </div>--%>
                <div class="col-md-6">
                    <div class="form-group">
                    <label>
                            Approved by:</label> <%--<input type="button" id="Button2" aria-hidden="true" value="&plus;" />--%>
                        <asp:DropDownList ID="ddl_approved" ClientIDMode="Static" AutoComplete="off" runat="server" CssClass="select2" style="width:100%">
                        </asp:DropDownList>
                                                
                    </div>
                </div>
            </div>
            <hr />
            <div class="row">
                    <div class="col-md-12">
                     <label>Supporting Document for New Position:</label>
                    </div>
                   </div>
                   <hr />
            
                  <div class="row">
                    <div class="col-md-12">
                     <label>1. Duties and Resposibilities (Job Description)</label>
                     <asp:FileUpload runat="server" ID="jobdesc" class=" form-control" />
                     
                    </div>
                   </div>
                     <div class="row">
                    <div class="col-md-12">
                     <label>2. Organizational Chart</label>
                     <asp:FileUpload runat="server" ID="orgstruct" class=" form-control" />
                    </div>
                   </div>
                     <div class="row">
                    <div class="col-md-12">
                     <label>3. Justification for new position / additional manpower request</label>
                     <asp:FileUpload runat="server" ID="justifypos"  class=" form-control"/>
                    </div>
                   </div>
                   <hr />

                 
        </div>
        <div class="modal-footer">
            <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="btn btn-primary" onclick="btnSave_Click" />
        </div>
    </div>
</div>
</div>

<%---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--%>
<div class="modal fade in" id="modal_manpower_request" clientidmode="Static" runat="server">
<div class="modal-dialog">
    <div class="modal-content">
        <div class="modal-header">
            <div align="right">
                <asp:LinkButton ID="lnkbtnclose" OnClick="close" runat="server"><i class="glyphicon glyphicon-remove"></i></asp:LinkButton>
            </div>
            <h4 class="modal-title">Manpower Request</h4>
        </div>
        <div class="modal-body">
          <div class="form-group box">
              <h4 class="pull-left label label-info">Date Filed: &nbsp;<asp:Label ID="txtdate" class="" runat="server"></asp:Label></h4>
              <h4 class="label label-default pull-right"> Form No. &nbsp;<asp:Label ID="txtfnum" class="" runat="server"></asp:Label></h4>
              </div>
            <hr />
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group">
                        <label>Company</label>
                        <asp:DropDownList ID="drop_c" runat="server">
                        </asp:DropDownList>
                    </div>    
                </div>
                <div class="col-md-6">
                    <div class="form-group">
                        <label>Site/Branch</label>
                        <asp:DropDownList ID="dorp_b" runat="server">
                        </asp:DropDownList>
                    </div>    
                </div>
            </div>
            
            <div class="form-group">
                <label>Department/Division Name</label>
                <asp:DropDownList ID="drop_d" runat="server">
                </asp:DropDownList>
            </div>
            <hr />
            <h5><strong>REQUESTED JOB INFORMATION</strong></h5>
            <hr />
            <div class="form-group">
                <label>Position Title</label>
                <asp:TextBox ID="txt_p" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            
             <div class="form-group">
                <label>Position Reports to</label>
                <asp:DropDownList ID="drop_rep" runat="server">
                    <asp:ListItem></asp:ListItem>
                </asp:DropDownList>
            </div>
            

             <div class="row">
                <div class="col-md-6">
                    <div class="form-group">
                        <label>Job level</label>
                        <asp:DropDownList ID="drop_l" runat="server">
                            <asp:ListItem></asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group">
                        <label>Position Type</label>
                        <asp:DropDownList ID="drop_n" ClientIDMode="Static" runat="server" onchange="changepos()">
                            <asp:ListItem></asp:ListItem>
                            <asp:ListItem>Regular</asp:ListItem>
                            <asp:ListItem>Probationary</asp:ListItem>
                            <asp:ListItem>Project</asp:ListItem>
                            <asp:ListItem>Contractual</asp:ListItem>
                            <asp:ListItem>Intern/OJT</asp:ListItem>
                            </asp:DropDownList>
                    </div>
                </div>
             </div>

             <div class="row" id="Div3" style="display:none;">
                <div class="col-md-6">
                   <div class="form-group">
                        <label>Contractual:</label>
                        <asp:DropDownList ID="drop_con" runat="server">
                            <asp:ListItem></asp:ListItem>
                            <asp:ListItem>Direct Hire</asp:ListItem>
                            <asp:ListItem>Contractor</asp:ListItem>
                            </asp:DropDownList>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group">
                        <label>Duration</label>
                        <asp:TextBox ID="txt_du" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>   
                </div>
            </div>
            
              <div class="row">
                <div class="col-md-6">
                <div class="form-group">
                        <label>Reason for Vacancy</label>
                        <asp:DropDownList ID="drop_r" runat="server">
                            <asp:ListItem></asp:ListItem>
                            <asp:ListItem>Replacement</asp:ListItem>
                            <asp:ListItem>New Position</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group">
                        <label>Budget Allocation</label>
                        <asp:DropDownList ID="drop_all" runat="server">
                            <asp:ListItem></asp:ListItem>
                            <asp:ListItem >Cost Center Number</asp:ListItem>
                            <asp:ListItem>Internal Order Number</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>
                </div>
              <div class="row">
                <div class="col-md-6">
                      <div class="form-group">
                        <label>No. of Manpower Requested</label>
                        <asp:TextBox ID="txt_np" runat="server" CssClass="form-control" onkeypress="return isNumberKey(event);"></asp:TextBox>
                    </div>
                </div>
                <div class="col-md-6">
                      <div class="form-group">
                        <label>Date of start</label>
                        <asp:TextBox ID="txt_dn" ClientIDMode="Static" runat="server" CssClass="datee form-control" ></asp:TextBox>
                    </div>
                </div>
              </div>
             
            
            
            <div class="form-group">
                <label>Summary of function</label>
                <asp:TextBox ID="txt_s" runat="server" TextMode="MultiLine" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="form-group">
                <label>Qualification requirement or equivalent</label>
                <asp:TextBox ID="txt_q" runat="server" TextMode="MultiLine" CssClass="form-control"></asp:TextBox>
            </div>
             <div class="form-group">
                <label>Specific experience required</label>
                <asp:TextBox ID="txt_sp" runat="server" TextMode="MultiLine" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="form-group">
                <label>Expected system knowledge</label>
                <asp:TextBox ID="txt_ex" runat="server" TextMode="MultiLine" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="form-group" style="display:none;">
                <label>Reason</label>
                <asp:TextBox ID="txt_r" runat="server" CssClass="form-control" TextMode="MultiLine"></asp:TextBox>
            </div>
              <hr />
            <div class="row">
                    <div class="col-md-12">
                     <label>Tools Requisition:</label>
                    </div>
                   </div>
            
            <div class="row">
                <div class="col-md-12">
                         <asp:CheckBoxList ID="chcklist2" onclick="toolreq2();" runat="server"  CssClass="checkbox checkbox-inline" RepeatLayout="table" RepeatColumns="2" RepeatDirection="vertical"  ClientIDMode="Static">
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
                                                <tbody><%if (spl.Count() > 1)
                                                      {
                                                          for (int i = 0; i < spl.Count()-1; i++)
                                                          { %>
                                                       <tr>
                                                            <td>
                                                                <input text='text' style='border-color:transparent;outline:none;border-style:none;' value='<%=spl[i] %>' />
                                                            </td>
                                                            <td>
                                                                
                                                                 <input type="button" value="Remove" onclick="Remove2(this);" />
                                                            </td>
                                                       </tr>

                                                    <%}
                                                      } %>
                                                </tbody>
                                                <tfoot>
                                                    
                                                    <tr>
                                                        <td>
                                                            <asp:TextBox ID="txt_Enum2" AutoPostBack="false" AutoComplete="off" runat="server" class="form-control"
                                                                Style="width: 300px;" ValidationGroup="fat" ClientIDMode="Static"></asp:TextBox>
                                                        </td>
                                                      
                                                        <td>
                                                            <input type="button" id="btnAdd2" value="ADD" class="btn btn-success btn-rounded mb-4 pull-right" />
                                                        </td>
                                                    </tr>
                                                </tfoot>
                                            </table>
                                            <br />
                                        </div>
                                    </div>
                                    <br />

             <hr />


            <div class="row">
                    <div class="col-md-12">
                     <label>Supporting Document for New Position:</label>
                    </div>
                   </div>
                   <hr />
                  <div class="row">
                    <div class="col-md-12">
                     <label>1. Duties and Resposibilities (Job Description)</label>
                     <asp:FileUpload runat="server" ID="editfile1" class=" form-control" />
                     
                    </div>
                   </div>
                     <div class="row">
                    <div class="col-md-12">
                     <label>2. Organizational Chart</label>
                     <asp:FileUpload runat="server" ID="editfile2" class=" form-control" />
                    </div>
                   </div>
                     <div class="row">
                    <div class="col-md-12">
                     <label>3. Justification for new position / additional manpower request</label>
                     <asp:FileUpload runat="server" ID="editfile3"  class=" form-control"/>
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
                                    <a id="atrash~<%# Eval("id") %>"  onclick="trashrow(this);" ><i class="fa fa-trash"></i></a>
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
                <div class="col-md-6">
                    <div class="form-group">
                    <label>
                            Approved by:</label> <%--<input type="button" id="Button7" aria-hidden="true" value="&plus;" />--%>
                        <asp:DropDownList ID="drop_appr" ClientIDMode="Static" AutoComplete="off" runat="server" CssClass="select2" style="width:100%">
                        </asp:DropDownList>
                                                <%--
                         <asp:Label runat="server" ID="txt_appr" CssClass="form-control"> </asp:Label>--%>
                    </div>
                </div>
            </div>
            <hr />
        </div>
        <div class="modal-footer">
            <asp:Button ID="Button5" runat="server" Text="Update" OnClick="update" CssClass="btn btn-primary" />
        </div>
    </div>
</div>
</div>
<%--

  <div id="Div1" runat="server" clientidmode="Static" class="modal fade in">
        <div class="modal-dialog" style="width: 500px;">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">
                        <input type="button" id="Button3" class="close" aria-hidden="true" value="&times;" />
                        Reviewer</h4>
                </div>
                <div class="modal-body">
                    <asp:Panel ID="Panel3" runat="server">
                        <div class="form-group">
                                <div style="overflow-y: scroll; width: auto; height: 300px;">
                                    <asp:CheckBoxList ID="chkMemberList1" runat="server" CssClass="checkbox checkbox-inline"
                                        RepeatLayout="table">
                                    </asp:CheckBoxList>
                                </div>
                                <br />
                                <div>
                                    <asp:LinkButton runat="server" ClientIDMode="Static" ID="savesapp" CssClass="btn btn-success pull-right"
                                        Text="Save" OnClick="saveapp"></asp:LinkButton>
                                </div>
                                <br />
                        </div>
                    </asp:Panel>
                </div>
            </div>
        </div>
    </div> <div id="Div2" runat="server" clientidmode="Static" class="modal fade in">
        <div class="modal-dialog" style="width: 500px;">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">
                        <input type="button" id="Button4" class="close" aria-hidden="true" value="&times;" />
                        Approver</h4>
                </div>
                <div class="modal-body">
                    <asp:Panel ID="Panel4" runat="server">
                        <div class="form-group">
                                <div style="overflow-y: scroll; width: auto; height: 300px;">
                                    <asp:CheckBoxList ID="chkMemberList2" runat="server" CssClass="checkbox checkbox-inline"
                                        RepeatLayout="table">
                                    </asp:CheckBoxList>
                                </div>
                                <br />
                                <div>
                                    <asp:LinkButton runat="server" ClientIDMode="Static" ID="LinkButton3" CssClass="btn btn-success pull-right"
                                        Text="Save" OnClick="saveapp2"></asp:LinkButton>
                                </div>
                                <br />
                        </div>
                    </asp:Panel>
                </div>
            </div>
        </div>
    </div>
    --%>

    
    <asp:HiddenField ID="hf_cbvalues1" runat="server" />
    <asp:HiddenField ID="hf_posvalues1" runat="server" />
    <asp:HiddenField ID="hf_cbvalues2" runat="server" />
    <asp:HiddenField ID="hf_posvalues2" runat="server" />

<asp:HiddenField ID="hf_id" runat="server" />
<asp:HiddenField ID="hf_con" runat="server" /> 
<asp:HiddenField ID="hftoolreq" ClientIDMode="Static" runat="server" /> 
<asp:HiddenField ID="hftoolreq2" ClientIDMode="Static" runat="server" />
<div style=" visibility:hidden;">
    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
</div>
</asp:Content>


<asp:Content ID="footer" runat="server" ContentPlaceHolderID="footer">
    <script type="text/javascript">
//        $("#Button3").on("click", function () {
//            $("#Div1").hide();
//        });
//        $("#Button1").on("click", function () {
//            $("#Div1").show();
//        });

//        $("#Button4").on("click", function () {
//            $("#Div2").hide();
//        });
//        $("#Button2").on("click", function () {
//            $("#Div2").show();
//        });

        function toolreq() {
            var num = "";
            $('[id$=chcklist1] input:checked').each(function () {
                num += $(this).val() + ",";
            })
            num += "~";
            $("#tblItems TBODY TR").each(function () {
                var row = $(this);
                num += row.find("TD").eq(0).find("input").eq(0).val() + ",";
            });
            console.log(num);
            $("[id$=hftoolreq]").val(num);
        }
        $("#btnAdd").on("click", function () {

            var txtEnum = $("#txt_Enum");

            var tBody = $("#tblItems > TBODY")[0];

            //Add Row.
            var row = tBody.insertRow(-1);

            var cell = $(row.insertCell(-1));
            cell.html("<input text='text' style='border-color:transparent;outline:none;border-style:none;' value='" + txtEnum.val() + "' />");

            //Add Button cell.
            cell = $(row.insertCell(-1));
            var btnRemove = $("<input />");
            btnRemove.attr("type", "button");
            btnRemove.attr("onclick", "Remove(this);");
            btnRemove.val("Remove");
            cell.append(btnRemove);

            //Clear the TextBoxes.
            txtEnum.val("");
            toolreq();
        });

        function Remove(button) {
            var row = $(button).closest("TR");
            if (confirm("Do you want to delete this item?")) {
                var table = $("#tblItems")[0];
                table.deleteRow(row[0].rowIndex);

                toolreq();
            }
        };

        function trashrow(button) {
             if (confirm("Do you want to delete this row?")) {

                 var row = $(button).closest("TR");
                 var evs = $(button).attr("id").split("~")[1];
                 console.log(evs);
                  $.ajax({
                        type: "POST",
                        url: "content/Manager/ManPower.aspx/delfile",
                        data: JSON.stringify({ Id:evs}),
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (data) {
                             var table = $("#content_grid_req")[0];
                             table.deleteRow(row[0].rowIndex);
                         },
                         error: function (xhr, status, error) {
                             alert(xhr.responseText);
                         }
                     });

            }
        }
        function toolreq2() {
            var num = "";
            $('[id$=chcklist2] input:checked').each(function () {
                num += $(this).val() + ",";
            })
            num += "~";
            $("#tblItems2 TBODY TR").each(function () {
                var row = $(this);
                num += row.find("TD").eq(0).find("input").eq(0).val() + ",";
            });
            console.log(num);
            $("[id$=hftoolreq2]").val(num);
        }
        $("#btnAdd2").on("click", function () {

            var txtEnum = $("#txt_Enum2");

            var tBody = $("#tblItems2 > TBODY")[0];

            //Add Row.
            var row = tBody.insertRow(-1);

            var cell = $(row.insertCell(-1));
            cell.html("<input text='text' style='border-color:transparent;outline:none;border-style:none;' value='" + txtEnum.val() + "' />");


            //Add Button cell.
            cell = $(row.insertCell(-1));
            var btnRemove = $("<input />");
            btnRemove.attr("type", "button");
            btnRemove.attr("onclick", "Remove2(this);");
            btnRemove.val("Remove");
            cell.append(btnRemove);

            //Clear the TextBoxes.
            txtEnum.val("");
            toolreq2();
        });

        function Remove2(button) {
            var row = $(button).closest("TR");
            if (confirm("Do you want to delete this item?")) {
                var table = $("#tblItems2")[0];
                table.deleteRow(row[0].rowIndex);

                toolreq2();
            }
        };

        function changepos(evs) {
            var result=$("[id$=drop_status]").val();

            if (result == "Contractual") {
                $("[id$=contractial]").attr("style", "display:block");
            }
            else {

                $("[id$=contractial]").attr("style", "display:none");
            }
        }

        function isNumberKey(evt) {
            console.log(evt);
            var charCode = (evt.which) ? evt.which : evt.keyCode;
            if (charCode != 46 && charCode > 31
                  && (charCode < 48 || charCode > 57))
                return false;

            return true;
        }

        //contractial
    </script>
</asp:Content>


