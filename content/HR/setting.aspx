<%@ Page Language="C#" AutoEventWireup="true" CodeFile="setting.aspx.cs" Inherits="content_HR_setting" MasterPageFile="~/content/NewMasterPage.master" %>

<asp:Content ID="head" runat="server" ContentPlaceHolderID="head">
    <style type="text/css">
        .PopUpPanel { width:400px;left: 50%; margin-left:-220px}
        .PopUpPanel hr {margin:5px 0}
        fieldset { padding:5px}
        fieldset legend { padding:5px}
        .page-content { margin-top:60px}
        .up, .down        { cursor: pointer; }
        .up:after         { content: '△'; }
        .up:hover:after   { content: '▲'; }
        .down:after       { content: '▽'; }
        .down:hover:after { content: '▼'; }
        .delete:after {content:'ⓧ'}
        .leg {border:1px solid #333; margin-bottom:10px;background-color:#eee; padding:10px;}
        .up-down div { display:inline-block }
        .save-ban {padding:3px 8px}
    </style>
</asp:Content>

<asp:Content ID="content" runat="server" ContentPlaceHolderID="content">
<section class="content-header">
    <h1>Banner</h1>
    <ol class="breadcrumb">
    <li><a href="dashboard"><i class="fa fa-dashboard"></i> Home</a></li>
    <li class="active">Banner</li>
    </ol>
</section>
<section class="content">
 <div class="row">
        <div class="col-xs-12">
          <div class="box box-primary">
            <div class="box-body table-responsive padding">
              <div id="d_ban">
                <% 
                    System.Data.DataTable dt = dbhelper.getdata("select * from mycarousel order by herar");
                    for (int i = 0; i < dt.Rows.Count; i++)
                    {
                        %>  
                        <div id="cnt<% Response.Write(dt.Rows[i]["id"].ToString()); %>" class="leg">
                            <a class="image"><% Response.Write(dt.Rows[i]["f_name"].ToString()); %></a><br />
                            <img src="style/img/slider/thumb/<% Response.Write(dt.Rows[i]["f_name"].ToString()); %>" /> 
	                        <div class="up-down">
		                        <div class="up"></div>
		                        <div class="down"></div>
                                <div class="delete" data-id="<%= dt.Rows[i]["id"].ToString() %>" > 
		                        </div>
	                        </div>
                        </div>   
                        <%
                    }   
                %>
                </div>
                <hr />
                <asp:Button ID="b_delete" runat="server" ClientIDMode="Static" OnClick="click_delete" Text="Delete" CssClass="hide"/>
                <asp:Button ID="b_save" runat="server" Text="Save" OnClick="click_save" OnClientClick="show_sub()" CssClass="btn btn-primary" />
                <asp:LinkButton ID="lb_add" runat="server" OnClick="click_add" CssClass="btn btn-primary pull-right">Add</asp:LinkButton>
            </div>
          </div>
        </div>
      </div>
</section>

<div id="modaladd" runat="server" class="modal fade in">
    <div class="modal-dialog">  
        <div class="modal-content">
            <div class="modal-header">
                <asp:LinkButton ID="LinkButton1" runat="server" OnClick="close" class="close" aria-hidden="true"><span aria-hidden="true">&times;</span></asp:LinkButton>
                <h4 class="modal-title">Add Banner</h4>
            </div>
            <div class="modal-body">
                <asp:FileUpload ID="fu_banner" runat="server" name="files[]"  multiple="multiple" accept ="image/jpeg"  />
            </div>
            <div class="modal-footer">
                <asp:Button ID="b_img" runat="server" Text="Upload" OnClick="upload" CssClass="btn btn-primary" />
                <asp:Label ID="l_msg" runat="server" ForeColor="Red"></asp:Label>
            </div>
        </div>
    </div>
</div>
 
<asp:TextBox ID="TextBox1" runat="server" CssClass="hide"></asp:TextBox>   
<asp:TextBox ID="TextBox2" runat="server" CssClass="hide"></asp:TextBox>   
<script type="text/javascript" src="script/jquery-1.6.4.js"></script>
<script>
    function del_img(elem) {
        document.getElementById("<%=TextBox2.ClientID%>").value = elem;
    }

    function show_sub() {

        var doc = document.getElementById("d_ban");
        var notes = "";
        for (var i = 0; i < doc.childNodes.length; i++) {
            if (doc.childNodes[i].className == "leg") {
                notes = notes + doc.childNodes[i].id + " ";
            }
        }
        document.getElementById("<%=TextBox1.ClientID%>").value = notes.trim();
    }

    $(".down").click(function () {
        var $parent = $(this).parents(".leg");
        $parent.insertAfter($parent.next());
        //            var numberOfSpans = $('fieldset').children('.leg').length;
        //            alert(numberOfSpans);
    });

    $(".up").click(function () {
        var $parent = $(this).parents(".leg");
        $parent.insertBefore($parent.prev());
    });

    $(".delete").click(function () {
//        var $parent = $(this).parents(".leg");
//        $parent.hide();

        img = $(this).attr("data-id");
        document.getElementById("<%=TextBox2.ClientID%>").value = img;

        $("#b_delete").trigger("click");
        

    });
</script>
     
</asp:Content>
  