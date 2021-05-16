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
						<li class="active"><a href="/Web/trang-chu/">TRANG CHỦ</a></li>
						<li><a
							href="/Web/trang-chu/san-pham?trang=1&thuongHieu=&timKiem=">SHOP</a></li>
						<li><a href="./contact.html">LIÊN HỆ</a></li>
					</ul>
				</nav>
				<div id="mobile-menu-wrap"></div>
			</div>
		</div>
	</header>
	<!-- Header End -->

	<div class="breacrumb-section">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="breadcrumb-text product-more">
						<a href="/Web/trang-chu/"><i class="fa fa-home"></i> Trang chủ</a> <a
							href="/Web/trang-chu/gio-hang">Giỏ hàng</a> <span>Trang thanh toán</span>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Breadcrumb Section Begin -->

	<!-- Shopping Cart Section Begin -->
	<section class="checkout-section spad">
		<div class="container">
			<form action="#" class="checkout-form">
				<div class="row">
					<div class="col-lg-6">
						<div class="checkout-content">
							<a href="/Web/trang-chu/san-pham?trang=1&thuongHieu=&timKiem=" class="content-btn">Tiếp tục mua sắm</a>
						</div>
						<h4>Thông tin hoá đơn</h4>
						<div class="row">
							<div class="col-lg-12">
								<label><i>Thông tin khách hàng</i></label>
								<hr>
							</div>

							<div class="col-lg-12">
								<label for="cun-name">Tên</label> <input type="text"
									id="cun-name" value="${sessionScope.UserSession.accInfor.name }">
							</div>
							<div class="col-lg-6">
								<label for="email">Email Address<span>*</span></label> <input
									type="text" id="email" value="${sessionScope.UserSession.accInfor.email }">
							</div>
							<div class="col-lg-6">
								<label for="phone">Phone<span>*</span></label> <input
									type="text" id="phone" value="${sessionScope.UserSession.accInfor.email }">
							</div>

							<div class="col-lg-12 mt-3">
								<label><i>Địa chỉ giao hàng</i></label>
								<hr>
							</div>
							<div class="col-lg-12">
								<label for="city">Tỉnh\ Thành phố<span>*</span></label> <select
									id="city">
									<option>Tp.Hồ Chí Minh</option>
									<option>Bình Dương</option>
								</select>
							</div>
							<div class="col-lg-12">
								<label for="ward">Quận\ Huyện\ Thị xã<span>*</span></label> <select
									id="ward">
									<option>Quận 1</option>
									<option>Quận 2</option>
								</select>
							</div>
							<div class="col-lg-12">
								<label for="commune">Xã\ Phường\ Thị trấn<span>*</span></label>
								<select id="commune" name="maDiaChi">
									<option value="1">Quận 1</option>
									<option value="2">Quận 2</option>
								</select>
							</div>
						</div>
					</div>
					<div class="col-lg-6">
						<div class="checkout-content">
							<input type="text" placeholder="Nhập mã khuyến mãi"
								style="margin-bottom: 0;" id="discountCode" name="maGiamGia">
							<div style="width: 100%; display: flex;">
								<button class="site-btn"
									style="width: 100%; text-align: center;" id="btnCheckDiscount"
									onclick="sendDiscountCodeHandler()">SỬ DỤNG MÃ</button>
							</div>
						</div>
						<div class="place-order">
							<h4>Chi tiết mua hàng</h4>
							<div class="order-total">
								<ul class="order-table">
									<li>Sản phẩm <span>Thành tiền</span></li>
									<c:forEach var="item" items="${sessionScope.cart.lstItem }">
										<li class="fw-normal">${item.pro.name } - ${item.color.name } x ${item.amount } <span>${item.value }</span></li>
									</c:forEach>
									<li class="total-price">Total <span>${sessionScope.cart.totalValue }</span></li>
								</ul>
							</div>
						</div>
					</div>
					<div class="col-lg-12">
						<div class="checkout-content">
							<button type="submit" class="site-btn place-btn mt-4"
								style="width: 100%;">XÁC NHẬN MUA HÀNG</button>
						</div>
					</div>
				</div>
			</form>
		</div>
	</section>

	<!-- Footer Section Begin -->
	<footer class="footer-section">
		<div class="container">
			<div class="row">
				<div class="col-lg-3">
					<div class="footer-left">
						<div class="footer-logo">
							<a href="#">LV Shop</a>
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
						<h5>Về chúng tôi</h5>
						<ul>
							<li><a href="#">Chính sách</a></li>
							<li><a href="#">Liên hệ</a></li>
						</ul>
					</div>
				</div>
				<div class="col-lg-2">
					<div class="footer-widget">
						<h5>Tài khoản</h5>
						<ul>
							<li><a href="#">Thông tin</a></li>
							<li><a href="#">Giỏ hàng</a></li>
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