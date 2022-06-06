<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Copy of form.aspx.cs" Inherits="form" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Bluewater</title>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <link href="style/css/recruitment.css" rel="Stylesheet" type="text/css" />
    <script type="text/javascript" src="script/profilej/jquery.min.js"></script>
    <script type="text/javascript" src="script/profilej/jcrop.js"></script>
    <script type="text/javascript" src="script/profilej/smoothness.js"></script>
    <link rel="Stylesheet" href="style/css/jquery-ui-1.8.16.custom.css"/>
    <script type="text/javascript" src="script/autocomplete/jquery-ui.js"></script>
    <script type="text/javascript" src="script/datetimepicker/jquery-1.9.1.js"></script>
    <script type="text/javascript" src="script/datetimepicker/jquery-ui.js"></script>
    <script type="text/javascript">
        var $date = jQuery.noConflict();
        $date(function () { $date(".txt_from").datepicker(); $date(".txt_to").datepicker(); });
    </script>
    <script type="text/javascript">
          var $test = jQuery.noConflict();
          $test(function () {
              $('#File1').change(function () {
                  $('#Image1').hide();
                  $('#File1').hide();
                  var reader = new FileReader();
                  reader.onload = function(e) {
                      $('#ss').show();
                      $('#Image1').show();
                      $('#Image1').attr("src", e.target.result);
                      $('#panelPopUpPanel').css("left", "11.5%");
                      $('#panelPopUpPanel').css("top", "5%");
                      $('#panelPopUpPanel').css("width", "1000px");
                      $('#Image1').Jcrop({
                          onChange: SetCoordinates,
                          onSelect: SetCoordinates
                      });
                  }
                  reader.readAsDataURL($(this)[0].files[0]);
              });

              $test('#btnCrop').click(function () {
                  var x1 = $('#imgX1').val();
                  var y1 = $('#imgY1').val();
                  var width = $('#imgWidth').val();
                  var height = $('#imgHeight').val();
                  var canvas = $("#canvas")[0];
                  var context = canvas.getContext('2d');
                  var img = new Image();
                  img.onload = function () {
                      canvas.height = height;
                      canvas.width = width;
                      context.drawImage(img, x1, y1, width, height, 0, 0, width, height);
                      $('#imgCropped').val(canvas.toDataURL());
                      $('[id*=btnUpload]').show();
                      $('#canvas').show();
                  };
                  img.src = $('#Image1').attr("src");
              });
          });
          function SetCoordinates(c) {
              $('#imgX1').val(c.x);
              $('#imgY1').val(c.y);
              $('#imgWidth').val(c.w);
              $('#imgHeight').val(c.h);
              $('#btnCrop').show();
          };
    </script>
    <script type="text/javascript">

        var $phil = jQuery.noConflict();
        $phil(document).ready(function () {
 
            city('ddl_city', "city");
            province('ddl_province', "distinct province");

            procity('ddl_pro_city', "city")
            proprovince('ddl_pro_province', "distinct province");

        });

        function province(ee,fl) {
            $phil(".autoprovince").autocomplete({
                source: function (request, response) {
                    $phil.ajax({
                        type: "POST",
                        contentType: "application/json; charset=utf-8",
                        url: "form.aspx/getprovince",
                        data: "{'field':'" + fl + "', 'province':'" + document.getElementById('<%=ddl_province.ClientID %>').value + "','country':'" + document.getElementById('<%=ddl_country.ClientID %>').value + "','city':'" + document.getElementById('<%=ddl_city.ClientID %>').value + "'}",
                        dataType: "json",
                        success: function (data) {
                            response(data.d);
                        },
                        error: function (result) {
                            alert("Error");
                        }
                    });
                }
            });

        }

        function city(ee, fl) {
            $phil(".autocity").autocomplete({
                source: function (request, response) {
                    $phil.ajax({
                        type: "POST",
                        contentType: "application/json; charset=utf-8",
                        url: "form.aspx/getprovince",
                        data: "{'field':'" + fl + "', 'province':'" + document.getElementById('<%=ddl_province.ClientID %>').value + "','country':'" + document.getElementById('<%=ddl_country.ClientID %>').value + "','city':'" + document.getElementById('<%=ddl_city.ClientID %>').value + "'}",
                        dataType: "json",
                        success: function (data) {
                            response(data.d);
                        },
                        error: function (result) {
                            alert("Error");
                        }
                    });
                }
            });

        }

    </script>
</head>

<body>
    <form id="form1" runat="server">
    <asp:ScriptManager ID="myScriptManager2" runat="server"></asp:ScriptManager>
    <div class="ds">
        <span>APPLICATION FORM</span>      
    </div>

    <div class="row">
         <div class="col1" style=" display:none">
            <ul>
                <li><h4>Personal Details</h4></li>
                <li><asp:ImageButton ID="ImageButton1"  OnClick="click_profile" alt="profile" runat="server" class="img-del" /></li>
            </ul>
         </div>

         <div class="col2 as" style=" display:none">

            <div class="col-row">
                <ul>
                    <li><small>First Name <span>*</span></small></li>
                    <li><asp:TextBox ID="txt_fname"  runat="server"></asp:TextBox></li>
                </ul>
            </div>

            <div class="col-row">
                <ul>
                     <li><small>Middle Name <span>*</span></small></li>
                    <li><asp:TextBox ID="txt_mname"  runat="server"></asp:TextBox></li>
                </ul>
            </div>

            <div class="col-row">
                <ul>
                    <li><small>Last Name <span>*</span></small></li>
                    <li><asp:TextBox ID="txt_lname" runat="server" style="margin:0"></asp:TextBox></li>
                </ul>
            </div>

            <asp:UpdatePanel ID="UpdatePanel3" runat="server" style=" display:none">
                <ContentTemplate>
                    <table class="sub-tb">
                        <tr>
                            <td colspan="5"><small>Present Address <span>*</span></small></td>
                        </tr>
                        <tr>
                            <td>
                                <asp:DropDownList ID="ddl_country" OnSelectedIndexChanged="clear_pre_country" AutoPostBack="true" runat="server" CssClass="sub-tb-da">
                                </asp:DropDownList>
                            </td>
                            <td>
                                <asp:TextBox ID="ddl_region" Visible="false" onkeydown ="return (event.keyCode!=13)" Placeholder="Region" autocomplete="off" runat="server" CssClass="sub-tb-dd" style=" padding:6px; margin-right:3px"></asp:TextBox>
                                <asp:DropDownList ID="drop_region" OnSelectedIndexChanged="select_pre_region" AutoPostBack="true" runat="server"  CssClass="sub-tb-d" >
                                    <asp:ListItem>Region</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td>
                                <asp:TextBox ID="ddl_province"  Visible="false"  onkeydown ="return (event.keyCode!=13)" Placeholder="Province" class="autoprovince" autocomplete="off"  runat="server"  style=" padding:6px;margin-right:3px"></asp:TextBox><%--OnTextChanged="getregpro" AutoPostBack="true"--%>
                                <asp:DropDownList ID="drop_province" OnSelectedIndexChanged="select_pre_province" AutoPostBack="true" CssClass="sub-tb-da" runat="server">
                                    <asp:ListItem>Province</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td>
                                <asp:TextBox ID="ddl_city"  Visible="false" onkeydown ="return (event.keyCode!=13)" class="autocity" Placeholder="City"  autocomplete="off"  runat="server" CssClass="sub-tb-de" style=" padding:6px;margin-right:3px"></asp:TextBox>
                                <asp:DropDownList ID="drop_city" CssClass="sub-tb-da" runat="server">
                                    <asp:ListItem>City</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td>
                                <asp:TextBox ID="txt_baranggay" Placeholder="Barangay/Street" CssClass="sub-tb-dc"  style=" padding:6px; margin-left:0px;" runat="server"></asp:TextBox>
                            </td>                         
                        </tr>
                        
                    </table>
                </ContentTemplate>
            </asp:UpdatePanel>
         </div>
          
    </div>



<div class="mod_so" style=" display:none">   
   
    
        <div class="content">
      
            <table class="subs">
                <tr>
                    <td style=" vertical-align:top">
                        
                    </td>
                    <td>
                    <table class="sub-tb st-2">
                            <tr>
                                <td colspan="3"><asp:Label ID="lbl_error" runat="server" ForeColor="Maroon"></asp:Label></td>
                            </tr>
                            <tr>
                       
                            </tr>
                            
                        </table>
                        
                        <table class="sub-tb st-1">
                            <tr>
                                <td><asp:TextBox ID="txt_cel" MaxLength="11" runat="server"></asp:TextBox></td>
                                <td><asp:TextBox ID="txt_tel" runat="server"></asp:TextBox></td>
                                <td><asp:TextBox ID="txt_email" ClientIDMode="Static" runat="server"></asp:TextBox></td>
                                <td>
                                    <asp:DropDownList ID="ddl_month" runat="server" Width="55px" style="margin-left:3px">
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
                                    </asp:DropDownList> / 
                                    <asp:DropDownList ID="ddl_day" runat="server"  Width="55px">
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
                                    </asp:DropDownList> / 
                                    <asp:DropDownList ID="ddl_year" runat="server"  Width="65px">
                                        <asp:ListItem Value="">YYYY</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td>Mobile Number  (REQ.)</td>
                                <td>Telephone Number</td>
                                <td>E-mail Address  (REQ.)</td>
                                <td>Date of Birth (REQ.)</td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td>
                        <ul>
                            <li><h4>EDUCATION</h4></li>
                            <li>
                           
                                    <span class="select-wrapper">
                                        <asp:FileUpload ID="FileUpload1" runat="server" CssClass="image_src" /><%--CssClass="image_src"--%>
                                    </span>
                                    <span>Upload resume (REQ.)</span>
                                
                            </li>
                        </ul>
                    </td>
                    <td>
                        <table class="sub-tb educa st-1">
                            <tr>
                                <td>Elementary</td>
                                <td><asp:TextBox ID="txt_elemschool" runat="server" placeholder="School"></asp:TextBox></td>
                                <td><asp:TextBox ID="txt_elemaddress" runat="server" placeholder="Address"></asp:TextBox></td>
                                <td>
                                    <asp:DropDownList ID="ddl_elemmonth" runat="server" Width="55px" style="margin-left:3px">
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
                                    </asp:DropDownList> / 
                                    <asp:DropDownList ID="ddl_elemyear" runat="server"  Width="65px">
                                        <asp:ListItem Value="">YYYY</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                 
                                <td style=" display:none;" ><asp:TextBox ID="txt_elemyear" runat="server" placeholder="Years Attended"></asp:TextBox></td>
                            </tr>
                            <tr>
                            <td>High School</td>
                            <td><asp:TextBox ID="txt_secondschool" runat="server"  placeholder="School"></asp:TextBox></td>
                            <td><asp:TextBox ID="txt_secondaddress" runat="server" placeholder="Address"></asp:TextBox></td>
                            <td>
                                    <asp:DropDownList ID="ddl_secondmonth" runat="server" Width="55px" style="margin-left:3px">
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
                                    </asp:DropDownList> / 
                                    <asp:DropDownList ID="ddl_secondyear" runat="server"  Width="65px">
                                        <asp:ListItem Value="">YYYY</asp:ListItem>
                                    </asp:DropDownList>
                                </td>

                            <td style=" display:none;"><asp:TextBox ID="txt_secondyear" runat="server" placeholder="Years Attended"></asp:TextBox></td>
                            </tr>
                            <tr>
                            <td>College</td>
                            <td><asp:TextBox ID="txt_collegeschool" runat="server"  placeholder="School"></asp:TextBox></td>
                            <td><asp:TextBox ID="txt_collegeaddress" runat="server" placeholder="Address"></asp:TextBox></td>
                            <td>
                                    <asp:DropDownList ID="ddl_collegemonth" runat="server" Width="55px" style="margin-left:3px">
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
                                    </asp:DropDownList> / 
                                    <asp:DropDownList ID="ddl_collegeyear" runat="server"  Width="65px">
                                        <asp:ListItem Value="">YYYY</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            <td style=" display:none;"><asp:TextBox ID="txt_collegeyear" runat="server" placeholder="Years Attended"></asp:TextBox></td>
                            </tr>
                            <tr>
                            <td>Vocational</td>
                            <td><asp:TextBox ID="txt_vocationalschool" runat="server"  placeholder="School"></asp:TextBox></td>
                            <td><asp:TextBox ID="txt_vocationaladdress" runat="server" placeholder="Address"></asp:TextBox></td>
                            <td>
                                    <asp:DropDownList ID="ddl_vocationalmonth" runat="server" Width="55px" style="margin-left:3px">
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
                                    </asp:DropDownList> / 
                                    <asp:DropDownList ID="ddl_vocationalyear" runat="server"  Width="65px">
                                        <asp:ListItem Value="">YYYY</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            <td style=" display:none;"><asp:TextBox ID="txt_vocationalyear" runat="server" placeholder="Years Attended"></asp:TextBox></td>
                            </tr>
                        </table>
                    
                    </td>
                    </tr>
                <tr>
                    <td style="width:200px; vertical-align:top ">
                        <ul>
                            <li><h4>EMPLOYMENT</h4></li>
                        </ul>
                    </td>
                    <td>
                        <asp:UpdatePanel ID="UpdatePanel1"   runat="server">
                            <ContentTemplate>
                                  <script type="text/javascript">
                                    // when dom is ready we initialize the UpdatePanel requests
                                    $(document).ready(function () {
                                        var prm = Sys.WebForms.PageRequestManager.getInstance();
                                        prm.add_initializeRequest(InitializeRequest);
                                        prm.add_endRequest(EndRequest);
                                        $('.txtDatepicker').datepicker({});
                                    });
                                    function InitializeRequest(sender, args) {
                                        $('.txtDatepicker').datepicker();
                                    }
                                    function EndRequest(sender, args) {
                                        $('.txtDatepicker').datepicker({});
                                    }
                                </script>
                                <asp:GridView ID="grid_employmenthistory" CssClass="sub-tb"   AutoGenerateColumns="false" ShowHeader="false" OnRowDataBound="Databound_employmenthistory" OnRowDeleting="Deleting_employmenthistory"  border="0" ShowFooter="True" runat="server">
                                    <Columns>
                                        <asp:TemplateField  ItemStyle-Width="15px" > 
                                            <ItemTemplate>
                                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("RowNumber") %>'></asp:Label>
                                            </ItemTemplate>
                                         </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Position" ItemStyle-Width="250px">
                                            <ItemTemplate>
                                                <asp:Label ID="lbl_employmenthistory_position" runat="server"></asp:Label>
                                                <asp:Label ID="lbl_2ndemploymenthistory_position" runat="server" Text=""></asp:Label>
                                                <asp:textbox ID="txt_employmenthistory_position"  runat="server" autocomplete="off" placeholder="Position"></asp:textbox>
                                            </ItemTemplate>
                                            <FooterTemplate >
                                                        <asp:ImageButton ID="ImageButton2"  runat="server" OnClick="clickaddbutton_governmentlicenses" ImageUrl="~/style/img/add-1.png"/><%--OnClick="ButtonAdd_Click"--%>
                                            </FooterTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField  HeaderText="Company Name" >
                                            <ItemTemplate>
                                                <asp:Label ID="lbl_employmenthistory_c_name_address" runat="server" Text=""></asp:Label>
                                                <asp:Label ID="lbl_2ndemploymenthistory_c_name_address"  runat="server" Text=""></asp:Label>
                                                <asp:TextBox ID="txt_employmenthistory_c_name_address" autocomplete="off" runat="server"  Width="95.5%" placeholder="Company"></asp:TextBox>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField ItemStyle-Width="220px"> 
                                            <ItemTemplate>
                                                <asp:Label ID="lbl_employmenthistory_fromto" runat="server" Text=""></asp:Label>
                                                <asp:Label ID="lbl_2ndemploymenthistory_fromto"  runat="server" Text=""></asp:Label>
                                                <asp:TextBox ID="txt_from" runat="server" CssClass="txtDatepicker" autocomplete="off" ClientIDMode="Static"   placeholder="date from" Width="90px"></asp:TextBox>
                                                <asp:TextBox ID="txt_to" runat="server" CssClass="txtDatepicker" autocomplete="off" ClientIDMode="Static"  placeholder="date to"  Width="90px"></asp:TextBox>
                                               
                                            </ItemTemplate>
                                            <ItemStyle/>
                                        </asp:TemplateField>
                                        <asp:TemplateField ShowHeader="False">
                                            <ItemTemplate>
                                                <asp:ImageButton ID="can" runat="server"  CausesValidation="false" ToolTip="Delete Item"  CommandName="Delete" ImageUrl="~/style/img/delete-1.png" />
                                            </ItemTemplate>
                                            <ItemStyle Width="5px" />
                                        </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                       
                        <br />
                    </td>
                    </tr>
                <tr>
                    <td style="width:200px; vertical-align:top ">
                        <ul>
                            <li><h4>SPECIAL SKILLS</h4></li>
                        </ul>
                    </td>
                    <td>
                    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                            <ContentTemplate>
                        <asp:GridView ID="grid_item" runat="server" ShowHeader="false" CssClass="sub-tb" ShowFooter="true" onrowdeleting="grid_item_RowDeleting" AutoGenerateColumns="False" >
                            <Columns>
                                <asp:TemplateField ItemStyle-Width="15px" Visible="true"> 
                                    <ItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("RowNumber") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Skills">
                                    <ItemTemplate>
                                        <asp:Label ID="lbl_descripton" runat="server" CssClass="na" Text=""></asp:Label>
                                        <asp:Label ID="lbl_descripton_desp"  runat="server" Text=""></asp:Label>
                                        <asp:TextBox ID="txt_description" autocomplete="off"  runat="server"  Width="98%" ></asp:TextBox> 
                                    </ItemTemplate>
                                     <FooterTemplate >             
                                        <asp:ImageButton ID="btn" runat="server" ImageUrl="~/style/img/add-1.png" OnClick="ButtonAdd_Click"  />
                                    </FooterTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField ShowHeader="False" Visible="true">
                                    <ItemTemplate>
                                            <asp:ImageButton ID="can" runat="server" CausesValidation="false" CommandName="Delete" ImageUrl="~/style/img/delete-1.png"/>
                                    </ItemTemplate>
                                    <ItemStyle Width="5px" />
                                </asp:TemplateField>
                            </Columns>            
                        </asp:GridView>
                        </ContentTemplate>
                        </asp:UpdatePanel>
                    </td>
                </tr>
            </table>
 
        <div style=" text-align:center;">
             <asp:UpdatePanel ID="up_pan" runat="server">
                <ContentTemplate>
                    <ul>
                        <li><asp:Image ID="imgCaptcha" runat="server" /> 
                        <asp:LinkButton ID="btnRefresh" runat="server" OnClick="btnRefresh_Click"><img src="style/img/icon-5.png" /></asp:LinkButton>
                        <li><asp:TextBox ID="txtCaptcha" runat="server" Width="200px" placeholder="Captcha" style="padding:8px; background:transparent; border:1px solid #3c94b4; text-align:center"></asp:TextBox></li>
                        <li></li>
                    </ul>
               </ContentTemplate>
              </asp:UpdatePanel>
         
                 <asp:Button ID="Button1" runat="server" OnClientClick="window.scrollTo(0,0);document.getElementById('overlay').style.display='block';document.body.style.overflow = 'hidden';document.getElementById('fade').style.display='block'" OnClick="click_save" Text="Submit" /><%--OnClientClick="window.scrollTo(0,0);document.getElementById('overlay').style.display='block';document.body.style.overflow = 'hidden';document.getElementById('fade').style.display='block'"--%>
        </div>
<div id="panelOverlay" visible="false" runat="server" class="Ocrop"></div>
<div id="panelPopUpPanel" visible="false" runat="server" class="Pcrop">
    <asp:ImageButton ID="can" runat="server" CausesValidation="false" OnClick="add_close" CssClass="closecrop" ImageUrl="~/style/img/closeb.png" />
    <input type="file" id="File1" accept=".jpg,.png,.gif"/>
    <div id="ss" style="display: none; width:100%;overflow:scroll; text-align:center">
        <img id="Image1" style="display:none;"/>
    </div>
    <canvas id="canvas"  style="display:none"></canvas>
    <input type="button" id="btnCrop" value="Crop" style="display: none" class ="os" />
    <asp:Button ID="btnUpload" runat="server" Text="Upload" OnClick="Upload" Style="display: none" />
</div>

<input type="hidden" name="imgX1" id="imgX1" />
<input type="hidden" name="imgY1" id="imgY1" />
<input type="hidden" name="imgWidth" id="imgWidth" />
<input type="hidden" name="imgHeight" id="imgHeight" />
<input type="hidden" name="imgCropped" id="imgCropped" />
<input type="hidden" name="imff" id="imff" />
<div id="div1" visible="false" runat="server" class="PopUpPanel">
</div>
</div>
  </div>   
  
  
    <div id="fade"><div id="overlay"><img src="style/img/loading.gif"  alt="loading" style=" display:none"/></div></div>        
    </form>
</body>
</html>