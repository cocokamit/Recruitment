<%@ Page Language="C#" AutoEventWireup="true" CodeFile="examform.aspx.cs" Inherits="content_examineer_examform" %>

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
     
     .ladd { float:right; margin:-25px 5px 0 0   }
          .ss { float: left}
       .ss th,.res th { border:none}
        .res { float:right;}
        .ts, .ts td, .ts tr,.tle ,.tle td,.tle tr,.tle th {border:none}
       .tle { width:100%}
       .rbl label{ padding:5px}
       .na { color:Red; float:left;}
     
     input[type=text] { padding:5px; margin:2px; border:none; border-bottom:1px solid silver;}
     select { padding:5px; border:none; border-bottom:1px solid silver;}



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

<body style=" height:700px"  ><%--onkeydown="return (event.keyCode == 154)" oncontextmenu="return false"--%>
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <div class="header">
         <%--  <img src="style/img/logo.png" alt="Bluewater" class="logo" />--%>
        </div>
   <div class="content">
          
        <asp:UpdatePanel ID="UpdatePanel1" runat="server" style=" text-align:center; color:#0074a2;">
            <ContentTemplate>
                <asp:Timer runat="server" id="UpdateTimer"  Interval="1000" Enabled="false"  ontick="UpdateTimer_Tick"  />
                <asp:Label runat="server" id="DateStampLabel" />
            </ContentTemplate>
        </asp:UpdatePanel>   
        <div style=" text-align:center; color:#0074a2; font-weight:bold; font-size:xx-large;">  <asp:Label runat="server" style="text-decoration:blink;" id="lbl_score" />    </div>
 <asp:Label ID="lb_con" runat="server"></asp:Label>
 <asp:GridView ID="grid_question" runat="server" OnRowDataBound="grid_bound" CssClass="table" AutoGenerateColumns="false" ShowHeader="false">
            <Columns>
                <asp:TemplateField>
                    <ItemTemplate>
                      <asp:Panel ID="pl_a" runat="server">
                            <asp:GridView ID="grid_choices" runat="server" OnRowDataBound="grid_bound_sub" CssClass="ts" Visible="false" AutoGenerateColumns="false" ShowHeader="false">
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
                                    <asp:BoundField DataField="id" ItemStyle-Font-Size="0" />
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
                                
                                    <asp:BoundField DataField="id" ItemStyle-Font-Size="0" />
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
                <asp:BoundField DataField="id" ItemStyle-Font-Size="0" />
            </Columns>
        </asp:GridView>
        
        <asp:TextBox ID="txt_essay" runat="server"  TextMode="MultiLine" style=" resize:none;" Visible="false"></asp:TextBox>
        <asp:RadioButtonList ID="RadioButtonList1" runat="server">
        </asp:RadioButtonList>
        <asp:Label ID="lbl_qid" runat="server" Text="" style=" display:none;" ></asp:Label><%--style=" display:none;"--%>
        <asp:Label ID="lbl_qid2" runat="server" Text=""  style=" display:none;" ></asp:Label><%--style=" display:none;"--%>
        <asp:Label ID="lbl_essay" runat="server" Text=""  style=" display:none;" ></asp:Label>
        <asp:Label ID="lbl_coransid" runat="server" Text=""  style=" display:none;" ></asp:Label>
        <asp:Label ID="lbl_questiontext" runat="server" Text=""  style=" display:none;" ></asp:Label>
        <asp:Label ID="lbl_corranstext" runat="server" Text=""  style=" display:none;" ></asp:Label>
        <asp:Label ID="lbl_anstext" runat="server" Text=""  style=" display:none;" ></asp:Label>
        <asp:GridView ID="grid_disp" runat="server" AutoGenerateColumns="False" style=" display:none;" AllowSorting="True"><%--style=" display:none;"--%>
            <Columns>
                <asp:BoundField DataField="id" HeaderText="id" />
                <asp:BoundField DataField="e_id" HeaderText="e_id" />
                <asp:BoundField DataField="quest" HeaderText="quest" />
                <asp:BoundField DataField="answer" HeaderText="ans" />
                 <asp:BoundField DataField="status" HeaderText="status" />
            </Columns>
        </asp:GridView>
                                     
        <div class="c">
            <asp:Button ID="btn_back" runat="server" Visible="false" OnClick="button_back" Text="Back" class="bttm" />
            <asp:Button ID="button" runat="server"  OnClick="button_Click" Text="Start" class="bttm" />
        </div>
             <div style=" text-align:center; color:#0074a2;  font-size:medium"><asp:Label runat="server"  id="lbl_mssg" />    </div>
        </div>
    </form>
</body>
</html>