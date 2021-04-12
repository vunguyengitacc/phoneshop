<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>HVL Shop</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<!--Less styles -->
<!-- /template_Vu/ -->

<!-- Bootstrap style -->
<link id="callCss" rel="stylesheet"
	href="<c:url value="/template/NguyenHoangAnhVu/themes/bootshop/bootstrap.min.css"/>"
	media="screen" />
<link href="<c:url value="/template/NguyenHoangAnhVu/themes/css/base.css"/>"
	rel="stylesheet" media="screen" />
<!-- Bootstrap style responsive -->
<link
	href="<c:url value="/template/NguyenHoangAnhVu/themes/css/bootstrap-responsive.min.css"/>"
	rel="stylesheet" />
<link href="<c:url value="/template/NguyenHoangAnhVu/themes/css/font-awesome.css"/>"
	rel="stylesheet" type="text/css">
<!-- Google-code-prettify -->
<link
	href="<c:url value="/template/NguyenHoangAnhVu/themes/js/google-code-prettify/prettify.css"/>"
	rel="stylesheet" />
<!-- fav and touch icons -->
<link rel="shortcut icon"
	href="<c:url value="/template/NguyenHoangAnhVu/themes/images/ico/favicon.ico"/>">
<link rel="apple-touch-icon-precomposed" sizes="144x144"
	href="<c:url value="/template/NguyenHoangAnhVu/themes/images/ico/apple-touch-icon-144-precomposed.png"/>">
<link rel="apple-touch-icon-precomposed" sizes="114x114"
	href="<c:url value="/template/NguyenHoangAnhVu/themes/images/ico/apple-touch-icon-114-precomposed.png"/>">
<link rel="apple-touch-icon-precomposed" sizes="72x72"
	href="<c:url value="/template/NguyenHoangAnhVu/themes/images/ico/apple-touch-icon-72-precomposed.png"/>">
<link rel="apple-touch-icon-precomposed"
	href="<c:url value="/template/NguyenHoangAnhVu/themes/images/ico/apple-touch-icon-57-precomposed.png"/>">
<style type="text/css" id="enject"></style>
</head>
<body>
	<div id="">
		<div class="container">
			<div id="welcomeLine" class="row">
				<div class="span6">
					Welcome!<strong> User</strong>
				</div>
				<div class="span6">
					<div class="pull-right">
						<span class="btn btn-mini">155.00</span> <a
							href="product_summary.html"><span class="">VNĐ</span></a> <a
							href="product_summary.html"><span
							class="btn btn-mini btn-primary"><i
								class="icon-shopping-cart icon-white"></i> [ 3 ] Giỏ hàng </span> </a>
					</div>
				</div>
			</div>
			<!-- Navbar ================================================== -->
			<div id="logoArea" class="navbar">
				<a id="smallScreen" data-target="#topMenu" data-toggle="collapse"
					class="btn btn-navbar"> <span class="icon-bar"></span> <span
					class="icon-bar"></span> <span class="icon-bar"></span>
				</a>
				<div class="navbar-inner">
					<a class="brand" href="index.html"><p class="text-logo">HVL
							Shop</p></a>
					<form class="form-inline navbar-search" method="post"
						action="products.html">
						<input id="srchFld" class="srchTxt" type="text" />

						<button type="submit" id="submitButton" class="btn btn-primary">Go</button>
					</form>
					<ul id="topMenu" class="nav pull-right">
						<li class=""><a href="<c:url value="/san-pham"/>">Sản phẩm</a></li>
						<li class=""><a href="tac.html">Chính sách</a></li>
						<li class=""><a href="contact.html">Liên hệ</a></li>
						<li class=""><a href="#login" role="button"
							data-toggle="modal" style="padding-right: 0"><span
								class="btn btn-large btn-primary">Login</span></a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<!-- Header End====================================================================== -->

	<div id="mainBody">
		<div class="container">
			<div class="row">
				<!-- Sidebar ================================================== -->
				<div id="sidebar" class="span3">
					<div class="well well-small">
						<a id="myCart" href="product_summary.html"><img
							src="<c:url value="/template/NguyenHoangAnhVu/themes/images/ico-cart.png"/>"
							alt="cart">Giỏ hàng: 0<span
							class="badge badge-warning pull-right">155.000</span></a>
					</div>
					<ul id="sideManu" class="nav nav-tabs nav-stacked">
						<li class="subMenu open"><a> NHÃN HIỆU</a>
							<ul>
								<li><a class="active" href="products.html"><i
										class="icon-chevron-right"></i>iPhone (100) </a></li>
								<li><a href="products.html"><i
										class="icon-chevron-right"></i>Samsung (30)</a></li>
								<li><a href="products.html"><i
										class="icon-chevron-right"></i>Oppo (80)</a></li>
								<li><a href="products.html"><i
										class="icon-chevron-right"></i>VSmart (15)</a></li>
							</ul></li>
					</ul>
					<br />

				</div>
				<!-- Sidebar end=============================================== -->
				<div class="span9">


					<ul class="thumbnails">
						<li class="span3">
							<div class="thumbnail">
								<a href="product_details.html"><img
									src="<c:url value="/template/NguyenHoangAnhVu/themes/images/products/6.jpg"/>" alt="" /></a>
								<div class="caption">
									<h5>Product name</h5>
									<p>Lorem Ipsum is simply dummy text.</p>

									<h4 style="text-align: center">
										<a class="btn" href="product_details.html"> <i
											class="icon-zoom-in"></i></a> <a class="btn" href="#">Add to
											<i class="icon-shopping-cart"></i>
										</a> <a class="btn btn-primary" href="#">$222.00</a>
									</h4>
								</div>
							</div>
						</li>
						<li class="span3">
							<div class="thumbnail">
								<a href="product_details.html"><img
									src="<c:url value="/template/NguyenHoangAnhVu/themes/images/products/7.jpg"/>" alt="" /></a>
								<div class="caption">
									<h5>Product name</h5>
									<p>Lorem Ipsum is simply dummy text.</p>
									<h4 style="text-align: center">
										<a class="btn" href="product_details.html"> <i
											class="icon-zoom-in"></i></a> <a class="btn" href="#">Add to
											<i class="icon-shopping-cart"></i>
										</a> <a class="btn btn-primary" href="#">$222.00</a>
									</h4>
								</div>
							</div>
						</li>
						<li class="span3">
							<div class="thumbnail">
								<a href="product_details.html"><img
									src="<c:url value="/template/NguyenHoangAnhVu/themes/images/products/8.jpg"/>" alt="" /></a>
								<div class="caption">
									<h5>Product name</h5>
									<p>Lorem Ipsum is simply dummy text.</p>
									<h4 style="text-align: center">
										<a class="btn" href="product_details.html"> <i
											class="icon-zoom-in"></i></a> <a class="btn" href="#">Add to
											<i class="icon-shopping-cart"></i>
										</a> <a class="btn btn-primary" href="#">$222.00</a>
									</h4>
								</div>
							</div>
						</li>
						<li class="span3">
							<div class="thumbnail">
								<a href="product_details.html"><img
									src="<c:url value="/template/NguyenHoangAnhVu/themes/images/products/9.jpg"/>" alt="" /></a>
								<div class="caption">
									<h5>Product name</h5>
									<p>Lorem Ipsum is simply dummy text.</p>
									<h4 style="text-align: center">
										<a class="btn" href="product_details.html"> <i
											class="icon-zoom-in"></i></a> <a class="btn" href="#">Add to
											<i class="icon-shopping-cart"></i>
										</a> <a class="btn btn-primary" href="#">$222.00</a>
									</h4>
								</div>
							</div>
						</li>
						<li class="span3">
							<div class="thumbnail">
								<a href="product_details.html"><img
									src="<c:url value="/template/NguyenHoangAnhVu/themes/images/products/10.jpg"/>" alt="" /></a>
								<div class="caption">
									<h5>Product name</h5>
									<p>Lorem Ipsum is simply dummy text.</p>
									<h4 style="text-align: center">
										<a class="btn" href="product_details.html"> <i
											class="icon-zoom-in"></i></a> <a class="btn" href="#">Add to
											<i class="icon-shopping-cart"></i>
										</a> <a class="btn btn-primary" href="#">$222.00</a>
									</h4>
								</div>
							</div>
						</li>
						<li class="span3">
							<div class="thumbnail">
								<a href="product_details.html"><img
									src="<c:url value="/template/NguyenHoangAnhVu/themes/images/products/11.jpg"/>" alt="" /></a>
								<div class="caption">
									<h5>Product name</h5>
									<p>Lorem Ipsum is simply dummy text.</p>
									<h4 style="text-align: center">
										<a class="btn" href="product_details.html"> <i
											class="icon-zoom-in"></i></a> <a class="btn" href="#">Add to
											<i class="icon-shopping-cart"></i>
										</a> <a class="btn btn-primary" href="#">$222.00</a>
									</h4>
								</div>
							</div>
						</li>
					</ul>

				</div>
			</div>
		</div>
	</div>
	<!-- Footer ================================================================== -->
	<div id="footerSection">
		<div class="container">
			<div class="row">
				<div class="span3">
					<h5>ACCOUNT</h5>
					<a href="login.html">YOUR ACCOUNT</a> <a href="login.html">PERSONAL
						INFORMATION</a> <a href="login.html">ADDRESSES</a>
				</div>
				<div class="span3">
					<h5>INFORMATION</h5>
					<a href="contact.html">CONTACT</a> <a href="register.html">REGISTRATION</a>
					<a href="legal_notice.html">LEGAL NOTICE</a> <a href="tac.html">TERMS
						AND CONDITIONS</a>
				</div>
				<div class="span3">
					<h5>OUR OFFERS</h5>
					<a href="#">NEW PRODUCTS</a> <a href="#">TOP SELLERS</a> <a
						href="special_offer.html">SPECIAL OFFERS</a>
				</div>
				<div id="socialMedia" class="span3 pull-right">
					<h5>SOCIAL MEDIA</h5>
					<a href="#"><img width="60" height="60"
						src="<c:url value="/template/NguyenHoangAnhVu/themes/images/facebook.png"/>"
						title="facebook" alt="facebook" /></a> <a href="#"><img
						width="60" height="60"
						src="<c:url value="/template/NguyenHoangAnhVu/themes/images/twitter.png"/>"
						title="twitter" alt="twitter" /></a> <a href="#"><img width="60"
						height="60"
						src="<c:url value="/template/NguyenHoangAnhVu/themes/images/youtube.png"/>"
						title="youtube" alt="youtube" /></a>
				</div>
			</div>
		</div>
		<!-- Container End -->
	</div>
	<!-- Placed at the end of the document so the pages load faster ============================================= -->
	<script src="<c:url value="/template/NguyenHoangAnhVu/themes/js/jquery.js"/>"
		type="text/javascript"></script>
	<script src="<c:url value="/template/NguyenHoangAnhVu/themes/js/bootstrap.min.js"/>"
		type="text/javascript"></script>
	<script
		src="<c:url value="/template/NguyenHoangAnhVu/themes/js/google-code-prettify/prettify.js"/>"></script>

	<script src="<c:url value="/template/NguyenHoangAnhVu/themes/js/bootshop.js"/>"></script>
	<script
		src="<c:url value="/template/NguyenHoangAnhVu/themes/js/jquery.lightbox-0.5.js"/>"></script>
</body>
</html>