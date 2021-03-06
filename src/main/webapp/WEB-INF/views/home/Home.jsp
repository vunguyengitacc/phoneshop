<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="zxx">
<head>
<meta charset="UTF-8">
<meta name="description" content="Fashi Template">
<meta name="keywords" content="Fashi, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>LV Shop</title>

<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css?family=Muli:300,400,500,600,700,800,900&display=swap"
	rel="stylesheet">

<!-- Css Styles -->
<link rel="stylesheet"
	href="<c:url value="/template/Home/css/bootstrap.min.css"/>"
	type="text/css">
<link rel="stylesheet"
	href="<c:url value="/template/Home/css/font-awesome.min.css"/>"
	type="text/css">
<link rel="stylesheet"
	href="<c:url value="/template/Home/css/themify-icons.css"/>"
	type="text/css">
<link rel="stylesheet"
	href="<c:url value="/template/Home/css/elegant-icons.css"/>"
	type="text/css">
<link rel="stylesheet"
	href="<c:url value="/template/Home/css/owl.carousel.min.css"/>"
	type="text/css">
<link rel="stylesheet"
	href="<c:url value="/template/Home/css/nice-select.css"/>"
	type="text/css">
<link rel="stylesheet"
	href="<c:url value="/template/Home/css/jquery-ui.min.css"/>"
	type="text/css">
<link rel="stylesheet"
	href="<c:url value="/template/Home/css/slicknav.min.css"/>"
	type="text/css">
<link rel="stylesheet"
	href="<c:url value="/template/Home/css/style.css"/>" type="text/css">
<link rel="stylesheet"
	href="<c:url value="/template/Home/css/success-feature.css"/>"
	type="text/css">
</head>

<body>

	<c:if test="${sessionScope.UserSession.accInfor.type == 0 }">
		<div id="feedback">
			<a href="/Web/admin/quan-li-chung"><i class="fas fa-user-cog"></i>Trang
				admin</a>
		</div>
	</c:if>
	<!-- Header Section Begin -->
	<header class="header-section">
		<div class="header-top">
			<div class="container">
				<div class="ht-left">
					<div class="mail-service">
						<i class=" fa fa-envelope"></i> ${shopInfor.email }
					</div>
					<div class="phone-service">
						<i class=" fa fa-phone"></i> ${shopInfor.phone }
					</div>
				</div>
				<div class="ht-right">
					<c:choose>
						<c:when test="${sessionScope.UserSession == null }">
							<a href="/Web/login" class="login-panel"><i
								class="fa fa-user"></i>????ng nh???p</a>
						</c:when>
						<c:otherwise>
							<a href="/Web/trang-chu/trang-ca-nhan" class="login-panel"><i
								class="fa fa-user"></i>${sessionScope.UserSession.accInfor.username }</a>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</div>
		<div class="container">
			<div class="inner-header">
				<div class="row">
					<div class="col-lg-2 col-md-2">
						<div class="logo">
							<a href="/Web/trang-chu/" style="font-size: 1.4rem;"> LV SHOP
							</a>
						</div>
					</div>
					<div class="col-lg-7 col-md-7">
						<div class="advanced-search">
							<button type="button" class="category-btn">T??m s???n ph???m</button>
							<form class="input-group" action="/Web/trang-chu/san-pham">
								<input type="hidden" value="1" name="trang"> <input
									type="hidden" value="" name="thuongHieu"><input
									type="hidden" value="1" name="sapXep"> <input
									type="text" placeholder="B???n mu???n t??m g???" name="timKiem">
								<button type="button">
									<i class="ti-search"></i>
								</button>
							</form>
						</div>
					</div>
					<div class="col-lg-3 text-right col-md-3">
						<ul class="nav-right">
							<li class="cart-icon"><a href="/Web/trang-chu/gio-hang">
									<i class="icon_bag_alt"></i> <span>${sessionScope.cart.lstItem.size() }</span>
							</a></li>
							<li class="cart-price">${sessionScope.cart.totalValue }</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<div class="nav-item">
			<div class="container">
				<nav class="nav-menu mobile-menu">
					<ul>
						<li class="active"><a href="/Web/trang-chu/">TRANG CH???</a></li>
						<li><a
							href="/Web/trang-chu/san-pham?trang=1&thuongHieu=&timKiem=&sapXep=1">SHOP</a></li>
						<li><a href="/Web/trang-chu/lien-he">LI??N H???</a></li>
						<li><a href="/Web/trang-chu/ma-giam-gia?trang=1&sapXep=1">KHUY???N
								M??I</a></li>
					</ul>
				</nav>
				<div id="mobile-menu-wrap"></div>
			</div>
		</div>
	</header>
	<!-- Header End -->
	<!-- Banner Section Begin -->

	<!-- Banner Section End -->

	<section>

		<div id="myCarousel" class="carousel slide carousel-fade"
			data-ride="carousel">
			<div class="carousel-inner" id="carousel-block">

				<div class="carousel-item active">
					<div class="mask flex-center">
						<div class="container">
							<div class="row align-items-center">
								<div class="col-md-7 col-12 order-md-1 order-2"
									style="padding: 8vw;">
									<h4>S???n ph???m m???i</h4>
									<p>Nh???ng s???n ph???m m???i nh???t c???a ch??ng t??i</p>
									<a
										href="/Web/trang-chu/san-pham?trang=1&timKiem=&thuongHieu=&sapXep=1">?????N
										NGAY</a>
								</div>
								<div class="col-md-5 col-12 order-md-2 order-1">
									<img style="height: 300px; width: 350px"
										src="<c:url value="/template/Home/img/newicon.png"/>"
										class="mx-auto" alt="slide">
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="carousel-item">
					<div class="mask flex-center">
						<div class="container">
							<div class="row align-items-center">
								<div class="col-md-7 col-12 order-md-1 order-2"
									style="padding: 8vw;">
									<h4>S??n sale</h4>
									<p>V?? s??? m?? khuy???n m??i gi??p b???n b???n ti???t ki???m v?? ti???n</p>
									<a href="/Web/trang-chu/ma-giam-gia?trang=1&sapXep=1">?????N
										NGAY</a>
								</div>
								<div class="col-md-5 col-12 order-md-2 order-1">
									<img src="<c:url value="/template/Home/img/sale-logo.png"/>"
										style="height: 300px; width: 350px" class="mx-auto"
										alt="slide">
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="carousel-item">
					<div class="mask flex-center">
						<div class="container">
							<div class="row align-items-center">
								<div class="col-md-7 col-12 order-md-1 order-2"
									style="padding: 8vw;">
									<h4>S???n ph???m hot</h4>
									<p>B???t k???p xu h?????ng c???a m???i ng?????i</p>
									<a
										href="/Web/trang-chu/san-pham?timKiem=&thuongHieu=&sapXep=4&trang=1">?????N
										NGAY</a>
								</div>
								<div class="col-md-5 col-12 order-md-2 order-1">
									<img src="<c:url value="/template/Home/img/top-sell.png"/>"
										style="height: 300px; width: 350px" class="mx-auto"
										alt="slide">
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<a class="carousel-control-prev" href="#myCarousel" role="button"
				data-slide="prev"> <span class="carousel-control-prev-icon"
				aria-hidden="true"></span> <span class="sr-only">Previous</span>
			</a> <a class="carousel-control-next" href="#myCarousel" role="button"
				data-slide="next"> <span class="carousel-control-next-icon"
				aria-hidden="true"></span> <span class="sr-only">Next</span>
			</a>
		</div>
		<!--slide end-->


		<section class="product-shop spad" style="margin-top: 50px; margin-bottom: 100px">
			<div class="container">
				<div class="row">
					<h3 style="margin-bottom: 10vh">S???N PH???M N???I B???T</h3>
					<div class="col-lg-12 order-1 order-lg-2">
						<div class="product-list">
							<div class="row">
								<c:forEach var="item" items="${lstPro }">
									<div class="col-lg-3 col-sm-6">
										<div class="product-item">
											<div class="pi-pic">
												<c:choose>
													<c:when test="${item.image ==null }">
														<img src="<c:url value="/resources/default.png"/>" alt=""
															style="height: 45vh;">
													</c:when>
													<c:otherwise>
														<img src="<c:url value="${item.image }"/>" alt=""
															style="height: 45vh;">
													</c:otherwise>
												</c:choose>
												<c:if test="${item.promotionPrice != '0.00' }">
													<div class="sale pp-sale">Khuy???n m??i</div>
												</c:if>
												<ul>
													<li class="quick-view"><a
														href="/Web/trang-chu/san-pham/${item.name }?id=${item.id }">+
															Xem chi ti???t</a></li>
												</ul>
											</div>
											<div class="pi-text">
												<div class="catagory-name">${item.trademark.name }</div>
												<a href="#">
													<h5>${item.name }</h5>
												</a>
												<c:choose>
													<c:when test="${item.promotionPrice == '0.00' }">
														<div class="product-price">${item.price }</div>
													</c:when>
													<c:otherwise>
														<div class="product-price">${item.promotionPrice }
															<span>${item.price }</span>
														</div>
													</c:otherwise>
												</c:choose>
											</div>
										</div>
									</div>
								</c:forEach>
							</div>
						</div>
						<div class="loading-more">
							<a
								href="/Web/trang-chu/san-pham?trang=1&thuongHieu=&timKiem=&sapXep=1">
								Xem th??m </a>
						</div>
					</div>
				</div>
			</div>
		</section>
	</section>
	<!-- Footer Section Begin -->
	<footer class="footer-section">
		<div class="container">
			<div class="row">
				<div class="col-lg-3">
					<div class="footer-left">
						<div class="footer-logo">
							<a href="#" style="font-size: 1.5rem; color: white;">LV Shop</a>
						</div>
						<ul>
							<li>?????a ch???: ${shopInfor.address }</li>
							<li>S??T: ${shopInfor.phone }</li>
							<li>Email: ${shopInfor.email }</li>
						</ul>
						<div class="footer-social">
							<a href="#"><i class="fa fa-facebook"></i></a> <a href="#"><i
								class="fa fa-instagram"></i></a> <a href="#"><i
								class="fa fa-twitter"></i></a> <a href="#"><i
								class="fa fa-pinterest"></i></a>
						</div>
					</div>
				</div>
				<div class="col-lg-2 offset-lg-1">
					<div class="footer-widget">
						<h5>Shop</h5>
						<ul>
							<li><a
								href="/Web/trang-chu/san-pham?timKiem=&thuongHieu=&sapXep=1&trang=1">S???n
									ph???m</a></li>
							<li><a href="/Web/trang-chu/lien-he">Li??n h???</a></li>
						</ul>
					</div>
				</div>
				<div class="col-lg-2">
					<div class="footer-widget">
						<h5>T??i kho???n</h5>
						<ul>
							<li><a href="/Web/trang-chu/trang-ca-nhan">Th??ng tin</a></li>
							<li><a href="/Web/trang-chu/gio-hang">Gi??? h??ng</a></li>
						</ul>
					</div>
				</div>
				<div class="col-lg-4">
					<div class="newslatter-item">
						<h5>Ph???n h???i v???i ch??ng t??i</h5>
						<p>G???i email ????? ch??ng t??i c?? th??? ti???p nh???n ?? ki???n c???a b???n</p>
					</div>
				</div>
			</div>
		</div>
	</footer>
	<!-- Footer Section End -->

	<!-- Js Plugins -->
	<script src="<c:url value="/template/Home/js/jquery-3.3.1.min.js"/>"></script>
	<script src="<c:url value="/template/Home/js/bootstrap.min.js"/>"></script>
	<script src="<c:url value="/template/Home/js/jquery-ui.min.js"/>"></script>
	<script
		src="<c:url value="/template/Home/js/jquery.countdown.min.js"/>"></script>
	<script
		src="<c:url value="/template/Home/js/jquery.nice-select.min.js"/>"></script>
	<script src="<c:url value="/template/Home/js/jquery.zoom.min.js"/>"></script>
	<script src="<c:url value="/template/Home/js/jquery.dd.min.js"/>"></script>
	<script src="<c:url value="/template/Home/js/jquery.slicknav.js"/>"></script>
	<script src="<c:url value="/template/Home/js/owl.carousel.min.js"/>"></script>
	<script src="<c:url value="/template/Home/js/main.js"/>"></script>
</body>

</html>