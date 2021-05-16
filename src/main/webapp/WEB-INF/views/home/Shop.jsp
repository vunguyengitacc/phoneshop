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
</head>

<body>
	<!-- Header Section Begin -->
	<header class="header-section">
		<div class="header-top">
			<div class="container">
				<div class="ht-left">
					<div class="mail-service">
						<i class=" fa fa-envelope"></i> lvshop@gmail.com
					</div>
					<div class="phone-service">
						<i class=" fa fa-phone"></i> +84 00.000.000
					</div>
				</div>
				<div class="ht-right">
					<c:choose>
						<c:when test="${sessionScope.UserSession == null }">
							<a href="#" class="login-panel"><i class="fa fa-user"></i>Đăng
								nhập</a>
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
							<a href="/Web/trang-chu/"> LV SHOP </a>
						</div>
					</div>
					<div class="col-lg-7 col-md-7">
						<div class="advanced-search">
							<button type="button" class="category-btn">Tìm sản phẩm</button>
							<form class="input-group" action="/Web/trang-chu/san-pham">
								<input type="hidden" value="1" name="trang"> <input
									type="hidden" value="" name="thuongHieu"> <input
									type="text" placeholder="Bạn muốn tìm gì?" name="timKiem">
								<button type="submit">
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
				<div class="nav-depart">
					<div class="depart-btn">
						<i class="ti-menu"></i> <span>Thương hiệu</span>
						<ul class="depart-hover">
							<c:forEach var="item" items="${lstTradeMark }">
								<li><a
									href="/Web/trang-chu/san-pham?trang=1&thuongHieu=${item.name }&timKiem=">${item.name }</a></li>
							</c:forEach>
						</ul>
					</div>
				</div>
				<nav class="nav-menu mobile-menu">
					<ul>
						<li><a href="/Web/trang-chu/">TRANG CHỦ</a></li>
						<li class="active"><a
							href="/Web/trang-chu/san-pham?trang=1&thuongHieu=&timKiem=">SHOP</a></li>
						<li><a href="./contact.html">LIÊN HỆ</a></li>
					</ul>
				</nav>
				<div id="mobile-menu-wrap"></div>
			</div>
		</div>
	</header>
	<!-- Header End -->

	<!-- Breadcrumb Section Begin -->
	<div class="breacrumb-section">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="breadcrumb-text">
						<a href="/Web/trang-chu/"><i class="fa fa-home"></i> Trang chủ</a>
						<span>Trang sản phẩm</span>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Breadcrumb Section Begin -->

	<!-- Product Shop Section Begin -->
	<section class="product-shop spad">
		<div class="container">
			<div class="row">
				<div
					class="col-lg-3 col-md-6 col-sm-8 order-2 order-lg-1 produts-sidebar-filter">
					<div class="filter-widget">
						<h4 class="fw-title">Thương hiệu</h4>
						<ul class="filter-catagories">
							<c:forEach var="item" items="${lstTradeMark }">
								<li><a
									href="/Web/trang-chu/san-pham?trang=1&thuongHieu=${item.name }&timKiem=">${item.name }</a></li>
							</c:forEach>
						</ul>
					</div>
				</div>
				<div class="col-lg-9 order-1 order-lg-2">
					<div class="product-show-option">
						<div class="row">
							<div class="col-lg-7 col-md-7"></div>
							<div class="col-lg-5 col-md-5 text-right">
								<p>Tìm thấy ${count } sản phẩm</p>
							</div>
						</div>
					</div>
					<div class="product-list">
						<div class="row">

							<c:forEach var="item" items="${lstPro }">
								<div class="col-lg-3 col-sm-6">
									<div class="product-item">
										<div class="pi-pic">
											<c:choose>
												<c:when test="${item.image == null }">
													<img src="<c:url value="/resources/default.png"/>" alt=""
														style="height: 40vh;">
												</c:when>
												<c:otherwise>
													<img src="<c:url value="${item.image }"/>" alt=""
														style="height: 40vh;">
												</c:otherwise>
											</c:choose>
											<c:if test="${item.promotionPrice != '0.00' }">
												<div class="sale pp-sale">Khuyến mãi</div>
											</c:if>
											<ul>
												<li class="quick-view"><a
													href="/Web/trang-chu/san-pham/${item.name }?id=${item.id }">+
														Xem chi tiết</a></li>

											</ul>
										</div>
										<div class="pi-text">
											<div class="catagory-name">${item.trademark.name }</div>
											<a href="#">
												<h5
													style="height: 13vh; overflow: hidden; display: flex; flex-wrap: wrap; align-content: center; justify-content: center;">
													${item.name }</h5>
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
						<div class="pagination">
							<ul>
								<li><a
									href="/Web/trang-chu/san-pham?trang=1&thuongHieu=${param.thuongHieu}&timKiem=">&lsaquo;&lsaquo;</a></li>
								<li><c:choose>
										<c:when test="${currentPage > 1 }">
											<a
												href="/Web/trang-chu/san-pham?trang=${currentPage - 1 }&thuongHieu=${param.thuongHieu}&timKiem=">&lsaquo;</a>
										</c:when>
										<c:otherwise>
											<a href="#">&lsaquo;</a>
										</c:otherwise>
									</c:choose></li>

								<c:if test="${currentPage >= 3 }">
									<li><a href="#">...</a></li>
								</c:if>
								<c:if test="${currentPage > 1 }">
									<li><a
										href="/Web/trang-chu/san-pham?trang=${currentPage - 1 }&thuongHieu=${param.thuongHieu}&timKiem=">${currentPage-1 }</a></li>
								</c:if>
								<li><a href="#">${currentPage } </a></li>
								<c:if test="${currentPage < pageCount }">
									<li><a
										href="/Web/trang-chu/san-pham?trang=${currentPage + 1 }&thuongHieu=${param.thuongHieu}&timKiem=">${currentPage +1 }</a></li>
								</c:if>
								<c:if test="${currentPage < pageCount-1 }">
									<li><a href="#">...</a></li>
								</c:if>
								<li><c:choose>
										<c:when test="${currentPage < pageCount }">
											<a
												href="/Web/trang-chu/san-pham?trang=${currentPage + 1 }&thuongHieu=${param.thuongHieu}&timKiem=">&rsaquo;</a>
										</c:when>
										<c:otherwise>
											<a href="#">&rsaquo;</a>
										</c:otherwise>
									</c:choose></li>
								<li><a
									href="/Web/trang-chu/san-pham?trang=${pageCount }&thuongHieu=${param.thuongHieu}&timKiem=">&rsaquo;&rsaquo;</a></li>
							</ul>
						</div>

					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Footer Section Begin -->
	<footer class="footer-section">
		<div class="container">
			<div class="row">
				<div class="col-lg-3">
					<div class="footer-left">
						<div class="footer-logo">
							<a href="#"><img
								src="<c:url value="/template/Home/img/footer-logo.png"/>" alt=""></a>
						</div>
						<ul>
							<li>Địa chỉ: Khu công nghệ cao quận 9, Tp. Hồ Chí Minh</li>
							<li>SĐT: +84 00.000.000</li>
							<li>Email: lvshop@gmail.com</li>
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
						<h5>Information</h5>
						<ul>
							<li><a href="#">About Us</a></li>
							<li><a href="#">Checkout</a></li>
							<li><a href="#">Contact</a></li>
						</ul>
					</div>
				</div>
				<div class="col-lg-2">
					<div class="footer-widget">
						<h5>My Account</h5>
						<ul>
							<li><a href="#">My Account</a></li>
							<li><a href="#">Shopping Cart</a></li>
							<li><a href="#">Shop</a></li>
						</ul>
					</div>
				</div>
				<div class="col-lg-4">
					<div class="newslatter-item">
						<h5>Phản hồi với chúng tôi</h5>
						<a href="#">Gửi email để chúng tôi có thể tiếp nhận ý kiến của
							bạn.</a>
					</div>
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