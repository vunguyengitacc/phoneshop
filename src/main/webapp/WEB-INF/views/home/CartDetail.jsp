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
								class="fa fa-user"></i>Đăng nhập</a>
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
							<a href="/Web/trang-chu/" style="font-size: 1.4rem;"> HLV
								SHOP </a>
						</div>
					</div>
					<div class="col-lg-7 col-md-7">
						<div class="advanced-search">
							<button type="button" class="category-btn">Tìm sản phẩm</button>
							<form class="input-group" action="/Web/trang-chu/san-pham">
								<input type="hidden" value="1" name="trang"> <input
									type="hidden" value="" name="thuongHieu"> <input
									type="hidden" value="1" name="sapXep"> <input
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
				<nav class="nav-menu mobile-menu">
					<ul>
						<li class="active"><a href="/Web/trang-chu/">TRANG CHỦ</a></li>
						<li><a
							href="/Web/trang-chu/san-pham?trang=1&thuongHieu=&timKiem=&sapXep=1">SHOP</a></li>
						<li><a href="./contact.html">LIÊN HỆ</a></li>
						<li><a href="/Web/trang-chu/ma-giam-gia?trang=1&sapXep=1">KHUYẾN
								MÃI</a></li>
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
								<form id="addPromotionForm" class="coupon-form">
									<input type="text" id="idPromo" name="idKhuyenMai"
										placeholder="Enter your codes">
									<button type="button" onclick="addPromotionHandler()"
										class="site-btn coupon-btn">Xác thực</button>
								</form>
							</div>
						</div>
						<div class="col-lg-4 offset-lg-4">
							<div class="proceed-checkout">
								<ul>
									<li class="subtotal">Giá ban đầu <span id="subTotalValue">${sessionScope.cart.totalValue }</span></li>
									<li class="cart-total">Tổng cộng <span id="totalValue">${sessionScope.cart.promoValue }</span></li>
								</ul>
								<a href="/Web/trang-chu/gio-hang/thanh-toan" class="proceed-btn">THANH
									TOÁN</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<!-- Cart Detail Section End -->

	<!-- Modal Add Cart	Start-->
	<div class="modal fade" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalCenterTitle" aria-hidden="true"
		id="modalCart">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Thông báo</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body" id="contentForCartAction">...</div>
			</div>
		</div>
	</div>
	<!-- Modal Add Cart	End-->


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
							<li>Địa chỉ: ${shopInfor.address }</li>
							<li>SĐT: ${shopInfor.phone }</li>
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
							<li><a href="/Web/trang-chu/san-pham?timKiem=&thuongHieu=&sapXep=1&trang=1">Sản phẩm</a></li>
							<li><a href="/Web/trang-chu/lien-he">Liên hệ</a></li>
						</ul>
					</div>
				</div>
				<div class="col-lg-2">
					<div class="footer-widget">
						<h5>Tài khoản</h5>
						<ul>
							<li><a href="/Web/trang-chu/trang-ca-nhan">Thông tin</a></li>
							<li><a href="/Web/trang-chu/gio-hang">Giỏ hàng</a></li>
						</ul>
					</div>
				</div>
				<div class="col-lg-4">
					<div class="newslatter-item">
						<h5>Phản hồi với chúng tôi</h5>
						<p>Gửi email để chúng tôi có thể tiếp nhận ý kiến của
							bạn</p>
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
				url: "/Web/trang-chu/api/gio-hang?idMau="+y+"&idSanPham="+z+"&soLuong=0&thayDoiSoLuong="+x,
				type: 'PUT', 
				success: function(response){
					var objJson = JSON.parse(response);
					if(objJson.status == "2"){
						$("#contentForCartAction").html("Cập nhật thất bại");
						$("#modalCart").modal('show');
					}
					else{
						$("#"+t).html(objJson.newItemValue);
						$("#amountItemCart").html(objJson.totalItem);
						$("#amountValueCart").html(objJson.totalValue);
						$("#subTotalValue").html(objJson.totalValue);
						$("#totalValue").html(objJson.promoValue);
					}
				},
				error: function(error){
					$("#contentForCartAction").html("Đã xảy ra lỗi");
					$("#modalCart").modal('show');
				}
			})
		}
		function sendAsync(x, y, z){
			$.ajax({
				url: "/Web/trang-chu/api/gio-hang/item?idSanPham="+x+"&idMau="+y,
				type: 'DELETE',
				success: function(response){
					var objJson = JSON.parse(response);
					if(objJson.resultDelete == 2){
						$("#contentForCartAction").html("Cập nhật thất bại");
						$("#modalCart").modal('show');
					}
					if(objJson.resultDelete == 1){
						$("#amountItemCart").html(objJson.totalItem);
						$("#amountValueCart").html(objJson.totalValue);
						$("#subTotalValue").html(objJson.totalValue);
						$("#totalValue").html(objJson.totalValue);
						z.remove();
					}
				},
				error: function(error){
					$("#contentForCartAction").html("Đã xảy ra lỗi");
					$("#modalCart").modal('show');
				}
			})
		}
		
		function addPromotionHandler() {
			var input = $("#idPromo");
			var regEx = /^\w{8,}$/gi;
			if(!regEx.test(input.val())){
				$("#contentForCartAction").html("Nhập sai định dạng mã");
				$("#modalCart").modal('show');
				if(input.val()!="")
					return;
			}
			$.ajax({
				url: "/Web/trang-chu/api/gio-hang/ma-khuyen-mai?" + $("#addPromotionForm").serialize(),
				type: 'PUT',
				success: function(response){
					var objJson = JSON.parse(response);
					if(objJson.status == 0){
						$("#amountItemCart").html(objJson.totalItem);
						$("#amountValueCart").html(objJson.totalValue);
						$("#subTotalValue").html(objJson.totalValue);
						$("#totalValue").html(objJson.promoValue);
					}
					else if(objJson.status == 1){
						$("#contentForCartAction").html("Thêm thành công");
						$("#modalCart").modal('show');
						$("#amountItemCart").html(objJson.totalItem);
						$("#amountValueCart").html(objJson.totalValue);
						$("#subTotalValue").html(objJson.totalValue);
						$("#totalValue").html(objJson.promoValue);
					}
					else if(objJson.status == 2){
						$("#contentForCartAction").html("Mã đã dùng");
						$("#modalCart").modal('show');
					}
					else if(objJson.status == 3){
						$("#contentForCartAction").html("Chưa đăng nhập");
						$("#modalCart").modal('show');
					}
					else if(objJson.status == 4){
						$("#contentForCartAction").html("Mã không tồn tại");
						$("#modalCart").modal('show');
					}
				},
				error: function(error){
					$("#contentForCartAction").html("Đã xảy ra lỗi");
					$("#modalCart").modal('show');
				}
			})
		}
	</script>
</body>

</html>