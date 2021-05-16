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
							<a href="#" class="login-panel"><i class="fa fa-user"></i>${sessionScope.UserSession.accInfor.username }</a>
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
						<span> Trang cá nhân</span>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Breadcrumb Section Begin -->

	<!-- Profile Begin -->
	<div class="container">
		<div class="row gutters-sm"
			style="margin-top: 5vh; margin-bottom: 5vh;">
			<div class="col-md-4 d-none d-md-block">
				<div class="card">
					<div class="card-body" style="padding: 0;">
						<nav class="nav flex-column nav-pills nav-gap-y-1">
							<a href="#profile" data-toggle="tab"
								class="nav-link has-icon nav-link-faded active"> <svg
									xmlns="http://www.w3.org/2000/svg" width="24" height="24"
									viewBox="0 0 24 24" fill="none" stroke="currentColor"
									stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
									class="feather feather-user mr-2">
								<path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"></path>
								<circle cx="12" cy="7" r="4"></circle></svg>Thông tin tài khoản
							</a> <a href="#account" data-toggle="tab"
								class="nav-link has-icon nav-link-faded"> <svg
									xmlns="http://www.w3.org/2000/svg" width="24" height="24"
									viewBox="0 0 24 24" fill="none" stroke="currentColor"
									stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
									class="feather feather-settings mr-2">
								<circle cx="12" cy="12" r="3"></circle>
								<path
										d="M19.4 15a1.65 1.65 0 0 0 .33 1.82l.06.06a2 2 0 0 1 0 2.83 2 2 0 0 1-2.83 0l-.06-.06a1.65 1.65 0 0 0-1.82-.33 1.65 1.65 0 0 0-1 1.51V21a2 2 0 0 1-2 2 2 2 0 0 1-2-2v-.09A1.65 1.65 0 0 0 9 19.4a1.65 1.65 0 0 0-1.82.33l-.06.06a2 2 0 0 1-2.83 0 2 2 0 0 1 0-2.83l.06-.06a1.65 1.65 0 0 0 .33-1.82 1.65 1.65 0 0 0-1.51-1H3a2 2 0 0 1-2-2 2 2 0 0 1 2-2h.09A1.65 1.65 0 0 0 4.6 9a1.65 1.65 0 0 0-.33-1.82l-.06-.06a2 2 0 0 1 0-2.83 2 2 0 0 1 2.83 0l.06.06a1.65 1.65 0 0 0 1.82.33H9a1.65 1.65 0 0 0 1-1.51V3a2 2 0 0 1 2-2 2 2 0 0 1 2 2v.09a1.65 1.65 0 0 0 1 1.51 1.65 1.65 0 0 0 1.82-.33l.06-.06a2 2 0 0 1 2.83 0 2 2 0 0 1 0 2.83l-.06.06a1.65 1.65 0 0 0-.33 1.82V9a1.65 1.65 0 0 0 1.51 1H21a2 2 0 0 1 2 2 2 2 0 0 1-2 2h-.09a1.65 1.65 0 0 0-1.51 1z"></path></svg>Đổi
								mật khẩu
							</a> <a href="#billing" data-toggle="tab"
								class="nav-link has-icon nav-link-faded"> <svg
									xmlns="http://www.w3.org/2000/svg" width="24" height="24"
									viewBox="0 0 24 24" fill="none" stroke="currentColor"
									stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
									class="feather feather-credit-card mr-2">
								<rect x="1" y="4" width="22" height="16" rx="2" ry="2"></rect>
								<line x1="1" y1="10" x2="23" y2="10"></line></svg>Lịch sử mua hàng
							</a>
						</nav>
					</div>
				</div>
			</div>
			<div class="col-md-8">
				<div class="card">
					<div class="card-header border-bottom mb-3 d-flex d-md-none">
						<ul class="nav nav-tabs card-header-tabs nav-gap-x-1"
							role="tablist">
							<li class="nav-item"><a href="#profile" data-toggle="tab"
								class="nav-link has-icon active"><svg
										xmlns="http://www.w3.org/2000/svg" width="24" height="24"
										viewBox="0 0 24 24" fill="none" stroke="currentColor"
										stroke-width="2" stroke-linecap="round"
										stroke-linejoin="round" class="feather feather-user">
									<path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"></path>
									<circle cx="12" cy="7" r="4"></circle></svg></a></li>
							<li class="nav-item"><a href="#account" data-toggle="tab"
								class="nav-link has-icon"><svg
										xmlns="http://www.w3.org/2000/svg" width="24" height="24"
										viewBox="0 0 24 24" fill="none" stroke="currentColor"
										stroke-width="2" stroke-linecap="round"
										stroke-linejoin="round" class="feather feather-settings">
									<circle cx="12" cy="12" r="3"></circle>
									<path
											d="M19.4 15a1.65 1.65 0 0 0 .33 1.82l.06.06a2 2 0 0 1 0 2.83 2 2 0 0 1-2.83 0l-.06-.06a1.65 1.65 0 0 0-1.82-.33 1.65 1.65 0 0 0-1 1.51V21a2 2 0 0 1-2 2 2 2 0 0 1-2-2v-.09A1.65 1.65 0 0 0 9 19.4a1.65 1.65 0 0 0-1.82.33l-.06.06a2 2 0 0 1-2.83 0 2 2 0 0 1 0-2.83l.06-.06a1.65 1.65 0 0 0 .33-1.82 1.65 1.65 0 0 0-1.51-1H3a2 2 0 0 1-2-2 2 2 0 0 1 2-2h.09A1.65 1.65 0 0 0 4.6 9a1.65 1.65 0 0 0-.33-1.82l-.06-.06a2 2 0 0 1 0-2.83 2 2 0 0 1 2.83 0l.06.06a1.65 1.65 0 0 0 1.82.33H9a1.65 1.65 0 0 0 1-1.51V3a2 2 0 0 1 2-2 2 2 0 0 1 2 2v.09a1.65 1.65 0 0 0 1 1.51 1.65 1.65 0 0 0 1.82-.33l.06-.06a2 2 0 0 1 2.83 0 2 2 0 0 1 0 2.83l-.06.06a1.65 1.65 0 0 0-.33 1.82V9a1.65 1.65 0 0 0 1.51 1H21a2 2 0 0 1 2 2 2 2 0 0 1-2 2h-.09a1.65 1.65 0 0 0-1.51 1z"></path></svg></a>
							</li>
							<li class="nav-item"><a href="#billing" data-toggle="tab"
								class="nav-link has-icon"><svg
										xmlns="http://www.w3.org/2000/svg" width="24" height="24"
										viewBox="0 0 24 24" fill="none" stroke="currentColor"
										stroke-width="2" stroke-linecap="round"
										stroke-linejoin="round" class="feather feather-credit-card">
									<rect x="1" y="4" width="22" height="16" rx="2" ry="2"></rect>
									<line x1="1" y1="10" x2="23" y2="10"></line></svg></a></li>
						</ul>
					</div>
					<div class="card-body tab-content">

						<!-- Profile -->
						<div class="tab-pane active" id="profile">
							<h3>Thông tin tài khoản</h3>
							<hr>
							<div>

								<div class="form-group">

									<label for="fullName">Tên</label> <input type="text"
										class="form-control" id="fullName"
										aria-describedby="fullNameHelp"
										placeholder="Tên của bạn sẽ được dùng thay thế cho tên đăng nhập"
										value="${sessionScope.UserSession.accInfor.name }">
								</div>
								<div class="form-group">
									<label for="url">Email</label> <input type="text"
										class="form-control" id="email"
										placeholder="Chúng tôi có thể liên lạc cho bạn lúc cần"
										value="${sessionScope.UserSession.accInfor.email }">
								</div>
								<div class="form-group">
									<label for="location">Số điện thoại </label> <input type="text"
										class="form-control" id="phoneNumber"
										placeholder="Nhập số điện thoại"
										value="${sessionScope.UserSession.accInfor.phone }">
								</div>
								<div class="form-group">
									<label for="location">Giới tính</label> <select
										class="form-control" id="gender">
										<c:choose>
											<c:when
												test="${sessionScope.UserSession.accInfor.phone == '1' }">
												<option value="1">Nam</option>
												<option value="2">Nữ</option>
											</c:when>
											<c:otherwise>
												<option value="2">Nữ</option>
												<option value="1">Nam</option>
											</c:otherwise>
										</c:choose>
									</select>
								</div>
								<hr>
								<button type="button" class="btn btn-primary"
									onclick="updateAccountHandler()">Cập nhật</button>
								<a href="/Web/trang-chu/trang-ca-nhan" class="btn btn-light">Huỷ</a>
							</div>
						</div>
						<!-- Profile -->


						<!-- Change Pass -->
						<div class="tab-pane" id="account">
							<h3>Đổi mật khẩu</h3>
							<hr>
							<div>
								<div class="form-group">
									<label for="username">Mật khẩu cũ</label> <input
										type="password" class="form-control" id="oldPass"
										aria-describedby="usernameHelp"> <label for="username">Mật
										khẩu mới</label> <input type="password" class="form-control"
										id="newPass" aria-describedby="usernameHelp"> <label
										for="username">Xác nhận mật khẩu mới</label> <input
										type="password" class="form-control" id="confirmPass"
										aria-describedby="usernameHelp"> <small
										id="usernameHelp" class="form-text text-muted">Sau khi
										thay đổi mật khẩu thành công, vui lòng đăng nhập lại.</small>
								</div>
								<hr>
								<button class="btn btn-primary" onclick="changePassHandler()">Lưu</button>
							</div>
						</div>
						<!-- Change Pass -->

						<!--Bill History-->
						<div class="tab-pane" id="billing">
							<h3>Lịch sử mua hàng</h3>
							<hr>
							<div>
								<div class="form-group mb-0">
									<div
										class="border border-gray-500 bg-gray-200 p-3 text-center font-size-sm">Bạn
										chưa từng thực hiện bất cứ đơn hàng nào.</div>
								</div>
							</div>
						</div>
						<!--Bill History-->

					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Profile End -->

	<!-- Product Shop Section Begin -->
	<footer class="footer-section">
		<div class="container">
			<div class="row">
				<div class="col-lg-3">
					<div class="footer-left">
						<div class="footer-logo">
							<a href="/Web/trang-chu">LV Shop</a>
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
	<script>
		
		function updateAccountHandler() {
			var a = $("#fullName");
			var b = $("#email");
			var c = $("#phoneNumber");
			var d = $("#gender");
			var reGexForName = /^[a-zA-Z]+$/g;
			var reGexForEmail = /^[a-zA-Z]+@gmail.com$/g;
			var reGexForName = /^(0|+84)[0-9]{9}$/g;
			if(reGexForName.test(a.val())==false){
				alert("Chỉ được nhập kí tự chữ");
				return;
			}
		}
	
		function changePassHandler() {
			var x = $("#oldPass");
			var y = $("#newPass");
			var z = $("#confirmPass");
			var reGex = /^[a-z0-9]{8,20}$/g;
			if(reGex.test(y.val())==false){
				console.log("Chỉ được nhập kí tự chữ viết thường và kí tự chữ số");
				return;
			}
			if(y.val()!=z.val()){
				console.log("Nhập sai mã xác nhận");
				return;
			}
			$.ajax({
				url: "\Web\trang-chu\api\tai-khoan\doi-mat-khau?matKhauMoi="+y.val(),
				type: 'PUT',
				success: (response)=>{
					var objJson = JSON.parse(response);
					if(objJson.status == 1)
						console.log("Thành công");
					if(objJson.status == 2)
						console.log("Không thành công");
					if(objJson.status == 3)
						console.log("Chưa đăng nhập");
				},
				error: (error)=>{
					console.log("Đã xảy ra lỗi");
				}
			})
		}
				
	</script>
</body>

</html>