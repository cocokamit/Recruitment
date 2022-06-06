<%@ Page Language="C#" AutoEventWireup="true" CodeFile="form.aspx.cs" Inherits="form" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
     <title>Bluewater</title>
    <link href="style/css/survey.css" rel="Stylesheet" type="text/css" />
    
    <style type="text/css">
        .content h3 { padding-bottom:0}
        li{ list-style:none; padding:5px 0px}
        textarea{ width:100%; height:100px; margin:5px 0px}
        .a {float:right; font-size:11px; font-weight:bold}
        .a tr td {padding:0px 8.5px; }
        .b { margin:3px 10px}
        .b td { padding:3px 0px}
        .c { text-align:center; margin:20px 0px}
        .d { margin:0px 10px}
        .d input[type=checkbox], .b input[type=radio] { margin-right:5px}
        .d input[type=text] { width:80%}
        .g { clear:both; margin:5px 0 5px 15px }
        .g table { float:right; clear:both; width:110px}
        .g td {font-size:0px; }
        .bttm {
    border: none;
    padding: 8px 20px;
    width: 94%;
    border-radius: 4px;
    cursor: pointer;
    background: #2ea2cc;
    border-color: #0074a2;
    -webkit-box-shadow: inset 0 1px 0 rgba(120,200,230,.5),0 1px 0 rgba(0,0,0,.15);
    box-shadow: inset 0 1px 0 rgba(120,200,230,.5),0 1px 0 rgba(0,0,0,.15);
    color: #fff;
    text-decoration: none;
   
    }
    
     
     .gr{ width:100%;}
     .gr input[type=text] { padding:5px; margin:2px; border:none; width:100%; border-bottom:1px solid silver; }
     .gr select { padding:5px; margin:2px;  width:100%; border:none; border-bottom:1px solid silver; }
     
     .educa{ width:100%;}
     .educa tr ,educa td { border:1px solid silver;}
     .educa input[type=text] { padding:5px; margin:2px; border:none; width:92%; border-bottom:1px solid silver; }
     
     .tb, .tb td, .tb th, .tb tr{ border: none; text-align:left; width:800px;}
     .tb th { border-bottom:2px solid #0074a2; font-size:12px; height:25px;}
     .tb td {line-height:35px;}
     input[type=text] { padding:5px; margin:2px; border:none; border-bottom:1px solid silver;}
     select { padding:5px; border:none; border-bottom:1px solid silver;}
     input[type=submit] { padding:3px; margin:2px;}
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="header">
           <img src="style/img/logo.png" alt="Bluewater" class="logo" />
        </div>
        <div class="content">
        <div style=" text-align:center; margin:5px; padding:5px;">
        <h2>APPLICANT’S FORM</h2>
       <br />
        </div>
        <h4 style=" color:#0074a2;">Personal Background</h4>
        <br />
            <table class="gr">
               <tr>
                    <td>Full Name</td>
                    <td>:</td>
                    <td><asp:TextBox ID="txt_fname" placeholder="First Name" Width="25%" runat="server"></asp:TextBox><asp:RequiredFieldValidator ID="rv_name" ControlToValidate="txt_fname" ForeColor="Red" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>
                    <asp:TextBox ID="txt_mname" placeholder="Middle Name" Width="25%" runat="server"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="txt_mname" ForeColor="Red" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>
                    <asp:TextBox ID="txt_lname" placeholder="Last Name" Width="25%" runat="server"></asp:TextBox>   <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="txt_lname" ForeColor="Red" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator></td>
                    <td></td>
                    <td></td>
                </tr>
                 <tr>
                    <td>Position Desired<asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="drop_type" ForeColor="Red" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator></td>
                    <td>:</td>
                    <td><asp:DropDownList ID="drop_type"  runat="server" 
                        DataSourceID="SqlDataSource1" AppendDataBoundItems="true" DataTextField="job_type" >
                        <asp:ListItem></asp:ListItem>
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:dbconnection %>" 
                        SelectCommand="SELECT [job_type], [jobtype_id] FROM [JobType] where status is null">
                        </asp:SqlDataSource>
                    </td>
                </tr>
                <tr>
                    <td>Present Address<asp:RequiredFieldValidator ID="RequiredFieldValidator4" ControlToValidate="txt_pread" ForeColor="Red" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator></td>
                    <td>:</td>
                    <td><asp:TextBox ID="txt_pread" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>Povencial Address<asp:RequiredFieldValidator ID="RequiredFieldValidator5" ControlToValidate="txt_provad" ForeColor="Red" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator></td>
                    <td>:</td>
                    <td><asp:TextBox ID="txt_provad" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>Telephone Number</td>
                    <td>:</td>
                    <td><asp:TextBox ID="txt_tel" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>Cellular Number<asp:RequiredFieldValidator ID="RequiredFieldValidator7" ControlToValidate="txt_cel" ForeColor="Red" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator><asp:CompareValidator ID="cv_contactss" runat="server" ForeColor="Red" ControlToValidate="txt_cel" Type="Integer" Operator="DataTypeCheck" ErrorMessage="*"/></td>
                    <td>:</td>
                    <td><asp:TextBox ID="txt_cel" MaxLength="11" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>Email-Address<asp:RequiredFieldValidator ID="RequiredFieldValidator6" ControlToValidate="txt_email" ForeColor="Red" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator><asp:RegularExpressionValidator ID="re_email" runat="server"  ForeColor="Red" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="txt_email" ErrorMessage="*"></asp:RegularExpressionValidator></td>
                    <td>:</td>
                    <td><asp:TextBox ID="txt_email" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>Date of Birth</td>
                    <td>:</td>
                    <td>
                        <asp:DropDownList ID="ddl_month" Width="25%" runat="server">
                         <asp:ListItem Value="">MM</asp:ListItem>
                    <asp:ListItem>01</asp:ListItem>
                    <asp:ListItem>02</asp:ListItem>
                    <asp:ListItem>03</asp:ListItem>
                    <asp:ListItem>04</asp:ListItem>
                    <asp:ListItem>05</asp:ListItem>
                    <asp:ListItem>06</asp:ListItem>
                    <asp:ListItem>07</asp:ListItem>
                    <asp:ListItem>08</asp:ListItem>
                    <asp:ListItem>09</asp:ListItem>
                    <asp:ListItem>10</asp:ListItem>
                    <asp:ListItem>11</asp:ListItem>
                    <asp:ListItem>12</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" ControlToValidate="ddl_month" ForeColor="Red" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>
                        <asp:DropDownList ID="ddl_day" Width="25%" runat="server">
                        <asp:ListItem Value="">DD</asp:ListItem>
                    <asp:ListItem>01</asp:ListItem>
                    <asp:ListItem>02</asp:ListItem>
                    <asp:ListItem>03</asp:ListItem>
                    <asp:ListItem>04</asp:ListItem>
                    <asp:ListItem>05</asp:ListItem>
                    <asp:ListItem>06</asp:ListItem>
                    <asp:ListItem>07</asp:ListItem>
                    <asp:ListItem>08</asp:ListItem>
                    <asp:ListItem>09</asp:ListItem>
                    <asp:ListItem>10</asp:ListItem>
                    <asp:ListItem>11</asp:ListItem>
                    <asp:ListItem>12</asp:ListItem>
                    <asp:ListItem>13</asp:ListItem>
                    <asp:ListItem>14</asp:ListItem>
                    <asp:ListItem>15</asp:ListItem>
                    <asp:ListItem>16</asp:ListItem>
                    <asp:ListItem>17</asp:ListItem>
                    <asp:ListItem>18</asp:ListItem>
                    <asp:ListItem>19</asp:ListItem>
                    <asp:ListItem>20</asp:ListItem>
                    <asp:ListItem>21</asp:ListItem>
                    <asp:ListItem>22</asp:ListItem>
                    <asp:ListItem>23</asp:ListItem>
                    <asp:ListItem>24</asp:ListItem>
                    <asp:ListItem>25</asp:ListItem>
                    <asp:ListItem>26</asp:ListItem>
                    <asp:ListItem>27</asp:ListItem>
                    <asp:ListItem>28</asp:ListItem>
                    <asp:ListItem>29</asp:ListItem>
                    <asp:ListItem>30</asp:ListItem>
                    <asp:ListItem>31</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" ControlToValidate="ddl_day" ForeColor="Red" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>
                        <asp:DropDownList ID="ddl_year" Width="25%" runat="server">
                        <asp:ListItem Value="">YYYY</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator10" ControlToValidate="ddl_year" ForeColor="Red" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>
                       </td>
                    
                </tr>
                <tr>
                <td>Attached Resume<asp:RequiredFieldValidator ID="RequiredFieldValidator11" ControlToValidate="FileUpload1" ForeColor="Red" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator></td>
                <td>:</td>
                <td><asp:FileUpload ID="FileUpload1" runat="server" /></td>
                </tr>
            </table>
            <fieldset style=" border:none; margin-top:20px;">
            <legend><h4 style=" color:#0074a2;">Educational Attainment</h4></legend>
            <table class="educa">
              
                     <tr>
                         <th></th>
                         <th>School</th>
                         <th>Address</th>
                         <th>Year</th>
                     </tr>
                      <tr>
                        <td>Elementary</td>
                        
                        <td><asp:TextBox ID="txt_elemschool" runat="server"></asp:TextBox></td>
                        <td><asp:TextBox ID="txt_elemaddress" runat="server"></asp:TextBox></td>
                        <td><asp:TextBox ID="txt_elemyear" runat="server"></asp:TextBox></td>
                      </tr>
                      <tr>
                        <td>Secondary</td>
                        <td><asp:TextBox ID="txt_secondschool" runat="server"></asp:TextBox></td>
                        <td><asp:TextBox ID="txt_secondaddress" runat="server"></asp:TextBox></td>
                        <td><asp:TextBox ID="txt_secondyear" runat="server"></asp:TextBox></td>
                      </tr>
                      <tr>
                        <td>College</td>
                        <td><asp:TextBox ID="txt_collegeschool" runat="server"></asp:TextBox></td>
                        <td><asp:TextBox ID="txt_collegeaddress" runat="server"></asp:TextBox></td>
                        <td><asp:TextBox ID="txt_collegeyear" runat="server"></asp:TextBox></td>
                      </tr>
                      <tr>
                        <td>Vocational</td>
                        <td><asp:TextBox ID="txt_vocationalschool" runat="server"></asp:TextBox></td>
                        <td><asp:TextBox ID="txt_vocationaladdress" runat="server"></asp:TextBox></td>
                        <td><asp:TextBox ID="txt_vocationalyear" runat="server"></asp:TextBox></td>
                      </tr>
                      <tr>
                        <td>Specials Skills</td>
                        <td><asp:TextBox ID="txt_specialschool" runat="server"></asp:TextBox></td>
                        <td><asp:TextBox ID="txt_specialaddress" runat="server"></asp:TextBox></td>
                        <td><asp:TextBox ID="txt_specialyear" runat="server"></asp:TextBox></td>
                      </tr>
                 
            </table>
            </fieldset>
            <fieldset style=" border:none; margin-top:20px;">
            <legend><h4 style=" color:#0074a2;">Employment History</h4></legend>
            <br />
              <asp:GridView ID="grid_employmenthistory" AutoGenerateColumns="false" CssClass="tb"   OnRowDataBound="Databound_employmenthistory"  OnRowDeleting="Deleting_employmenthistory"  border="0" ShowFooter="True" runat="server"><%--onrowdeleting="grid_item_RowDeleting"OnRowDataBound="GridItemRowBound" OnRowDataBound="Databound_trainingrecords"--%>
              <Columns>
                 <asp:TemplateField> 
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("RowNumber") %>'></asp:Label>
                    </ItemTemplate>
                      <FooterTemplate >
                         <asp:ImageButton ID="ImageButton2"  runat="server" OnClick="clickaddbutton_governmentlicenses"   ImageUrl="~/style/img/add.png"/><%--OnClick="ButtonAdd_Click"--%>
                    </FooterTemplate>
                 </asp:TemplateField>
                   <asp:TemplateField  HeaderText="Company Name - Address">
                    <ItemTemplate>
                        <asp:Label ID="lbl_employmenthistory_c_name_address" runat="server" Text=""></asp:Label>
                        <asp:Label ID="lbl_2ndemploymenthistory_c_name_address"  runat="server" Text=""></asp:Label>
                        <asp:TextBox ID="txt_employmenthistory_c_name_address" autocomplete="off" runat="server"></asp:TextBox>
                    </ItemTemplate>
                   
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Position">
                    <ItemTemplate>
                        <asp:Label ID="lbl_employmenthistory_position" runat="server"  Text=""></asp:Label>
                        <asp:Label ID="lbl_2ndemploymenthistory_position" runat="server" Text=""></asp:Label>
                        <asp:textbox ID="txt_employmenthistory_position"  runat="server" autocomplete="off" Text=""></asp:textbox>
                    </ItemTemplate>
                </asp:TemplateField>
                 <asp:TemplateField HeaderText="From-To" > 
                    <ItemTemplate>
                       <asp:Label ID="lbl_employmenthistory_fromto" runat="server" Text=""></asp:Label>
                       <asp:Label ID="lbl_2ndemploymenthistory_fromto"  runat="server" Text=""></asp:Label>
                                <asp:DropDownList ID="ddl_employmenthistory_day" style=" width:65px;"  runat="server">
                                <asp:ListItem>From</asp:ListItem>
                            </asp:DropDownList>-<asp:DropDownList ID="ddl_employmenthistory_year" style=" width:65px;" runat="server" >
                                <asp:ListItem>To</asp:ListItem>
                            </asp:DropDownList>
                    </ItemTemplate>
                 </asp:TemplateField>
                <asp:TemplateField ShowHeader="False">
                    <ItemTemplate>
                    <asp:ImageButton ID="can" runat="server"  CausesValidation="false" ToolTip="Delete Item"  CommandName="Delete" ImageUrl="~/style/img/delete.png" />
                    </ItemTemplate>
                </asp:TemplateField>
              </Columns>
            </asp:GridView>
            </fieldset>
            <div style=" text-align:center;">
              
        
                <asp:Button ID="Button1" runat="server" OnClick="click_save" Text="Go" />
            </div>
        </div>
    </form>
</body>
</html>