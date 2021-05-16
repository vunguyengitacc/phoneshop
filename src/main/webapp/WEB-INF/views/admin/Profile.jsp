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
	href="<c:url value="assets/plugins/data-tables/datatables.bootstrap4.min.css"/>"
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
								<li><a class="sidenav-item-link" href="#"> <span
										class="nav-text">Thương hiệu</span>
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
								<li><a class="sidenav-item-link" href="basic-tables.html">
										<span class="nav-text">Cá nhân</span>
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

													<li><div
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
																		<i class="mdi mdi-clock-outline"></i> 5 phút trước...
																	</span>
																</div>
															</div>
														</div></li>
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
								class="dropdown-toggle nav-link" data-toggle="dropdown"> <img
									src="<c:url value="/template/Admin/assets/img/user/user.png"/>"
									class="user-image" alt="User Image" /> <c:choose>
										<c:when
											test="${sessionScope.UserSession.AccInfor.name != null }">
											<span class="d-none d-lg-inline-block">${sessionScope.UserSession.AccInfor.name }</span>
										</c:when>
										<c:otherwise>
											<span class="d-none d-lg-inline-block">${sessionScope.UserSession.AccInfor.username }</span>
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
													test="${sessionScope.UserSession.AccInfor.name != null }">
											${sessionScope.UserSession.AccInfor.name }
										</c:when>
												<c:otherwise>
										${sessionScope.UserSession.AccInfor.username }
										</c:otherwise>
											</c:choose>
											<small class="pt-1">${sessionScope.UserSession.AccInfor.email }</small>
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

					<div class="bg-white border rounded">
						<div class="row no-gutters">
							<div class="col-lg-4 col-xl-3">
								<div
									class="profile-content-left profile-left-spacing pt-5 pb-3 px-3 px-xl-5">
									<div class="card text-center widget-profile px-0 border-0">
										<div class="card-img mx-auto rounded-circle">
											<img src="assets/img/user/u6.jpg" alt="user image">
										</div>

										<div class="card-body">
											<c:choose>
												<c:when
													test="${sessionScope.UserSession.AccInfor.name != null }">
													<h4 class="py-2 text-dark">${sessionScope.UserSession.AccInfor.name }</h4>
												</c:when>
												<c:otherwise>
													<h4 class="py-2 text-dark">${sessionScope.UserSession.AccInfor.username }</h4>
												</c:otherwise>
											</c:choose>

										</div>
									</div>


									<hr class="w-100">

									<div class="contact-info pt-4">
										<h5 class="text-dark mb-1">Thông tin tài khoản</h5>
										<p class="text-dark font-weight-medium pt-4 mb-2">Email</p>
										<p>${sessionScope.UserSession.accInfor.email }</p>
										<p class="text-dark font-weight-medium pt-4 mb-2">Số điện
											thoại</p>
										<p>${sessionScope.UserSession.accInfor.phone }</p>
									</div>
								</div>
							</div>

							<div class="col-lg-8 col-xl-9">
								<div class="profile-content-right profile-right-spacing py-5">
									<ul class="nav nav-tabs px-3 px-xl-5 nav-style-border"
										id="myTab" role="tablist">
										<li class="nav-item"><a class="nav-link active"
											id="settings-tab" data-toggle="tab" href="#settings"
											role="tab" aria-controls="settings" aria-selected="false">Thông
												tin</a></li>
										<li class="nav-item"><a class="nav-link" id="profile-tab"
											data-toggle="tab" href="#profile" role="tab"
											aria-controls="profile" aria-selected="false">Đổi mật
												khẩu</a></li>


									</ul>

									<div class="tab-content px-3 px-xl-5" id="myTabContent">

										<div class="tab-pane fade" id="profile" role="tabpanel"
											aria-labelledby="profile-tab">
											<div class="tab-pane-content mt-5">
												<div>
													<div class="form-group mb-4">
														<label for="conPassword">Mật khẩu cũ</label> <input
															type="text" class="form-control" id="oldPassword">
													</div>

													<div class="form-group mb-4">
														<label for="conPassword">Mật khẩu mới</label> <input
															type="password" class="form-control" id="newPassword">
													</div>

													<div class="form-group mb-4">
														<label for="conPassword">Xác nhận</label> <input
															type="password" class="form-control" id="confirm">
													</div>

													<div class="d-flex justify-content-end mt-5">
														<button type="submit"
															class="btn btn-primary mb-2 btn-pill">Cập nhật</button>
													</div>
												</div>
											</div>
										</div>

										<div class="tab-pane fade show active" id="settings"
											role="tabpanel" aria-labelledby="settings-tab">
											<div class="tab-pane-content mt-5">
												<div>
													<div class="form-group row mb-6">
														<label for="coverImage"
															class="col-sm-4 col-lg-2 col-form-label">Avatar</label>
														<div class="col-sm-8 col-lg-10">
															<div class="custom-file mb-1">
																<input type="file" class="custom-file-input"
																	id="coverImage" required> <label
																	class="custom-file-label" for="coverImage">Chọn
																	ảnh...</label>
																<div class="invalid-feedback">Example invalid
																	custom file feedback</div>
															</div>
														</div>
													</div>

													<div class="row mb-2">
														<div class="col-lg-12">
															<div class="form-group">
																<label for="firstName">Tên đăng nhập</label> <input
																	type="text" class="form-control" id="firstName"
																	value="${sessionScope.UserSession.accInfor.username }"
																	readonly>
															</div>
														</div>

														<div class="col-lg-12">
															<div class="form-group">
																<label for="lastName">Tên hiển thị</label> <input
																	type="text" class="form-control" id="lastName"
																	value="${sessionScope.UserSession.accInfor.name }">
															</div>
														</div>
													</div>

													<div class="form-group mb-4">
														<label for="email">Email</label> <input type="email"
															class="form-control" id="email"
															value="${sessionScope.UserSession.accInfor.email }">
													</div>

													<div class="form-group mb-4">
														<label for="oldPassword">Số điện thoại</label> <input
															type="text" class="form-control" id="phone"
															value="${sessionScope.UserSession.accInfor.phone }">
													</div>

													<div class="form-group mb-4">
														<label for="newPassword">Giới tính</label> <select
															class="form-control" id="">
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
													<div class="d-flex justify-content-end mt-5">
														<button type="submit"
															class="btn btn-primary mb-2 btn-pill">Cập nhật</button>
													</div>
												</div>
											</div>
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
	<script
		src="<c:url value="/template/Admin/assets/plugins/jquery/jquery.min.js"/>"></script>
	<script
		src="<c:url value="/template/Admin/assets/plugins/bootstrap/js/bootstrap.bundle.min.js"/>"></script>
</body>

</html>