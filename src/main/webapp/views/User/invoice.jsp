<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html lang="en">
<head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="${pageContext.request.contextPath}/js/customjs/ajax.js"></script>
<meta charset="utf-8">
<title>E Store - eCommerce HTML Template</title>
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="eCommerce HTML Template Free Download" name="keywords">
<meta content="eCommerce HTML Template Free Download" name="description">

<!-- Favicon -->
<link href="${pageContext.request.contextPath }/img/favicon.ico"
	rel="icon">

<!-- Google Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,400|Source+Code+Pro:700,900&display=swap"
	rel="stylesheet">

<!-- CSS Libraries -->
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath }/lib/slick/slick.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath }/lib/slick/slick-theme.css"
	rel="stylesheet">

<!-- Template Stylesheet -->
<link href="${pageContext.request.contextPath }/css/style.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
</head>

<body>
	<jsp:include
		page="${pageContext.request.contextPath }/views/User/navUser.jsp"></jsp:include>

	<!-- Breadcrumb Start -->
	<div class="breadcrumb-wrap">
		<div class="container-fluid">
			<ul class="breadcrumb">
				<li class="breadcrumb-item"><a href="${pageContext.request.contextPath }/home">Home</a></li>
				<li class="breadcrumb-item"><a href="${pageContext.request.contextPath }/my-account">Order</a></li>
				<li class="breadcrumb-item active">Order Detail</li>
			</ul>
		</div>
	</div>
	<!-- Breadcrumb End -->

	<!-- Product Detail Start -->
	<div class="container mt-5 mb-5">
		<div class="row d-flex justify-content-center">
			<div class="col-md-8">
				<div class="card">
					<div class="invoice p-5">
						<h5>Your order Confirmed!</h5>
						<span class="font-weight-bold d-block mt-4">Hello,
							${item.fullname}</span> <span>You order has been confirmed and
							will be shipped in next two days!</span>
						<div
							class="payment border-top mt-3 mb-3 border-bottom table-responsive">
							<table class="table table-borderless">
								<tbody>
									<tr>
										<td>
											<div class="py-2">
												<span class="d-block text-muted">Order Date</span> <span>${ord.createdate}</span>
											</div>
										</td>
										<td>
											<div class="py-2">
												<span class="d-block text-muted">Order No</span> <span>${ord.id}</span>
											</div>
										</td>
										<td>
											<div class="py-2">
												<span class="d-block text-muted">Payment</span>

											</div>
										</td>
										<td>
											<div class="py-2">
												<span class="d-block text-muted">Shiping Address</span> <span>${ord.address}</span>
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
													<span class="d-block">Quantity:${ordt.quantity }</span> <span>Color:${ordt.color}</span>
													<div><span>Size:${ordt.size}</span></div>
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
													<span class="font-weight-bold">Subtotal</span>
												</div>
											</td>
											<td>
												<div class="text-right">
													<span class="font-weight-bold">$${ord.totalprice }</span>
												</div>
											</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
						<p>We will be sending shipping confirmation email when the
							item shipped successfully!</p>
						<p class="font-weight-bold mb-0">Thanks for shopping with us!</p>
						<span>From LilBao with love</span>
					</div>
					<div class="d-flex justify-content-between footer p-3">
						<span>Need Help? visit our <a href="#"> help center</a></span>
						<div>
						<c:if test="${not empty sessionScope.user }">
							<c:if test="${ord.status==0}">
								<a
									href="${pageContext.request.contextPath}/cancellated?ordid=${ord.id}"
									class="btn btn-outline-danger"> <i class="bi bi-x"></i>
									Cancellation order
								</a>
							</c:if>
						</c:if>			
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<jsp:include
		page="${pageContext.request.contextPath }/views/User/footerUser.jsp"></jsp:include>

	<!-- Back to Top -->
	<a href="#" class="back-to-top"><i class="fa fa-chevron-up"></i></a>

	<!-- JavaScript Libraries -->
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
	<script src="lib/easing/easing.min.js"></script>
	<script src="lib/slick/slick.min.js"></script>

	<!-- Template Javascript -->
	<script src="js/main.js"></script>
</body>
</html>