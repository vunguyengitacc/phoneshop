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
									<i class="icon_bag_alt"></i> <span id="amountItemCart">${sessionScope.cart.lstItem.size() }</span>
							</a></li>
							<li class="cart-price" id="amountValueCart">${sessionScope.cart.totalValue }</li>
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

	<!-- Breadcrumb Section Begin -->
	<div class="breacrumb-section">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="breadcrumb-text">
						<a href="/Web/trang-chu/"><i class="fa fa-home"></i> Trang chủ</a>
						<span>Giỏ hàng</span>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Breadcrumb Section Begin -->

	<!-- Cart Detail Section Begin -->

	<section class="shopping-cart spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="cart-table">
						<table>
							<thead>
								<tr>
									<th>Ảnh</th>
									<th class="p-name">Tên sản phẩm</th>
									<th>Màu</th>
									<th>Giá</th>
									<th>Số lượng</th>
									<th>Tổng</th>
									<th><i class="ti-close"></i></th>
								</tr>
							</thead>
							<tbody>
								<c:set var="myVar" value="${0 }" />
								<c:forEach var="item" items="${sessionScope.cart.lstItem }">
									<c:set var="myVar" value="${myVar+1 }" />
									<tr id="item${myVar }">
										<td class="cart-pic first-row"><img
											src="<c:url value="${item.pro.image }"/>" alt=""
											style="height: 15vh"></td>
										<td class="cart-title first-row">
											<h5>${item.pro.name }</h5>
										</td>
										<td class="cart-title first-row">${item.color.name }</td>
										<c:choose>
											<c:when test="${item.pro.promotionPrice =='0.00' }">
												<td class="p-price first-row">${item.pro.price }</td>
											</c:when>
											<c:otherwise>
												<td class="p-price first-row">${item.pro.promotionPrice }</td>
											</c:otherwise>
										</c:choose>
										<td class="qua-col first-row">
											<div class="quantity">
												<div class="pro-qty">
													<input type="number" value="${item.amount }" min=1
														onchange="changeHandler(this.value, ${item.color.id }, ${item.pro.id }, ${myVar })">
												</div>
											</div>
										</td>

										<td class="total-price first-row" id="${myVar }">${item.value }</td>
										<td class="close-td first-row"><i class="ti-close"
											onclick="sendAsync(${item.pro.id}, ${item.color.id }, item${myVar })"></i></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
					<div class="row">
						<div class="col-lg-4">
							<div class="cart-buttons">

								<a href="/Web/trang-chu/san-pham?trang=1&thuongHieu=&timKiem="
									class="primary-btn up-cart">Tiếp tục mua sắm</a>
							</div>
							<div class="discount-coupon">
								<h6>Mã khuyến mãi</h6>
								<form action="#" class="coupon-form">
									<input type="text" placeholder="Enter your codes">
									<button type="submit" class="site-btn coupon-btn">Xác
										thực</button>
								</form>
							</div>
						</div>
						<div class="col-lg-4 offset-lg-4">
							<div class="proceed-checkout">
								<ul>
									<li class="subtotal">Giá ban đầu <span id="subTotalValue">${sessionScope.cart.totalValue }</span></li>
									<li class="cart-total">Tổng cộng <span id="totalValue">${sessionScope.cart.totalValue }</span></li>
								</ul>
								<a href="#" class="proceed-btn">THANH TOÁN</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<!-- Cart Detail Section End -->

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
						<p>Gửi email để chúng tôi có thể tiếp nhận ý kiến của bạn.</p>
						<form action="#" class="subscribe-form">

							<button type="button">THỰC HIỆN</button>
						</form>
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
	<script type="text/javascript">
		function changeHandler(x, y, z, t){
			$.ajax({
				url: "/Web/trang-chu/api/gio-hang/cap-nhat-gio-hang?idMau="+y+"&idSanPham="+z+"&soLuong=0&thayDoiSoLuong="+x,
				type: 'PUT', 
				success: function(response){
					var objJson = JSON.parse(response);
					if(objJson.status == "2")
						alert("Cập nhật thất bại");
					else{
						$("#"+t).html(objJson.newItemValue);
						$("#amountItemCart").html(objJson.totalItem);
						$("#amountValueCart").html(objJson.totalValue);
						$("#subTotalValue").html(objJson.totalValue);
						$("#totalValue").html(objJson.totalValue);	
					}
				},
				error: function(erorr){
					alert("Đã xảy ra lỗi");
				}
			})
		}
		function sendAsync(x, y, z){
			$.ajax({
				url: "/Web/trang-chu//api/gio-hang/xoa-item-gio-hang?idSanPham="+x+"&idMau="+y,
				type: 'DELETE',
				success: function(response){
					var objJson = JSON.parse(response);
					if(objJson.resultDelete == 2)
						alert("Cập nhật thất bại");
					if(objJson.resultDelete == 1){
						$("#amountItemCart").html(objJson.totalItem);
						$("#amountValueCart").html(objJson.totalValue);
						$("#subTotalValue").html(objJson.totalValue);
						$("#totalValue").html(objJson.totalValue);
						z.remove();
					}
				},
				error: function(error){
					console.log(error);
				}
			})
		}
	</script>
</body>

</html>