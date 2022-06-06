<%@ Page Language="C#" AutoEventWireup="true" CodeFile="questionnaire.aspx.cs" Inherits="content_examineer_questionnaire" MasterPageFile="~/content/NewMasterPage.master" %>

<asp:Content ID="head" runat="server" ContentPlaceHolderID="head">
    <style type="text/css">
        .ts { margin-left:10px}
        .tbl { width:100%; margin:10px 0; font-size:13px}
        .tbl label { margin-left:10px}
        .PopUpPanel { width:450px; left: 50%; margin-left:-260px}
        .PopUpPanel textarea{ width:100%; height:200px; margin-bottom:15px}
        .PopUpPanel select { width:auto}
        .PopUpPanel fieldset { padding:5px}
        .PopUpPanel legend { padding: 0 4px}
        .PopUpPanel input[type=text] { width:96%}
        .tle { width:100%}
        .rbl label {  padding-left:5px}
    </style>
     <script type="text/javascript">
         function Confirm() {
             var confirm_value = document.getElementById("<%= TextBox11.ClientID %>")

             if (confirm("Are you sure to delete this question?")) {
                 confirm_value.value = "Yes";
             } else {
                 confirm_value.value = "No";
             }
         }
 </script>

</asp:Content>
<asp:Content ID="content" runat="server" ContentPlaceHolderID="content">
<section class="content-header">
    <h1>Examination / Customize Questioner</h1>
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
                
                <div class="pcs-sub">
                    <asp:ImageButton ID="ib_add" runat="server" ImageUrl="~/style/img/icon/i-add.png" OnClick="click_add" />
                </div>
                <div class="box-tools box-tool-add">
                    <button type="button" class="btn btn-block btn-primary" data-toggle="modal" data-target="#modal-questionnaire">Add</button>
                </div>
            </div>
            <div class="box-body table-responsive padding no-pad-top">
                <asp:GridView ID="grid_question" runat="server" OnRowDataBound="grid_bound" CssClass="table table-bordered table-hover dataTable" AutoGenerateColumns="false" ShowHeader="false">
                  <Columns>
                    <asp:TemplateField>
                      <ItemTemplate>
                        <%# Container.DataItemIndex + 1 %>.) 
                        <asp:Label ID="lbl_question" runat="server" Text='<%# Bind("quest") %>'></asp:Label>
                        <asp:Panel ID="pl_a" runat="server" style="margin-bottom:20px">
                            <asp:GridView ID="grid_choices" runat="server" OnRowDataBound="grid_bound_sub" CssClass="ts" AutoGenerateColumns="false" ShowHeader="false">
                            <Columns>
                                <asp:BoundField DataField="id" ItemStyle-Font-Size="0" />
                                <asp:BoundField DataField="answer" ItemStyle-Font-Size="0" />
                                <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:RadioButton ID="rb" runat="server" Text='<%# Bind("description") %>' />
                                </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            </asp:GridView>
                        </asp:Panel>
                        <asp:Panel ID="pl_b" runat="server">
                            <asp:GridView ID="GridView4" runat="server" CssClass="ts ss"  OnRowDataBound="gv5" AutoGenerateColumns="false" >
                            <Columns>
                                <asp:BoundField DataField="q_id" ItemStyle-Font-Size="0" />
                                <asp:BoundField DataField="answer" ItemStyle-Font-Size="0" />
                                <asp:TemplateField HeaderText="Column A">
                                <ItemTemplate>
                                    <asp:DropDownList ID="ddl_b" runat="server">
                                    </asp:DropDownList>
                                    <%# Container.DataItemIndex + 1 %>. 
                                    <asp:Label ID="lbl_des" runat="server" Text='<%# Bind("description") %>'></asp:Label>
                                </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            </asp:GridView>

                            <asp:GridView ID="GridView5" runat="server" CssClass="ts res" OnRowDataBound="gv5"  AutoGenerateColumns="false" >
                            <Columns>
                                <asp:TemplateField HeaderText="Column B">
                                <ItemTemplate>
                                    <asp:Label ID="lbl_a" runat="server"></asp:Label>.
                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("description") %>'></asp:Label>
                                </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            </asp:GridView>
                        </asp:Panel>
                      </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                      <ItemTemplate>
                        <asp:LinkButton ID="lnk_edit" runat="server" Text="edit" CommandName='<%# Bind("status") %>' OnClick="click_edit"><img src="style/img/icon/i-edit.PNG" alt="edit" /></asp:LinkButton>
                        <asp:LinkButton ID="lnk_delete" runat="server" Text="delete" OnClientClick="Confirm()" OnClick="click_delete" ><img src="style/img/icon/i-delete.PNG" alt="edit" /></asp:LinkButton>
                      </ItemTemplate>
                      <ItemStyle Width="50px" VerticalAlign="Top" />
                    </asp:TemplateField>
                    <asp:BoundField DataField="id" ItemStyle-Font-Size="0" />
                  </Columns>
                </asp:GridView>
            </div>
        </div>
    </div>
</div>
</section>

 
    <div id="panelOverlay" visible="false" runat="server" class="Overlay"></div>
    <div id="panelPopUpPanel" visible="false" runat="server" class="PopUpPanel">
        <asp:ImageButton ID="can" runat="server" CausesValidation="false" OnClick="close" ImageUrl="~/style/img/closeb.png" CssClass="close" />
        <ul class="ul">
            
        </ul>
    </div>

<div class="modal fade" id="modal-questionnaire">
<div class="modal-dialog">
    <div class="modal-content">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title">Examination / Customize Questioner</h4>
        </div>
        <div class="modal-body">
            <li id="li_t" runat="server">Type</li>
            <li id="li_td" runat="server">
                <asp:DropDownList ID="ddl_type" runat="server" AutoPostBack="true" OnTextChanged="ddl_change">
                    <asp:ListItem Value="1">Identification</asp:ListItem>
                    <%--<asp:ListItem Value="2">Essay</asp:ListItem>--%>
                    <asp:ListItem Value="3">Matching Type</asp:ListItem>
                    <asp:ListItem Value="4">True or False</asp:ListItem>
                </asp:DropDownList>
            </li>
            <li><asp:Label ID="lbl_qi" runat="server" Text="Question"></asp:Label></li>
            <li><asp:TextBox ID="txt_question" runat="server" TextMode="MultiLine"></asp:TextBox></li>     
            <li id="li_grid" runat="server">
                <asp:GridView ID="grid_item" AutoGenerateColumns="false" ShowFooter="True" CssClass="tle" OnRowDataBound="choices_bound" onrowdeleting="grid_item_RowDeleting" runat="server">
                    <Columns>
                        <asp:TemplateField> 
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("RowNumber") %>'></asp:Label>.
                            </ItemTemplate>
                            <FooterTemplate >             
                                <asp:ImageButton ID="btn"  runat="server" OnClick="ButtonAdd_Click" ImageUrl="~/style/img/add.png"/> 
                            </FooterTemplate>
                            <ItemStyle Width="10px" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Choices">
                            <ItemTemplate>
                                <asp:textbox ID="txt_discription" runat="server" Text='<%# Bind("col_1") %>' ></asp:textbox>
                            </ItemTemplate>
                        </asp:TemplateField>
                       <asp:TemplateField HeaderText="Answer">
                            <ItemTemplate>
                                <asp:CheckBox ID="cb_ib" runat="server" />
                            </ItemTemplate>
                            <ItemStyle Width="30px" HorizontalAlign="Center" />
                        </asp:TemplateField>
                        <asp:TemplateField ShowHeader="False">
                            <ItemTemplate>
                                <asp:ImageButton ID="can" runat="server" CausesValidation="false" CommandName="Delete" ImageUrl="~/style/img/delete.png" />
                                <asp:Label ID="lbl_discription" runat="server" CssClass="na" Text=""></asp:Label>
                            </ItemTemplate>
                             <ItemStyle Width="5px" />
                        </asp:TemplateField>
                        <asp:BoundField DataField="col_0" ItemStyle-Font-Size="0" ItemStyle-Width="0" />
                        <asp:BoundField DataField="col_2" ItemStyle-Font-Size="0" ItemStyle-Width="0"  />
                    </Columns>
                </asp:GridView>
            </li>
            <li id="li_rbl" runat="server" visible="false">
                <asp:RadioButtonList ID="rbl_tf" runat="server" CssClass="rbl">
                    <asp:ListItem>True</asp:ListItem>
                    <asp:ListItem>False</asp:ListItem>
                </asp:RadioButtonList>
            </li>
            <li id="lbl_mat" runat="server" visible="false">
                <fieldset>
                    <legend>Column A</legend>
                    <asp:GridView ID="GridView1" AutoGenerateColumns="false"  ShowFooter="True" CssClass="tle" onrowdeleting="gvp_item_RowDeleting" runat="server">
                        <Columns>
                            <asp:TemplateField> 
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("RowNumber") %>'></asp:Label>.
                                </ItemTemplate>
                                <FooterTemplate >             
                                    <asp:ImageButton ID="btn"  runat="server" OnClick="click_addd" CommandName="premise" ImageUrl="~/style/img/add.png"/> 
                                </FooterTemplate>
                                <ItemStyle Width="10px" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Premise">
                                <ItemTemplate>
                                    <asp:textbox ID="txt_discription" runat="server" Text='<%# Bind("col_0") %>' ></asp:textbox>
                                    <asp:Label ID="lbl_disID" runat="server" Text='<%# Bind("col_1") %>' Font-Size="0" ></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField ShowHeader="False">
                                <ItemTemplate>
                                    <asp:ImageButton ID="can" runat="server" CausesValidation="false" CommandName="Delete" ImageUrl="~/style/img/delete.png" />
                                    <asp:Label ID="lbl_discription" runat="server" CssClass="na" Text=""></asp:Label>
                                </ItemTemplate>
                                 <ItemStyle Width="5px" />
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </fieldset>

                <fieldset>
                    <legend>Column B</legend>
                    <asp:GridView ID="GridView2" AutoGenerateColumns="false" ShowFooter="True" CssClass="tle" onrowdeleting="gvr_item_RowDeleting" runat="server">
                        <Columns>
                            <asp:TemplateField> 
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("RowNumber") %>'></asp:Label>.
                                </ItemTemplate>
                                <FooterTemplate >             
                                    <asp:ImageButton ID="btn"  runat="server" OnClick="click_addd" CommandName="response" ImageUrl="~/style/img/add.png"/> 
                                </FooterTemplate>
                                <ItemStyle Width="10px" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Response">
                                <ItemTemplate>
                                    <asp:textbox ID="txt_discription" runat="server" Text='<%# Bind("col_0") %>' ></asp:textbox>
                                    <asp:Label ID="lbl_disID" runat="server" Text='<%# Bind("col_1") %>'  Font-Size="0" ></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField ShowHeader="False">
                                <ItemTemplate>
                                    <asp:ImageButton ID="can" runat="server" CausesValidation="false" CommandName="Delete" ImageUrl="~/style/img/delete.png" />
                                    <asp:Label ID="lbl_discription" runat="server" CssClass="na" Text=""></asp:Label>
                                </ItemTemplate>
                                 <ItemStyle Width="5px" />
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </fieldset>

               <fieldset id="fs_answer" runat="server" visible="false">
                    <legend>Answer</legend>
                    <asp:GridView ID="GridView3" AutoGenerateColumns="false" CssClass="tle" OnRowDataBound="grid3_bound" runat="server">
                        <Columns>
                            <asp:BoundField DataField="col_1" ItemStyle-Font-Size="0" HeaderStyle-Width="0" />
                            <asp:TemplateField> 
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("RowNumber") %>'></asp:Label>.
                                </ItemTemplate>
                                <ItemStyle Width="10px" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Premise">
                                <ItemTemplate>
                                    <asp:Label ID="txt_discription" runat="server" Text='<%# Bind("col_0") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Response">
                                <ItemTemplate>
                                    <asp:DropDownList ID="ddl_response" runat="server">
                                    </asp:DropDownList>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
               </fieldset>

            </li>
            <li><hr /></li>
            <li>
                <asp:Button ID="btn_edit" runat="server" Text="Edit" OnClick="click_match_edit" Visible="false" CssClass="btn" />
                <asp:Button ID="btn_save" runat="server" Text="Add" OnClick="click_save" CssClass="btn" />
                <asp:Label ID="lbl_msg" runat="server" ForeColor="Red"></asp:Label>
           </li>

        </div>
        <div class="modal-footer">
            <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="btn btn-primary" />
        </div>
    </div>
</div>
</div>

    <asp:HiddenField ID="hf_id" runat="server" />
    <asp:HiddenField ID="hf_status" runat="server" />
    <asp:HiddenField ID="hf_command" runat="server" />
    <asp:TextBox ID="TextBox11" runat="server" CssClass="hide"></asp:TextBox>
</asp:Content>
 