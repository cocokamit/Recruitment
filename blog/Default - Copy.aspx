<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="blog_Default" %>
<%@ Import Namespace="System.Data" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Bluewater</title>
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <link rel="stylesheet" href="../vendors/bootstrap/dist/css/bootstrap.min.css" />
    <link rel="stylesheet" href="../vendors/font-awesome/css/font-awesome.min.css" />
    <link rel="stylesheet" href="../../dist/css/AdminLTE.min.css" />

    <link href="./css" rel="stylesheet">
    <link rel="stylesheet" href="./slick-theme.css">
	<link rel="stylesheet" href="./slick.css">
	<link rel="stylesheet" href="./style.css">
</head>
<body>
    <form id="form1" runat="server">
        <div class="box-body">
              <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
                <ol class="carousel-indicators">
                  <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                  <li data-target="#carousel-example-generic" data-slide-to="1" class=""></li>
                  <li data-target="#carousel-example-generic" data-slide-to="2" class=""></li>
                </ol>
                <div class="carousel-inner">
                  <div class="item active">
                    <img src="style/img/slider/Banner-1.jpg " alt="First slide">
                  </div>
                  <div class="item">
                    <img src="style/img/slider/Banner-2.jpg" alt="Second slide">
                  </div>
                  <div class="item">
                    <img src="style/img/slider/Banner-3.jpg" alt="Third slide">
                  </div>
                </div>
                <a class="left carousel-control" href="#carousel-example-generic" data-slide="prev">
                  <span class="fa fa-angle-left"></span>
                </a>
                <a class="right carousel-control" href="#carousel-example-generic" data-slide="next">
                  <span class="fa fa-angle-right"></span>
                </a>
              </div>
        </div>

    <div class="kotha-default-content">
	<div class="container">
		<div class="row">
            <div class="col-sm-12">
                <div class="site-header-main">
				    <div class="site-branding pull-left">
                        <h2 class="site-title no-margin"><a href="blog" rel="home">JOBS AT BLUEWATER RESORTS</a></h2>
                        <p class="site-description small" style="margin-left:5px">Our people is our brand.</p>
                    </div>
                    <div class="collapse navbar-collapse pull-right" id="navbar-collapse">
                        <ul class="nav navbar-nav">
                            <li class="active"><a href="blog?category=referral-program">Referral Program</a></li>
                            <li><a href="blog?category=employee-events">Employee Events</a></li>
                            <li><a href="blog" class="fa fa-home" style=" font-size:larger"></a></li>
                        </ul>
                    </div>
                </div>
            </div>

			<div class="col-sm-8">
                <% 
                    DataTable dt = (DataTable)ViewState["post"];
                    if (dt.Rows.Count > 0)
                    {
                        foreach (DataRow row in dt.Rows)
                        {
                 %>
                        <article class="single-blog">
	                        <div class="post-thumb">
		                        <a href="#"><img src="blogger/upload/<%= row["id"] %>.jpg" alt=""></a>
	                        </div>
	                        <div class="post-content">
		                        <div class="entry-header text-center text-uppercase">
			                        <h2><a href="javascript:void(0)"><%= row["subject"]%></a></h2>
		                        </div>
		                        <div class="entry-content">
                                    <p><%= row["featured"]%></p>

                                <% if (Request.QueryString["title"] != null)
                                   { %>

			                         <%= row["description"]%>

                                     <% } %>
		                        </div>
                                 <% if (Request.QueryString["title"] == null)
                                    { %>
                                 <div class="continue-reading text-center text-uppercase">
			                        <a href="blog?title=<%= row["subject"].ToString().Trim().Replace(" ","-") %>">Continue Reading</a>
		                        </div>
                                 <% } %>

		                        
		                        <div class="post-meta">
			                        <ul class="pull-left list-inline author-meta">
				                        <li class="date"> On <%= row["entry_date"]%></li>
			                        </ul>
		                        </div>
	                        </div>
                        </article>
                
                 <%     }
                    }
                    else { 
                    
                    %>
                     <div class="alert btn-primary alert-dismissible">
                        <p class="no-margin"><i class="icon fa fa-info-circle"></i> No data found.</p>
                     </div>
                    <%
                    
                    } %>
				
     
			</div>
			<div class="col-sm-4">
				<div class="kotha-sidebar">
                    <aside class="widget widget-popular-post text-center">
                         <a href="blog"><img src="style/img/clogo.png" alt="Alternate Text" /></a>
						<ul>
							 <li></li>
							<li><a href="##" class="popular-img"><img src="./p-2.jpg" alt="">
							</a>
								<div class="p-content">
									<h4 style=" font-size:18px">JOBS AT BLUEWATER RESORTS</h4>
                                    <a href="recruitment" class="text-uppercase text-center btn btn-block btn-primary">Apply here</a>
								</div>
							</li>
						</ul>
					</aside>
					<aside class="widget news-letter-widget">
						<h2 class="widget-title text-uppercase text-center">Search Post</h2>
						<form action="##">
                            <asp:TextBox ID="tb_search" runat="server" placeholder="search keyword" OnTextChanged="click_search" CssClass="search" ></asp:TextBox>
							<input type="submit" value="Search" class="text-uppercase text-center btn btn-subscribe">
						</form>
					</aside>
					<aside class="widget latest-post-widget">
						<h2 class="widget-title text-uppercase text-center">Latest Posts</h2>
						<ul>
                            <%
                                dt = (DataTable)ViewState["latest"];
                                 foreach (DataRow row in dt.Rows)
                                 {%>
                                 
                                 <li class="media">
								    <div class="latest-post-content">
									    <h2 class="text-uppercase"><a href="blog?title=<%= row["subject"].ToString().Trim().Replace(" ","-") %>"><%= row["subject"] %></a></h2>
									    <p><%= row["entry_date"]%></p>
								    </div>
							    </li>

                                 <%
                                    
                                 }
                            %>
 
						</ul>
					</aside>
					<aside class="widget insta-widget hide">
						<h2 class="widget-title text-uppercase text-center">INSTAGRAM FEED</h2>
						<div class="instagram-feed">
							<div class="single-instagram">
								<a href="#">
									<img src="./ft-insta-1.jpg" alt="">
								</a>
								<div class="insta-overlay">
									<div class="insta-meta">
										<ul class="list-inline text-center">
											<li><a href="#"><i class="fa fa-heart-o"></i></a> 325</li>
											<li><a href="#"><i class="fa fa-comment-o"></i></a> 20</li>
										</ul>
									</div>
								</div>
								<a href="#" class="insta-link"></a>
							</div>
							<div class="single-instagram">
								<a href="#">
									<img src="./ft-insta-6.jpg" alt="">
								</a>
								<div class="insta-overlay">
									<div class="insta-meta">
										<ul class="list-inline text-center">
											<li><a href="#"><i class="fa fa-heart-o"></i></a> 325</li>
											<li><a href="#"><i class="fa fa-comment-o"></i></a> 20</li>
										</ul>
									</div>
								</div>
								<a href="#" class="insta-link"></a>
							</div>
							<div class="single-instagram">
								<a href="#">
									<img src="./ft-insta-4.jpg" alt="">
								</a>
								<div class="insta-overlay">
									<div class="insta-meta">
										<ul class="list-inline text-center">
											<li><a href="#"><i class="fa fa-heart-o"></i></a> 325</li>
											<li><a href="#"><i class="fa fa-comment-o"></i></a> 20</li>
										</ul>
									</div>
								</div>
								<a href="#" class="insta-link"></a>
							</div>
							<div class="single-instagram">
								<a href="#">
									<img src="./ft-insta-3.jpg" alt="">
								</a>
								<div class="insta-overlay">
									<div class="insta-meta">
										<ul class="list-inline text-center">
											<li><a href="#"><i class="fa fa-heart-o"></i></a> 325</li>
											<li><a href="#"><i class="fa fa-comment-o"></i></a> 20</li>
										</ul>
									</div>
								</div>
								<a href="#" class="insta-link"></a>
							</div>
							<div class="single-instagram">
								<a href="#">
									<img src="./ft-insta-7.jpg" alt="">
								</a>
								<div class="insta-overlay">
									<div class="insta-meta">
										<ul class="list-inline text-center">
											<li><a href="#"><i class="fa fa-heart-o"></i></a> 325</li>
											<li><a href="#"><i class="fa fa-comment-o"></i></a> 20</li>
										</ul>
									</div>
								</div>
								<a href="#" class="insta-link"></a>
							</div>
							<div class="single-instagram">
								<a href="#">
									<img src="./ft-insta-8.jpg" alt="">
								</a>
								<div class="insta-overlay">
									<div class="insta-meta">
										<ul class="list-inline text-center">
											<li><a href="#"><i class="fa fa-heart-o"></i></a> 325</li>
											<li><a href="#"><i class="fa fa-comment-o"></i></a> 20</li>
										</ul>
									</div>
								</div>
								<a href="#" class="insta-link"></a>
							</div>
						</div>
					</aside>
					<aside class="widget add-widget hide">
						<h2 class="widget-title text-uppercase text-center">Advertisement</h2>

						<div class="add-image">
							<a href="#"><img src="./add-image.jpg" alt=""></a>
						</div>
					</aside>
				</div>
			</div>
		</div>
	</div>
</div>
    </form>

 
<!-- jQuery 3 -->
  <script src="vendors/jquery/dist/jquery.min.js"></script>
  <!-- Bootstrap 3.3.7 -->
  <script src="vendors/bootstrap/dist/js/bootstrap.min.js"></script>
  <!-- FastClick -->
  <script src="vendors/fastclick/lib/fastclick.js"></script>
  <!-- AdminLTE App -->
  <script src="dist/js/adminlte.min.js"></script>
  <!-- AdminLTE for demo purposes -->
  <script src="dist/js/demo.js"></script>
   
</body>
</html>
