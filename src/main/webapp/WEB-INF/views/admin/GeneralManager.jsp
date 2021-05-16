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

<!-- GOOGLE FONTS -->
<link
	href="https://fonts.googleapis.com/css?family=Montserrat:400,500|Poppins:400,500,600,700|Roboto:400,500"
	rel="stylesheet" />

<link
	href="https://cdn.materialdesignicons.com/4.4.95/css/materialdesignicons.min.css"
	rel="stylesheet" />

<!-- SLEEK CSS -->
<link id="sleek-css" rel="stylesheet" href="<c:url value="template/Admin/assets/css/sleek.css"/>" />
</head>

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
					<a href="/Web/admin/general" title="Sleek Dashboard"> <span>LV</span>
						<span class="brand-name text-truncate">LV Shop</span>
					</a>
				</div>

				<!-- begin sidebar scrollbar -->
				<div class="" data-simplebar style="height: 100%;">
					<!-- sidebar menu -->
					<ul class="nav sidebar-inner" id="sidebar-menu">

						<li class="has-sub "><a class="sidenav-item-link" href="#"
							aria-expanded="false" style="cursor: pointer;"> <i
								class="mdi mdi-pencil-box-multiple"></i> <span class="nav-text">Quản
									lí chung</span>
						</a></li>

						<li class="has-sub "><a class="sidenav-item-link" href="#"
							aria-expanded="false" style="cursor: pointer;"> <i
								class="mdi mdi-cart"></i> <span class="nav-text">Quản lí
									hoá đơn</span>
						</a></li>
						<!--Products-->
						<li class="has-sub "><a class="sidenav-item-link"
							data-toggle="collapse" data-target="#tables"
							aria-expanded="false" aria-controls="tables"
							style="cursor: pointer;"> <i
								class="mdi mdi-paper-cut-vertical"></i> <span class="nav-text">Quản
									lí sản phẩm</span> <b class="caret"></b>
						</a>

							<ul class="collapse " id="tables" data-parent="#sidebar-menu">
									<li class=""><a class="sidenav-item-link"
										href="basic-tables.html"> <span class="nav-text">Thương
												hiệu</span>
									</a></li>
									<li class=""><a class="sidenav-item-link"
										href="basic-tables.html"> <span class="nav-text">Mặt
												hàng</span>
									</a></li>

							</ul></li>
						<!--Account-->
						<li class="has-sub "><a class="sidenav-item-link"
							data-toggle="collapse" data-target="#accountMenu"
							aria-expanded="false" aria-controls="tables"
							style="cursor: pointer;"> <i class="mdi mdi-account"></i> <span
								class="nav-text">Quản lí tài khoản</span> <b class="caret"></b>
						</a>

							<ul class="collapse " id="accountMenu"
								data-parent="#sidebar-menu">
									<li class=""><a class="sidenav-item-link"
										href="basic-tables.html"> <span class="nav-text">Cá
												nhân</span>
									</a></li>
									<li class=""><a class="sidenav-item-link"
										href="basic-tables.html"> <span class="nav-text">Khách
												hàng</span>
									</a></li>

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

													<li><a href="#"
														class="media media-message media-notification">

															<div
																class="d-flex rounded-circle align-items-center justify-content-center mr-3 media-icon iconbox-45 bg-primary text-white">
																<i class="mdi mdi-account-multiple-check font-size-20"></i>
															</div>

															<div class="media-body d-flex justify-content-between">
																<div class="message-contents">
																	<h4 class="title">Hoá đơn chờ duyệt</h4>
																	<p class="last-msg font-size-14">10.000.000VNĐ</p>

																	<button type="button"
																		class="my-1 btn btn-sm btn-success">Xem</button>

																	<span
																		class="font-size-12 font-weight-medium text-secondary d-block">
																		<i class="mdi mdi-clock-outline"></i> 5 min ago...
																	</span>
																</div>
															</div>
													</a></li>


												</ul>
											</div>

										</div>
									</div>
								</div>

							</li>
							<li class="right-sidebar-in right-sidebar-2-menu"><i
								class="mdi mdi-settings mdi-spin"></i></li>
							<!-- User Account -->
							<li class="dropdown user-menu">
								<button href="#" class="dropdown-toggle nav-link"
									data-toggle="dropdown">
									<img src="assets/img/user/user.png" class="user-image"
										alt="User Image" /> <span class="d-none d-lg-inline-block">Abdus
										Salam</span>
								</button>
								<ul class="dropdown-menu dropdown-menu-right">
									<!-- User image -->
									<li class="dropdown-header"><img
										src="assets/img/user/user.png" class="img-circle"
										alt="User Image" />
										<div class="d-inline-block">
											Abdus Salam <small class="pt-1">iamabdus@gmail.com</small>
										</div></li>

									<li><a href="user-profile.html"> <i
											class="mdi mdi-account"></i> Thông tin cá nhân
									</a></li>
									<li class="right-sidebar-in"><a href="javascript:0"> <i
											class="mdi mdi-settings"></i> Cài đặt tài khoản
									</a></li>

									<li class="dropdown-footer"><a href="index.html"> <i
											class="mdi mdi-logout"></i> Đăng xuất
									</a></li>
								</ul>
							</li>
						</ul>
					</div>
				</nav>
			</header>


			<!-- ====================================
          ——— CONTENT WRAPPER
          ===================================== -->
			<div class="content-wrapper">
				<div class="content">


					<!-- Top Statistics -->
					<div class="row">
						<div class="col-xl-3 col-sm-6" style="height: 20vh;">
							<div class="card card-mini mb-4 badge-success">
								<div class="card-body">
									<h2 class="mb-1">71,503</h2>
									<p>Người đang truy cập</p>

								</div>
							</div>
						</div>
						<div class="col-xl-3 col-sm-6">
							<div class="card card-mini  mb-4 badge-danger">
								<div class="card-body">
									<h2 class="mb-1">9,503</h2>
									<p>Người truy cập hôm nay</p>

								</div>
							</div>
						</div>
						<div class="col-xl-3 col-sm-6">
							<div class="card card-mini mb-4 badge-warning">
								<div class="card-body">
									<h2 class="mb-1">71,503</h2>
									<p style="color: white;">Số hoá đơn hôm nay</p>

								</div>
							</div>
						</div>
						<div class="col-xl-3 col-sm-6">
							<div class="card card-mini mb-4 badge-info">
								<div class="card-body">
									<h2 class="mb-1">9,503</h2>
									<p>Thu nhập hôm nay</p>

								</div>
							</div>
						</div>
					</div>


					<div class="row">
						<div class="col-xl-5">

							<!-- Top Customers -->
							<div class="card card-table-border-none">
								<div class="card-header justify-content-between ">
									<h2>Khách hàng đầu</h2>
									<div>
										<button class="text-black-50 mr-2 font-size-20">
											<i class="mdi mdi-cached"></i>
										</button>

									</div>
								</div>
								<div class="card-body pt-0" data-simplebar
									style="height: 468px;">
									<table class="table ">
										<tbody>
											<tr>
												<td>
													<div class="media">
														<div class="media-image mr-3 rounded-circle">
															<a href="profile.html"><img
																class="rounded-circle w-45" src="assets/img/user/u1.jpg"
																alt="customer image"></a>
														</div>
														<div class="media-body align-self-center">
															<a href="profile.html"><h6
																	class="mt-0 text-dark font-weight-medium">Full
																	Name</h6></a> <small>Username</small>
														</div>
													</div>
												</td>
												<td>? Hoá đơn</td>
												<td class="text-dark d-none d-md-block">Tổng chi</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>

						</div>

						<div class="col-xl-7">

							<!-- Top Products -->
							<div class="card card-default">
								<div class="card-header justify-content-between mb-4">
									<h2>Sản phẩm hàng đầu</h2>
									<div>
										<button class="text-black-50 mr-2 font-size-20">
											<i class="mdi mdi-cached"></i>
										</button>
									</div>

								</div>
								<div class="card-body py-0">
									<div class="media d-flex mb-5">
										<div class="media-image align-self-center mr-3 rounded">
											<a href="#"><img src="assets/img/products/p1.jpg"
												alt="customer image"></a>
										</div>
										<div class="media-body align-self-center">
											<a href="#"><h6 class="mb-3 text-dark font-weight-medium">
													Product Name</h6></a>
											<p class="float-md-right">
												<span class="text-dark mr-2">?</span>Đã bán
											</p>
											<p class="mb-0">
												<del>$300</del>
												<span class="text-dark ml-3">$250</span>
											</p>
										</div>
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
	<script src="<c:url value="/template/Admin/assets/plugins/jquery/jquery.min.js"/>"></script>
	<script src="<c:url value="/template/Admin/assets/plugins/bootstrap/js/bootstrap.bundle.min.js"/>"></script>
    <script src="<c:url value="/template/Admin/assets/js/sleek.js"/>"></script>

</body>
</html>

