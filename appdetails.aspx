<%@ Page Language="C#" AutoEventWireup="true" CodeFile="appdetails.aspx.cs" Inherits="appdetails" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Cebu LandMasters</title>
    <script src="script/jquery-1.7.1.min.js"></script>
    <script src="script/jquery.Jcrop.js"> </script>
    <style type="text/css">
       *{margin:0; padding:0; font-family: Calibri;  }
       li {list-style:none; font-size:12px}
       table, tr,td,th { border:none}
       hr{border:1px solid black; margin:10px 0}
       fieldset {border:none}
       .content {width:1000px; margin:0 auto}
       ul{ float:right; text-align:center; margin:20px 0 0 0}
       .logo { margin-left:-20px}
       .gr {  margin:10px 0; width:100%; text-align:left;}
       .gr td { padding:4px; line-height:30px}
       .img-del {width:200px; border-radius:3px}
       .aa { float:left }
       legend {  width:99%; background:#459dda; color:White; font-weight:bold; padding:3px 8px}
    </style>
</head>
<body>

    <form id="form1" runat="server">
 
        <div class="content">
        <img src="style/img/myCLIRecruitmentAdminPortal.png" height="100px" width="250px" style="margin-top:20px; margin-left:-8px" alt="cebulandmaster" class="logo" />
        <ul>
            <li><asp:ImageButton ID="ImageButton1" runat="server" Visible="false" CssClass="img-del" /></li>
            <li><asp:Label ID="lbl_password" Visible="false" runat="server"></asp:Label></li>
            <li><asp:LinkButton ID="lnk_pd" runat="server" OnClick="click_dl"  ForeColor="red" Text="ATTACHED RESUME"  style=" text-decoration:underline;  text-transform:none;" ></asp:LinkButton></li>
        </ul>
        <fieldset style=" margin-top:20px">
            <legend>Personal Background</legend>
         
            <table class="gr aa">
               <tr>
                    <td>Name</td>
                    <td>: </td>
                    <td>
                        <asp:Label ID="txt_fname" runat="server"></asp:Label>
                        <asp:Label ID="txt_mname" runat="server"></asp:Label>
                        <asp:Label ID="txt_lname" runat="server"></asp:Label>
                    </td>
                </tr>
                 <tr>
                    <td>Position Desired</td>
                    <td>: </td>
                    <td><asp:Label ID="drop_type" runat="server"></asp:Label></td>
                </tr>
                <tr>
                    <td>Present Address</td>
                    <td>:</td>
                    <td>
                    <asp:Label ID="txt_pread" runat="server"></asp:Label>
                    
                    </td>
                </tr>
                <tr style=" display:none;">
                    <td>Povencial Address</td>
                    <td>: </td>
                    <td>
                    <asp:Label ID="txt_provad" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>Telephone Number</td>
                    <td>: </td>
                    <td><asp:Label ID="txt_tel" runat="server" Width="547px"></asp:Label></td>
                </tr>
                <tr>
                    <td>Cellular Number</td>
                    <td>: </td>
                    <td><asp:Label ID="txt_cel" runat="server"></asp:Label></td>
                </tr>
                <tr>
                    <td>E-mail</td>
                    <td>:</td>
                    <td><asp:Label ID="txt_email" runat="server"></asp:Label></td>
                </tr>
                <tr>
                    <td>Date of Birth</td>
                    <td>: </td>
                    <td>
                    <asp:Label ID="ddl_month" runat="server"></asp:Label> 
                    <asp:Label ID="ddl_day" runat="server"></asp:Label> 
                    <asp:Label ID="ddl_year" runat="server"></asp:Label>
                       </td>
                </tr>
                <tr>
                    <td>Gender</td>
                    <td>: </td>
                    <td><asp:Label ID="l_gender" runat="server"></asp:Label></td>
                </tr>
            </table>
        </fieldset>
            
            <fieldset>
            <legend>Educational Attainment</legend>
                <asp:GridView ID="grid_educ" AutoGenerateColumns="false" CssClass="gr" ShowFooter="false" ShowHeader="false" runat="server">
                  <Columns>
                        <asp:BoundField DataField="level" HeaderText="" />
                        <asp:BoundField DataField="school" HeaderText="School" />
                  </Columns>
                </asp:GridView>
            </fieldset>

            <fieldset>
            <legend>Employment History</legend>
                <asp:GridView ID="grid_employmenthistory" AutoGenerateColumns="false" CssClass="gr"  EmptyDataText="No Data Found" ShowFooter="false" runat="server">
                    <Columns>
                        <asp:BoundField DataField="position" HeaderText="Company" />
                        <asp:BoundField DataField="company" HeaderText="Position" />
                        <asp:BoundField DataField="fromto" HeaderText="History" />
                    </Columns>
                </asp:GridView>
            </fieldset>

            <fieldset>
                <legend>Special Skills</legend>
                <asp:GridView ID="grid_skills" AutoGenerateColumns="false" CssClass="gr" ShowHeader="false" EmptyDataText="No Data Found" ShowFooter="false" runat="server">
                    <Columns>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:Label ID="skill" runat="server" Text='<%# Eval("skills") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </fieldset>
      </div>
    </form>
</body>
</html>