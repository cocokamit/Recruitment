<%@ Page Language="C#" AutoEventWireup="true" CodeFile="FormDetails.aspx.cs" Inherits="content_HR_FormDetails" %>
<%@ Import Namespace="System.Data" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../../style/css/survey.css" rel="Stylesheet" type="text/css" />
    <style>
        .content { width:800px; }
        .ul li{ line-height:25px }
        .li_hd { font-size:13px; font-weight:bold}
        .li_cn {color:#1c3f94; padding-left:10px}
        .li_bt { margin:10px 0}
    </style>
</head>
<body>
    <form id="form1" runat="server">
     <div class="header">
<asp:LinkButton ID="lnk_maribago" OnClick="home" runat="server" style="color:#236464; margin:5px; text-decoration:none; font-weight:bold; float:left"><img src="style/img/backButton2.png" title="Back to Home" style=" float:left; width:25px; padding-right:5px" alt="back"/> Back</asp:LinkButton>
           <%
            string query = "select * from jobs where id=" + Request.QueryString["frm_id"].ToString() + " ";
            DataTable dt = new DataTable();
            dt = dbhelper.getdata(query);
           %> 
           
           <% if (dt.Rows[0]["loc_id"].ToString() == "1") %>
            <% {%>
            <img src="style/img/png/maribago.png" style="height:100px;" alt="Bluewater" class="logo" />
            <% }%>

             <% else if (dt.Rows[0]["loc_id"].ToString() == "2") %>
            <% {%>
            <img src="style/img/png/pangloa.png" style="height:100px;" alt="Bluewater" class="logo" />
            <% }%>

              <% else if (dt.Rows[0]["loc_id"].ToString() == "3") %>
            <% {%>
            <img src="style/img/png/sumilon.png" style="height:100px;" alt="Bluewater" class="logo" />
            <% }%>

            <% else if (dt.Rows[0]["loc_id"].ToString() == "4") %>
            <% {%>
            <img src="style/img/png/almot.png" style="height:100px;" alt="Bluewater" class="logo" />
            <% }%>

            <% else if (dt.Rows[0]["loc_id"].ToString() == "5") %>
            <% {%>
            <img src="style/img/png/amuma.png" style="height:100px;" alt="Bluewater" class="logo" />
            <% }%>

             <% else if (dt.Rows[0]["loc_id"].ToString() == "6") %>
            <% {%>
            <img src="style/img/png/other.png" style="height:100px;" alt="Bluewater" class="logo" />
            <% }%>
            
    </div>

    <div class="content"> 
            <ul class="ul">

             <li class="li_hd">Department</li>
            <li class="li_cn"><asp:Label ID="lbl_type" runat="server" Text=""></asp:Label></li>
            <li id="sec" runat="server" class="li_hd">Section</li>
            <li class="li_cn"><asp:Label ID="lbl_section" runat="server" Text=""></asp:Label></li>
            <li class="li_hd">Position</li>
            <li class="li_cn"><asp:Label ID="lbl_title" runat="server" Text=""></asp:Label></li>
             <li id="qua" runat="server"  class="li_hd">Qualification</li>
            <li class="li_cn"><asp:Label ID="lbl_qualification" runat="server" Text=""></asp:Label></li>
            <li id="job" runat="server" class="li_hd">Job Description</li>
            <li><asp:Label ID="txt_details" runat="server"></asp:Label></li>
            <li><asp:Button ID="btn_apply" OnClick="click_apply" Text="Apply" runat="server" CssClass="li_bt" /></li>
        </ul>
       
    </div>
    </form>
</body>
</html>
