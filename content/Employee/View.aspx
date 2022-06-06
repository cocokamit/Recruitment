<%@ Page Language="C#" AutoEventWireup="true" CodeFile="View.aspx.cs" Inherits="content_Employee_View" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
     <title>Recruitment</title>
     <link href="../../style/css/survey.css" rel="Stylesheet" type="text/css" />

     <style type="text/css">
     .content { width:1000px}
     .content h3 { padding-bottom:0;}
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
     .bttm {border: none;padding: 8px 20px;width: 94%;border-radius: 4px;cursor: pointer;background: #2ea2cc;border-color: #0074a2;-webkit-box-shadow: inset 0 1px 0 rgba(120,200,230,.5),0 1px 0 rgba(0,0,0,.15);box-shadow: inset 0 1px 0 rgba(120,200,230,.5),0 1px 0 rgba(0,0,0,.15);color: #fff;text-decoration: none;}
     .aa { float:left }
     .gr{ width:100%;}
     .gr input[type=text] { padding:5px; margin:2px; border:none; width:100%;  }
     .gr select { padding:5px; margin:2px;  width:100%; border:none;  }
     
     .educa{ width:100%;}
     .educa tr ,educa td { border:1px solid silver;}
     .educa input[type=text] { padding:5px; margin:2px; border:none; width:92%;  }
     
     .tb, .tb td, .tb th, .tb tr{ border: none; text-align:left; width:800px;}
     .tb th { border-bottom:2px solid #0074a2; font-size:12px; text-transform:uppercase; }
     .tb td {line-height:20px; font-size:12px; border-bottom:1px dashed silver;}
     
     input[type=text] { padding:5px; margin:2px; border:none; }
     select { padding:5px; border:none; }
     fieldset { border:none; margin-bottom:50px; }
     fieldset table  { width:100%;font-size:13px; line-height:30px; text-align:left;}
     legend {width:99%; background:#459dda; color:White; font-weight:bold; padding:3px 8px }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div class="content">
        <img src="style/img/myCLIRecruitmentAdminPortal.png" height="100px" width="250px" alt="cebulandmaster" class="logo" />
        
        <fieldset style=" margin-top:10px">
            <legend>Educational Attainment</legend>
             <table class="gr aa">
               <tr>
                    <td>Full Name</td>
                    <td>:</td>
                    <td><asp:TextBox ID="txt_fname" placeholder="First Name" Width="30%" runat="server"></asp:TextBox><asp:RequiredFieldValidator ID="rv_name" ControlToValidate="txt_fname" ForeColor="Red" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>
                    <asp:TextBox ID="txt_mname" placeholder="Middle Name" Width="30%" runat="server"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="txt_mname" ForeColor="Red" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>
                    <asp:TextBox ID="txt_lname" placeholder="Last Name" Width="30%" runat="server"></asp:TextBox>   <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="txt_lname" ForeColor="Red" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator></td>
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
                    <td>Cellular Number<asp:RequiredFieldValidator ID="RequiredFieldValidator7" ControlToValidate="txt_cel" ForeColor="Red" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator></td>
                    <td>:</td>
                    <td><asp:TextBox ID="txt_cel" runat="server"></asp:TextBox></td>
               </tr>
               <tr>
                    <td>Email-Address<asp:RequiredFieldValidator ID="RequiredFieldValidator6" ControlToValidate="txt_email" ForeColor="Red" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator><asp:RegularExpressionValidator ID="re_email" runat="server" ForeColor="Red" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="txt_email" ErrorMessage="*"></asp:RegularExpressionValidator></td>
                    <td>:</td>
                    <td><asp:TextBox ID="txt_email" runat="server"></asp:TextBox></td>
               </tr>
               <tr>
                    <td>Date of Birth</td>
                    <td>:</td>
                    <td>
                        <asp:DropDownList ID="ddl_month" Width="30%" runat="server">
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
                        <asp:DropDownList ID="ddl_day" Width="30%" runat="server">
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
                        <asp:DropDownList ID="ddl_year" Width="33%" runat="server">
                        <asp:ListItem Value="">YYYY</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator10" ControlToValidate="ddl_year" ForeColor="Red" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>
                       </td>
                    
                </tr>
              </table>
            </fieldset>
           
        <fieldset>
           <legend>Educational Attainment</legend>
           <asp:GridView ID="grid_educ" AutoGenerateColumns="false" border="0" ShowFooter="false" runat="server">
              <Columns>
                <asp:BoundField DataField="level" HeaderText="Level" />
                <asp:BoundField DataField="school" HeaderText="School" />
                <asp:BoundField DataField="address" HeaderText="Address" />
                <asp:BoundField DataField="year" HeaderText="Year" />
              </Columns>
            </asp:GridView>
        </fieldset>

        <fieldset>
            <legend>Special Skills</legend>
            <asp:GridView ID="grid_skills" AutoGenerateColumns="false" EmptyDataText="No Data Found" ShowFooter="false" runat="server"><%--onrowdeleting="grid_item_RowDeleting"OnRowDataBound="GridItemRowBound" OnRowDataBound="Databound_trainingrecords"--%>
                <Columns>
                <asp:BoundField DataField="skills" HeaderText="Skills" />
                </Columns>
            </asp:GridView>
        </fieldset>

        <fieldset>
        <legend>Employment History</legend>
            <asp:GridView ID="grid_employmenthistory" AutoGenerateColumns="false" EmptyDataText="No Data Found" ShowFooter="false" runat="server"><%--onrowdeleting="grid_item_RowDeleting"OnRowDataBound="GridItemRowBound" OnRowDataBound="Databound_trainingrecords"--%>
            <Columns>
            <asp:BoundField DataField="company" HeaderText="Company" />
            <asp:BoundField DataField="position" HeaderText="Position" />
            <asp:BoundField DataField="datef" HeaderText="From" />
            <asp:BoundField DataField="datet" HeaderText="To" />
   
            </Columns>
        </asp:GridView>
        </fieldset>


        <asp:ScriptManager ID="myScriptManager2" runat="server"></asp:ScriptManager>
        <asp:UpdatePanel ID="up_pan" Visible="false" runat="server">
            <ContentTemplate>
                    <fieldset>
                        <legend>Special Skills</legend>
                        <div class="ad">
                                <asp:GridView ID="grid_item" runat="server" ShowFooter="true" onrowdeleting="grid_item_RowDeleting" AutoGenerateColumns="False" >
                                <Columns>
                                        <asp:TemplateField ItemStyle-Width="15px" Visible="true"> 
                                        <ItemTemplate>
                                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("RowNumber") %>'></asp:Label>
                                        </ItemTemplate>
                                        <FooterTemplate >             
                                            <asp:ImageButton ID="btn" runat="server" ImageUrl="~/style/img/add.png" OnClick="ButtonAdd_Click"  />
                                        </FooterTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Skills">
                                        <ItemTemplate>
                                            <asp:Label ID="lbl_descripton" runat="server" CssClass="na" Text=""></asp:Label>
                                            <asp:Label ID="lbl_descripton_desp"  runat="server" Text=""></asp:Label>
                                            <asp:TextBox ID="txt_description" autocomplete="off" runat="server" Width="800px"></asp:TextBox> 
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField ShowHeader="False" Visible="true">
                                        <ItemTemplate>
                                                <asp:ImageButton ID="can" runat="server" CausesValidation="false" CommandName="Delete" ImageUrl="~/style/img/delete.png"/>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>            
                            </asp:GridView>
                                <asp:Button ID="btn_save" runat="server" Text="Save" onclick="btn_save_Click"  CssClass="button" />  
                                </div>
                    </fieldset>
            </ContentTemplate>
            </asp:UpdatePanel>
            

    </div>
    </form>
</body>
</html>
