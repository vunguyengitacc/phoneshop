<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
	href="<c:url value="/template/Home/css/promotion-page.css"/>"
	type="text/css">

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
<style type="text/css">
.pagination>li>a {
	margin: 0 5px;
}
</style>
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
						<li><a href="/Web/trang-chu/">TRANG CH???</a></li>
						<li><a
							href="/Web/trang-chu/san-pham?trang=1&thuongHieu=&timKiem=&sapXep=1">SHOP</a></li>
						<li><a href="/Web/trang-chu/lien-he">LI??N H???</a></li>
						<li class="active"><a
							href="/Web/trang-chu/ma-giam-gia?trang=1&sapXep=1">KHUY???N M??I</a></li>
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
						<a href="/Web/trang-chu/"><i class="fa fa-home"></i> Trang ch???</a>
						<span>Trang m?? gi???m gi??</span>
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
						<h4 class="fw-title">S???p x???p</h4>
						<ul class="filter-catagories">
							<li><a href="/Web/trang-chu/ma-giam-gia?trang=1&sapXep=1">Theo
									ng??y th??m</a></li>
							<li><a href="/Web/trang-chu/ma-giam-gia?trang=1&sapXep=2">Theo
									gi?? tr???</a></li>
						</ul>
					</div>
				</div>
				<div class="col-lg-9 order-1 order-lg-2">
					<div class="product-show-option">
						<div class="row">
							<div class="col-lg-7 col-md-7"></div>
						</div>
					</div>
					<div class="product-list">
						<div class="row">
							<div class="col-lg-12 mb-5">
								<div class=" col-lg-12 col-sm-offset-2 ">
									<ul class="event-list">
										<c:forEach var="item" items="${lstPromotion }">
											<li><time datetime="${item.expiredDate }">
													<span class="day"><fmt:formatDate pattern="dd"
															value="${item.expiredDate }" /></span> <span class="month"><fmt:formatDate
															pattern="MM" value="${item.expiredDate }" /></span>
												</time>
												<div class="info">
													<h2 class="title">${item.id }</h2>
													<c:choose>
														<c:when test="${item.type == 1 }">
															<p class="desc">D??ng theo user</p>
														</c:when>
														<c:when test="${item.type == 2 }">
															<p class="desc">D??ng theo ng??y</p>
														</c:when>
														<c:when test="${item.type == 3 }">
															<p class="desc">D??ng theo tu???n</p>
														</c:when>
														<c:otherwise>
															<p class="desc">D??ng theo th??ng</p>
														</c:otherwise>
													</c:choose>
													<ul>
														<li style="width: 65%;"><span>GI???M: </span> <span
															style="font-size: 2rem;">${item.value }%</span></li>
														<li style="width: 35%;"
															onclick="addPromotionHandler('${item.id}')"><span
															style="font-size: 1.5rem;">D??NG NGAY</span></li>
													</ul>
												</div></li>



										</c:forEach>
									</ul>
								</div>
							</div>
						</div>
					</div>
					<div>
						<div class="pagination">

							<nav aria-label="Page navigation example">
								<ul class="pagination">
									<li class="page-item"><a class="page-link"
										href="/Web/trang-chu/ma-giam-gia?trang=1&sapXep=${param.sapXep}">&lsaquo;&lsaquo;</a></li>
									<li class="page-item"><c:choose>
											<c:when test="${currentPage > 1 }">
												<a class="page-link"
													href="/Web/trang-chu/ma-giam-gia?trang=${currentPage - 1 }&sapXep=${param.sapXep}">&lsaquo;</a>
											</c:when>
											<c:otherwise>
												<a class="page-link" href="#">&lsaquo;</a>
											</c:otherwise>
										</c:choose></li>

									<c:if test="${currentPage >= 3 }">
										<li class="page-item"><a class="page-link" href="#">...</a></li>
									</c:if>
									<c:if test="${currentPage > 1 }">
										<li class="page-item"><a class="page-link"
											href="/Web/trang-chu/ma-giam-gia?trang=${currentPage - 1 }&sapXep=${param.sapXep}">${currentPage-1 }</a></li>
									</c:if>
									<li class="page-item active"><a class="page-link" href="#">${currentPage }
									</a></li>
									<c:if test="${currentPage < pageCount }">
										<li class="page-item"><a class="page-link"
											href="/Web/trang-chu/ma-giam-gia?trang=${currentPage + 1 }&sapXep=${param.sapXep}">${currentPage +1 }</a></li>
									</c:if>
									<c:if test="${currentPage < pageCount-1 }">
										<li class="page-item"><a class="page-link" href="#">...</a></li>
									</c:if>
									<li class="page-item"><c:choose>
											<c:when test="${currentPage < pageCount }">
												<a class="page-link"
													href="/Web/trang-chu/ma-giam-gia?trang=${currentPage + 1 }&sapXep=${param.sapXep}">&rsaquo;</a>
											</c:when>
											<c:otherwise>
												<a class="page-link" href="#">&rsaquo;</a>
											</c:otherwise>
										</c:choose></li>
									<li class="page-item"><a class="page-link"
										href="/Web/trang-chu/ma-giam-gia?trang=${pageCount }&sapXep=${param.sapXep}">&rsaquo;&rsaquo;</a></li>
								</ul>
							</nav>

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
		function addPromotionHandler(id) {
			$.ajax({
				url : "/Web/trang-chu/api/gio-hang/ma-khuyen-mai?idKhuyenMai="
						+ id,
				type : 'PUT',
				success : function(response) {
					var objJson = JSON.parse(response);
					if (objJson.status == 0) {
						$("#amountItemCart").html(objJson.totalItem);
						$("#amountValueCart").html(objJson.totalValue);
						$("#subTotalValue").html(objJson.totalValue);
						$("#totalValue").html(objJson.promoValue);
					} else if (objJson.status == 1) {
						$("#contentForCartAction").html("Th??m th??nh c??ng");
						$("#modalCart").modal('show');
						$("#amountItemCart").html(objJson.totalItem);
						$("#amountValueCart").html(objJson.totalValue);
					} else if (objJson.status == 2) {
						$("#contentForCartAction").html("M?? ???? d??ng");
						$("#modalCart").modal('show');
					} else if (objJson.status == 3) {
						$("#contentForCartAction").html("Ch??a ????ng nh???p");
						$("#modalCart").modal('show');
					} else if (objJson.status == 4) {
						$("#contentForCartAction").html("M?? kh??ng t???n t???i");
						$("#modalCart").modal('show');
					}
				},
				error : function(error) {
					$("#contentForCartAction").html("L???i ???????ng truy???n");
					$("#modalCart").modal('show');
				}
			})
		}
	</script>
</body>

</html>