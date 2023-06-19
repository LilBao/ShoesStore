<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>Admin 2 - Tables</title>

<!-- Custom fonts for this template -->
<link
	href="${pageContext.request.contextPath }/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template -->
<link href="${pageContext.request.contextPath }/css/sb-admin-2.min.css"
	rel="stylesheet">

<!-- Custom styles for this page -->
<link
	href="${pageContext.request.contextPath }/vendor/datatables/dataTables.bootstrap4.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
</head>

<body id="page-top">

	<!-- Page Wrapper -->
	<div id="wrapper">

		<!-- Sidebar -->
		<jsp:include
			page="${pageContext.request.contextPath }/views/Admin/slideAdmin.jsp"></jsp:include>
		<!-- End of Sidebar -->

		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">

			<!-- Main Content -->
			<div id="content">

				<!-- Topbar -->
				<jsp:include
					page="${pageContext.request.contextPath }/views/Admin/navAdmin.jsp"></jsp:include>
				<!-- End of Topbar -->

				<!-- Begin Page Content -->
				<div class="container-fluid">

					<!-- Page Heading -->
					<h1 class="h3 mb-2 text-gray-800">Tables</h1>


					<!-- DataTales Example -->
					<div class="card shadow mb-4">
						<div class="card-header py-3">
							<h6 class="m-0 font-weight-bold text-primary">List</h6>
						</div>
						<div class="card-body">
							<!--     Table User -->
							<div class="container mb-5">
								<div class="row d-flex justify-content-center">
									<div class="col-md-8">
										<div class="x`card">
											<div class="invoice">
											<div class="payment border-top mt-3 mb-3 border-bottom table-responsive">
													<table class="table table-borderless">
														<tbody>
														<th>Thông tin khách hàng</th>
															<tr>
																<td colspan="2">
																	<div class="">
																		<span class="d-block font-weight-bold">Địa chỉ giao hàng</span> 
																		<span class="d-block">${ord.fullname}</span>
																		<span class="d-block">${ord.address}</span>
																	</div>
																</td>
																<td colspan="2">
																	<div class="py-2">
																		<span class="d-block font-weight-bold">Địa chỉ thanh toán</span>
																		<span class="d-block">${ord.users.fullname}</span>
																		 <span class="d-block">${ord.address}</span>
																	</div>																	
																</td>															
															</tr>
														</tbody>
													</table>
												</div>
												<div class="payment border-top mt-3 mb-3 border-bottom table-responsive">
													<table class="table table-borderless">
														<thead>
														<th colspan="2">Thông tin đơn hàng</th>
														</thead>	
														<tbody>
															<tr>
																<td>
																	<div class="py-2">
																		<span class="d-block font-weight-bold">Order Date</span> <span>${ord.createdate}</span>
																	</div>
																</td>
																<td>
																	<div class="py-2">
																		<span class="d-block font-weight-bold">Order No</span> <span>#${ord.id}</span>
																	</div>
																</td>
																<td>
																	<div class="py-2">
																		<span class="d-block font-weight-bold">Payment</span>

																	</div>
																</td>
																<td>
																	<div class="py-2">
																		<span class="d-block font-weight-bold">Shiping
																			Address</span> <span>${ord.address}</span>
																	</div>
																</td>
															</tr>
														</tbody>
													</table>
												</div>
												<div class="product border-bottom table-responsive">
													<table class="table table-borderless text-left">																
														<tbody>
															<c:forEach var="ordt" items="${ord.orderdt }">
																<tr>
																	<td width="20%"><img
																		src="${pageContext.request.contextPath }/img/${ordt.img}"
																		width="90"></td>
																	<td width="60%"><span class="font-weight-bold">${ordt.products.name}</span>
																		<div class="product-qty"
																			style="font-size: 12px; color: black">
																			<span class="d-block">Quantity:${ordt.quantity }</span>
																			<span>Color:${ordt.color}</span>
																			<div>
																				<span>Size:${ordt.size}</span>
																			</div>
																		</div></td>
																	<td width="20%">
																		<div class="text-right">
																			<span class="font-weight-bold">$${ordt.price}</span>
																		</div>
																	</td>
																</tr>
															</c:forEach>
														</tbody>
													</table>
												</div>
												<div class="row d-flex justify-content-end">
													<div class="col-md-5">
														<table class="table table-borderless">
															<tbody class="totals">
																<tr>
																	<td>
																		<div class="text-left">
																			<span class="text-muted">Subtotal</span>
																		</div>
																	</td>
																	<td>
																		<div class="text-right">
																			<span>$${ord.totalprice }</span>
																		</div>
																	</td>
																</tr>
																<tr>
																	<td>
																		<div class="text-left">
																			<span class="text-muted">Shipping Fee</span>
																		</div>
																	</td>
																	<td>
																		<div class="text-right">
																			<span>$0</span>
																		</div>
																	</td>
																</tr>
																<tr class="border-top border-bottom">
																	<td>
																		<div class="text-left">
																			<span class="font-weight-bold">Total price</span>
																		</div>
																	</td>
																	<td>
																		<div class="text-right">
																			<span class="font-weight-bold">$${ord.totalprice}</span>
																		</div>
																	</td>
																</tr>
															</tbody>
														</table>
													</div>
												</div>
												<div class="d-flex justify-content-between footer p-3">
													<div>
														<c:if test="${ord.status==0}">
															<a
																href="${pageContext.request.contextPath}/cancellated?ordid=${ord.id}"
																class="btn btn-outline-danger"> <i class="bi bi-x"></i>
																Cancellation order
															</a>
														</c:if>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>


					</div>
					<!-- /.container-fluid -->

				</div>
				<!-- Footer -->
				<footer class="sticky-footer bg-white">
					<div class="container my-auto">
						<div class="copyright text-center my-auto">
							<span>Copyright &copy; Your Website 2020</span>
						</div>
					</div>
				</footer>
				<!-- End of Footer -->

			</div>
			<!-- End of Content Wrapper -->

		</div>
		<!-- End of Page Wrapper -->

		<!-- Scroll to Top Button-->
		<a class="scroll-to-top rounded" href="#page-top"> <i
			class="fas fa-angle-up"></i>
		</a>



		<!-- Bootstrap core JavaScript-->
		<script
			src="${pageContext.request.contextPath }/vendor/jquery/jquery.min.js"></script>
		<script
			src="${pageContext.request.contextPath }/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

		<!-- Core plugin JavaScript-->
		<script
			src="${pageContext.request.contextPath }/vendor/jquery-easing/jquery.easing.min.js"></script>

		<!-- Custom scripts for all pages-->
		<script src="${pageContext.request.contextPath }/js/sb-admin-2.min.js"></script>

		<!-- Page level plugins -->

		<script
			src="${pageContext.request.contextPath }/vendor/datatables/dataTables.bootstrap4.min.js"></script>

		<!-- Page level custom scripts -->
		<script
			src="${pageContext.request.contextPath }/js/demo/datatables-demo.js"></script>


		<script src="${pageContext.request.contextPath }/js/costom.js"></script>
</body>

</html>