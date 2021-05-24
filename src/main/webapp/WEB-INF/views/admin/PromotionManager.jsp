<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="vi">
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

						<li class="has-sub "><a class="sidenav-item-link"
							href="/Web/admin/danh-sach-hoa-don" aria-expanded="false"
							style="cursor: pointer;"> <i class="mdi mdi-cart"></i> <span
								class="nav-text">Hoá đơn</span>
						</a></li>
						<!--Products-->
						<li class="has-sub "><a class="sidenav-item-link"
							href="/Web/admin/danh-sach-san-pham" aria-expanded="false"
							style="cursor: pointer;"> <i
								class="mdi mdi-cellphone"></i> <span class="nav-text">Sản
									phẩm</span>
						</a></li>
						<li class="has-sub "><a class="sidenav-item-link"  style="color: white; font-size: 1.005rem"
							href="/Web/admin/danh-sach-ma-khuyen-mai" aria-expanded="false"
							style="cursor: pointer;"> <i
								class="mdi mdi-paper-cut-vertical"></i> <span class="nav-text">khuyến
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
							<li class="dropdown user-menu" ><a href="#"
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
								<ul class="dropdown-menu dropdown-menu-right"  style="overflow: hidden; text-overflow: ellipsis;">
									<!-- User image -->
									<li class="dropdown-header"x><img style="width: 10%; height: 5vh"
										src="<c:url value="${sessionScope.UserSession.accInfor.avatar }"/>" class="img-circle"
										alt="x" />
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
				<form id="promotionDetailForm" method="post">

					<div class="content">
						<div class="row">

							<div class="col-lg-12">
								<div class="card card-default">
									<div class="card-header card-header-border-bottom">
										<h2>Thông tin chi tiết của khuyến mãi</h2>
									</div>
									<div class="card-body">
										<div class="form-group">
											<label>Mã khuyến mãi <span style="color: red">*</span></label>
											<c:choose>
												<c:when test="${promotionDetail.id != null }">
													<div class="input-group">
														<input type="text" class="form-control" id="promoCode"
															value="${promotionDetail.id }" name="idKhuyenMai"
															readonly="readonly">
													</div>
												</c:when>
												<c:otherwise>
													<div class="input-group">
														<input type="text" class="form-control" id="promoCode"
															value="${promotionDetail.id }" name="idKhuyenMai"
															data-toggle="tooltip" data-placement="top"
															title="Chỉ được nhập kí tự chữ không dấu hoặc số">
													</div>
												</c:otherwise>
											</c:choose>

										</div>

										<div class="form-group">
											<label>Giá trị ưu đãi <span style="color: red">*</span></label>
											<div class="input-group">
												<input type="text" class="form-control" id="valuePromo"
													value="${promotionDetail.value }" name="giaTri"
													data-toggle="tooltip" data-placement="top"
													title="Bạn nên nhập một số có định dạng abc.xyz (Đơn vị mặc định là %)">
											</div>
										</div>
										<div class="form-group">
											<label>Loại khuyến mãi <span style="color: red">*</span></label>
											<div class="input-group">
												<select class="form-control" id="selectType"
													value="${promotionDetail.type }" name="loai">
													<option value="1">Dùng theo user</option>
													<option value="2">Dùng theo ngày</option>
													<option value="3">Dùng theo tuần</option>
													<option value="4">Dùng theo tháng</option>
												</select>
											</div>
										</div>
										<div class="form-group">
											<label>Ngày hết hạn <span style="color: red">*</span></label>
											<div class="input-group">
												<input type="date" class="form-control"
													id="expiredDatePromo" value="${promotionDetailExpiredDate}"
													name="ngayHetHan" data-toggle="tooltip"
													data-placement="top"
													title="Bạn nên nhập giá trị là một ngày trong tương lai">
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>

						<footer class=" d-flex justify-content-center footer mt-auto">

							<c:choose>
								<c:when test="${promotionDetail.id != null}">
									<button type="button" id="addButton" onclick="addSubmit()"
										disabled="disabled" class="btn btn-light mb-2 btn-pill m-3">Thêm
										mã khuyến mãi</button>
									<button type="button" id="updateButton"
										onclick="updateSubmit()"
										class="btn btn-primary mb-2 btn-pill m-3">Cập nhật</button>

								</c:when>
								<c:otherwise>
									<button type="button" id="addButton" onclick="addSubmit()"
										class="btn btn-success mb-2 btn-pill m-3">Thêm mã
										khuyến mãi</button>
									<button type="button" id="updateButton" disabled="disabled"
										class="btn btn-light mb-2 btn-pill m-3">Cập nhật</button>
								</c:otherwise>
							</c:choose>

						</footer>

					</div>
					<!-- End Content -->
				</form>
			</div>
			<!-- End Content Wrapper -->
		</div>
		<!-- End Page Wrapper -->
	</div>
	<!-- End Wrapper -->


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
	<form
		action="/Web/admin/danh-sach-san-pham/chi-tiet-san-pham?idSanPham=${productDetail.id }"
		id="reloadTrick"></form>

	<form action="/Web/admin/danh-sach-ma-khuyen-mai" id="combackTrick"></form>


	<!-- Javascript -->
	<script
		src="<c:url value="/template/Admin/assets/plugins/jquery/jquery.min.js"/>"></script>
	<script
		src="<c:url value="/template/Admin/assets/plugins/bootstrap/js/bootstrap.bundle.min.js"/>"></script>
	<script src="<c:url value="/template/Admin/assets/js/sleek.js"/>"></script>
	<script type="text/javascript">
	
		jQuery(document).ready(function($) {
			$('#selectType option[value = "${promotionDetail.type}"]').attr("selected", "selected");
		});
	
	
		function reloadPage(){
			$("#reloadTrick").submit();
		}
		
		function combackPage(){
			$("#combackTrick").submit();
		}
		
		
		function addSubmit(){
			var promoCode= $("#promoCode");
			console.log(promoCode.val());
			var promoExpired=$("#expiredDatePromo");
			var codeRegEx= /^\w{8,}$/gi;
			var current = new Date();
			if(current >= promoExpired){
				$("#contentForCartAction").html("Ngày hết hạn nên lớn hơn ngày hiện tại");
				$("#modalCart").modal('show');
				return;
			}
			if(!codeRegEx.test(promoCode.val())){
				$("#contentForCartAction").html("Nhập sai định dạng mã khuyến mãi");
				$("#modalCart").modal('show');
				return;
			}
			$.ajax({
				url: "/Web/admin/api/ma-khuyen-mai?"+$("#promotionDetailForm").serialize(),
				type: 'POST',
				success:(response)=>{
					var objJson = JSON.parse(response);
					if(objJson.status == 1){
						$("#contentForCartAction").html("Thêm thành công");
						$("#modalCart").modal('show');
						setTimeout(()=>combackPage(),1000);
					}
					else if(objJson.status == 2){
						$("#contentForCartAction").html("Thêm thất bại");
						$("#modalCart").modal('show');
						
					}
					else if(objJson.status == 3){
						$("#contentForCartAction").html("Lỗi! Bạn chưa đăng nhập");
						$("#modalCart").modal('show');
						setTimeout(()=>combackPage(),1000);
					}
					else if(objJson.status == 4){
						$("#contentForCartAction").html("Có vẻ bạn đang nhập sai định dạng input! Vui lòng kiểm tra lại");
						$("#modalCart").modal('show');
					}
				},
				error:(error)=>{
					$("#contentForCartAction").html("Đã xảy ra lỗi");
					$("#modalCart").modal('show');
					console.log(error)
					return;
				}
			})			
		}
		
		function updateSubmit(){
			var promoCode= $("#promoCode");
			console.log(promoCode.val());
			var promoExpired=$("#expiredDatePromo");
			var codeRegEx= /^\w{8,}$/gi;
			var current = new Date();
			if(current >= promoExpired){
				$("#contentForCartAction").html("Ngày hết hạn nên lớn hơn ngày hiện tại");
				$("#modalCart").modal('show');
				return;
			}
			if(!codeRegEx.test(promoCode.val())){
				$("#contentForCartAction").html("Nhập sai định dạng mã khuyến mãi");
				$("#modalCart").modal('show');
				return;
			}
			$.ajax({
				url: "/Web/admin/api/ma-khuyen-mai?"+$("#promotionDetailForm").serialize(),
				type: 'PUT',
				success:(response)=>{
					var objJson = JSON.parse(response);
					if(objJson.status == 1){
						$("#contentForCartAction").html("Cập nhật thành công");
						$("#modalCart").modal('show');
						setTimeout(()=>combackPage(),1000);
					}
					else if(objJson.status == 2){
						$("#contentForCartAction").html("Cập nhật thất bại");
						$("#modalCart").modal('show');
						
					}
					else if(objJson.status == 3){
						$("#contentForCartAction").html("Lỗi! Bạn chưa đăng nhập");
						$("#modalCart").modal('show');
						setTimeout(()=>combackPage(),1000);
					}
					else if(objJson.status == 4){
						$("#contentForCartAction").html("Có vẻ bạn đang nhập sai định dạng input! Vui lòng kiểm tra lại");
						$("#modalCart").modal('show');
					}
				},
				error:(error)=>{
					$("#contentForCartAction").html("Đã xảy ra lỗi");
					$("#modalCart").modal('show');
					return;
				}
			})			
		}
		
	</script>
</body>
</html>

