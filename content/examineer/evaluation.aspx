<%@ Page Language="C#" AutoEventWireup="true" CodeFile="evaluation.aspx.cs" Inherits="content_examineer_evaluation" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Cebu LandMasters</title>
    <link href="../../style/css/survey.css" rel="Stylesheet" type="text/css" />
    <script src="script/jquery-1.3.2.min.js"></script>
    <script>
        function clicks(elem) {

            var val = "A";
            var x = elem.value;
            $.ajax({
                type: "POST",
                url: "content/misc/survey.aspx/add_rate",
                data: '{rate: "' + x + '",category: "' + val + '" }',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                failure: function (response) {
                    alert(response.d);
                }
            });
        }

        function clic(elem) {

            var x = elem.value;

            var val = elem.getAttribute("atr");
            $.ajax({
                type: "POST",
                url: "content/misc/survey.aspx/add_rate",
                data: '{rate: "' + x + '",category: "' + val + '" }',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                failure: function (response) {
                    alert(response.d);
                }
            });
        }
    </script>
     <style type="text/css">
.ratings
{
    float:left; 
    width:100%;

}
.ratings span { float:left}

.ratings label { none}
/* :not(:checked) is a filter, so that browsers that don’t support :checked don’t 
   follow these rules. Every browser that supports :checked also supports :not(), so
   it doesn’t make the test unnecessarily selective */
.ratings:not(:checked) > input {
    position:absolute;
    top:-9999px;
    clip:rect(0,0,0,0);
}

.ratings:not(:checked) > label {
    float:right;
    width:1em;
    padding:0 .1em;
    overflow:hidden;
    white-space:nowrap;
    cursor:pointer;
    font-size:200%;
    line-height:1.2;
    color:#ddd;
    /**text-shadow:1px 1px #bbb, 2px 2px #666, .1em .1em .2em rgba(0,0,0,.5);**/
}

.ratings:not(:checked) > label:before {
    content: '★ ';
}

.ratings> input:checked ~ label 
{


      color: #82b3d5;
   /** text-shadow:1px 1px goldenrod, 2px 2px #B57340, .1em .1em .2em rgba(0,0,0,.5);**/
}

.ratings:not(:checked) > label:hover,
.ratings:not(:checked) > label:hover ~ label 
{
        color: gold;
   /** text-shadow:1px 1px #c60, 2px 2px #940, .1em .1em .2em rgba(0,0,0,.5);**/
  
}

.ratings> input:checked + label:hover,
.ratings> input:checked + label:hover ~ label,
.ratings> input:checked ~ label:hover,
.ratings> input:checked ~ label:hover ~ label,
.ratings> label:hover ~ input:checked ~ label {
    color: gold;
   /** text-shadow:1px 1px goldenrod, 2px 2px #B57340, .1em .1em .2em rgba(0,0,0,.5);**/
}

.ratings> label:active {
    position:relative;
    top:2px;
    left:2px;
}
     </style>
</head>
<body>
    <form id="form1" runat="server">
      
<div id="panelOverlay" visible="false" runat="server" class="Overlay"></div>

    <div class="header">
       <img src="style/img/myCLIRecruitmentAdminPortal.png" alt="CLI" class="logo" style=" height:90px; width:210px;" />
    </div>
    <asp:ScriptManager ID="myScriptManager" runat="server"></asp:ScriptManager>


    <div class="content">
    <asp:Label  ID="lbl_msg" runat="server"></asp:Label>
        <div  id="div_cont" runat="server" >
        <div class="box">
                 <h3><span>Please fill to continue your Application.</span></h3>
                <asp:ListView ID="lv_pii" runat="server" class="rating">
                </asp:ListView>
      
                    <h5><span><asp:Label ID="lbl_source" runat="server" Text="Source" ></asp:Label><asp:Label ID="lbl_err_source" runat="server" color="red" ></asp:Label></span><h5>
                    <asp:DropDownList  ID="ddl_source" style=" width:300px; padding:5px;" runat="server"><asp:ListItem>Select</asp:ListItem></asp:DropDownList>
        
                    <h5>
                        <span><asp:Label ID="lbl_comment" runat="server" Text="Comments" ></asp:Label><asp:Label ID="lbl_err_comment" runat="server" color="red" ></asp:Label></span>
                    </br>
                    <asp:TextBox ID="txt_comment" runat="server" style="resize:none;" TextMode="MultiLine"></asp:TextBox>
                    </br>
                    </br>
            <asp:Button ID="Button1" runat="server" OnClick="click_save" Text="save" />
               <%-- <asp:Button ID="" runat="server" OnClick="click_save" Text="save"  />--%>
        </div>

   

     </div>

    </div>


        <asp:HiddenField ID="hf_a" runat="server"   />
    </form>
</body>
</html>