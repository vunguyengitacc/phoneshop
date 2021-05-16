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
<link id="sleek-css" rel="stylesheet"
	href="<c:url value="template/Admin/assets/css/sleek.css"/>" />
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
					<a href="/Web/admin/general" title="Sleek Dashboard"> <span
						class="brand-name text-truncate">LV Shop</span>
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


					<div class="row">

						<div class="col-lg-12">
							<div class="card card-default">
								<div class="card-header card-header-border-bottom">
									<h2>Thông tin bổ sung</h2>
								</div>
								<div class="row">
									<div class="card-body col-lg-6">
										<div class="form-group" style="margin-top: 15%;">
											<label>Ảnh</label>
											<div class="custom-file mb-1 input-group">
												<input type="file" class="custom-file-input" id="coverImage"
													required> <label class="custom-file-label"
													for="coverImage">Chọn ảnh...</label>
												<div class="invalid-feedback">Example invalid custom
													file feedback</div>
											</div>
										</div>
									</div>
									<div class="card-body col-lg-6">
										<div class="input-group d-flex justify-content-center">
											<img src="assets/img/user/user.png" style="height: 35vh;" />
										</div>
									</div>
								</div>

							</div>
						</div>
						<div class="col-lg-6">
							<div class="card card-default">
								<div class="card-header card-header-border-bottom">
									<h2>Thông tin chung</h2>
								</div>
								<div class="card-body">
									<div class="form-group">
										<label>Mã sản phẩm</label>
										<div class="input-group">
											<input type="text" class="form-control"
												placeholder="Mã sẽ được tạo tự động nếu thêm mới" readonly
												required>
										</div>
									</div>

									<div class="form-group">
										<label>Tên sản phẩm</label>
										<div class="input-group">
											<input type="text" class="form-control" required>
										</div>
									</div>
									<div class="form-group">
										<label>Giá gốc</label>
										<div class="input-group">
											<input type="text" class="form-control" required>
										</div>
									</div>
									<div class="form-group">
										<label>Giá bán</label>
										<div class="input-group">
											<input type="text" class="form-control" required>
										</div>
									</div>
									<div class="form-group">
										<label>Giá khuyến mãi</label>
										<div class="input-group">
											<input type="text" class="form-control" required>
										</div>
									</div>
								</div>
							</div>
						</div>

						<div class="col-lg-6">
							<div class="row">

								<div class="col-lg-12">

									<div class="card card-default">
										<div class="card-header card-header-border-bottom">
											<h2>Thông tin màu</h2>
										</div>
										<div class="row">
											<div class="card-body col-lg-6">
												<div class="form-group">
													<label>Màu</label>
													<div class="input-group">
														<select class="form-control">
															<option>1</option>
															<option>1</option>
															<option>1</option>
														</select>
													</div>
												</div>
												<div class="form-group">
													<label>Số lượng</label>
													<div class="input-group">
														<input type="text" class="form-control">
													</div>
												</div>
											</div>
											<div class="card-body col-lg-6">

												<div class="form-group">
													<label>Thêm màu</label>
													<div class="input-group">
														<input type="text" class="form-control"
															placeholder="Tên màu mới">
													</div>
												</div>
												<div class="input-group d-flex justify-content-end">
													<button type="submit"
														class="btn btn-success mb-2 btn-pill m-3">Xác
														nhận thêm</button>
												</div>
											</div>
										</div>

									</div>
								</div>

								<div class="col-lg-12">
									<div class="card card-default">
										<div class="card-header card-header-border-bottom">
											<h2>Thông tin thương hiệu</h2>
										</div>
										<div class="row">
											<div class="card-body col-lg-6">
												<div class="form-group">
													<label>Thương hiệu</label>
													<div class="input-group">
														<select class="form-control">
															<option>1</option>
															<option>1</option>
															<option>1</option>
														</select>
													</div>
												</div>


											</div>
											<div class="card-body col-lg-6">
												<div class="form-group">
													<label>Thêm thương hiệu</label>
													<div class="input-group">
														<input type="text" class="form-control"
															placeholder="Tên thương hiệu mới">
													</div>
												</div>
												<div class="input-group d-flex justify-content-end">
													<button type="submit"
														class="btn btn-success mb-2 btn-pill m-3">Xác
														nhận thêm</button>
												</div>
											</div>

										</div>

									</div>
								</div>
							</div>
						</div>
						<div class="col-lg-12">
							<div class="card card-default">
								<div class="card-header card-header-border-bottom">
									<h2>Thông tin chi tiết</h2>
								</div>
								<div class="card-body">
									<form>
										<div class="form-group">
											<label>RAM</label>
											<div class="input-group">
												<input type="text" class="form-control">
											</div>
										</div>

										<div class="form-group">
											<label>ROM</label>
											<div class="input-group">
												<input type="text" class="form-control">
											</div>
										</div>
										<div class="form-group">
											<label>Kích cỡ màn hình</label>
											<div class="input-group">
												<input type="text" class="form-control">
											</div>
										</div>
										<div class="form-group">
											<label>Thông tin camera trước</label>
											<div class="input-group">
												<input type="text" class="form-control">
											</div>
										</div>
										<div class="form-group">
											<label>Hệ điều hành</label>
											<div class="input-group">
												<input type="text" class="form-control">
											</div>
										</div>

										<div class="form-group">
											<label>Thông tin GPU</label>
											<div class="input-group">
												<input type="text" class="form-control">
											</div>
										</div>

										<div class="form-group">
											<label>Thông tin CPU</label>
											<div class="input-group">
												<input type="text" class="form-control">
											</div>
										</div>
										<div class="form-group">
											<label>Mô tả sơ lược sản phẩm</label>
											<div class="input-group">
												<textarea class="form-control" rows="5"></textarea>
											</div>
										</div>
									</form>
								</div>
							</div>
						</div>
					</div>

					<footer class=" d-flex justify-content-center footer mt-auto">
						<button type="submit" class="btn btn-success mb-2 btn-pill m-3">Thêm
							sản phẩm</button>
						<button type="submit" class="btn btn-primary mb-2 btn-pill m-3">Cập
							nhật</button>
						<button type="submit" class="btn btn-danger mb-2 btn-pill m-3">Xoá
							sản phẩm này</button>
					</footer>

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
	<script src="<c:url value="/template/Admin/assets/js/sleek.js"/>"></script>

</body>
</html>
