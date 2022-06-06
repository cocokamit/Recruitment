<%@ Page Title="" Language="C#" MasterPageFile="~/content/website.master" AutoEventWireup="true" CodeFile="vacancy.aspx.cs" Inherits="site_jobs" %>
<%@ import Namespace="System.Data" %>

<asp:Content ID="head" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .main ul li{ list-style-type:disc; list-style-position: inside; color:Black}
        .bg-title-page {min-height:300px}
        .vacancy { width:100%}
        .vacancy, .vacancy td {border:none}
    </style>
   
</asp:Content>
<asp:Content ID="content" ContentPlaceHolderID="content" Runat="Server">
	<!-- Title Page -->
	<section class="bg-title-page flex-c-m p-t-160 p-b-80 p-l-15 p-r-15" style="background-image: url(site/images/150994999497392100.jpg);">
	</section>

	<!-- Content page -->
	<section>
 
		<div class="container">
			<div class="row">
                <div class="col-md-4 col-lg-3">
					<div class="p-t-30 p-b-124 bo5-r h-full p-r-50 p-r-0-md bo-none-md">
                         <div class="row">
                              <h4 class="txt33 p-b-20 p-t-0">Filter</h4>
                              <!-- Search -->
						    
                        </div>
                            <div class="row">
                               <div class="search-sidebar2 size12 bo2 pos-relative">
                                <asp:TextBox ID="tbSearch" runat="server" OnTextChanged="searchJob" CssClass="input-search-sidebar2 txt10 p-l-20 p-r-55" placeholder="Search"></asp:TextBox>
                                <asp:LinkButton ID="lblSearch" runat="server" OnClick="searchJob" CssClass="btn-search-sidebar2 flex-c-m ti-search trans-0-4" ></asp:LinkButton>
						    </div>

								<span class="txt9 p-t-20">
									Property
								</span>
								<div class="wrap-inputtime size12 bo2 bo-rad-10 m-t-3 m-b-23">
									<!-- Select2 -->
                                   <asp:DropDownList ID="ddl_property" runat="server" CssClass="selection-1" AutoPostBack="true" OnTextChanged="changeProperty">
                                        <asp:ListItem Value="0">All</asp:ListItem>
                                    </asp:DropDownList>
								</div>

                                <span class="txt9">
									Categories
								</span>
								<div class="wrap-inputtime size12 bo2 bo-rad-10 m-t-3 m-b-23">
									<asp:DropDownList ID="ddlCategories" runat="server" AutoPostBack="true" OnTextChanged="changeCategory" CssClass="selection-1">
                                        <asp:ListItem Value="0" disabled Selected>All</asp:ListItem>
                                    </asp:DropDownList>
								</div>
							   
						</div>
 
						<div class="popular">
							
                            <asp:GridView ID="gvProperty" runat="server" ShowHeader="false" AutoGenerateColumns="False" AllowSorting="true" CssClass="job-categories" >
                                <Columns>
                                    <asp:BoundField DataField="id" ItemStyle-CssClass="none" HeaderStyle-CssClass="none"/>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:CheckBox ID="cbProperty" runat="server" />
											<%# Eval("description") %>
                                        </ItemTemplate>
                                    </asp:TemplateField>  
                                </Columns>
                            </asp:GridView>
						</div>
					</div>
				</div>
            
            
                <div class="col-md-8 col-lg-9">
				    <div class="sidebar2 p-t-30 p-b-80 p-l-20 p-l-0-md p-t-0-md">
						<div class="blo4 p-b-63">
                            <div id="pnlSearchResult" runat="server" class="pic-blo4 hov-img-zoom bo-rad-10 pos-relative p-t-40">
								 <h4 class="txt5 m-b-18" >
						            SEARCH RESULT FOR 
                                    <span style="font-style:italic; color:#2783ab">"<asp:Label ID="lblKey" runat="server"></asp:Label>"</span>
					            </h4>
							</div>

							<div class="text-blo4 p-t-40">
                                <asp:GridView ID="grid_subject" runat="server"   ShowHeader="false" AutoGenerateColumns="False" CssClass="vacancy">
                                    <Columns>
                                        <asp:BoundField DataField="id" ItemStyle-CssClass="none" HeaderStyle-CssClass="none" />
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <h4 class="p-b-6">
                                                   <asp:LinkButton ID="lblSubject" runat="server" OnClick="clickViewJob" CssClass="tit9">
                                                    <%# Eval("job_subject") %>
                                                    </asp:LinkButton>
								                </h4>
                                                <div class="txt32 flex-w p-b-10">
									                <span><%# Eval("description")%></span>
                                                    <span class="m-r-6 m-l-4">></span>
                                                    <span><%# Eval("job_type")%></span>
								                </div>
                                                <div class="info-box-text">
                                                    <%# (Eval("qualification").ToString().Length > 100) ? (Eval("qualification").ToString().Substring(0, 100) + "...") : Eval("qualification")%>
                                                </div>



                                                <asp:LinkButton ID="lbJobDeatils" runat="server" OnClick="clickViewJob" CssClass="dis-block txt4 m-t-15 p-b-50">
                                                    Continue Reading
                                                    <i class="fa fa-long-arrow-right m-l-10" aria-hidden="true"></i>
                                                </asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>   
                                    </Columns>
                                </asp:GridView>
								
 

								
							</div>
						</div>
					</div>
				</div> 

			</div>
		</div>
	</section>
</asp:Content>
<asp:Content ID="footer" ContentPlaceHolderID="footer" Runat="Server">
 <script type="text/javascript">
     $(document).ready(function () {

         var uri = window.location.toString();

         if (uri.indexOf("?") > 0) {

             var clean_uri = uri.substring(0, uri.indexOf("?"));

             window.history.replaceState({}, document.title, clean_uri);

         }

     });
    </script>
</asp:Content>

