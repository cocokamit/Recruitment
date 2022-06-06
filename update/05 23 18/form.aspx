<%@ Page Language="C#" AutoEventWireup="true" CodeFile="form.aspx.cs" Inherits="form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Bluewater</title>
    <script type="text/javascript">
        function disableBackButton() {
            window.history.forward()
        }
        disableBackButton();
        window.onload = disableBackButton();
        window.onpageshow = function (evt) { if (evt.persisted) disableBackButton() }
        window.onunload = function () { void (0) } 
    </script>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <link href="crop image/css/cropper.min.css" rel="stylesheet"  type="text/css" />
    <link href="crop image/css/main.css" rel="stylesheet"  type="text/css" />
    <link href="style/css/style.css" rel="Stylesheet" type="text/css" />
    <link href="style/css/recruitment.css" rel="Stylesheet" type="text/css" />
    <script type="text/javascript">
        function number() {
            var elm = document.getElementById("txt_cel");
            mob = elm.value.replace(/ /g, '')
            if (mob.length > 4) {

                if (mob.length > 7) {
                    elm.value = mob.substring(0, 4) + " " + mob.substring(4, 7) + " " + mob.substring(7);
                }
                else {
                    elm.value = mob.substring(0, 4) + " " + mob.substring(4);
                }
            }
        }
        function clos() {
            var modal = document.getElementById('myModal');
            var modalcon = document.getElementById('myModalContent');
            var modalrem = document.getElementById('modalresume');
            modal.style.display = "none";
            modalcon.style.display = "none";
            modalrem.style.display = "none";
        }
        function modaliza(el) {
            var modal = document.getElementById('myModal');
            var modalcon = document.getElementById('myModalContent');
            var modalrem = document.getElementById('modalresume');
            modal.style.display = "block";
            if(el==1)
                modalcon.style.display = "block";
            else
                modalrem.style.display = "block";
            var ss = document.getElementsByClassName('cropper-container');
        }
        function crop() {
            var modal = document.getElementById('myModal');
            var modalcon = document.getElementById('myModalContent');
            var modalrem = document.getElementById('modalresume');
            var setAspectRatio = document.getElementById('setAspectRatio');
            setAspectRatio.style.display = "none";
            modal.style.display = "none";
            modalcon.style.display = "none";
            modalrem.style.display = "none";
        }
        function upfile() {
            var modal = document.getElementById('img_container');
            var li_crop = document.getElementById('getDataURL2');
            var img_up = document.getElementById('img_up');
            modal.style.display = "block";
            li_crop.style.display = "inline-block";
            img_up.style.width = "40px";
        }
    </script>
    <script src="crop image/js/jquery-1.12.4.min.js" type="text/javascript"></script>
    <script src="crop image/js/cropper.min.js" type="text/javascript"></script>
    <script src="crop image/js/main.js" type="text/javascript"></script>
    <link rel="stylesheet" href="style/css/jquery-calendar.css" type="text/css"/>
    <script type="text/javascript" src="script/autocomplete/jquery-ui.js"></script>
    <script type="text/javascript">
        function dss(elem) {
            $("#" + elem.id).datepicker({
                changeMonth: true,
                yearRange: "-100:+0",
                changeYear: true
            });
        }
        function selectchange(elem) {
            elem.style.color = "red";
            alert(elem.selectedIndex);
        }
    </script>
    <style type="text/css">
        .personal small { font-size:11px}
        .ds span{ font-weight:bold;letter-spacing:1.5px}
        .address-text {display:none}
        .contact input[type="text"] { width:191px; }
        .emp {margin-top:70px}
        .js .inputfile {width: 0.1px;height: 0.1px;opacity: 0;overflow: hidden;position: absolute;z-index: -1;}
        .inputfile + label {max-width: 80%;font-size: 1.25rem;/* 20px */font-weight: 700;text-overflow: ellipsis;white-space: nowrap;cursor: pointer;display: inline-block;overflow: hidden;padding: 0.625rem 1.25rem;/* 10px 20px */}
        .no-js .inputfile + label {display: none;}
        .inputfile:focus + label,
        .inputfile.has-focus + label {outline: 1px dotted #000;outline: -webkit-focus-ring-color auto 5px;}
        .inputfile + label svg {width: 1em;height: 1em;vertical-align: middle;fill: currentColor;margin-top: -0.25em;/* 4px */margin-right: 0.25em;/* 4px */}
        .inputfile-1 + label {color: #f1e5e6;background-color: #2188ae;}
        .inputfile-1:focus + label,.inputfile-1.has-focus + label,.inputfile-1 + label:hover {background-color: #65a1b7;}
        .fountainG{position:absolute;top:0;background-color:rgb(90,164,204);width:12px;height:12px;animation-name:bounce_fountainG;-o-animation-name:bounce_fountainG;-ms-animation-name:bounce_fountainG;-webkit-animation-name:bounce_fountainG;-moz-animation-name:bounce_fountainG;animation-duration:1.3s;-o-animation-duration:1.3s;-ms-animation-duration:1.3s;-webkit-animation-duration:1.3s;-moz-animation-duration:1.3s;animation-iteration-count:infinite;-o-animation-iteration-count:infinite;-ms-animation-iteration-count:infinite;-webkit-animation-iteration-count:infinite;-moz-animation-iteration-count:infinite;animation-direction:normal;-o-animation-direction:normal;-ms-animation-direction:normal;-webkit-animation-direction:normal;-moz-animation-direction:normal;transform:scale(.3);-o-transform:scale(.3);-ms-transform:scale(.3);-webkit-transform:scale(.3);-moz-transform:scale(.3);border-radius:8px;-o-border-radius:8px;-ms-border-radius:8px;-webkit-border-radius:8px;-moz-border-radius:8px;}
        #fountainG{display:none;position:relative;width:96px;height:12px;margin:auto;}
        #fountainG_1{left:0;animation-delay:0.52s;-o-animation-delay:0.52s;-ms-animation-delay:0.52s;-webkit-animation-delay:0.52s;-moz-animation-delay:0.52s;}
        #fountainG_2{left:12px;animation-delay:0.65s;-o-animation-delay:0.65s;-ms-animation-delay:0.65s;-webkit-animation-delay:0.65s;-moz-animation-delay:0.65s;}
        #fountainG_3{left:24px;animation-delay:0.78s;-o-animation-delay:0.78s;-ms-animation-delay:0.78s;-webkit-animation-delay:0.78s;-moz-animation-delay:0.78s;}
        #fountainG_4{left:36px;animation-delay:0.91s;-o-animation-delay:0.91s;-ms-animation-delay:0.91s;-webkit-animation-delay:0.91s;-moz-animation-delay:0.91s;}
        #fountainG_5{left:48px;animation-delay:1.04s;-o-animation-delay:1.04s;-ms-animation-delay:1.04s;-webkit-animation-delay:1.04s;-moz-animation-delay:1.04s;}
        #fountainG_6{left:60px;animation-delay:1.17s;-o-animation-delay:1.17s;-ms-animation-delay:1.17s;-webkit-animation-delay:1.17s;-moz-animation-delay:1.17s;}
        #fountainG_7{left:72px;animation-delay:1.3s;-o-animation-delay:1.3s;-ms-animation-delay:1.3s;-webkit-animation-delay:1.3s;-moz-animation-delay:1.3s;}
        #fountainG_8{left:84px;animation-delay:1.43s;-o-animation-delay:1.43s;-ms-animation-delay:1.43s;-webkit-animation-delay:1.43s;-moz-animation-delay:1.43s;}
        @keyframes bounce_fountainG{
	        0%{transform:scale(1); background-color:rgb(21,125,143);}
	        100%{transform:scale(.3);background-color:rgb(255,255,255);}
        }

        @-o-keyframes bounce_fountainG{
	        0%{-o-transform:scale(1);background-color:rgb(21,125,143);}
	        100%{-o-transform:scale(.3);background-color:rgb(255,255,255);}
        }

        @-ms-keyframes bounce_fountainG{
	        0%{-ms-transform:scale(1);background-color:rgb(21,125,143);}
	        100%{-ms-transform:scale(.3);background-color:rgb(255,255,255);}
        }

        @-webkit-keyframes bounce_fountainG{
	        0%{-webkit-transform:scale(1);background-color:rgb(21,125,143);}
	        100%{-webkit-transform:scale(.3);background-color:rgb(255,255,255);}
        }

        @-moz-keyframes bounce_fountainG{
	        0%{-moz-transform:scale(1);background-color:rgb(21,125,143);}
	        100%{-moz-transform:scale(.3);background-color:rgb(255,255,255);}
        }
    </style>
</head>

<body onload="noBack();" onpageshow="if (event.persisted) noBack();" onunload="">
    <form id="form1" runat="server">
    <script type="text/javascript" src="script/country/jquery.min.js"></script>
    <script type="text/javascript" src="script/country/list.js"></script>
    <script type="text/javascript">
        jQuery.noConflict();
        jQuery(document).ready(function(){
         $(".country").change(function () {
            if (this.value == "Philippines" || this.value == "Country") {
                $("#ddl_region").css("display", "none");
                $("#countryy").css("display", "block");
                $("#ddl_province").css("display", "none");
                $("#statey").css("display", "block");
                $("#ddl_city").css("display", "none");
                $("#cityy").css("display", "block");
            }
            else {
                document.getElementById('ddl_region').value="";
                document.getElementById('ddl_city').value= "";
                document.getElementById('ddl_province').value="";
                $("#ddl_region").css("display", "block");
                $("#countryy").css("display", "none");
                $("#ddl_province").css("display", "block");
                $("#statey").css("display", "none");
                $("#ddl_city").css("display", "block");
                $("#cityy").css("display", "none");
            }
        });

        $.each(country_arr, function (i, item) {
            $('#countryy').append($('<option>', {
                value: i + 1,
                text : item,
            }, '</option>' ));
            $('#countryy option:selected').val(0);
        });
         
        $('#countryy').change(function(){
            var c = $(this).val();
            document.getElementById('ddl_region').value= $('#countryy option:selected').text() + "|" + c;
            var state_arr = s_a[c].split("|");
            $('#statey').empty();
            $('#cityy').empty();
            if(c==0){
                $('#statey').append($('<option>', {
                    value: '0',
                    text: 'Select State',
                }, '</option>'));
            }else {
                $.each(state_arr, function (i, item_state) {
                    $('#statey').append($('<option>', {
                        value: item_state,
                        text: item_state,
                    }, '</option>'));
                });
            }
            $('#cityy').append($('<option>', {
                value: '0',
                text: 'City',
            }, '</option>'));
        });
        $('#statey').change(function(){
            var s = $(this).val();
            document.getElementById('ddl_province').value= $('#statey option:selected').text();
            var city_arr = c_a[s].split("|");
            $('#cityy').empty();
            $.each(city_arr, function (j, item_city) {
                $('#cityy').append($('<option>', {
                    value: item_city,
                    text: item_city,
                }, '</option>'));
            });
        });
        $('#cityy').change(function(){
            document.getElementById('ddl_city').value= $('#cityy option:selected').text();
        });

        if (document.getElementById('ddl_country').value == "Philippines" ) 
        {
            $("#ddl_region").css("display", "none");
            $("#countryy").css("display", "block");
            $("#ddl_province").css("display", "none");
            $("#statey").css("display", "block");
            $("#ddl_city").css("display", "none");
            $("#cityy").css("display", "block");
            var reg = $('#ddl_region').val().split("|");
            $('#countryy option:selected').text(reg[0]);
            provicne(reg[1]);
            $('#statey option:selected').text($('#ddl_province').val());
            cityni($('#ddl_province').val());
            $('#cityy option:selected').text($('#ddl_city').val());
        }
        else
        {
            $("#ddl_region").css("display", "block");
            $("#countryy").css("display", "none");
            $("#ddl_province").css("display", "block");
            $("#statey").css("display", "none");
            $("#ddl_city").css("display", "block");
            $("#cityy").css("display", "none");
        }
    });
    </script>
    <asp:ScriptManager ID="myScriptManager2" runat="server"></asp:ScriptManager>
    <div class="ds">
        <span>APPLICATION FORM</span> 
    </div>
    <div class="row">
        <div class="col-a personal">
            <ul>
                <li><h4>PERSONAL DETAILS</h4></li>
                <li>
                    <div class="docs-data-url">
                        <div class="col-sm-6" style=" display:none">
                            <asp:TextBox ID="dataURLInto" runat="server" CssClass="form-control" TextMode="MultiLine"></asp:TextBox>
                        </div>
                        <div class="col-sm-6">
                            <div id="dataURLView" onclick="modaliza(1)" style="cursor:pointer"></div>
                        </div>
                    </div>
                    <img id="setAspectRatio" runat="server" src="style/img/icon-1.png" onclick="modaliza(1)" style="  cursor:pointer; margin-top:8px" alt="ID"  />
                </li>
                <li style=" margin-top:-8px"><small><asp:Label ID="l_addpic" runat="server" Text="Add picture"></asp:Label></small></li>
            </ul>
        </div>
        <div class="col-b">
            <div class="col-row personal-a">
                <ul>
                    <li><asp:TextBox ID="txt_fname" runat="server"></asp:TextBox></li>
                    <li><small><asp:Label ID="l_fname" runat="server" Text="First Name *"></asp:Label></small></li>
                </ul>
                <ul>
                    <li><asp:TextBox ID="txt_mname"  runat="server"></asp:TextBox></li>
                    <li><small><asp:Label ID="l_mname" runat="server" Text="Middle Name"></asp:Label></small></li>
                </ul>
                <ul>
                    <li><asp:TextBox ID="txt_lname" runat="server" style="margin:0"></asp:TextBox></li>
                    <li><small><asp:Label ID="l_lname" runat="server" Text="Last Name *"></asp:Label></small></li>
                </ul>
            </div>
            <div class="col-row address">
                <ul>
                    <li><asp:DropDownList ID="ddl_country" ClientIDMode="Static" CssClass="country" runat="server"></asp:DropDownList></li>
                    <li><small><asp:Label ID="l_coun" runat="server" Text="Present Address *"></asp:Label></small></li>
                </ul>
                <ul>
                    <li>
                        <select name="country" id="countryy">
                            <option>Region</option>
                        </select>   
                        <asp:TextBox ID="ddl_region" Placeholder="Region" runat="server" ClientIDMode="Static" CssClass="address-text"></asp:TextBox>
                    </li>
                </ul>
                <ul>
                    <li>
                        <select name="state" id="statey">
                            <option>Province</option>
                        </select> 
                        <asp:TextBox ID="ddl_province" Placeholder="Province" autocomplete="off" ClientIDMode="Static" runat="server" CssClass="address-text"></asp:TextBox>
                    </li>
                </ul>
                    <ul>
                    <li>
                        <select name="city" id="cityy">
                            <option>City</option>
                        </select>
                        <asp:TextBox ID="ddl_city" onkeydown ="return (event.keyCode!=13)" Placeholder="City" ClientIDMode="Static" autocomplete="off" runat="server" CssClass="address-text"></asp:TextBox>
                    </li>
                </ul>
                    <ul>
                    <li><asp:TextBox ID="txt_baranggay" Placeholder="Barangay/Street" runat="server" CssClass="barang"></asp:TextBox></li>
                </ul>
            </div>
            <div class="col-row contact">
                <ul>
                    <li><asp:TextBox ID="txt_cel" MaxLength="13" ClientIDMode="Static" onblur="number()" onkeyup="number()" runat="server"></asp:TextBox></li>
                    <li style=" margin-top:-5px"><small><asp:Label ID="l_mn" runat="server" Text="Mobile Number *"></asp:Label></small></li>
                </ul>
                <ul>
                    <li><asp:TextBox ID="txt_tel" runat="server"></asp:TextBox></li>
                    <li style=" margin-top:-5px"><small><asp:Label ID="l_tn" runat="server" Text="Telephone Number"></asp:Label></small></li>
                </ul>
                <ul>
                    <li><asp:TextBox ID="txt_email" ClientIDMode="Static" runat="server"></asp:TextBox></li>
                    <li style=" margin-top:-5px"><small><asp:Label ID="l_ea" runat="server" Text="E-mail Address *"></asp:Label></small></li>
                </ul>
                <ul>
                    <li><asp:TextBox ID="txt_from" runat="server"  CssClass="txtDatepicker"  autocomplete="off" onpaste="return false" onkeydown="return false" onmouseover="dss(this)" style=" margin-right:0; width:199px;"></asp:TextBox></li>
                    <li style="margin:-5px 0 0 2px"><small><asp:Label ID="l_db" runat="server" Text="Date of Birth *"></asp:Label></small></li>
                    <li class="normal hide">
                         <asp:DropDownList ID="ddl_month" runat="server" Width="55px">
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
                        </asp:DropDownList> -
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
                        </asp:DropDownList> -
                        <asp:DropDownList ID="ddl_year" runat="server"  Width="67.5px">
                            <asp:ListItem Value="">YYYY</asp:ListItem>
                        </asp:DropDownList>
                    </li>
                </ul>
                <ul>
                    <li>
                        <asp:DropDownList ID="ddl_gender" runat="server" Width="80px">
                            <asp:ListItem>Male</asp:ListItem>
                            <asp:ListItem>Female</asp:ListItem>
                        </asp:DropDownList>
                    </li>
                    <li style=" margin-top:-5px"><small><asp:Label ID="l_gender" runat="server" Text="Gender"></asp:Label></small></li>
                </ul>
             </div>
        </div>
    </div>
    <div class="row">
        <div class="col-a educ" onclick="modaliza(0)" style="cursor:pointer"> 
            <ul>
                <li><h4>EDUCATION</h4></li>
                <li>
                    <span id="educ_span" runat="server" class="select-wrapper" style=" word-wrap:break-word;">
                    
                    <small id="fdoc" runat="server"></small>
                       
                    </span>
                </li>
                <li><small><asp:Label ID="l_educ" runat="server" Text="Upload resume"></asp:Label></small></li>
            </ul>
        </div>
        <div class="col-b educ-a">
            <div class="col-row educ-b">
                <div>Elementary</div>
                <ul>
                    <li><asp:TextBox ID="txt_elemschool" runat="server" placeholder="School"></asp:TextBox></li>
                    <li><asp:TextBox ID="txt_elemaddress" runat="server" placeholder="Address"></asp:TextBox></li>
                    <li>
                        <asp:DropDownList ID="ddl_elemmonth" runat="server" Width="65px">
                             <asp:ListItem Value="">YYYY</asp:ListItem>
                        </asp:DropDownList> -
                        <asp:DropDownList ID="ddl_elemyear" runat="server"  Width="65px">
                            <asp:ListItem Value="">YYYY</asp:ListItem>
                        </asp:DropDownList>
                    </li>
                </ul>
            </div>

            <div class="col-row educ-b">
                <div>High School</div>
                <ul>
                    <li><asp:TextBox ID="txt_secondschool" runat="server"  placeholder="School"></asp:TextBox></li>
                    <li><asp:TextBox ID="txt_secondaddress" runat="server" placeholder="Address"></asp:TextBox></li>
                    <li>
                        <asp:DropDownList ID="ddl_secondmonth" runat="server" Width="65px">
                            <asp:ListItem Value="">YYYY</asp:ListItem>
                        </asp:DropDownList> - 
                        <asp:DropDownList ID="ddl_secondyear" runat="server"  Width="65px">
                            <asp:ListItem Value="">YYYY</asp:ListItem>
                        </asp:DropDownList>
                    </li>
                </ul>
            </div>

            <div class="col-row educ-b">
                <div>College</div>
                <ul>
                    <li><asp:TextBox ID="txt_collegeschool" runat="server"  placeholder="School"></asp:TextBox></li>
                    <li><asp:TextBox ID="txt_collegeaddress" runat="server" placeholder="Address"></asp:TextBox></li>
                    <li>
                        <asp:DropDownList ID="ddl_collegemonth" runat="server" Width="65px" >
                            <asp:ListItem Value="">YYYY</asp:ListItem>
                        </asp:DropDownList> - 
                        <asp:DropDownList ID="ddl_collegeyear" runat="server"  Width="65px">
                            <asp:ListItem Value="">YYYY</asp:ListItem>
                        </asp:DropDownList>
                    </li>
                </ul>
            </div>

            <div class="col-row educ-b">
                <div>Vocational</div>
                <ul>
                    <li><asp:TextBox ID="txt_vocationalschool" runat="server"  placeholder="School"></asp:TextBox></li>
                    <li><asp:TextBox ID="txt_vocationaladdress" runat="server" placeholder="Address"></asp:TextBox></li>
                    <li>
                        <asp:DropDownList ID="ddl_vocationalmonth" runat="server" Width="65px">
                           <asp:ListItem Value="">YYYY</asp:ListItem>
                        </asp:DropDownList> - 
                        <asp:DropDownList ID="ddl_vocationalyear" runat="server"  Width="65px">
                            <asp:ListItem Value="">YYYY</asp:ListItem>
                        </asp:DropDownList>
                    </li>
                    <li></li>
                </ul>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-a emp">
            <h4>EMPLOYMENT</h4>
        </div>
        <div class="col-b emp-b">
            <asp:UpdatePanel ID="UpdatePanel1"   runat="server">
            <ContentTemplate>
               
                <asp:GridView ID="grid_employmenthistory" CssClass="sub-tb" AutoGenerateColumns="false" ShowHeader="false" OnRowDataBound="Databound_employmenthistory" OnRowDeleting="Deleting_employmenthistory"  border="0" ShowFooter="True" runat="server">
                    <Columns>
                        <asp:TemplateField ItemStyle-Width="20px" > 
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Font-Size="11px" Text='<%# Bind("RowNumber") %>' CssClass="sb-cnt"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Position" ItemStyle-CssClass="tb-pos-a" >
                            <ItemTemplate>
                                <asp:Label ID="lbl_employmenthistory_position" runat="server" CssClass="na naa"></asp:Label>
                                <asp:textbox ID="txt_employmenthistory_position"  runat="server" autocomplete="off" placeholder="Position"  CssClass="tb-pos-txt-a" ></asp:textbox>
                            </ItemTemplate>
                            <FooterTemplate >
                                <asp:ImageButton ID="ImageButton2"  runat="server" OnClick="clickaddbutton_governmentlicenses" ImageUrl="~/style/img/add-1.png" CssClass="tb-add"/><%--OnClick="ButtonAdd_Click"--%>
                            </FooterTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField  HeaderText="Company Name" ItemStyle-CssClass="tb-pos-c"  >
                            <ItemTemplate>
                                <asp:Label ID="lbl_employmenthistory_c_name_address" runat="server"  CssClass="na naa"></asp:Label>
                                <asp:TextBox ID="txt_employmenthistory_c_name_address" autocomplete="off" runat="server" CssClass="tb-pos-txt" placeholder="Company"></asp:TextBox>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField ItemStyle-CssClass="tb-pos-b"> 
                            <ItemTemplate>
                                <asp:Label ID="lbl_employmenthistory_from" runat="server"  CssClass="na naa"></asp:Label>
                                <asp:TextBox ID="txt_from" runat="server" CssClass="txtDatepicker" autocomplete="off" onpaste="return false" onkeydown="return false"  onmouseover="dss(this)" placeholder="date from" Width="92px"></asp:TextBox>
                                <asp:Label ID="lbl_employmenthistory_to" runat="server"  CssClass="na naa"></asp:Label>
                                <asp:TextBox ID="txt_to" runat="server" CssClass="txtDatepicker" autocomplete="off"  onpaste="return false" onkeydown="return false" onmouseover="dss(this)"  placeholder="date to"  Width="92px"></asp:TextBox>
                            </ItemTemplate>
                            <ItemStyle/>
                        </asp:TemplateField>
                        <asp:TemplateField ShowHeader="False">
                            <ItemTemplate>
                                <asp:ImageButton ID="can" runat="server"  CausesValidation="false" ToolTip="Delete Item" CommandName="Delete" ImageUrl="~/style/img/delete-1.png" />
                            </ItemTemplate>
                            <ItemStyle Width="5px" />
                        </asp:TemplateField>
                        </Columns>
                    </asp:GridView>

                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>
     <div class="row">
        <div class="col-b emp-b">
            <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                <ContentTemplate>
                <div class="special">
            <h4>SPECIAL SKILLS</h4>
        </div>
                    <asp:GridView ID="grid_item" runat="server" ShowHeader="false" CssClass="sub-tb" ShowFooter="true" onrowdeleting="grid_item_RowDeleting" AutoGenerateColumns="False" >
                        <Columns>
                            <asp:TemplateField ItemStyle-Width="20px" Visible="true"> 
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("RowNumber") %>'  CssClass="sb-cnt"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Skills">
                                <ItemTemplate>
                                    <asp:Label ID="lbl_descripton" runat="server" CssClass="na"></asp:Label>
                                    <asp:TextBox ID="txt_description" autocomplete="off"  runat="server"  Width="98%" CssClass="emp-b-txt" ></asp:TextBox> 
                                </ItemTemplate>
                                    <FooterTemplate >             
                                    <asp:ImageButton ID="btn" runat="server" ImageUrl="~/style/img/add-1.png" OnClick="ButtonAdd_Click"  CssClass="tb-add emp-b-add" />
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
        </div>
    </div>
    <div class="capcha">
        <asp:UpdatePanel ID="up_pan" runat="server">
            <ContentTemplate>
            <div>
                <asp:Image ID="imgCaptcha" runat="server" />  
                <asp:LinkButton ID="btnRefresh" runat="server" OnClick="btnRefresh_Click"><img src="style/img/icon-5.png" /></asp:LinkButton><br />
                <asp:TextBox ID="txtCaptcha" runat="server" Width="200px" placeholder="Captcha" style=" margin:5PX 0; padding:8px; background:transparent; border:1px solid #3c94b4; text-align:center"></asp:TextBox>
            </div>
            </ContentTemplate>
        </asp:UpdatePanel>
        <asp:Button ID="Button1" runat="server" OnClientClick="window.scrollTo(0,0);document.getElementById('div_load_modal').style.display='block';document.body.style.overflow = 'hidden';document.getElementById('div_load_gif').style.display='block'" OnClick="click_save" Text="Submit" /><%--OnClientClick="window.scrollTo(0,0);document.getElementById('overlay').style.display='block';document.body.style.overflow = 'hidden';document.getElementById('fade').style.display='block'"--%>
    </div>
    <div id="myModal" class="modal"><span onclick="clos()" class="closex">&times;</span></div>
    <div  id="myModalContent"  class="modal-content">
    
        <div id="img_container" class="img-container"><img src="crop image/img/avatar.png"></div>
        <div class="docs-toolbar">
            <div class="btn-group">
                <ul>
                    <li>
                        <label class="btn btn-primary" for="inputImage" title="Upload image file">
                            <img id="img_up" src="style/img/icon/i-upload.png" />
                            <span>Select</span>
                        </label>
                    </li>
                    <li onclick="crop()" id="getDataURL2" title="$().cropper(&quot;getDataURL&quot;, &quot;image/jpeg&quot;)" class="li-crop">
                        <label class="btn btn-primary">
                            <img src="style/img/icon/i-crop.png" width="38px" />
                            <span>Crop</span>
                        </label>
                    </li>
                </ul>
            </div>
        </div>
    </div>
    <div id="modalresume" runat="server" class="modal-content">
        <asp:FileUpload ID="FileUpload1" runat="server" ClientIDMode="Static" class="inputfile inputfile-1" style=" display:none    " accept=".doc, .docx, .pdf, .rtf" />
	    <label for="FileUpload1"><svg style="color:#fff" xmlns="http://www.w3.org/2000/svg" width="20" height="17" viewBox="0 0 20 17"><path d="M10 0l-5.2 4.9h3.3v5.1h3.8v-5.1h3.3l-5.2-4.9zm9.3 11.5l-3.2-2.1h-2l3.4 2.6h-3.5c-.1 0-.2.1-.2.1l-.8 2.3h-6l-.8-2.2c-.1-.1-.1-.2-.2-.2h-3.6l3.4-2.6h-2l-3.2 2.1c-.4.3-.7 1-.6 1.5l.6 3.1c.1.5.7.9 1.2.9h16.3c.6 0 1.1-.4 1.3-.9l.6-3.1c.1-.5-.2-1.2-.7-1.5z"/></svg> 
        <span style="color:white;">Choose a file&hellip;</span></label><br />
        <div style="padding:3px"></div>
        <a id="done" href="javascript:void(0)" onclick="click_done()">DONE</a>
        
        <div id="fountainG">
	        <div id="fountainG_1" class="fountainG"></div>
	        <div id="fountainG_2" class="fountainG"></div>
	        <div id="fountainG_3" class="fountainG"></div>
	        <div id="fountainG_4" class="fountainG"></div>
	        <div id="fountainG_5" class="fountainG"></div>
	        <div id="fountainG_6" class="fountainG"></div>
	        <div id="fountainG_7" class="fountainG"></div>
	        <div id="fountainG_8" class="fountainG"></div>
        </div>

        <span id="upf" style=" display:none; font-size:11px">UPLOADING</span>

        <script type="text/javascript">
            function click_done() {
                var nme = document.getElementById("FileUpload1");
                var oFile = nme.files[0];

                if (nme.value.length == 0) {
                    alert('Select file');
                    nme.focus();
                    return false;
                }
                else {
                    if (oFile.size / 1048576 < 3) {
                        document.getElementById("done").style.display = "none";
                        document.getElementById("upf").style.display = "block";
                        document.getElementById("fountainG").style.display = "block";
                        document.getElementById("lb_upload").click();
                    }
                    else
                        alert("file too large");
                }
            }
        </script>
    </div>
    <div id="div_load_modal" class="modal"></div> 
    <div  id="div_load_gif" class="modal-content"  style=" top:20%; margin-left:-170px; min-width:200px">
        <img src="style/img/loading.gif"  alt="loading" />
    </div>
    <asp:HiddenField ID="hf_reload_id" runat="server" />
    <asp:HiddenField ID="hf_app_id" runat="server" />
    <asp:HiddenField ID="hf_property" runat="server" />
    <div style=" display:none">
    <asp:LinkButton ID="lb_upload" runat="server" Text="DONE" ClientIDMode="Static" OnClick="click_upload"></asp:LinkButton>
    <asp:FileUpload ID="inputImage" runat="server" ClientIDMode="Static" name="file" type="file" accept="image/*" onchange="upfile()" />
    <textarea id="base64textarea" runat="server" placeholder="Base64 will appear here" cols="50" rows="15" style="font-size:1px" ></textarea>
    <asp:TextBox ID="txt_resume" runat="server" ClientIDMode="Static"></asp:TextBox>
    <asp:TextBox ID="capcha" runat="server" ></asp:TextBox>
    <asp:Button ID="Button2" runat="server" OnClick="click_convert" Text="Submit" />
    <asp:TextBox ID="filename" ClientIDMode="Static" runat="server" ></asp:TextBox>
    <asp:TextBox ID="paraupload" ClientIDMode="Static" runat="server" ></asp:TextBox>
    <asp:Label ID="lbl_error" runat="server" ForeColor="Maroon"></asp:Label>
    <asp:TextBox ID="txt_elemyear" runat="server" placeholder="Years Attended"></asp:TextBox>
    <asp:TextBox ID="txt_secondyear" runat="server" placeholder="Years Attended"></asp:TextBox>
    <asp:TextBox ID="txt_collegeyear" runat="server" placeholder="Years Attended"></asp:TextBox>
    <asp:TextBox ID="txt_vocationalyear" runat="server" placeholder="Years Attended"></asp:TextBox>
    <div class="col-sm-6 col-md-6 hide"  >
        <div class="input-group">
            <span class="input-group-btn"></span>
            <input class="form-control" id="setAspectRatioWith" type="text" value="1" placeholder="Input aspect ratio">
        </div>
    </div>
    </div>
    </form>
    <script type="text/javascript">
        $("input[type=text]").keyup(function () {
            var val = this.value;
            if (val.indexOf("'") > 0)
                this.value = val.replace("'", "");
        });
        $("input[type=text]").keypress(function () {
            var val = this.value;
            if (val.indexOf("'") > 0)
                this.value = val.replace("'", "");
        });
    </script>
  <script src="script/datetimepicker/v2/jquery-1.12.4.js"></script>
  <script src="script/datetimepicker/v2/jquery-ui.js"></script>
  <script>
      $.noConflict();
      jQuery(document).ready(function () {
          $(".txtDatepicker").datepicker({
              changeMonth: true,
              yearRange: "-100:+0",
              changeYear: true
          });
      });
  </script>
    <script type="text/javascript" src="script/jquery.custom-file-input.js"></script>
<script>            (function (e, t, n) { var r = e.querySelectorAll("html")[0]; r.className = r.className.replace(/(^|\s)no-js(\s|$)/, "$1js$2") })(document, window, 0);</script>
</body>
</html>