<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1" />

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
<style>
	tbody tr:hover{
		background-color: #EEEEEE;
	}
</style>
<body class="header-fixed sidebar-fixed sidebar-dark header-light"
	id="body">

	<!-- ====================================
    ——— WRAPPER
    ===================================== -->
	<div class="wrapper">

		<!-- ====================================
          ——— LEFT SIDEBAR WITH OUT FOOTER
        ===================================== -->
		<aside class="left-sidebar bg-sidebar">
			<div id="sidebar" class="sidebar sidebar-with-footer">
				<!-- Aplication Brand -->
				<div class="app-brand">
					<a href="/Web/trang-chu/" title="Sleek Dashboard"> <span
						class="brand-name text-truncate">LV Shop</span>
					</a>
				</div>

				<!-- begin sidebar scrollbar -->
				<div class="" data-simplebar style="height: 100%;">
					<!-- sidebar menu -->
					<ul class="nav sidebar-inner" id="sidebar-menu">

						<li class="has-sub "><a class="sidenav-item-link"
							href="/Web/admin/quan-li-chung" aria-expanded="false"
							style="cursor: pointer;"> <i
								class="mdi mdi-pencil-box-multiple"></i> <span class="nav-text">Quản
									lí chung</span>
						</a></li>

						<li class="has-sub "><a class="sidenav-item-link" href="#"
							aria-expanded="false" style="cursor: pointer;"> <i
								class="mdi mdi-cart"></i> <span class="nav-text">Hoá đơn</span>
						</a></li>
						<!--Products-->
						<li class="has-sub "><a class="sidenav-item-link"
							href="/Web/admin/danh-sach-san-pham" aria-expanded="false"
							style="cursor: pointer;"> <i
								class="mdi mdi-cellphone"></i> <span class="nav-text">Sản
									phẩm</span>
						</a></li>
						<li class="has-sub "><a class="sidenav-item-link" href="#"  style="color: white; font-size: 1.005rem"
							aria-expanded="false" style="cursor: pointer;"> <i
								class="mdi mdi-paper-cut-vertical"></i> <span class="nav-text">Khuyến
									mãi</span>
						</a></li>
						<!--Account-->
						<li class="has-sub "><a class="sidenav-item-link"
							href="/Web/admin/danh-sach-tai-khoan" aria-expanded="false"
							style="cursor: pointer;"> <i
								class="mdi mdi-account"></i> <span class="nav-text">Tài
									khoản</span>
						</a></li>
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
																		<a href="/Web/admin/danh-sach-hoa-don"
																			class="my-1 btn btn-sm btn-success">Đến trang hoá
																			đơn</a>
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
																		<a href="/Web/admin/danh-sach-hoa-don"
																			class="my-1 btn btn-sm btn-warning">Đến trang hoá
																			đơn</a>
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
								<ul class="dropdown-menu dropdown-menu-right"
									style="overflow: hidden; text-overflow: ellipsis;">
									<!-- User image -->
									<li class="dropdown-header" x><img
										style="width: 10%; height: 5vh" src="<c:url value="${sessionScope.UserSession.accInfor.avatar }"/>"
										class="img-circle" alt="x" />
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

									<li><a href="/Web/trang-chu/trang-ca-nhan"> <i class="mdi mdi-account"></i> Thông
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
									<h2>Danh sách khuyến mãi</h2>
									<a href="/Web/admin/danh-sach-ma-khuyen-mai/them-moi"
										class="btn btn-outline-primary btn-sm text-uppercase"> <i
										class=" mdi mdi-shopify"></i> THÊM
									</a>
								</div>

								<div class="card-body">
									<div class="basic-data-table">
										<table id="basic-data-table" class="table nowrap"
											style="width: 100%">
											<thead>
												<tr>
													<th>Mã khuyến mãi</th>
													<th>giá trị ưu đãi</th>
													<th>Ngày hết hạn</th>
													<th>status</th>
												</tr>
											</thead>

											<tbody>
												<c:if test="${not empty lstPromotion }">
													<c:forEach var="item" items="${lstPromotion }">
														<tr onclick="submitForm('${item.id}')"
															style="cursor: pointer;">
															<td>${item.id }</td>
															<td>${item.value }%</td>
															<td>${item.expiredDate }</td>
															<td><c:choose>
																	<c:when test="${item.isExpired == '0' }">
																		<a href="#" class="badge badge-success">Còn hạn</a>
																	</c:when>
																	<c:otherwise>
																		<a href="#" class="badge badge-danger">Hết hạn</a>
																	</c:otherwise>
																</c:choose></td>
															<form
																action="/Web/admin/danh-sach-ma-khuyen-mai/${item.id }"
																id="form-${item.id }"></form>
														</tr>

													</c:forEach>

												</c:if>
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

