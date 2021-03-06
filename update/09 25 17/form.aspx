<%@ Page Language="C#" AutoEventWireup="true" CodeFile="form.aspx.cs" Inherits="form" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Bluewater</title>
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
            modal.style.display = "none";
            modalcon.style.display = "none";
        }

        function modaliza() {
            var modal = document.getElementById('myModal');
            var modalcon = document.getElementById('myModalContent');
            modal.style.display = "block";
            modalcon.style.display = "block";
            var ss = document.getElementsByClassName('cropper-container');
        }

        function crop() {
            var modal = document.getElementById('myModal');
            var modalcon = document.getElementById('myModalContent');
            var setAspectRatio = document.getElementById('setAspectRatio');

            setAspectRatio.style.display = "none";
            modal.style.display = "none";
            modalcon.style.display = "none";
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

    <link rel="stylesheet" href="style/css/jquery-ui-1.8.16.custom.css" type="text/css" >
    <script type="text/javascript" src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script type="text/javascript">
        
        function dss(elem) {
            $("#" + elem.id).datepicker();
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
    </style>
</head>

<body>
    <form id="form1" runat="server">
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
                            <div id="dataURLView" onclick="modaliza()" style="cursor:pointer"></div>
                        </div>
                    </div>
                    <img id="setAspectRatio" runat="server" src="style/img/icon-1.png" onclick="modaliza()" style="  cursor:pointer; margin-top:8px" alt="ID"  />
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
                    <li><small><asp:Label ID="l_mname" runat="server" Text="Middle Name *"></asp:Label></small></li>
                </ul>
                <ul>
                    <li><asp:TextBox ID="txt_lname" runat="server" style="margin:0"></asp:TextBox></li>
                    <li><small><asp:Label ID="l_lname" runat="server" Text="Last Name *"></asp:Label></small></li>
                </ul>
            </div>

            <div class="col-row address">
                    <ul>
                        <li><asp:DropDownList ID="ddl_country" CssClass="country" runat="server"></asp:DropDownList></li>
                        <li><small><asp:Label ID="l_coun" runat="server" Text="Present Address *"></asp:Label></small></li>
                    </ul>
                    <ul>
                        <li>
                            <asp:TextBox ID="ddl_region" onkeydown ="return (event.keyCode!=13)" Placeholder="Region" autocomplete="off" runat="server" CssClass="address-text" ></asp:TextBox>
                            <asp:DropDownList ID="drop_region" runat="server"  CssClass="region sub-tb-d" >
                            </asp:DropDownList>
                        </li>
                    </ul>
                    <ul>
                        <li>
                            <asp:TextBox ID="ddl_province" onkeydown ="return (event.keyCode!=13)" Placeholder="Province" autocomplete="off" runat="server" CssClass="address-text" ></asp:TextBox><%--OnTextChanged="getregpro" AutoPostBack="true"--%>
                            <asp:DropDownList ID="drop_province" CssClass="province sub-tb-da" runat="server">
                            </asp:DropDownList>
                        </li>
                    </ul>
                     <ul>
                        <li>
                            <asp:TextBox ID="ddl_city" onkeydown ="return (event.keyCode!=13)" Placeholder="City" autocomplete="off" runat="server" CssClass="address-text"></asp:TextBox>
                            <asp:DropDownList ID="drop_city" CssClass="sub-tb-da" runat="server">
                            </asp:DropDownList>
                        </li>
                    </ul>
                     <ul>
                        <li><asp:TextBox ID="txt_baranggay" Placeholder="Barangay/Street" runat="server" CssClass="barang"></asp:TextBox></li>
                    </ul>
                    <script type="text/javascript">
                        $(".province").change(function() {
                            $.ajax({
                                type: "POST",
                                contentType: "application/json; charset=utf-8",
                                url: "form.aspx/city",
                                data: "{'val':'" + this.value + "'}",
                                dataType: "json",
                                async: false,
                                success: function(response) {
                                    $('#drop_city').empty();
                                    $('#drop_city').append("<option>City</option>");
                                    $.each(response.d, function() {
                                        $('#drop_city').append('<option>' + this + '</option>');
                                    });

                                },
                                error: function() {
                                    alert('Error occured');
                                }
                            });
                        });

                        $(".country").change(function() {
                            if (this.value == "Philippines" || this.value == "Country") {
                                $("#ddl_region").css("display", "none");
                                $("#drop_region").css("display", "block");
                                $("#ddl_province").css("display", "none");
                                $("#drop_province").css("display", "block");
                                $("#ddl_city").css("display", "none");
                                $("#drop_city").css("display", "block");
                            }
                            else {
                                $("#ddl_region").css("display", "block");
                                $("#drop_region").css("display", "none");
                                $("#ddl_province").css("display", "block");
                                $("#drop_province").css("display", "none");
                                $("#ddl_city").css("display", "block");
                                $("#drop_city").css("display", "none");
                            }
                        });

                        $(".region").change(function() {
                            $.ajax({
                                type: "POST",
                                contentType: "application/json; charset=utf-8",
                                url: "form.aspx/prov",
                                data: "{'val':'" + this.value + "'}",
                                dataType: "json",
                                async: false,
                                success: function(response) {
                                    $('#drop_province').empty();
                                    $('#drop_province').append("<option>Province</option>");
                                    $.each(response.d, function() {
                                        $('#drop_province').append('<option>' + this + '</option>');
                                    });

                                },
                                error: function() {
                                    alert('Error occured');
                                }
                            });
                        });
                </script>
            </div>

             <div class="col-row contact">
                <ul>
                    <li><asp:TextBox ID="txt_cel" MaxLength="13" ClientIDMode="Static" onblur="number()" onkeyup="number()" runat="server"></asp:TextBox></li>
                    <li style=" margin-top:-5px"><small><asp:Label ID="l_mn" runat="server" Text="Mobile Number *"></asp:Label></small></li>
                </ul>
                <ul>
                    <li><asp:TextBox ID="txt_tel" runat="server"></asp:TextBox></li>
                    <li style=" margin-top:-5px"><small><asp:Label ID="l_tn" runat="server" Text="Telephone Number *"></asp:Label></small></li>
                </ul>
                <ul>
                    <li><asp:TextBox ID="txt_email" ClientIDMode="Static" runat="server"></asp:TextBox></li>
                    <li style=" margin-top:-5px"><small><asp:Label ID="l_ea" runat="server" Text="E-mail Address *"></asp:Label></small></li>
                </ul>
                <ul>
                    <li><asp:TextBox ID="txt_from" runat="server" CssClass="txtDatepicker" autocomplete="off" onpaste="return false" onmouseover="dss(this)"></asp:TextBox></li>
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
                
             </div>
        </div>
    </div>

    <div class="row">
        <div class="col-a educ">
            <ul>
                <li><h4>EDUCATION</h4></li>
                <li>
                    <span id="educ_span" runat="server" class="select-wrapper">
                    <small id="fdoc"></small>
                        <asp:FileUpload ID="FileUpload1" runat="server" ClientIDMode="Static" CssClass="image_src" accept=".doc, .docx, .pdf, .rtf" />
                        
                    </span>
                </li>
                <li><small><asp:Label ID="l_educ" runat="server" Text="Upload resume"></asp:Label></small></li>
            </ul>
            <script type="text/javascript">

                var handleFileSelect = function(evt) {
                    var files = evt.target.files;
                    var file = files[0];

                    if (file.size / 1048576 < 5) {
                        if (files && file) {
                            var reader = new FileReader();

                            reader.onload = function(readerEvt) {
                                var binaryString = readerEvt.target.result;
                                document.getElementById("base64textarea").value = btoa(binaryString);
                            };

                            reader.readAsBinaryString(file);
                        }

                        var y = document.getElementById('FileUpload1').value.split(".");
                        document.getElementById('txt_resume').value = y[(y.length) - 1];
                        document.getElementById('filename').value = document.getElementById('FileUpload1').value.replace(/C:\\fakepath\\/i, '');
                        document.getElementById('fdoc').innerHTML = document.getElementById('FileUpload1').value.replace(/C:\\fakepath\\/i, '').substring(0, 4) + '--.' + y[(y.length) - 1];


                        var x = document.getElementsByClassName("select-wrapper");
                        if (y[(y.length) - 1] == "pdf")
                            x[0].style = "background:url(style/img/icon/i-pdf.png) center no-repeat; border:1px solid #3c94b4; border-radius:3px";
                        else
                            x[0].style = "background:url(style/img/icon/i-word.png) center no-repeat; border:1px solid #3c94b4; border-radius:3px";
                    }
                    else
                        alert("File to large");
                    
                };

                if (window.File && window.FileReader && window.FileList && window.Blob) {
                    document.getElementById('FileUpload1').addEventListener('change', handleFileSelect, false);
                    
                     
                } else {
                    alert('The File APIs are not fully supported in this browser.');
                }

        </script>
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
                                <asp:TextBox ID="txt_from" runat="server" CssClass="txtDatepicker" autocomplete="off" onpaste="return false" onmouseover="dss(this)" placeholder="date from" Width="92px"></asp:TextBox>
                                <asp:Label ID="lbl_employmenthistory_to" runat="server"  CssClass="na naa"></asp:Label>
                                <asp:TextBox ID="txt_to" runat="server" CssClass="txtDatepicker" autocomplete="off"  onpaste="return false" onmouseover="dss(this)"  placeholder="date to"  Width="92px"></asp:TextBox>
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
  
    <div id="div_load_modal" class="modal"></div> 
    <div  id="div_load_gif" class="modal-content"  style=" top:20%; margin-left:-170px; min-width:200px">
        <img src="style/img/loading.gif"  alt="loading" />
    </div>

    <div style=" display:none">
    <asp:FileUpload ID="inputImage" runat="server" ClientIDMode="Static" name="file" type="file" accept="image/*" onchange="upfile()" />
    <textarea id="base64textarea" runat="server" placeholder="Base64 will appear here" cols="50" rows="15" ></textarea>
    <asp:TextBox ID="txt_resume" runat="server" ClientIDMode="Static"></asp:TextBox>
    <asp:TextBox ID="capcha" runat="server" ></asp:TextBox>
    <asp:Button ID="Button2" runat="server" OnClick="click_convert" Text="Submit" />
    <asp:TextBox ID="filename" ClientIDMode="Static" runat="server" ></asp:TextBox>
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
        $("input[type=text]").keyup(function() {
            var val = this.value;
            if (val.indexOf("'") > 0)
                this.value = val.replace("'", "");
        });
        $("input[type=text]").keypress(function() {
            var val = this.value;
            if (val.indexOf("'") > 0)
                this.value = val.replace("'", "");
        });
    </script>
</body>
</html>