<%@ Page Language="C#" AutoEventWireup="true" CodeFile="viewansweredform.aspx.cs" Inherits="content_examineer_viewansweredform" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html  xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
     <title>test</title>
     <link href="../../style/css/survey.css" rel="Stylesheet" type="text/css" />
<%--     <link href="../style/css/style.css" rel="Stylesheet" type="text/css" />--%>
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
     .tb th { border-bottom:2px solid #0074a2; font-size:12px; text-transform:uppercase; }
     .tb td {line-height:20px; font-size:12px; border-bottom:1px dashed silver;}
     
     input[type=text] { padding:5px; margin:2px; border:none; border-bottom:1px solid silver;}
     select { padding:5px; border:none; border-bottom:1px solid silver;}
      .label{ color:Red;}


    </style>
    


    <script type="text/javascript">
        window.location.hash = "no-back-button";
        window.location.hash = "Again-No-back-button"; //again because google chrome don't insert first hash into history
        window.onhashchange = function () { window.location.hash = "no-back-button"; }

        window.onmousedown = disableclick;
        function disableclick(event) {
            if (event.button == 2) {
                return false;
            }
        }
        //onkeydown="return (event.keyCode == 154)" oncontextmenu="return false"
       
</script> 

</head>

<body>
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <div class="header">
         <%--  <img src="style/img/logo.png" alt="Bluewater" class="logo" />--%>
        </div>
        <div class="content">
        <asp:Label ID="lb_con" runat="server"></asp:Label>
                        
                        <asp:RadioButtonList ID="RadioButtonList1" runat="server">
                        </asp:RadioButtonList>
        </div>
    </form>
</body>
</html>