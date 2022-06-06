<%@ Page Language="C#" AutoEventWireup="true" CodeFile="search.aspx.cs" Inherits="content_HR_search" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
     <link href="../../style/css/survey.css" rel="Stylesheet" type="text/css" />
      <style type="text/css">
        * { margin:0; padding:0}
        .content-a { height:400px;width:900px; margin:0 auto; }
        .content-b { margin-bottom:100px}
        .header { height:50px;}
        .link { float:left; margin:0px 0;}
        .link ul { list-style:none; width:100%; }
        .link li { display:inline; }
        .link img { width:285px;margin:5px}
        .link img:hover {border:1px dashed #5C91C2;width:283px;}
        .suwat { text-align:center; width:100%;}
        .suwat h3 {color:#104575; font-size:20px; line-height:50px;}
        .suwat p {  font-size:13px}
        .search { z-index:99; margin:250px 0 0 0;  float:left;text-align:center; opacity: 0.7;  height:45px; width:100%}
        .ds { text-align:center;background-image: url(style/img/bg-2.png); float:left; margin:0px 0 10px 0; height:45px; width:100%}
        .ds input[type=text] { padding:5px 5px 5px 25px; border:none;  color:White;  width:140px; background:transparent; font-size:18px; margin:5px 0  }
        .ds input[type=text]::-webkit-input-placeholder { /* WebKit, Blink, Edge */color:  #fff;}
        .ds input[type=text]:-moz-placeholder { /* Mozilla Firefox 4 to 18 */color:    #fff;opacity:  1;}
        .ds input[type=text]::-moz-placeholder { /* Mozilla Firefox 19+ */color:    #fff;opacity:  1;}
        .ds input[type=text]:-ms-input-placeholder { /* Internet Explorer 10-11 */color:    #fff;}
        .ds img { position:absolute; margin:13px 0; }
      
        .box-a { float:left; width:100%; margin:10px 0}
        .consub-a {float:left;border:1px solid #e4e4e4;   width:215px; padding:15px; height:auto ; background:#fff; border-radius:5px }
        .consub-a h3 { border-bottom:2px solid black}
        .consub-a table { margin:10px 0px}
        .consub-a td { height:30px; font-size:13px}
        .consub-a a {color:#142d69;}
        .consub-c { border:1px solid red; padding:20px; box-shadow: 0px 1px 3px -5px; float:right;  width:605px; min-heigth:400px; background:#fff; border:1px solid #e4e4e4; border-radius:5px;  }
        .consub-c tr{ border-bottom:1px dashed silver; line-height:40px }
        .consub-c table textarea { width:100%; border:none;}
        .table tr:last-child {border:none}
        .li_cn { padding-left:10px}
        .li_hd { font-weight:bold;}
        .ul { font-size:13px; margin:10px 0 0 0}
        .ul hr { margin:5px 0}
        .ul input[type=submit]{padding: 8px;width: 94%;border-radius: 4px;border: none;cursor: pointer;background: #2ea2cc;border-color: #0074a2;-webkit-box-shadow: inset 0 1px 0 rgba(120,200,230,.5),0 1px 0 rgba(0,0,0,.15);box-shadow: inset 0 1px 0 rgba(120,200,230,.5),0 1px 0 rgba(0,0,0,.15);color: #fff;text-decoration: none;width: 100px;}
        .ul ol ,.ul ul { margin-left:30px }
        .ul ol br,.ul ul br { display: none; }
        .ul ul li { list-style-type: circle; }
     </style>
    <link href="../../style/css/bootstrap.min.css" rel="stylesheet" />
    <script src="script/slider/jquery.min.js"></script>
    <script src="script/slider/bootstrap.min.js"></script>
    <link href="../../style/css/jquerysctipttop.css" rel="stylesheet" type="text/css">
</head>
<body>
    <form id="form1" runat="server">
    <div id="myCarousel" class="carousel slide" data-ride="carousel"> 
        <div class="carousel-inner">
            <% System.Data.DataTable dt = dbhelper.getdata("select * from mycarousel  order by herar"); %>
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
        <div class="ds" >
            <img src="style/img/bg-3.png" />
            <asp:TextBox ID="txt_search" runat="server"  placeholder="Search Job..." AutoPostBack="true" ontextchanged="txt_TextChanged"></asp:TextBox>    
        </div>
        <div class="content-a">
        <asp:LinkButton ID="LinkButton2" OnClick="home" runat="server" style=" color:#236464; margin:5px; padding-left:30px; text-decoration:none; font-weight:bold;"><img src="style/img/backButton2.png" title="Back to Home" style=" position:absolute; margin: 10px 0 0 -30px;" alt="back"/></asp:LinkButton>
        
        <asp:ScriptManager ID="sm_rec" runat="server"></asp:ScriptManager>


        <div id="Div9" class="box-a" runat="server" >
            No record found.
        </div>

        <div id="Div8" class="box-a" runat="server" visible="false">

            <div class="consub-a">
                <asp:Image ID="img_logo" runat="server" ImageUrl="~/style/img/png/0.png" style=" width:100%" />
            </div>

            <asp:Panel ID="pnl_det" runat="server" CssClass="consub-c" >
                
                <ul class="ul">
                    <li class="li_hd">Department</li>
                    <li class="li_cn"><asp:Label ID="lbl_type" runat="server" Text=""></asp:Label></li>
                    <li id="sec" runat="server" class="li_hd">Section</li>
                    <li class="li_cn"><asp:Label ID="lbl_section" runat="server" Text=""></asp:Label></li>
                    <li class="li_hd">Position</li>
                    <li class="li_cn"><asp:Label ID="lbl_title" runat="server" Text=""></asp:Label></li>
                    <li class="li_cn"><asp:Label ID="lbl_qualification" runat="server" Text=""></asp:Label></li>
                    <li id="job" runat="server" class="li_hd">Qualifications</li>
                    <li><asp:Label ID="txt_details" runat="server"></asp:Label></li>
                    <li><hr /></li>
                    <li><asp:Button ID="btn_apply" Text="Apply" OnClick="click_apply"  runat="server" CssClass="li_bt" /></li>
                </ul>
            </asp:Panel>

        </div>

       <asp:UpdatePanel ID="update_maribago" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <div id="Div1" class="box-a">
                    <div class="consub-a">
                        <img src="style/img/0.jpg" style="height:100px;" alt="Cebu LandMasters" class="logo" />
                        <asp:GridView ID="grid_maribago" runat="server" ShowHeader="false" AutoGenerateColumns="False" CssClass="table" AllowSorting="true" Visible="false">
                            <Columns>
                                <asp:BoundField DataField="jobtype_id" ItemStyle-Font-Size="0px" HeaderStyle-Width="0px"/>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lnkEdit" OnClick="view_maribago" runat="server" Text='<%# Bind("job_type") %>' ></asp:LinkButton>
                                        (<asp:Label ID="lbl_cnt" runat="server" Text='<%# Bind("cnnt") %>'></asp:Label>)
                                    </ItemTemplate>
                                </asp:TemplateField>  
                            </Columns>
                        </asp:GridView>
                    </div>

                    <div class="consub-c">
                       <h3><asp:Label ID="lbl_mar_head" runat="server"></asp:Label></h3> 
                       <asp:Label ID="lbl_mar_sub" runat="server" Text=""></asp:Label> 
                       <asp:GridView ID="grid_maribago_sub" runat="server" ShowHeader="false" AutoGenerateColumns="False" CssClass="table" AllowSorting="true">
                            <Columns>
                                <asp:BoundField DataField="id"  ItemStyle-Font-Size="0px" />
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <ul>
                                            <li><asp:LinkButton ID="lnkEdit" runat="server" OnClick="goForm" CssClass="tb_hd" ToolTip="CLI" Text='<%# Bind("job_subject") %>' ></asp:LinkButton></li>
                                            <li><asp:Label ID="lbl_details" runat="server" CssClass="tb_det" Text='<%# Bind("job_details") %>'></asp:Label></li>
                                            <li style="display:none;"><asp:Label ID="lbl_date" runat="server"  CssClass="tb_date" ForeColor="Gray" Text='<%# Bind("date") %>'></asp:Label></li>
                                            <li style="display:none;"><asp:LinkButton ID="LinkButton1" runat="server"  Text="Read more..." Font-Size="12px" ForeColor="Red" ></asp:LinkButton></li>
                                        </ul>
                                    </ItemTemplate>
                                </asp:TemplateField>   
                            </Columns>
                        </asp:GridView>
                    </div>

                    
                </div>
            </ContentTemplate> 
        </asp:UpdatePanel>


                  
       <asp:UpdatePanel ID="update_panglao" runat="server">
             <ContentTemplate>
                    <div id="Div2"  class="box-a">
                        <div class="consub-a">
                       <img src="style/img/png/pangloa.png" style="height:100px;" alt="Bluewater" class="logo" />

                            <asp:GridView ID="grid_panglao" runat="server" ShowHeader="false" AutoGenerateColumns="False" CssClass="table" AllowSorting="true" Visible="false">
                                <Columns>
                                    <asp:BoundField DataField="jobtype_id" ItemStyle-Font-Size="0px" HeaderStyle-Width="0px"/>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:LinkButton ID="lnkEdit" OnClick="view_panglao" runat="server" Text='<%# Bind("job_type") %>' ></asp:LinkButton>
                                            (<asp:Label ID="lbl_cnt" runat="server" Text='<%# Bind("cnnt") %>'></asp:Label>)
                                        </ItemTemplate>
                                    </asp:TemplateField>  
                                </Columns>
                            </asp:GridView>
                        </div>
                        <div class="consub-c">
                           <h3><asp:Label ID="lbl_panglao_head" runat="server"></asp:Label></h3> 
                           <asp:Label ID="lbl_panglao_sub" runat="server" Text=""></asp:Label> 
                           <asp:GridView ID="grid_panglao_sub" runat="server" ShowHeader="false" AutoGenerateColumns="False" CssClass="table" AllowSorting="true">
                                <Columns>
                                    <asp:BoundField DataField="id"  ItemStyle-Font-Size="0px" />
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <ul>
                                                <li><asp:LinkButton ID="lnkEdit" runat="server" OnClick="goForm" CssClass="tb_hd" ToolTip="pangloa"  Text='<%# Bind("job_subject") %>' ></asp:LinkButton></li>
                                                <li><asp:Label ID="lbl_details" runat="server" CssClass="tb_det" Text='<%# Bind("job_details") %>'></asp:Label></li>
                                                <li style="display:none;"><asp:Label ID="lbl_date" runat="server"  CssClass="tb_date" ForeColor="Gray" Text='<%# Bind("date") %>'></asp:Label></li>
                                                <li style="display:none;"><asp:LinkButton ID="LinkButton1" runat="server"  Text="Read more..." Font-Size="12px" ForeColor="Red" ></asp:LinkButton></li>
                                            </ul>
                                        </ItemTemplate>
                                    </asp:TemplateField>   
                                </Columns>
                            </asp:GridView>
                        </div>
                    </div>
             </ContentTemplate>
       </asp:UpdatePanel>

       <asp:UpdatePanel ID="update_sumilon" runat="server">
             <ContentTemplate>
                    <div id="Div3" class="box-a">
                        <div class="consub-a">
                       <img src="style/img/png/sumilon.png" style="height:100px;" alt="Bluewater" class="logo" />

                            <asp:GridView ID="grid_sumilon" runat="server" ShowHeader="false" AutoGenerateColumns="False" CssClass="table" AllowSorting="true" Visible="false">
                                <Columns>
                                    <asp:BoundField DataField="jobtype_id" ItemStyle-Font-Size="0px" HeaderStyle-Width="0px"/>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:LinkButton ID="lnkEdit" OnClick="view_sumilon" runat="server" Text='<%# Bind("job_type") %>' ></asp:LinkButton>
                                            (<asp:Label ID="lbl_cnt" runat="server" Text='<%# Bind("cnnt") %>'></asp:Label>)
                                        </ItemTemplate>
                                    </asp:TemplateField>  
                                </Columns>
                            </asp:GridView>
                        </div>

                        <div class="consub-c">
                           <h3><asp:Label ID="lbl_sumilon_head" runat="server"></asp:Label></h3> 
                           <asp:GridView ID="grid_sumilon_sub" runat="server" ShowHeader="false" AutoGenerateColumns="False" CssClass="table" AllowSorting="true" EmptyDataText="No Record Found">
                                <Columns>
                                    <asp:BoundField DataField="id"  ItemStyle-Font-Size="0px" />
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <ul>
                                                <li><asp:LinkButton ID="lnkEdit" runat="server" OnClick="goForm" CssClass="tb_hd" ToolTip="sumilon"  Text='<%# Bind("job_subject") %>' ></asp:LinkButton></li>
                                                <li><asp:Label ID="lbl_details" runat="server" CssClass="tb_det" Text='<%# Bind("job_details") %>'></asp:Label></li>
                                                <li style="display:none;"><asp:Label ID="lbl_date" runat="server"  CssClass="tb_date" ForeColor="Gray" Text='<%# Bind("date") %>'></asp:Label></li>
                                                <li style="display:none;"><asp:LinkButton ID="LinkButton1" runat="server"  Text="Read more..." Font-Size="12px" ForeColor="Red" ></asp:LinkButton></li>
                                            </ul>
                                        </ItemTemplate>
                                    </asp:TemplateField>   
                                </Columns>
                            </asp:GridView>
                        </div>
                    </div>
             </ContentTemplate>
       </asp:UpdatePanel>
       
        <asp:UpdatePanel ID="update_almont" runat="server">
             <ContentTemplate>
                    <div id="Div4" class="box-a">
                        <div class="consub-a">
                       <img src="style/img/png/almot.png" style="height:100px;" alt="Bluewater" class="logo" />
                            <asp:GridView ID="grid_almont" runat="server" ShowHeader="false" AutoGenerateColumns="False" CssClass="table" AllowSorting="true" Visible="false">
                                <Columns>
                                    <asp:BoundField DataField="jobtype_id" ItemStyle-Font-Size="0px" HeaderStyle-Width="0px"/>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:LinkButton ID="lnkEdit" OnClick="view_almont" runat="server" Text='<%# Bind("job_type") %>' ></asp:LinkButton>
                                            (<asp:Label ID="lbl_cnt" runat="server" Text='<%# Bind("cnnt") %>'></asp:Label>)
                                        </ItemTemplate>
                                    </asp:TemplateField>  
                                </Columns>
                            </asp:GridView>
                        </div>
                        <div class="consub-c">
                           <h3><asp:Label ID="lbl_almont_head" runat="server"></asp:Label></h3> 
                           <asp:Label ID="lbl_almont_sub" runat="server" Text=""></asp:Label> 
                           <asp:GridView ID="grid_almont_sub" runat="server" ShowHeader="false" AutoGenerateColumns="False" CssClass="table" AllowSorting="true">
                                <Columns>
                                    <asp:BoundField DataField="id"  ItemStyle-Font-Size="0px" />
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <ul>
                                                <li><asp:LinkButton ID="lnkEdit" runat="server" OnClick="goForm" CssClass="tb_hd" ToolTip="almot"  Text='<%# Bind("job_subject") %>' ></asp:LinkButton></li>
                                                <li><asp:Label ID="lbl_details" runat="server" CssClass="tb_det" Text='<%# Bind("job_details") %>'></asp:Label></li>
                                                <li style="display:none;"><asp:Label ID="lbl_date" runat="server"  CssClass="tb_date" ForeColor="Gray" Text='<%# Bind("date") %>'></asp:Label></li>
                                                <li style="display:none;"><asp:LinkButton ID="LinkButton1" runat="server"  Text="Read more..." Font-Size="12px" ForeColor="Red" ></asp:LinkButton></li>
                                            </ul>
                                        </ItemTemplate>
                                    </asp:TemplateField>   
                                </Columns>
                            </asp:GridView>
                        </div>
                    </div>
                </ContentTemplate>
                   </asp:UpdatePanel>

        <asp:UpdatePanel ID="update_amuma" runat="server">
             <ContentTemplate>
                    <div id="Div5" class="box-a">
                        <div class="consub-a">
                       <img src="style/img/logo/amuma.png" style="height:100px;" alt="Bluewater" class="logo" />

                            <asp:GridView ID="grid_amuma" runat="server" ShowHeader="false" AutoGenerateColumns="False" CssClass="table" AllowSorting="true" Visible="false">
                                <Columns>
                                    <asp:BoundField DataField="jobtype_id" ItemStyle-Font-Size="0px" HeaderStyle-Width="0px"/>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:LinkButton ID="lnkEdit" OnClick="view_amuma" runat="server" Text='<%# Bind("job_type") %>' ></asp:LinkButton>
                                            (<asp:Label ID="lbl_cnt" runat="server" Text='<%# Bind("cnnt") %>'></asp:Label>)
                                        </ItemTemplate>
                                    </asp:TemplateField>  
                                </Columns>
                            </asp:GridView>
                        </div>
                        <div class="consub-c">
                           <h3><asp:Label ID="lbl_amu_head" runat="server"></asp:Label></h3> 
                           <asp:Label ID="lbl_amu_sub" runat="server" Text=""></asp:Label> 
                           <asp:GridView ID="grid_amuma_sub" runat="server" ShowHeader="false" AutoGenerateColumns="False" CssClass="table" AllowSorting="true">
                                <Columns>
                                    <asp:BoundField DataField="id"  ItemStyle-Font-Size="0px" />
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <ul>
                                                <li><asp:LinkButton ID="lnkEdit" runat="server" OnClick="goForm" CssClass="tb_hd" ToolTip="amuma"  Text='<%# Bind("job_subject") %>' ></asp:LinkButton></li>
                                                <li><asp:Label ID="lbl_details" runat="server" CssClass="tb_det" Text='<%# Bind("job_details") %>'></asp:Label></li>
                                                <li style="display:none;"><asp:Label ID="lbl_date" runat="server"  CssClass="tb_date" ForeColor="Gray" Text='<%# Bind("date") %>'></asp:Label></li>
                                                <li style="display:none;"><asp:LinkButton ID="LinkButton1" runat="server"  Text="Read more..." Font-Size="12px" ForeColor="Red" ></asp:LinkButton></li>
                                            </ul>
                                        </ItemTemplate>
                                    </asp:TemplateField>   
                                </Columns>
                            </asp:GridView>
                        </div>
                    </div>
                </ContentTemplate>
                   </asp:UpdatePanel>

         <asp:UpdatePanel ID="update_others" runat="server">
             <ContentTemplate>
                    <div id="Div6" class="box-a">
                        <div class="consub-a">
                       <img src="style/img/logo/other.png" style="height:100px;" alt="Bluewater" class="logo" />

                            <asp:GridView ID="grid_other" runat="server" ShowHeader="false" AutoGenerateColumns="False" CssClass="table" AllowSorting="true" Visible="false">
                                <Columns>
                                    <asp:BoundField DataField="jobtype_id" ItemStyle-Font-Size="0px" HeaderStyle-Width="0px"/>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:LinkButton ID="lnkEdit" OnClick="view_others" runat="server" Text='<%# Bind("job_type") %>' ></asp:LinkButton>
                                            (<asp:Label ID="lbl_cnt" runat="server" Text='<%# Bind("cnnt") %>'></asp:Label>)
                                        </ItemTemplate>
                                    </asp:TemplateField>  
                                </Columns>
                            </asp:GridView>
                        </div>
                        <div class="consub-c">
                           <h3><asp:Label ID="lbl_other_head" runat="server"></asp:Label></h3> 
                           <asp:Label ID="lbl_other_sub" runat="server" Text=""></asp:Label> 
                           <asp:GridView ID="grid_other_sub" runat="server" ShowHeader="false" AutoGenerateColumns="False" CssClass="table" AllowSorting="true">
                                <Columns>
                                    <asp:BoundField DataField="id"  ItemStyle-Font-Size="0px" />
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <ul>
                                                <li><asp:LinkButton ID="lnkEdit" runat="server" OnClick="goForm" CssClass="tb_hd" ToolTip="other"  Text='<%# Bind("job_subject") %>' ></asp:LinkButton></li>
                                                <li><asp:Label ID="lbl_details" runat="server" CssClass="tb_det" Text='<%# Bind("job_details") %>'></asp:Label></li>
                                                <li style="display:none;"><asp:Label ID="lbl_date" runat="server"  CssClass="tb_date" ForeColor="Gray" Text='<%# Bind("date") %>'></asp:Label></li>
                                                <li style="display:none;"><asp:LinkButton ID="LinkButton1" runat="server"  Text="Read more..." Font-Size="12px" ForeColor="Red" ></asp:LinkButton></li>
                                            </ul>
                                        </ItemTemplate>
                                    </asp:TemplateField>   
                                </Columns>
                            </asp:GridView>
                        </div>
                    </div>
                </ContentTemplate>
                   </asp:UpdatePanel>

                   
         <asp:UpdatePanel ID="UpdatePanel1" runat="server">
             <ContentTemplate>
                    <div id="Div7" class="box-a">
                        <div class="consub-a">
                            <img src="style/img/logo/ARCHospitals.png" style="height:100px;" alt="Bluewater" class="logo" />
                             <asp:GridView ID="GridView1" runat="server" ShowHeader="false" AutoGenerateColumns="False" CssClass="table" AllowSorting="true" Visible="false">
                                <Columns>
                                    <asp:BoundField DataField="jobtype_id" ItemStyle-Font-Size="0px" HeaderStyle-Width="0px"/>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:LinkButton ID="lnkEdit" OnClick="view_amuma" runat="server" Text='<%# Bind("job_type") %>' ></asp:LinkButton>
                                            (<asp:Label ID="lbl_cnt" runat="server" Text='<%# Bind("cnnt") %>'></asp:Label>)
                                        </ItemTemplate>
                                    </asp:TemplateField>  
                                </Columns>
                            </asp:GridView>
                        </div>
                        <div class="consub-c">
                           <h3><asp:Label ID="Label1" runat="server"></asp:Label></h3> 
                           <asp:Label ID="Label2" runat="server" Text=""></asp:Label> 
                           <asp:GridView ID="GridView2" runat="server" ShowHeader="false" AutoGenerateColumns="False" CssClass="table" AllowSorting="true">
                                <Columns>
                                    <asp:BoundField DataField="id"  ItemStyle-Font-Size="0px" />
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <ul>
                                                <li><asp:LinkButton ID="lnkEdit" runat="server" OnClick="goForm" CssClass="tb_hd" ToolTip="ARCHospitals"  Text='<%# Bind("job_subject") %>' ></asp:LinkButton></li>
                                                <li><asp:Label ID="lbl_details" runat="server" CssClass="tb_det" Text='<%# Bind("job_details") %>'></asp:Label></li>
                                                <li style="display:none;"><asp:Label ID="lbl_date" runat="server"  CssClass="tb_date" ForeColor="Gray" Text='<%# Bind("date") %>'></asp:Label></li>
                                                <li style="display:none;"><asp:LinkButton ID="LinkButton1" runat="server"  Text="Read more..." Font-Size="12px" ForeColor="Red" ></asp:LinkButton></li>
                                            </ul>
                                        </ItemTemplate>
                                    </asp:TemplateField>   
                                </Columns>
                            </asp:GridView>
                        </div>
                    </div>
                </ContentTemplate>
    </asp:UpdatePanel>
    
    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
    <ContentTemplate>
        <div id="Div10" class="box-a">
            <div class="consub-a">
                <img src="style/img/logo/One-Central.png" style="height:150px;" alt="Bluewater" class="logo" />
                    <asp:GridView ID="GridView3" runat="server" ShowHeader="false" AutoGenerateColumns="False" CssClass="table" AllowSorting="true" Visible="false">
                    <Columns>
                        <asp:BoundField DataField="jobtype_id" ItemStyle-Font-Size="0px" HeaderStyle-Width="0px"/>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:LinkButton ID="lnkEdit" OnClick="view_onehospital" runat="server" Text='<%# Bind("job_type") %>' ></asp:LinkButton>
                                (<asp:Label ID="lbl_cnt" runat="server" Text='<%# Bind("cnnt") %>'></asp:Label>)
                            </ItemTemplate>
                        </asp:TemplateField>  
                    </Columns>
                </asp:GridView>
            </div>
            <div class="consub-c">
                <h3><asp:Label ID="Label3" runat="server"></asp:Label></h3> 
                <asp:Label ID="Label4" runat="server" Text=""></asp:Label> 
                <asp:GridView ID="GridView4" runat="server" ShowHeader="false" AutoGenerateColumns="False" CssClass="table" AllowSorting="true">
                    <Columns>
                        <asp:BoundField DataField="id"  ItemStyle-Font-Size="0px" />
                        <asp:TemplateField>
                            <ItemTemplate>
                                <ul>
                                    <li><asp:LinkButton ID="lnkEdit" runat="server" OnClick="goForm" CssClass="tb_hd" ToolTip="One-Central"  Text='<%# Bind("job_subject") %>' ></asp:LinkButton></li>
                                    <li><asp:Label ID="lbl_details" runat="server" CssClass="tb_det" Text='<%# Bind("job_details") %>'></asp:Label></li>
                                    <li style="display:none;"><asp:Label ID="lbl_date" runat="server"  CssClass="tb_date" ForeColor="Gray" Text='<%# Bind("date") %>'></asp:Label></li>
                                    <li style="display:none;"><asp:LinkButton ID="LinkButton1" runat="server"  Text="Read more..." Font-Size="12px" ForeColor="Red" ></asp:LinkButton></li>
                                </ul>
                            </ItemTemplate>
                        </asp:TemplateField>   
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </ContentTemplate>
</asp:UpdatePanel>

<asp:UpdatePanel ID="UpdatePanel3" runat="server">
    <ContentTemplate>
        <div id="Div11" class="box-a">
            <div class="consub-a">
                <img src="style/img/logo/BlueBubble-Logo.png" style="height:80px;" alt="Bluewater" class="logo" />
                    <asp:GridView ID="GridView5" runat="server" ShowHeader="false" AutoGenerateColumns="False" CssClass="table" AllowSorting="true" Visible="false">
                    <Columns>
                        <asp:BoundField DataField="jobtype_id" ItemStyle-Font-Size="0px" HeaderStyle-Width="0px"/>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:LinkButton ID="lnkEdit" OnClick="view_buble" runat="server" Text='<%# Bind("job_type") %>' ></asp:LinkButton>
                                (<asp:Label ID="lbl_cnt" runat="server" Text='<%# Bind("cnnt") %>'></asp:Label>)
                            </ItemTemplate>
                        </asp:TemplateField>  
                    </Columns>
                </asp:GridView>
            </div>
            <div class="consub-c">
                <h3><asp:Label ID="Label5" runat="server"></asp:Label></h3> 
                <asp:Label ID="Label6" runat="server" Text=""></asp:Label> 
                <asp:GridView ID="GridView6" runat="server" ShowHeader="false" AutoGenerateColumns="False" CssClass="table" AllowSorting="true">
                    <Columns>
                        <asp:BoundField DataField="id"  ItemStyle-Font-Size="0px" />
                        <asp:TemplateField>
                            <ItemTemplate>
                                <ul>
                                    <li><asp:LinkButton ID="lnkEdit" runat="server" OnClick="goForm" CssClass="tb_hd" ToolTip="BlueBubble-Logo"  Text='<%# Bind("job_subject") %>' ></asp:LinkButton></li>
                                    <li><asp:Label ID="lbl_details" runat="server" CssClass="tb_det" Text='<%# Bind("job_details") %>'></asp:Label></li>
                                    <li style="display:none;"><asp:Label ID="lbl_date" runat="server"  CssClass="tb_date" ForeColor="Gray" Text='<%# Bind("date") %>'></asp:Label></li>
                                    <li style="display:none;"><asp:LinkButton ID="LinkButton1" runat="server"  Text="Read more..." Font-Size="12px" ForeColor="Red" ></asp:LinkButton></li>
                                </ul>
                            </ItemTemplate>
                        </asp:TemplateField>   
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </ContentTemplate>
</asp:UpdatePanel>

</div>
        <asp:TextBox ID="TextBox1" Visible="false" runat="server"></asp:TextBox>
        <asp:HiddenField ID="hd_logo" runat="server" />
    </form>
</body>
</html>