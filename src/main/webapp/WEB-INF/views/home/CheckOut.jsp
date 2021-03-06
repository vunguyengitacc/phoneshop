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
									type="hidden" value="" name="thuongHieu"> <input
									type="hidden" value="1" name="sapXep"><input
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
						<li><a href="./contact.html">LI??N H???</a></li>
						<li><a href="/Web/trang-chu/ma-giam-gia?trang=1&sapXep=1">KHUY???N
								M??I</a></li>
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
						<a href="/Web/trang-chu/"><i class="fa fa-home"></i> Trang ch???</a>
						<a href="/Web/trang-chu/gio-hang">Gi??? h??ng</a> <span>Trang
							thanh to??n</span>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Breadcrumb Section Begin -->

	<!-- Shopping Cart Section Begin -->
	<section class="checkout-section spad">
		<div class="container">
			<form action="/Web/trang-chu/gio-hang/thanh-toan/ket-qua"
				class="checkout-form">
				<div class="row">
					<div class="col-lg-6">
						<div class="checkout-content">
							<a href="/Web/trang-chu/san-pham?trang=1&thuongHieu=&timKiem=&sapXep=1"
								class="content-btn">Ti???p t???c mua s???m</a>
						</div>
						<h4>Th??ng tin ho?? ????n</h4>
						<div class="row">
							<div class="col-lg-12">
								<label><i>Th??ng tin kh??ch h??ng</i></label>
								<hr>
							</div>

							<div class="col-lg-12">
								<label for="cun-name">T??n</label> <input type="text"
									readonly="readonly" id="cun-name"
									value="${sessionScope.UserSession.accInfor.name }">
							</div>
							<div class="col-lg-6">
								<label for="email">?????a ch??? email</label> <input type="text"
									id="email" readonly="readonly"
									value="${sessionScope.UserSession.accInfor.email }">
							</div>
							<div class="col-lg-6">
								<label for="phone">S??? ??i???n tho???i</label> <input type="text"
									id="phone" readonly="readonly"
									value="${sessionScope.UserSession.accInfor.phone }">
							</div>

							<div class="col-lg-12 mt-3">
								<label><i>?????a ch??? giao h??ng</i></label>
								<hr>
							</div>
							<div class="col-lg-12">
								<label for="city">T???nh\ Th??nh ph???<span
									style="color: red;">*</span></label> <select id="city"
									onchange="loadWard()">
									<option value="0">Ch???n t???nh</option>
									<c:forEach var="item" items="${lstDistrict }">
										<option value="${item.id }">${item.name }</option>
									</c:forEach>
								</select>
							</div>
							<div class="col-lg-12">
								<label for="ward">Qu???n\ Huy???n\ Th??? x??<span>*</span></label> <select
									onclick="loadCommune()" id="ward">
								</select>
							</div>
							<div class="col-lg-12">
								<label for="commune">X??\ Ph?????ng\ Th??? tr???n<span>*</span></label>
								<select id="commune" name="maDiaChi" required="required">
								</select>
							</div>
						</div>
					</div>
					<div class="col-lg-6">
						<div class="checkout-content">
							<input type="text" placeholder="Nh???p m?? khuy???n m??i"
								value="${sessionScope.cart.promo.id }" readonly="readonly"
								style="margin-bottom: 0;" id="discountCode" name="maGiamGia">
						</div>
						<div class="place-order">
							<h4>Chi ti???t mua h??ng</h4>
							<div class="order-total">
								<ul class="order-table">
									<li>S???n ph???m <span>Th??nh ti???n</span></li>
									<c:forEach var="item" items="${sessionScope.cart.lstItem }">
										<li class="fw-normal">${item.pro.name }-
											${item.color.name } x ${item.amount } <span>${item.value }</span>
										</li>
									</c:forEach>
									<li class="total-price">T???ng c???ng <span>${sessionScope.cart.totalValue }</span></li>
									<li class="total-price">Ph???i tr??? <span>${sessionScope.cart.promoValue }</span></li>
								</ul>
							</div>
						</div>
					</div>
					<div class="col-lg-12">
						<div class="checkout-content">
							<c:choose>
								<c:when test="${sessionScope.cart.lstItem.size()=='0' }">
									<button type="button" class="site-btn place-btn mt-4 btn-light"
										style="width: 100%;" onclick="nullCartHandler()">X??C
										NH???N MUA H??NG</button>
								</c:when>
								<c:otherwise>
									<button type="submit" class="site-btn place-btn mt-4"
										style="width: 100%;">X??C NH???N MUA H??NG</button>
								</c:otherwise>
							</c:choose>

						</div>
					</div>
				</div>
			</form>
		</div>
	</section>

	<!-- Modal Add Cart	Start-->
	<div class="modal fade" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalCenterTitle" aria-hidden="true"
		id="modalCart">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Th??ng b??o</h5>
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
							<li><a href="/Web/trang-chu/san-pham?timKiem=&thuongHieu=&sapXep=1&trang=1">S???n ph???m</a></li>
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
						<p>G???i email ????? ch??ng t??i c?? th??? ti???p nh???n ?? ki???n c???a
							b???n</p>
					</div>
				</div>
			</div>
		</div>
	</footer>

	<div class="modal fade" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalCenterTitle" aria-hidden="true"
		id="modalCart">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Th??ng b??o</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body" id="contentForCartAction">...</div>
			</div>
		</div>
	</div>

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
	<script type="text/javascript" charset="utf-8">
		function nullCartHandler() {
			$("#contentForCartAction").html("B???n ch??a c?? v???t ph???m n??o trong gi??? h??ng");
			$("#modalCart").modal('show');
		}
		
		function loadWard(){
			var distr = $("#city");
			if(distr.val()==0){
				$("#ward").empty();
				$("#commune").empty();
				return;
			}
			$.ajax({
				url: "/Web/trang-chu/api/huyen?idTinh="+distr.val(),
				type: "GET",
				success: (response)=>{
					var objJson = JSON.parse(response);
					$("#ward").empty();
					$("#commune").empty();
					if(typeof(objJson.message) != "undefined")
					{
						return;
					}
					$("#ward").empty();
					$("#commune").empty();
					var opt = $('<option></option>');
				    opt.val("0");
				    opt.text("Ch???n");
				    $("#ward").append(opt);
					var i=-1;
					for(var x in objJson){
						i++;
						var opt = $('<option></option>');
					    opt.val(objJson[i].id);
					    opt.text(objJson[i].name);
					    $("#ward").append(opt);
					}
					
				},
				error: (error)=>{
					$("#contentForCartAction").html("L???i ???????ng truy???n");
					$("#modalCart").modal('show');
				}
			})
		}
		
		function loadCommune(){
			var ward = $("#ward");
			if(ward.val()==0||ward.val()==null){
				$("#commune").empty();
				return;
			}
			$.ajax({
				url: "/Web/trang-chu/api/xa?idHuyen="+ward.val(),
				type: "GET",
				success: (response)=>{
					var objJson = JSON.parse(response);	
					$("#commune").empty();
					if(typeof(objJson.message) != "undefined")
					{
						return;
					}
					$("#commune").empty();
					var opt = $('<option></option>');
				    opt.val("0");
				    opt.text("Ch???n");
				    $("#commune").append(opt);
					var i=-1;
					for(var x in objJson){
						i++;
						var opt = $('<option></option>');
					    opt.val(objJson[i].id);
					    opt.text(objJson[i].name);
					    $("#commune").append(opt);
					}
					
				},
				error: (error)=>{
					$("#contentForCartAction").html("L???i ???????ng truy???n");
					$("#modalCart").modal('show');
				}
			})
		}
		</script>
</body>

</html>