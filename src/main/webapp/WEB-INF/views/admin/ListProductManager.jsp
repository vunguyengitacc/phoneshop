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
	href="https://fonts.googleapis.com/css?family=Montserrat:400,500|Poppins:400,500,600,700|Roboto:400,500"
	rel="stylesheet" />

<link
	href="https://cdn.materialdesignicons.com/4.4.95/css/materialdesignicons.min.css"
	rel="stylesheet" />


<link
	href="<c:url value="/template/Admin/assets/plugins/data-tables/datatables.bootstrap4.min.css"/>"
	rel='stylesheet'>


<!-- Css Styles -->
<link id="sleek-css" rel="stylesheet"
	href="<c:url value="/template/Admin/assets/css/sleek.css"/>" />

<script
	src="<c:url value="/template/Admin/assets/plugins/nprogress/nprogress.js"/>"></script>
</head>

<body class="header-fixed sidebar-fixed sidebar-dark header-light"
	id="body">
	<div class="wrapper">
		<aside class="left-sidebar bg-sidebar">
			<div id="sidebar" class="sidebar sidebar-with-footer">
				<!-- Aplication Brand -->
				<div class="app-brand">
					<a href="#" title="Sleek Dashboard"> <span
						class="brand-name text-truncate">LV Shop</span>
					</a>
				</div>

				<!-- begin sidebar scrollbar -->
				<div data-simplebar style="height: 100%;">
					<!-- sidebar menu -->
					<ul class="nav sidebar-inner" id="sidebar-menu">

						<li class="has-sub "><a class="sidenav-item-link" href="#"
							aria-expanded="false" style="cursor: pointer;"> <i
								class="mdi mdi-pencil-box-multiple"></i> <span class="nav-text">Quản
									lí chung</span>
						</a></li>

						<li class="has-sub "><a class="sidenav-item-link"
							href="/Web/admin/danh-sach-hoa-don" aria-expanded="false"
							style="cursor: pointer;"> <i class="mdi mdi-cart"></i> <span
								class="nav-text">Quản lí hoá đơn</span>
						</a></li>
						<!--Products-->

						<li class="has-sub "><a class="sidenav-item-link" href="#"
							aria-expanded="false" style="cursor: pointer;"> <i
								class="mdi mdi-cart"></i> <span class="nav-text">Quản lí
									sản phẩm</span>
						</a></li>
						<!--Account-->
						<li class="has-sub "><a class="sidenav-item-link"
							data-toggle="collapse" data-target="#accountMenu"
							aria-expanded="false" aria-controls="tables"
							style="cursor: pointer;"> <i class="mdi mdi-account"></i> <span
								class="nav-text">Quản lí tài khoản</span> <b class="caret"></b>
						</a>

							<ul class="collapse " id="accountMenu"
								data-parent="#sidebar-menu">
								<div class="sub-menu">
									<li><a class="sidenav-item-link" href="#"> <span
											class="nav-text"> Cá nhân</span>
									</a></li>
									<li class=""><a class="sidenav-item-link"
										href="/Web/admin/danh-sach-tai-khoan"> <span
											class="nav-text"> Khách hàng</span>
									</a></li>
								</div>
							</ul></li>
					</ul>
				</div>

			</div>
		</aside>

		<!-- ====================================
        ——— PAGE WRAPPER
        ===================================== -->
		<div class="page-wrapper">

			<!-- Header -->
			<header class="main-header " id="header">
				<nav class="navbar navbar-static-top navbar-expand-lg">
					<!-- Sidebar toggle button -->
					<button id="sidebar-toggler" class="sidebar-toggle">
						<span class="sr-only">Toggle navigation</span>
					</button>
					<!-- search form -->
					<div class="search-form d-none d-lg-inline-block"></div>

					<div class="navbar-right ">
						<ul class="nav navbar-nav">
							<li class="dropdown notifications-menu custom-dropdown">
								<button
									class="dropdown-toggle notify-toggler custom-dropdown-toggler">
									<i class="mdi mdi-bell-outline"></i>
								</button>

								<div
									class="card card-default dropdown-notify dropdown-menu-right mb-0">
									<div class="card-header card-header-border-bottom px-3">
										<h2>Thông báo</h2>
									</div>

									<div class="card-body px-0 py-3">

										<div class="tab-content" id="myTabContent3">
											<div class="tab-pane fade show active" id="home2"
												role="tabpanel" aria-labelledby="home2-tab">
												<ul class="list-unstyled" data-simplebar
													style="height: 360px">
													<c:if test="${watingOrderAmount!='0' }">
														<li><div
																class="media media-message media-notification">

																<div
																	class="d-flex rounded-circle align-items-center justify-content-center mr-3 media-icon iconbox-45 bg-primary text-white">
																	<i class="mdi mdi-account-multiple-check font-size-20"></i>
																</div>

																<div class="media-body d-flex justify-content-between">
																	<div class="message-contents">
																		<h4 class="title">Hoá đơn chờ duyệt</h4>
																		<p class="last-msg font-size-14">${watingOrderAmount }
																			hoá đơn</p>
																		<a href="#" class="my-1 btn btn-sm btn-success">Đến
																			trang hoá đơn</a>
																	</div>
																</div>
															</div></li>

													</c:if>
													<c:if test="${watingOrderAmountToday!= '0' }">
														<li><div
																class="media media-message media-notification">

																<div
																	class="d-flex rounded-circle align-items-center justify-content-center mr-3 media-icon iconbox-45 bg-primary text-white">
																	<i class="mdi mdi-account-multiple-check font-size-20"></i>
																</div>

																<div class="media-body d-flex justify-content-between">
																	<div class="message-contents">
																		<h4 class="title">Hoá đơn mới</h4>
																		<p class="last-msg font-size-14">${watingOrderAmountToday }
																			hoá đơn</p>
																		<a href="#" class="my-1 btn btn-sm btn-warning">Đến
																			trang hoá đơn</a>
																	</div>
																</div>
															</div></li>

													</c:if>
												</ul>
											</div>

										</div>
									</div>
								</div>

							</li>
							<li class="right-sidebar-in right-sidebar-2-menu"><i
								class="mdi mdi-settings mdi-spin"></i></li>
							<!-- User Account -->
							<li class="dropdown user-menu"><a href="#"
								class="dropdown-toggle nav-link" data-toggle="dropdown"> <c:choose>
										<c:when
											test="${sessionScope.UserSession.accInfor.name != null }">
											<span class="d-none d-lg-inline-block">${sessionScope.UserSession.accInfor.name }</span>
										</c:when>
										<c:otherwise>
											<span class="d-none d-lg-inline-block">${sessionScope.UserSession.accInfor.username }</span>
										</c:otherwise>
									</c:choose>
							</a>
								<ul class="dropdown-menu dropdown-menu-right">
									<!-- User image -->
									<li class="dropdown-header"><img
										src="assets/img/user/user.png" class="img-circle"
										alt="User Image" />
										<div class="d-inline-block">
											<c:choose>
												<c:when
													test="${sessionScope.UserSession.accInfor.name != null }">
											${sessionScope.UserSession.accInfor.name }
										</c:when>
												<c:otherwise>
										${sessionScope.UserSession.accInfor.username }
										</c:otherwise>
											</c:choose>
											<small class="pt-1">${sessionScope.UserSession.accInfor.email }</small>
										</div></li>

									<li><a href="#"> <i class="mdi mdi-account"></i> Thông
											tin cá nhân
									</a></li>
									<li class="dropdown-footer"><a href="/Web/admin/log-out">
											<i class="mdi mdi-logout"></i> Đăng xuất
									</a></li>
								</ul></li>

						</ul>
					</div>
				</nav>
			</header>


			<!-- ====================================
          ——— CONTENT WRAPPER
          ===================================== -->
			<div class="content-wrapper">
				<div class="content">



					<div class="row">
						<div class="col-12">
							<div class="card card-default">
								<div
									class="card-header card-header-border-bottom d-flex justify-content-between">
									<h2>Danh sách sản phẩm</h2>

									<a
										href="/Web/admin/danh-sach-san-pham/chi-tiet-san-pham?idSanPham=0"
										target="_blank"
										class="btn btn-outline-primary btn-sm text-uppercase"> <i
										class=" mdi mdi-shopify"></i> THÊM
									</a>
								</div>

								<div class="card-body">
									<div class="hoverable-data-table">
										<table id="hoverable-data-table"
											class="table table-hover nowrap" style="width: 100%">
											<thead>
												<tr>
													<th>Ảnh</th>
													<th>Tên</th>
													<th>Hãng</th>
													<th>Giá gốc</th>
													<th>Giá bán</th>
													<th>Giá khuyến mãi</th>
												</tr>
											</thead>

											<tbody>
												<c:forEach var="item" items="${lstProduct }">
													<tr onclick="submitForm(${item.id})"
														style="cursor: pointer;">
														<td><c:choose>
																<c:when test="${item.image!='' }">
																	<img src="<c:url value="${item.image }"/>"
																		style="height: 5vh;" />
																</c:when>
																<c:otherwise>
																	<img src="<c:url value="/resources/default.png"/>"
																		style="height: 5vh;" />
																</c:otherwise>
															</c:choose></td>
														<td>${item.trademark.name }</td>
														<td>${item.name }</td>
														<td>${item.originalPrice }</td>
														<td>${item.price }</td>
														<td>${item.promotionPrice }</td>
														<form
															action="/Web/admin/danh-sach-san-pham/chi-tiet-san-pham"
															id="form-${item.id }">
															<input type="hidden" name="idSanPham" value="${item.id }">
														</form>
													</tr>
												</c:forEach>

											</tbody>
										</table>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- End Content -->
			</div>
			<!-- End Content Wrapper -->
		</div>
		<!-- End Page Wrapper -->
	</div>
	<!-- End Wrapper -->



	<!-- Javascript -->
	<script
		src="<c:url value="/template/Admin/assets/plugins/jquery/jquery.min.js"/>"></script>
	<script
		src="<c:url value="/template/Admin/assets/plugins/bootstrap/js/bootstrap.bundle.min.js"/>"></script>
	<script
		src="<c:url value="/template/Admin/assets/plugins/data-tables/jquery.datatables.min.js"/>"></script>
	<script
		src="<c:url value="/template/Admin/assets/plugins/data-tables/datatables.bootstrap4.min.js"/>"></script>

	<script src="<c:url value="/template/Admin/assets/js/sleek.js"/>"></script>
	<script>
		function submitForm(x) {
			$("#form-" + x).submit();
		}
	</script>

</body>
</html>

