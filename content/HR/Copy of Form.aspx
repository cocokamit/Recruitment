<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Copy of Form.aspx.cs" Inherits="content_HR_Form" %>
<%@ Import Namespace="System.Data" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="../../style/css/survey.css" rel="Stylesheet" type="text/css" />
    <style type="text/css">
        #rt {width: 1000px; margin:0px auto}
        .tbl { line-height:50px}
        .tbl td { padding: 0 0 0 2px}
        * { margin:0; padding:0; font-family:Calibri}
        /* body {background-image: url(style/img/bg.png);background-repeat:repeat-x;} */
        .content-a {margin-top:60px}
        .content-b { margin-bottom:100px}
        .header { height:50px;}
        .suwat { text-align:center; width:100%;}
        .suwat h3 {color:#104575; font-size:25px; line-height:50px; font-family:Calibri}
        .suwat p {  font-size:17px; color:#000101}
        .search { z-index:99; margin:250px 0 0 0;  float:left;text-align:center; opacity: 0.7;  height:45px; width:100%}
        .ds { text-align:center;background-image: url(style/img/bg-2.png); position:absolute;  margin:0px 0 10px 0; height:45px; width:100%}
        .ds input[type=text] { padding:5px 5px 5px 25px; border:none; color:White;  width:150px; background:transparent; font-size:18px; margin:8px 0}
        .ds input[type=text]::-webkit-input-placeholder { /* WebKit, Blink, Edge */color:  #fff;}
        .ds input[type=text]:-moz-placeholder { /* Mozilla Firefox 4 to 18 */color:    #fff;opacity:  1;}
        .ds input[type=text]::-moz-placeholder { /* Mozilla Firefox 19+ */color:    #fff;opacity:  1;}
        .ds input[type=text]:-ms-input-placeholder { /* Internet Explorer 10-11 */color:    #fff;}
        .ds img { position:absolute; margin:15px 0; }
        .lnk img { width:211px;margin:5px}
        .lnk {text-align:center}
        .consub-b { width:665px !important}
        .ul { margin:10px 0 0 0}
        .ul hr { margin:5px 0}
        .ul a{float:left;padding: 8px;border-radius: 4px;border: none;cursor: pointer;background: #2ea2cc;border-color: #0074a2;-webkit-box-shadow: inset 0 1px 0 rgba(120,200,230,.5),0 1px 0 rgba(0,0,0,.15);box-shadow: inset 0 1px 0 rgba(120,200,230,.5),0 1px 0 rgba(0,0,0,.15);color: #fff;text-decoration: none;}
        .li_cn { padding-left:10px}
        .li_hd { font-weight:bold}
        .ul ol ,.ul ul { margin-left:30px }
        .ul ol br,.ul ul br { display: none}
        .ul ul li { list-style-type: circle}
        .pm { margin-top:5px}
        .policy { text-align:center; width:560px; bottom:0; padding:10px; margin:10px auto}
    </style>
    <link href="../../style/css/bootstrap.min.css" rel="stylesheet" />
    <script src="script/slider/jquery.min.js"></script>
    <script src="script/slider/bootstrap.min.js"></script>
    <link href="../../style/css/jquerysctipttop.css" rel="stylesheet" type="text/css">
    <link href="../../vendors/select2/dist/css/select2.css" rel="stylesheet" type="text/css" />
</head>
<body>
<form id="form1" runat="server">
<asp:ScriptManager ID="sm_rec" runat="server"></asp:ScriptManager>
<div id="policy" runat="server" class="PopUpPanel policy">
    Accessing our website means you agree to our privacy policy. Click <a href="https://jobsbluewater.wordpress.com/privacy-policy/">here</a> to read it.
    <asp:LinkButton ID="lb_policy" runat="server" OnClick="click_refresh" CssClass="pull-right" style=" margin:-10px -5px; text-decoration:none; font-weight:bold; font-size:15px">&times;</asp:LinkButton>
</div>

<!--Start Application Form-->
<div id="overlay" runat="server" visible="false" class="Overlay"></div>
<div id="modal" runat="server" visible="false" class="PopUpPanel application">
    <asp:LinkButton ID="lb_close" runat="server" OnClick="close_modal" style=" float:right; margin-top:-45px; font-size:30px; font-weight:bold; text-decoration:none" ForeColor="White">&times;</asp:LinkButton>
    <div class="row">
        <div class="form-header">
             <span>APPLICATION FORM</span> 
        </div>
    </div>
    <div class="clearfix"></div>
    <div class="row">
        <div class="col-a text-center">
            <h4>PERSONAL DETAILS</h4>
            <img id="setAspectRatio" runat="server" src="~/style/img/icon-1.png" onclick="modaliza(1)" style="  cursor:pointer; margin:8px 0" alt="ID"  />
            <div id="dataURLView" onclick="modaliza(1)" class="docs-data-url"></div>
            <ul>
                <li><small><asp:Label ID="l_addpic" runat="server" Text="Add picture *"></asp:Label></small></li>
                <li class="hidden"><asp:TextBox ID="dataURLInto" runat="server" CssClass="form-control" TextMode="MultiLine"></asp:TextBox></li>
            </ul>
        </div>
        <div class="col-b">
            <div class="personal">
                <div class="app-group">
                    <asp:TextBox ID="txt_fname" runat="server"></asp:TextBox>
                    <asp:Label ID="l_fname" runat="server" Text="First Name *"></asp:Label>
                </div>
                <div class="app-group">
                    <asp:TextBox ID="txt_mname"  runat="server"></asp:TextBox>
                    <asp:Label ID="l_mname" runat="server" Text="Middle Name"></asp:Label>
                </div>
                <div class="app-group no-margin">
                    <asp:TextBox ID="txt_lname" runat="server" style="margin:0"></asp:TextBox>
                    <asp:Label ID="l_lname" runat="server" Text="Last Name *"></asp:Label>
                </div>
            </div>
            <div class="clearfix"></div>
            <div class="col-row address">
                <div class="app-group">
                    <asp:DropDownList ID="ddl_country" ClientIDMode="Static" CssClass="country" runat="server"></asp:DropDownList>
                    <asp:Label ID="l_coun" runat="server" Text="Present Address *"></asp:Label>
                </div>
                <div class="app-group">
                    <select name="country" id="countryy"><option>Region</option></select>
                    <asp:TextBox ID="ddl_region" Placeholder="Region" runat="server" ClientIDMode="Static" CssClass="address-text"></asp:TextBox>
                </div>
                <div class="app-group">
                    <select name="state" id="statey"><option>Province</option></select> 
                    <asp:TextBox ID="ddl_province" Placeholder="Province" autocomplete="off" ClientIDMode="Static" runat="server" CssClass="address-text"></asp:TextBox>
                </div>
                <div class="app-group">
                    <select name="city" id="cityy"><option>City</option></select>
                    <asp:TextBox ID="ddl_city" onkeydown ="return (event.keyCode!=13)" Placeholder="City" ClientIDMode="Static" autocomplete="off" runat="server" CssClass="address-text"></asp:TextBox>
                </div>
                <div class="app-group no-margin">
                    <asp:TextBox ID="txt_baranggay" Placeholder="Barangay/Street" runat="server" CssClass="barang"></asp:TextBox>
                </div>
            </div>
            <div class="clearfix"></div>
            <div class="col-row contact">
                <div class="app-group">
                    <asp:TextBox ID="txt_cel" MaxLength="13" ClientIDMode="Static" onblur="number()" onkeyup="number()" runat="server"></asp:TextBox>
                    <asp:Label ID="l_mn" runat="server" Text="Mobile Number *"></asp:Label>
                </div>
                <div class="app-group">
                    <asp:TextBox ID="txt_tel" runat="server"></asp:TextBox>
                    <asp:Label ID="l_tn" runat="server" Text="Telephone Number"></asp:Label>
                 </div>
                <div class="app-group">
                    <asp:TextBox ID="txt_email" ClientIDMode="Static" runat="server"></asp:TextBox>
                    <asp:Label ID="l_ea" runat="server" Text="E-mail Address *"></asp:Label>
                </div>
               <div class="app-group">
                    <asp:TextBox ID="txt_from" runat="server"  CssClass="txtDatepicker"  autocomplete="off" onpaste="return false" onkeydown="return false" onmouseover="dss(this)" ></asp:TextBox> 
                    <asp:Label ID="l_db" runat="server" Text="Date of Birth *"></asp:Label> 
                </div>
               <div class="app-group" style=" width:0">
                    <asp:DropDownList ID="ddl_gender" runat="server" Width="80px">
                        <asp:ListItem>Male</asp:ListItem>
                        <asp:ListItem>Female</asp:ListItem>
                    </asp:DropDownList>
                    <asp:Label ID="l_gender" runat="server" Text="Gender"></asp:Label> 
                </div>
             </div>
        </div>
    </div>
    <div class="clearfix" style="margin:5px 0"></div>
    <div class="row education">
        <div class="col-a educ text-center" onclick="modaliza(0)" style="cursor:pointer"> 
            <h4>EDUCATION</h4>
            <span id="educ_span" runat="server" class="select-wrapper" style=" word-wrap:break-word;">
                <small id="fdoc" runat="server"></small>
            </span>
             <asp:Label ID="l_educ" runat="server" Text="Upload resume *" style="font-size:13px; position:absolute; margin:3px 0 0 -42px"></asp:Label> 
        </div>

        <div class="col-b educ-a">
            <div class="col-row educ-b">
                <div class="clearfix" style="margin:10px 0"></div>
                <div class="app-group">
                    <asp:DropDownList ID="ddl_attainment" ClientIDMode="Static" runat="server" CssClass="form-control" style="border-radius:0">
                        <asp:ListItem Value="0" disabled selected>Educational level</asp:ListItem>
                        <asp:ListItem Value="1">Elementary Graduate</asp:ListItem>
                        <asp:ListItem Value="2">High School Level</asp:ListItem>
                        <asp:ListItem Value="3">High School Graduate</asp:ListItem>
                        <asp:ListItem Value="4">Vocational Course</asp:ListItem>
                        <asp:ListItem Value="5">College Level</asp:ListItem>
                        <asp:ListItem Value="6">College Graduate</asp:ListItem>
                        <asp:ListItem Value="7">Masters Degree</asp:ListItem>
                        <asp:ListItem Value="8">Doctorate</asp:ListItem>
                    </asp:DropDownList>
                    <asp:Label ID="l_hea" runat="server" Text="Highest Educational Attainment *" Font-Size="13px" style=" line-height:20px"></asp:Label>
                </div>
                <div class="clearfix" style="margin:7px 0"></div>
                <div id="courses">
                    <asp:DropDownList ID="ddl_courses" CssClass="form-control select2" runat="server" style="margin-top:20px">
                        <asp:ListItem Value="" disabled selected hidden>Courses</asp:ListItem>
                    </asp:DropDownList>
                    <asp:Label ID="Label3" runat="server" Text="Course/Degree *" Font-Size="13px" style=" line-height:20px"></asp:Label>
                </div>
                <div class="hidden">
                <div class="col-a">
                     <div>Elementary</div>
                </div>
                <div class="col-b" style=" width:82.5%" >
                    <div class="app-group">
                        <asp:TextBox ID="txt_elemschool" runat="server" placeholder="School"></asp:TextBox>
                    </div>
                    <div class="app-group">
                        <asp:TextBox ID="txt_elemaddress" runat="server" placeholder="Address"></asp:TextBox>
                    </div>
                    <div class="app-group no-margin" style=" float:right; width:147px">
                        <asp:DropDownList ID="ddl_elemmonth" runat="server" Width="66px">
                            <asp:ListItem Value="">YYYY</asp:ListItem>
                        </asp:DropDownList> -
                        <asp:DropDownList ID="ddl_elemyear" runat="server"  Width="66px">
                            <asp:ListItem Value="">YYYY</asp:ListItem>
                        </asp:DropDownList>
                     </div>
                </div>
                </div>
            </div>
             <div class="hidden">
            <div class="clearfix"></div>
            <div class="col-row educ-b">
                <div class="col-a">
                    <div>High School</div>
                </div>
                <div class="col-b" style=" width:82.5%">
                    <div class="app-group">
                        <asp:TextBox ID="txt_secondschool" runat="server"  placeholder="School"></asp:TextBox>
                    </div>
                    <div class="app-group">
                        <asp:TextBox ID="txt_secondaddress" runat="server" placeholder="Address"></asp:TextBox>
                    </div>
                    <div class="app-group no-margin" style=" float:right; width:147px">
                        <asp:DropDownList ID="ddl_secondmonth" runat="server" Width="66px">
                            <asp:ListItem Value="">YYYY</asp:ListItem>
                        </asp:DropDownList> - 
                        <asp:DropDownList ID="ddl_secondyear" runat="server"  Width="66px">
                            <asp:ListItem Value="">YYYY</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>
            </div>
            <div class="clearfix"></div>
            <div class="col-row educ-b">
                <div class="col-a">
                    <div>College</div>
                </div>
                <div class="col-b" style=" width:82.5%">
                    <div class="app-group">
                        <asp:TextBox ID="txt_collegeschool" runat="server"  placeholder="School"></asp:TextBox>
                    </div>
                    <div class="app-group">
                        <asp:TextBox ID="txt_collegeaddress" runat="server" placeholder="Address"></asp:TextBox>
                    </div>
                    <div class="app-group no-margin" style=" float:right; width:147px">
                        <asp:DropDownList ID="ddl_collegemonth" runat="server" Width="65px" >
                            <asp:ListItem Value="">YYYY</asp:ListItem>
                        </asp:DropDownList> - 
                        <asp:DropDownList ID="ddl_collegeyear" runat="server"  Width="65px">
                            <asp:ListItem Value="">YYYY</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>
            </div>
            <div class="clearfix"></div>
            <div class="col-row educ-b">
                <div class="col-a">
                    <div>Vocational</div>
                </div>
                <div class="col-b" style=" width:82.5%">
                    <div class="app-group">
                        <asp:TextBox ID="txt_vocationalschool" runat="server"  placeholder="School"></asp:TextBox>
                    </div>
                     <div class="app-group">
                        <asp:TextBox ID="txt_vocationaladdress" runat="server" placeholder="Address"></asp:TextBox>
                    </div>
                     <div class="app-group no-margin" style=" float:right; width:147px">
                        <asp:DropDownList ID="ddl_vocationalmonth" runat="server" Width="65px">
                           <asp:ListItem Value="">YYYY</asp:ListItem>
                        </asp:DropDownList> - 
                        <asp:DropDownList ID="ddl_vocationalyear" runat="server"  Width="65px">
                            <asp:ListItem Value="">YYYY</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>
            </div>
             </div>
        </div>
    </div>
    <div class="clearfix"></div>
    <div class="row employee">
        <div class="col-a text-center">
            <h4>EMPLOYMENT</h4>
        </div>
        <div class="col-b emp-b">
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <asp:GridView ID="grid_employmenthistory" AutoGenerateColumns="false" ShowHeader="false" OnRowDeleting="Deleting_employmenthistory" CssClass="table"  ShowFooter="True" runat="server">
                    <Columns>
                        <asp:TemplateField ItemStyle-Width="20px" > 
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Font-Size="11px" Text='<%# Bind("RowNumber") %>' CssClass="sb-cnt"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Position" ItemStyle-CssClass="tb-pos-a">
                            <ItemTemplate>
                                <asp:Label ID="lbl_employmenthistory_position" runat="server" CssClass="err"></asp:Label>
                                <asp:textbox ID="txt_employmenthistory_position"  runat="server" autocomplete="off" placeholder="Position"  CssClass="tb-pos-txt-a" ></asp:textbox>
                            </ItemTemplate>
                            <FooterTemplate>
                                <asp:ImageButton ID="ImageButton2"  runat="server" OnClick="clickaddbutton_governmentlicenses" ImageUrl="~/style/img/add-1.png" CssClass="tb-add"/><%--OnClick="ButtonAdd_Click"--%>
                            </FooterTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField  HeaderText="Company Name" ItemStyle-CssClass="tb-pos-c">
                            <ItemTemplate>
                                <asp:Label ID="lbl_employmenthistory_c_name_address" runat="server"  CssClass="err"></asp:Label>
                                <asp:TextBox ID="txt_employmenthistory_c_name_address" autocomplete="off" runat="server" CssClass="tb-pos-txt" placeholder="Company"></asp:TextBox>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField ItemStyle-CssClass="tb-pos-b"> 
                            <ItemTemplate>
                                <asp:Label ID="lbl_employmenthistory_from" runat="server"  CssClass="err" style=" margin-top:22px"></asp:Label>
                                <asp:TextBox ID="txt_from" runat="server" CssClass="txtDatepicker" autocomplete="off" onpaste="return false" onkeydown="return false"  onmouseover="dss(this)" placeholder="date from" Width="92px"></asp:TextBox>
                                <asp:Label ID="lbl_employmenthistory_to" runat="server"  CssClass="err" style=" margin-top:22px"></asp:Label>
                                <asp:TextBox ID="txt_to" runat="server" CssClass="txtDatepicker" autocomplete="off"  onpaste="return false" onkeydown="return false" onmouseover="dss(this)"  placeholder="date to"  Width="92px"></asp:TextBox>
                            </ItemTemplate>
                            <ItemStyle Width="215px"/>
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
    <div class="row skills">
        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
            <ContentTemplate>
                <div class="col-a text-center">
                    <h4>SPECIAL SKILLS</h4>
                </div>
                <div class="col-b">
                    <asp:GridView ID="grid_item" runat="server" ShowHeader="false" CssClass="sub-tb" ShowFooter="true" onrowdeleting="grid_item_RowDeleting" AutoGenerateColumns="False" >
                        <Columns>
                            <asp:TemplateField ItemStyle-Width="20px" Visible="true"> 
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("RowNumber") %>'  CssClass="sb-cnt"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Skills">
                                <ItemTemplate>
                                    <asp:Label ID="lbl_descripton" runat="server" CssClass="err"></asp:Label>
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
                 </div>
                </ContentTemplate>
            </asp:UpdatePanel>
    </div>
    <div class="capcha">
        <asp:UpdatePanel ID="up_pan" runat="server">
            <ContentTemplate>
            <div>
                <asp:Image ID="imgCaptcha" runat="server"/>  
                <asp:LinkButton ID="btnRefresh" runat="server" OnClick="btnRefresh_Click"><img src="style/img/icon-5.png" /></asp:LinkButton> 
                <asp:TextBox ID="txtCaptcha" runat="server" placeholder="Captcha"></asp:TextBox>
            </div>
            </ContentTemplate>
        </asp:UpdatePanel>
        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modal-default">Submit</button>
                                      </div>
    <div class="clearfix"></div>
</div>

<div class="modal fade in" id="modal-default" style =" background:none" >
    <div class="modal-dialog"  style=" z-index:2000">
    <div class="modal-content privacy" style="display:block;" >
        <div class="modal-header">  
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span></button>
        <h1 class="modal-title">Privacy Policy</h1>
        </div>
        <div class="modal-body">
       <main id="main" class="site-main" role="main">
		
<article>
	<header class="entry-header">
			</header><!-- .entry-header -->

	
	<div class="entry-content">
		<p><strong>GENERAL</strong></p>
<p>This Privacy Policy (“Privacy Policy”) is provided by Alenter Resort Hotels Corp., (“Alenter”) with respect to the operation and management of the Jobs at Bluewater Resorts website and social media pages, and the provision of services thereunder (collectively referred to as “we”, “our”, and “us”).</p>
<p>This Privacy Policy describes how and when we collect your personal information, what that information may be used for, who uses it, when it may be disclosed to other parties, the control of your own personal information, and how you can contact us.</p>
<p>By visiting/using our website at <a href="http://www.jobs.bluewater.com.ph/">www.jobs.bluewater.com.ph</a> or accessing our social media pages on Facebook, Instagram, Twitter, LinkedIn, and WordPress (the “Website” or the “Social Media Pages”), you are deemed to have read and agreed to be bound by this Privacy Policy.</p>
<p><strong>&nbsp;</strong><strong>NOTICE</strong></p>
<p>This Privacy Policy serves as a notice pursuant to Philippines’ Republic Act No. 10173 otherwise known as the Data Privacy Act.</p>
<p>We may modify, vary, or update this Privacy Policy from time to time to reflect any changes to our privacy practices. This Privacy Policy is always available on our Website and may be accessed any time to check for updates.</p>
<p><strong>INFORMATION COLLECTION AND USE</strong></p>
<p>We may collect and hold personal information/data (“Personal Information”) about you including but not limited to, full name, postal and e-mail address, other contact details, identification details, employment history, educational background, exam results, and other information relevant to us through our Website and Social Media Pages.</p>
<p>You consent to the collection and use of your Personal Information by Alenter in the ways described herein (which may change from time to time) unless and until you inform us to the contrary. You also represent and warrant that you have obtained the consent of third parties in cases where you provide us with their Personal Information or are otherwise entitled to provide us with their Personal Information. You agree to indemnify us in the event we suffer any loss or damage as a result of your failure to comply with the same.</p>
<p>You acknowledge and agree that in order for your application to be processed, the sharing, transfer, retrieval, updating, and processing of your Personal Information may occur between Alenter Resort Hotels Corp, Maribago Bluewater Beach Resort, Panglao Bluewater Beach Resort, Sumilon Bluewater Island Resort, Almont Holdings Inc., Almont Hotels and Resorts, Almont Inland Resort, Almont City Hotel, Almont Beach Resort, Allegiant Regional Care &nbsp;(ARC) Hospitals, Bluewater Hospitality Management, One Central Hotel, Amuma Spa, Blue Bubble, and other group companies, related corporations, and affiliates. You also acknowledge and agree that you have read, understood, and consented to the processing of your Personal Information for the purposes of the same.</p>
<p>You are responsible for ensuring that the Personal Information you provide us is accurate, complete, and not misleading, and that such Personal Information is up to date.</p>
<p>We may collect Personal Information in one or more of the following circumstances or for one or more of the following purposes:</p>
<ul>
<li>to process your job application;</li>
<li>to send you information on programs, events, and updated vacancies which you have subscribed for;</li>
<li>to update and manage the accuracy of our records;</li>
<li>to conduct data analysis, assessments, and research;</li>
<li>to administer your participation in contests or campaigns that we may run from time to time;</li>
<li>complying with legal and regulatory obligations;</li>
<li>maintaining your Personal Information record for present and/or future reference;</li>
<li>protecting Alenter’s interests and other ancillary or related purposes;</li>
<li>for other purposes as set out in any other terms and conditions (including campaign terms and conditions); and</li>
<li>for any purpose made known to you at the time of collection of your Personal Information.</li>
</ul>
<p>At any time, you may opt out of receiving updates from us by unsubscribing from our Social Media Pages.</p>
<p>We use general, aggregated information to generate statistics and measure site activity to improve the usefulness of customer visits.</p>
<p><strong>SECURITY OF YOUR PERSONAL INFORMATION</strong></p>
<p>We will take reasonable steps to protect any Personal Information we receive from you via our Website and Social Media Pages from misuse and loss and from unauthorized access, modification, or disclosure. We may hold your information in either electronic or hard copy form or retain third parties to hold that information on our behalf. Where required by applicable laws, your Personal Information will be destroyed when no longer needed.</p>
<p>By providing us with Personal Information or using our services or our Website or Social Media Pages, you consent to the transfer, storage, and processing of Personal Information to where our servers, central database, and system facilities are located and/or operated, which may be outside the location where you have accessed our Website or Social Media Pages to provide Personal Information.</p>
<p>However, as our Website and Social Media Pages are linked to the internet, and the internet is inherently unsecure, we cannot provide any assurance regarding the security of transmission of the Personal Information you send to us, and you do so at your own risk.</p>
<p><strong>LINKS TO OTHER WEBSITES</strong></p>
<p>Our Website and Social Media Pages may contain links to websites or applications operated by third parties. We are not responsible for the privacy practices or the content of these third parties. The Privacy Policy of Alenter applies solely to Personal Information collected by us, and does not apply to third party websites or applications.</p>
<p><strong>ACCESS AND CORRECTION</strong></p>
<p>You may request access to any Personal Information we hold about you or any third party whose Personal Information you provided at any time by contacting us. If you believe that the Personal Information we hold about you is incorrect, incomplete, or inaccurate, then you may request to amend it.</p>
<p><strong>COOKIES</strong></p>
<p>We may use cookies in our Website and Social Media Pages to maintain your session and required details during your application and to collect Website usage data for statistical/analytics purposes.</p>
<p>You may change the settings of your browser to stop accepting cookies or to prompt you before accepting a cookie from the Website or Social Media Pages that you visit. They may not function properly if the cookie setting is disabled.</p>
<p><strong>MINORS (UNDER THE AGE OF 18 YEARS OLD)</strong></p>
<p>We cannot distinguish the age of visitors to our Website or Social Media Pages. If you are a parent or guardian of someone under eighteen (18) years old who has provided us his/her Personal Information without your knowledge and consent, you may request that we remove such information by contacting us.</p>
<p><strong>CONTACTING US</strong></p>
<p>If you have any questions about our Privacy Policy, or any concerns or a complaint regarding the treatment of your privacy by us pursuant to the Philippines’ Republic Act No. 10173, please contact us via postal mail or e-mail (which must be sent from the e-mail address you used to provide Personal Information to us) at:</p>
<p>HUMAN RESOURCES DEPARTMENT<br>
Maribago Bluewater Beach Resort<br>
Buyong, Maribago,<br>
6015 Lapu-Lapu City,<br>
Philippines</p>
<p>E-mail: <a href="mailto:recruitment@bluewater.com.ph">recruitment@bluewater.com.ph</a></p>
 
</article> 
	</main>
        </div>
        <div class="modal-footer">
            <div class="checkbox pull-left">
                <label>
                    <input id="check-policy" type="checkbox"/> I have read and understand
                </label>
            </div>
            <asp:Button ID="Button1" runat="server" CssClass="btn btn-primary disabled" OnClientClick="window.scrollTo(0,0);document.getElementById('div_load_modal').style.display='block';document.body.style.overflow = 'hidden';document.getElementById('div_load_gif').style.display='block'" OnClick="click_save" Text="Accept" /><%--OnClientClick="window.scrollTo(0,0);document.getElementById('overlay').style.display='block';document.body.style.overflow = 'hidden';document.getElementById('fade').style.display='block'"--%>
        </div>
    </div>
    </div>
</div>

<div id="myModal" class="modal" onclick="clos()"></div>
<div  id="myModalContent"  class="modal-content profile">
    <div id="img_container" class="img-container profile-a"><img src="crop image/img/avatar.png"  style="width: 344px; height: 344px; margin-left: 0px; margin-top: 0px;"></div>
    <asp:FileUpload ID="inputImage" runat="server" ClientIDMode="Static" name="file" type="file" class="inputfile inputfile-1 hidden" accept="image/*" onchange="upfile()" />
    <label  for="inputImage" title="Upload image file">
       <svg style="color:#fff" xmlns="http://www.w3.org/2000/svg" width="20" height="17" viewBox="0 0 20 17"><path d="M10 0l-5.2 4.9h3.3v5.1h3.8v-5.1h3.3l-5.2-4.9zm9.3 11.5l-3.2-2.1h-2l3.4 2.6h-3.5c-.1 0-.2.1-.2.1l-.8 2.3h-6l-.8-2.2c-.1-.1-.1-.2-.2-.2h-3.6l3.4-2.6h-2l-3.2 2.1c-.4.3-.7 1-.6 1.5l.6 3.1c.1.5.7.9 1.2.9h16.3c.6 0 1.1-.4 1.3-.9l.6-3.1c.1-.5-.2-1.2-.7-1.5z"/></svg> 
    <span style="color:white;">Browse file&hellip;</span>
    </label>
    <a href="javascript:void(0)" onclick="crop()" id="getDataURL2" title="$().cropper(&quot;getDataURL&quot;, &quot;image/jpeg&quot;)" class="btn btn-primary pull-right profile-a">Crop</a>

    <div class="docs-toolbar hidden">
        <div class="btn-group">
            <ul>
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

<div id="modalresume" runat="server" class="modal-content resume">
    <a id="done" href="javascript:void(0)" class="pull-right" style=" display:none; line-height:40px" onclick="click_done()">DONE</a>
    <asp:FileUpload ID="FileUpload1" runat="server" ClientIDMode="Static" class="inputfile inputfile-1" style=" display:none    " accept=".doc, .docx, .pdf, .rtf"  onchange="upresume()"  />
	<label for="FileUpload1"><svg style="color:#fff" xmlns="http://www.w3.org/2000/svg" width="20" height="17" viewBox="0 0 20 17"><path d="M10 0l-5.2 4.9h3.3v5.1h3.8v-5.1h3.3l-5.2-4.9zm9.3 11.5l-3.2-2.1h-2l3.4 2.6h-3.5c-.1 0-.2.1-.2.1l-.8 2.3h-6l-.8-2.2c-.1-.1-.1-.2-.2-.2h-3.6l3.4-2.6h-2l-3.2 2.1c-.4.3-.7 1-.6 1.5l.6 3.1c.1.5.7.9 1.2.9h16.3c.6 0 1.1-.4 1.3-.9l.6-3.1c.1-.5-.2-1.2-.7-1.5z"/></svg> 
    <span style="color:white;">Browse file&hellip;</span></label><br />
    <div class="resume-uploading">
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
        <span id="upf">UPLOADING</span>
    </div>
    <asp:TextBox ID="txt_resume" runat="server" ClientIDMode="Static" CssClass="hidden"></asp:TextBox>
    <asp:TextBox ID="filename" ClientIDMode="Static" runat="server" CssClass="hidden"></asp:TextBox>
    <asp:TextBox ID="paraupload" ClientIDMode="Static" runat="server" CssClass="hidden"></asp:TextBox>
    <asp:LinkButton ID="lb_upload" runat="server" Text="Upload" ClientIDMode="Static" OnClick="click_upload" CssClass="hidden"></asp:LinkButton>
</div>

<div id="div_load_modal" class="modal"></div> 
<div  id="div_load_gif" class="modal-content processing" >
    <img src="style/img/loading.gif"  alt="loading" />
    <div class="alert alert-info no-margin">
        PLEASE WAIT, THANK YOU!! :) 
    </div>
</div>


<script src="crop image/js/jquery-1.12.4.min.js" type="text/javascript"></script>
<script src="crop image/js/cropper.min.js" type="text/javascript"></script>
<script src="crop image/js/main.js" type="text/javascript"></script>
<script src="crop image/js/custom.js" type="text/javascript"></script>
<link href="crop image/css/cropper.min.css" rel="stylesheet"  type="text/css" />
<link href="crop image/css/main.css" rel="stylesheet"  type="text/css" />

<asp:HiddenField ID="hf_reload_id" runat="server" />
<asp:HiddenField ID="hf_property" runat="server" />
<asp:HiddenField ID="hf_captcha" runat="server" />
<asp:HiddenField ID="hf_policy" runat="server" />
<asp:TextBox ID="tb_filecount" runat="server" ClientIDMode="Static" Text="0" CssClass="hidden"></asp:TextBox>
<!--End Application Form-->
    <div id="myCarousel" class="carousel slide" data-ride="carousel"> 
        <div class="carousel-inner">
            <% DataTable dt = dbhelper.getdata("select * from mycarousel  order by herar"); %>
            <% for (int i = 0; i < dt.Rows.Count; i++)
               {
                   string act = i == 0 ? " active" : "";
                   %>
                <div class="item<% Response.Write(act); %>"><img src="style/img/slider/<% Response.Write(dt.Rows[i]["f_name"].ToString()); %>" style="width:100%" alt="Bluewater"></div>

            <% } %>
        </div>
        <a class="left carousel-control" href="#myCarousel" data-slide="prev"></a>
        <a class="right carousel-control" href="#myCarousel" data-slide="next"></a> 
        <ol class="carousel-indicators">
            <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
            <li data-target="#myCarousel" data-slide-to="1"></li>
            <li data-target="#myCarousel" data-slide-to="2"></li>
        </ol>
    </div>
    <div class="ds">
        <img src="style/img/bg-3.png" alt="logo" />
        <asp:TextBox ID="txt_search" runat="server" placeholder="Search for a job" ontextchanged="txt_TextChanged"></asp:TextBox>    
    </div>
    <div class="content-a">
        <div class="suwat" runat="server" id="suwaatt">
            <h3>Join our team. Excel with us.</h3>
            <p>
                In line with the Filipino culture of amuma, we at Bluewater and Almont Resort and other company affiliates<br />
                embody extraordinary care and hospitality towards ourselves, our colleagues, guests, and the environment.<br /><br />

                Contribute to our passion in the
                hospitality industry and submit an application to any of our properties.
                <br /><br />
                Explore more of the world and grow with us.
            </p>
        </div>
        <div class="lnk" runat="server" id="logoo">
            
            <ul>
                <li>
                    <a href="panglao"><img src="style/img/logo/pangloa.png" alt="panglao" style="margin:10px 20px 10px 20px"/></a>
                    <a href="maribago"><img src="style/img/logo/maribago.png" alt="maribago" style="margin:10px 20px 10px 20px"/></a>
                    <a href="sumilon"><img src="style/img/logo/sumilon.png" alt="sumilon" style="margin:10px 20px 10px 20px"/></a>
                </li>
                <li>
                    <a href="amuma"><img src="style/img/logo/amuma.png" alt="amuma"/></a>
                    <a href="almont"><img src="style/img/logo/almot.png" alt="almot"/></a>
                    <a href="arc"><img src="style/img/logo/ARCHospitals.png" alt="arch"/></a>
                    <a href="onecentral"><img src="style/img/logo/One-Central.png" alt="One-Central"/></a>
                    <a href="bluebubble"><img src="style/img/logo/BlueBubble-Logo.png" alt="BlueBubble"/></a>
                </li>
            </ul>
            
            <!--
            <div style="border-top:1px solid #eee; margin:50px 0">
             <iframe src="https://keepthescore.co/view/fcphlnfvdjr?minimal=true/" height="520px" width="100%" style="border:none;"></iframe>
</div> --!>
            <ul class="hidden">
                <li>
                    <asp:LinkButton ID="lnk_panglao" OnClick="click_property" runat="server" ToolTip="Panglao" CommandName="2"><img src="style/img/logo/pangloa.png" alt="panglao" style="margin:10px 20px 10px 20px"/></asp:LinkButton>
                    <asp:LinkButton ID="lnk_maribago" OnClick="click_property" runat="server" ToolTip="Maribago" CommandName="1" ><img src="style/img/logo/maribago.png" alt="maribago" style="margin:10px 20px 10px 20px"/></asp:LinkButton>
                    <asp:LinkButton ID="lnk_sumilon" OnClick="click_property" runat="server" ToolTip="Sumilon" CommandName="3"><img src="style/img/logo/sumilon.png" alt="sumilon"  style="margin:10px 20px 10px 20px"/></asp:LinkButton>
                </li>
                <li>
                    <asp:LinkButton ID="lnk_amuma" OnClick="click_property" runat="server" ToolTip="Amuma Spa" CommandName="5"><img src="style/img/logo/amuma.png" alt="amuma"/></asp:LinkButton>
                    <asp:LinkButton ID="lnk_almot" OnClick="click_property" runat="server" ToolTip="Almont" CommandName="4"><img src="style/img/logo/almot.png" alt="almot"/></asp:LinkButton>
                    <asp:LinkButton ID="LinkButton3" OnClick="click_property" runat="server" ToolTip="ARC Hospitals" CommandName="8"><img src="style/img/logo/ARCHospitals.png" alt="arch"/></asp:LinkButton>
                    <asp:LinkButton ID="lnk_others" OnClick="click_property" runat="server" ToolTip="One Central Hotel" CommandName="9"><img src="style/img/logo/One-Central.png" alt="other"/></asp:LinkButton>
                    <asp:LinkButton ID="LinkButton1" OnClick="click_property" runat="server" ToolTip="Blue Bubble" CommandName="10"><img src="style/img/logo/BlueBubble-Logo.png" alt="other"/></asp:LinkButton>
                </li>
            </ul>
        </div>
            <div id="panel" runat="server" visible="false">
                <div id="rt">
                    <asp:LinkButton ID="LinkButton2" OnClick="home" runat="server" Visible="false" CssClass="back"><img src="style/img/backButton2.png" title="Back to Home"alt="back"/></asp:LinkButton>
                    <div class="consub">
                        <% if (hd_logo.Value == "1") %>
                        <% {%>
                        <img src="style/img/logo/maribago.png" style="height:100px;" alt="Maribago" class="logo" />
                        <% }%>

                            <% else if (hd_logo.Value == "2") %>
                        <% {%>
                        <img src="style/img/logo/pangloa.png" style="height:100px;" alt="Panglao" class="logo" />
                        <% }%>

                            <% else if (hd_logo.Value == "3") %>
                        <% {%>
                        <img src="style/img/logo/sumilon.png" style="height:100px;" alt="Sumilon" class="logo" />
                        <% }%>

                        <% else if (hd_logo.Value == "4") %>
                        <% {%>
                        <img src="style/img/logo/almot.png" style="height:100px;" alt="Almont" class="logo" />
                        <% }%>

                        <% else if (hd_logo.Value == "5") %>
                        <% {%>
                        <img src="style/img/logo/amuma.png" style="height:100px;" alt="Amuma" class="logo" />
                        <% }%>

                            <% else if (hd_logo.Value == "6") %>
                        <% {%>
                        <img src="style/img/logo/other.png" style="height:100px;" alt="Others" class="logo" />
                        <% }%>

                            <% else if (hd_logo.Value == "7") %>
                        <% {%>
                        <img src="style/img/logo/ARCHospitals.png" style="height:100px;" alt="ARC Hospital" class="logo" />
                        <% }%>
                        <% else if (hd_logo.Value == "9") %>
                        <% {%>
                        <img src="style/img/logo/One-Central.png" style="height:150px;" alt="One Central Hotel" class="logo" />
                        <% }%>

                        <% else if (hd_logo.Value == "10") %>
                        <% {%>
                        <img src="style/img/logo/BlueBubble-Logo.png" style="height:80px;" alt="Blue Bubble" class="logo" />
                        <% }%>
                        <h3 style=" display:none">Department (<asp:Label ID="lbl_brr" runat="server"></asp:Label>)</h3>
                        <hr />
                        <asp:LinkButton style="text-decoration:none;" OnClick="view_all" runat="server" ID="lbl_all" Font-Bold="true" ></asp:LinkButton>
                        <asp:GridView ID="grid_type" runat="server" ShowHeader="false" AutoGenerateColumns="False" CssClass="table" AllowSorting="true">
                            <Columns>
                                <asp:BoundField DataField="jobtype_id" ItemStyle-Font-Size="0px" HeaderStyle-Width="0px"/>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                            - <asp:LinkButton ID="lnkEdit" runat="server" OnClick="view" Text='<%# Bind("job_type") %>' ></asp:LinkButton>
                                        (<asp:Label ID="lbl_cnt" runat="server" Text='<%# Bind("cnnt") %>'></asp:Label>)
                                    </ItemTemplate>
                                </asp:TemplateField>  
                            </Columns>
                        </asp:GridView>
                    </div>
                    <div class="consub-b">
                        <div style=" border-bottom:1px solid silver; padding-bottom:10px; font-size:12px; color:#008b8b"><asp:Label ID="lbl_header" runat="server"></asp:Label> </div> 
                        <asp:Panel ID="pnl_pos" runat="server">
                            <asp:Label ID="Label1" runat="server" Text=""></asp:Label> 
                            <asp:GridView ID="grid_subject" runat="server" OnRowDataBound="boundgridsub" ShowHeader="false" AutoGenerateColumns="False" CssClass="table tbl" AllowSorting="true">
                                <Columns>
                                    <asp:BoundField DataField="id" ItemStyle-Font-Size="0px" ItemStyle-Width="0" HeaderStyle-Width="0px" />
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:LinkButton ID="lnkEdit" runat="server" OnClick="goForm" CssClass="tb_hd" Text='<%# Bind("job_subject") %>' ></asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>   
                                </Columns>
                            </asp:GridView>
                        </asp:Panel>
                        <asp:Panel ID="pnl_det" runat="server" Visible="false">
                            <ul class="ul">
                                <li class="li_hd">Department</li>
                                <li class="li_cn"><asp:Label ID="lbl_type" runat="server" Text=""></asp:Label></li>
                                <li id="sec" runat="server" class="li_hd">Section</li>
                                <li class="li_cn"><asp:Label ID="lbl_section" runat="server" Text=""></asp:Label></li>
                                <li class="li_hd pm">Position</li>
                                <li class="li_cn"><asp:Label ID="lbl_title" runat="server" Text=""></asp:Label></li>
                                <li id="job" runat="server" class="li_hd pm">Qualifications</li>
                                <li><asp:Label ID="txt_details" runat="server"></asp:Label></li>
                                <li><hr /></li>
                                <li><asp:LinkButton ID="li_bt" runat="server" Text="Apply" OnClick="click_apply"></asp:LinkButton></li>
                            </ul>
                        </asp:Panel>
                    </div>
                </div>
           </div>     
    </div>

    <asp:HiddenField ID="hd_jobid" runat="server" /> 
    <asp:TextBox ID="TextBox1" Visible="false" runat="server"></asp:TextBox>
    <asp:HiddenField ID="hd_logo" runat="server" />
    </form>
    <script type="text/javascript" src="script/country/list.js"></script>
    <script type="text/javascript">
        $('#check-policy').click(function(){
            if($(this).is(':checked'))
            {
              $("#Button1").removeClass("disabled");
            }else
            {
             $("#Button1").addClass("disabled");
            }
             
        });

        if (document.getElementById('ddl_country').value == "Philippines") {
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
        else {
            $("#ddl_region").css("display", "block");
            $("#countryy").css("display", "none");
            $("#ddl_province").css("display", "block");
            $("#statey").css("display", "none");
            $("#ddl_city").css("display", "block");
            $("#cityy").css("display", "none");
        }

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
               console.log("out");
            $('#countryy').append($('<option>', {
                value: i + 1,
                text : item,
            }, '</option>' ));
            $('#countryy option:selected').val(0);
        });
         
        $('#countryy').change(function(){
            console.log("country");
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

        $('#ddl_attainment').change(function(){
           educational = $(this).val();
           if (educational > 4)
             $("#courses").css("display", "block");
           else
            $("#courses").css("display", "none");
        });

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
    </script>
    <link rel="stylesheet" href="style/css/jquery-calendar.css" type="text/css"/>
    <script type="text/javascript" src="script/autocomplete/jquery-ui.js"></script>
    <script src="script/datetimepicker/v2/jquery-1.12.4.js"></script>
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
    <!--Custom File Input-->
    <script type="text/javascript" src="script/jquery.custom-file-input.js"></script>
    <script>(function (e, t, n) { var r = e.querySelectorAll("html")[0]; r.className = r.className.replace(/(^|\s)no-js(\s|$)/, "$1js$2") })(document, window, 0);</script>
    <!-- jQuery 3 -->
    <script src="vendors/jquery/dist/jquery.min.js"></script>
    <!--Select Minimal-->
    <script type="text/javascript" src="vendors/select2/dist/js/select2.full.js"></script>
    <script type="text/javascript">
        jQuery.noConflict();
        (function ($) {
            $('.select2').select2()
        })(jQuery);

    </script>
</body>
</html>
