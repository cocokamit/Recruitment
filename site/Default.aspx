<%@ Page Title="" Language="C#" MasterPageFile="~/content/website.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="site_Default" %>

<asp:Content ID="head" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .select2-container .select2-selection--single { height:40px}
        .centered-element {
              width: 800px;
              position: absolute;
              left: 50%;
              margin-left: -375px;
              bottom:40px;
              margin-top: 250px;
               z-index:99999; 
            }

.centered-element select { width:100%; padding:8px 5px; background:transparent;}
.centered-element .bnt1 {}
.select2-container .select2-selection--single {border-radius: 5px !important;}
    </style>
</asp:Content>
<asp:Content ID="content" ContentPlaceHolderID="content" Runat="Server">
    <div class="centered-element">
	    <div class="row">
		    <div class="col-md-4">
			    <asp:DropDownList ID="ddl_property" runat="server" CssClass="selection-1" AutoPostBack="true" OnTextChanged="changeProperty">
                    <asp:ListItem Value="0" disabled Selected>Property</asp:ListItem>
                </asp:DropDownList>
		    </div>	

		    <div class="col-md-4">
                <asp:DropDownList ID="ddl_position" runat="server" CssClass="selection-1">
                    <asp:ListItem Value="0" disabled Selected>Position</asp:ListItem>
                </asp:DropDownList>
		    </div>

		    <div class="col-md-4">
                <asp:LinkButton ID="lbSearch" runat="server" OnClick="clickSearch" CssClass="btn1 flex-c-m size1 txt3 trans-0-4 txt-gray"  style="border-radius:5px !important; width:200px; font-family: Montserrat;">Search</asp:LinkButton>
		    </div>
	    </div>
    </div> 
 
     
<!-- Slide1 -->
	<section class="section-slide">
		<div class="wrap-slick1">
			<div class="slick1">
				<div class="item-slick1 item1-slick1" style="background-image: url(site/images/master-slides-02.jpg);">
					<div class="wrap-content-slide1 sizefull flex-col-c-m p-l-15 p-r-15 p-t-150 p-b-170 none">
						<h2 class="caption2-slide1 title tit3 txt1 t-center animated visible-false m-b-37" data-appear="lightSpeedIn" style="font-family:edosz; margin-top:350px; margin-bottom: 10px">
						Jobs at Bluewater Resorts
						</h2>
						<span class="caption1-slide1 tit7 t-center animated visible-false m-b-15" data-appear="fadeInDown" style="font-family: Poppins; color:#fff" >
							Our people is our brand
						</span>
						<div class="wrap-btn-slide1 animated visible-false search" data-appear="zoomIn" >
							<!-- Button1 -->
							<div class="row">
								<div class="col-md-4">
						 
									<select class="selection-1">
										<option>Position</option>
										<option>Chef de Partie</option>
										<option>Personal Assistant to the President</option>
										<option>Carpenter</option>
										<option>Service Captain</option>
										<option>OJT</option>
									</select>
 
								</div>	

								<div class="col-md-4">
									<select class="selection-1">
										<option>Property</option>
										<option>Maribago</option>
										<option>Panglao</option>
										<option>Sumilon</option>
										<option>Amuma</option>
										<option>Almont</option>
									</select>
 
								</div>

								<div class="col-md-4">
									<button type="submit" class="btn1 flex-c-m size1 txt3 trans-0-4" style="width: 100px">
										Search
									</button>
								</div>
							</div>
						</div>
					</div>
				</div>

				<div class="item-slick1 item2-slick1" style="background-image: url(site/images/slide1-01.jpg);">
					<div class="wrap-content-slide1 sizefull flex-col-c-m p-l-15 p-r-15 p-t-150 p-b-170 none">
						<h2 class="caption2-slide1 title tit3 txt1 t-center animated visible-false m-b-37" data-appear="lightSpeedIn" style="font-family:edosz; margin-top:350px; margin-bottom: 10px">
						Jobs at Bluewater Resorts
						</h2>
						<span class="caption1-slide1 tit7 t-center animated visible-false m-b-15" data-appear="fadeInDown" style="font-family: Poppins; color:#fff" >
							Providing the best in Filipino Hospitality
						</span>
						<div class="wrap-btn-slide1 animated visible-false search" data-appear="slideup" >
							<!-- Button1 -->
							<div class="row">
								<div class="col-md-4">
						 
									<select class="selection-1">
										<option>Position</option>
										<option>Chef de Partie</option>
										<option>Personal Assistant to the President</option>
										<option>Carpenter</option>
										<option>Service Captain</option>
										<option>OJT</option>
									</select>
 
								</div>	

								<div class="col-md-4">
									<select class="selection-1">
										<option>Property</option>
										<option>Maribago</option>
										<option>Panglao</option>
										<option>Sumilon</option>
										<option>Amuma</option>
										<option>Almont</option>
									</select>
 
								</div>

								<div class="col-md-4">
									<button type="submit" class="btn1 flex-c-m size1 txt3 trans-0-4" style="width: 100px">
										Search
									</button>
								</div>
							</div>
						</div>
					</div>
				</div>

				<div class="item-slick1 item3-slick1" style="background-image: url(site/images/master-slides-01.jpg);">
					<div class="wrap-content-slide1 sizefull flex-col-c-m p-l-15 p-r-15 p-t-150 p-b-170 none">
						<h2 class="caption2-slide1 title tit3 txt1 t-center animated visible-false m-b-37" data-appear="lightSpeedIn" style="font-family:edosz; margin-top:350px; margin-bottom: 10px">
						Jobs at Bluewater Resorts
						</h2>


						<span class="caption1-slide1 tit7 t-center animated visible-false m-b-15" data-appear="fadeInDown" style="font-family: Poppins; color:#fff" >
							Home is Bluewater
						</span>

						 
						<div class="wrap-btn-slide1 animated visible-false search" data-appear="rotateIn" >
							<!-- Button1 -->
							<div class="row">
								<div class="col-md-4">
						 
									<select class="selection-1">
										<option>Position</option>
										<option>Chef de Partie</option>
										<option>Personal Assistant to the President</option>
										<option>Carpenter</option>
										<option>Service Captain</option>
										<option>OJT</option>
									</select>
 
								</div>	

								<div class="col-md-4">
									<select class="selection-1">
										<option>Property</option>
										<option>Maribago</option>
										<option>Panglao</option>
										<option>Sumilon</option>
										<option>Amuma</option>
										<option>Almont</option>
									</select>
 
								</div>

								<div class="col-md-4">
									<button type="submit" class="btn1 flex-c-m size1 txt3 trans-0-4" style="width: 100px">
										Search
									</button>
								</div>
							</div>
						</div>
					</div>
				</div>

			</div>

			<div class="wrap-slick1-dots"></div>
		</div>
	</section>

<!-- Welcome -->
	<section class="section-welcome bg1-pattern p-t-120 p-b-105">
		<div class="container">
			<div class="row">
				<div class="col-md-12 p-t-45 p-b-30">
					<div class="wrap-text-welcome t-center">
						<h3 class="tit3 t-center m-b-35 m-t-5">
							JOIN OUR TEAM. EXCEL WITH US
						</h3>
						<p class="t-center m-b-22 size3 m-l-r-auto">
							From the shores of Lapu Lapu (Bluewater Maribago), off the coast of Oslob (Bluewater Sumilon), on to the neighboring island of Bohol (Bluewater Panglao), and other company affiliates, our growing family is proud to serve with the warmth of a Filipino home.						</p>

						<a href="about" class="txt4">
							Our Story
							<i class="fa fa-long-arrow-right m-l-10" aria-hidden="true"></i>
						</a>
					</div>
				</div>

 
			</div>
		</div>
	</section>

	<!-- Intro -->
	<section class="section-intro">
		<div class="header-intro parallax100 t-center p-t-135 p-b-158" style="background-image: url(site/images/bg-intro-01.jpg);">
			<h3 class="tit4 t-center p-l-15 p-r-15 p-t-3">
				Explore more of the world and grow with us
			</h3>
		</div>
	</section>

    <!-- MISION VISION -->
    <section class="section-welcome bg-white p-t-120 p-b-105 none">
		<div class="container">
			<div class="row">
				<div class="col-md-6 p-t-45 p-b-30">
					<div class="wrap-text-welcome t-center">
						<h3 class="tit3 t-center m-b-35 m-t-5">
							MISSION
						</h3>

						<p class="t-center m-b-22 size3 m-l-r-auto">
							To be proud champions of Filipino Hospitality						
						</p>

					</div>
				</div>

				<div class="col-md-6 p-b-30">
					<div class="wrap-pic-welcome size2 bo-rad-10 hov-img-zoom m-l-r-auto">
						<img src="site/images/blog-01.jpg" alt="IMG-INTRO">
					</div>
				</div>
			</div>
		</div>
	</section>

    <section class="section-welcome bg1-pattern p-t-120 p-b-105 none">
		<div class="container">
			<div class="row">
				<div class="col-md-6 p-b-30">
					<div class="wrap-pic-welcome size2 bo-rad-10 hov-img-zoom m-l-r-auto">
						<img src="images/blog-01.jpg" alt="IMG-INTRO">
					</div>
				</div>

				<div class="col-md-6 p-t-45 p-b-30">
					<div class="wrap-text-welcome t-center">
						<h3 class="tit3 t-center m-b-35 m-t-5">
							Vision
						</h3>

						<p class="t-center m-b-22 size3 m-l-r-auto">
							To be the favorite resort brand that provides the best in Filipino hospitality and lifestyle experience					
						</p>

					</div>
				</div>

				
			</div>
		</div>
	</section>

	<section class="section-welcome bg-white p-t-120 p-b-105 none">
		<div class="container">
			<div class="row">
				<div class="col-md-6 p-t-45 p-b-30">
					<div class="wrap-text-welcome t-center">
						<h3 class="tit3 t-center m-b-35 m-t-5">
							Core Values
						</h3>

						<p class="t-center m-b-22 size3 m-l-r-auto">
							Love, Care, Respect, Protect, AMUMA					
						</p>

					</div>
				</div>

				<div class="col-md-6 p-b-30">
					<div class="wrap-pic-welcome size2 bo-rad-10 hov-img-zoom m-l-r-auto">
						<img src="site/images/blog-01.jpg" alt="IMG-INTRO">
					</div>
				</div>
			</div>
		</div>
	</section>

</asp:Content>
<asp:Content ID="footer" ContentPlaceHolderID="footer" Runat="Server">
</asp:Content>

