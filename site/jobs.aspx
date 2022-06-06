<%@ Page Title="" Language="C#" MasterPageFile="~/content/website.master" AutoEventWireup="true" CodeFile="jobs.aspx.cs" Inherits="site_jobs" %>

<asp:Content ID="head" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .main ul li{ list-style-type:disc; list-style-position: inside; color:Black}
        .bg-title-page {min-height:300px}
        .job-categories { width:100%}
        .job-categories, .job-categories td {border:none}
    </style>
</asp:Content>
<asp:Content ID="content" ContentPlaceHolderID="content" Runat="Server">
	<!-- Title Page -->
	<section class="bg-title-page flex-c-m p-t-160 p-b-80 p-l-15 p-r-15" style="background-image: url(site/images/150994999497392100.jpg);">
	</section>

	<!-- Content page -->
	<section>
        <div class="bread-crumb bo5-b p-t-17 p-b-17">
			<div class="container">
				<a href="vacancies" class="txt27">Job Vacancies</a>
				<span class="txt29 m-l-10 m-r-10">/</span>
                <span class="txt29"><%= ViewState["property"]%></span>
				<span class="txt29 m-l-10 m-r-10">/</span>
                <span class="txt29"><asp:Label ID="lblDept" runat="server"></asp:Label></span>
                <span class="txt29 m-l-10 m-r-10">/</span>
				<span class="txt29"><%= ViewState["postion"]%></span>

			</div>
		</div>

		<div class="container">
			<div class="row">
				<div class="col-md-8 col-lg-9">
					<div class="p-t-0 p-b-124 bo5-r h-full p-r-50 p-r-0-md bo-none-md">
						<div class="blo4 p-b-63">
							<div class="text-blo4 p-t-33">
								<h4 class="p-b-16">
                                    <asp:Label ID="lblPostion" runat="server" CssClass="tit9"></asp:Label>
								</h4>
								<div class="txt32 flex-w p-b-24" style=" display:none">
									<span>
										<asp:Label ID="lblProperty" runat="server"></asp:Label>
										<span class="m-r-6 m-l-4">></span>
									</span>
									<span>
										
									</span>
								</div>
                                <div id="lblDetails" runat="server" class="main"></div>
                                <div class="clearfix p-t-50"></div>
							 <asp:Button ID="btnApply" runat="server" CssClass="btn3 flex-c-m size36 txt11 trans-0-4" Text="Apply" />
							</div>
						</div>
 
					</div>
				</div>

				<div class="col-md-4 col-lg-3">
					<div class="sidebar2 p-t-40 p-b-80 p-l-20 p-l-0-md p-t-0-md">
						<!-- Search -->
						<div class="search-sidebar2 size12 bo2 pos-relative" style=" display:none">
                            <asp:TextBox ID="tbSearch" runat="server" OnTextChanged="search" CssClass="input-search-sidebar2 txt10 p-l-20 p-r-55" placeholder="Search"></asp:TextBox>
                            <asp:LinkButton ID="lblSearch" runat="server" OnClick="search" CssClass="btn-search-sidebar2 flex-c-m ti-search trans-0-4" ></asp:LinkButton>
						</div>
					
                    	<div class="archive">
							<h4 class="txt33 p-b-20 p-t-0">
								Job Categories
							</h4>

                            	<ul>
								<li class="flex-sb-m p-t-8 p-b-8">
									<a href="#" class="txt27" style=" font-weight:bold !important">
                                        All
									</a>

									<span class="txt29" style=" font-weight:bold !important">
										(<asp:LinkButton style="text-decoration:none;"  runat="server" ID="lbl_all"   Font-Size="10"></asp:LinkButton>)
									</span>
								</li>

                            
                            <asp:GridView ID="grid_type" runat="server" ShowHeader="false" AutoGenerateColumns="False" AllowSorting="true" CssClass="job-categories" >
                                <Columns>
                                    <asp:BoundField DataField="jobtype_id" ItemStyle-CssClass="none" HeaderStyle-CssClass="none"/>
                                    <asp:BoundField DataField="loc_id" ItemStyle-CssClass="none" HeaderStyle-CssClass="none"/>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                        <li class="flex-sb-m p-t-8 p-b-8">
                                            <asp:LinkButton ID="lnkEdit" runat="server" Text='<%# Bind("job_type") %>' CssClass="txt27" OnClick="viewCategories"></asp:LinkButton>
									        <span class="txt29">
										        (<asp:Label ID="lbl_cnt" runat="server" Text='<%# Bind("cnnt") %>'></asp:Label>)
									        </span>
								        </li>
                                        </ItemTemplate>
                                    </asp:TemplateField>  
                                </Columns>
                            </asp:GridView>

						

								

							 
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
</asp:Content>
<asp:Content ID="footer" ContentPlaceHolderID="footer" Runat="Server">
</asp:Content>

