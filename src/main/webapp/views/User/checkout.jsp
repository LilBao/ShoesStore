<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
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
</head>

<body>
	<jsp:include
		page="${pageContext.request.contextPath }/views/User/navUser.jsp"></jsp:include>
	<!-- Breadcrumb Start -->
	<div class="breadcrumb-wrap">
		<div class="container-fluid">
			<ul class="breadcrumb">
				<li class="breadcrumb-item"><a href="#">Home</a></li>
				<li class="breadcrumb-item"><a href="#">Products</a></li>
				<li class="breadcrumb-item active">Checkout</li>
			</ul>
		</div>
	</div>
	<!-- Breadcrumb End -->

	<!-- Checkout Start -->
	<div class="checkout">
		<div class="container-fluid">
			<form:form modelAttribute="orders"
				action="${pageContext.request.contextPath }/checkout/confirm"
				cssClass="col-md-12">
				<div class="row">
					<div class="col-lg-8">
						<div class="checkout-inner">
							<div class="billing-address">
								<h2>Billing Address</h2>
								<div class="row">
									<div class="col-md-12">
										<label>Full Name</label>
										<form:input path="fullname" value="${us.fullname }"
											cssClass="form-control" placeholder="First Name" />
									</div>
									<div class="col-md-6">
										<label>E-mail</label>
										<form:input path="email" value="${us.email }"
											cssClass="form-control" placeholder="E-mail" />
									</div>
									<div class="col-md-6">
										<label>Mobile No</label>
										<form:input path="phone" value="${us.phone }"
											cssClass="form-control" placeholder="Mobile No" />
									</div>
									<div class="col-md-12">
										<label>Address</label>
										<form:input path="address" cssClass="form-control"
											placeholder="Address" />
									</div>
									<!-- <div class="col-md-6">
                                        <label>Country</label>
                                        <select class="custom-select">
                                            <option selected>United States</option>
                                            <option>Afghanistan</option>
                                            <option>Albania</option>
                                            <option>Algeria</option>
                                        </select>
                                    </div> -->
									<div class="col-md-6">
										<label>District</label> <input class="form-control"
											type="text" placeholder="City">
									</div>
									<div class="col-md-6">
										<label>City</label> <input class="form-control" type="text"
											placeholder="State">
									</div>
									<div class="col-md-6">
										<label>ZIP Code</label> <input class="form-control"
											type="text" placeholder="ZIP Code">
									</div>
									<div class="col-md-12">
										<div class="custom-control custom-checkbox">
											<input type="checkbox" class="custom-control-input"
												id="newaccount"> <label class="custom-control-label"
												for="newaccount">Create an account</label>
										</div>
									</div>
									<div class="col-md-12">
										<div class="custom-control custom-checkbox">
											<input type="checkbox" class="custom-control-input"
												id="shipto"> <label class="custom-control-label"
												for="shipto">Ship to different address</label>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-lg-4">
						<div class="checkout-inner">
							<div class="header">Order Summary</div>
							<p>Total quantity of products: ${size }</p>
							<c:forEach var="item" items="${listCart }">
								<div class="row item">
									<div class="col-4 align-self-center">
										<img class="img-fluid"
											src="${pageContext.request.contextPath}/img/${item.value.prdDetail[0].img[0]}">
									</div>
									<div class="col-8">
										<div class="row">
											<b>$ ${item.value.quantity * item.value.price }</b>
										</div>
										<div class="row text-muted">${item.value.name}</div>
										<div class="row">Size:
											${item.value.prdDetail[0].size[0]}</div>
										<div class="row">Qty:${item.value.quantity }</div>
									</div>
								</div>
							</c:forEach>
							<hr>
							<div class="row lower">
								<div class="col text-left">Subtotal</div>
								<div class="col text-right">$ 46.98</div>
							</div>
							<div class="row lower">
								<div class="col text-left">Delivery</div>
								<div class="col text-right">Free</div>
							</div>
							<div class="row lower">
								<div class="col text-left">
									<b>Total to pay</b>
								</div>
								<div class="col text-right">
									<b>$ ${amount}</b>
								</div>
							</div>
							<div class="row lower">
								<div class="col text-left">
									<a href="#">Add promote code</a>
								</div>
							</div>
							<button class="btnCheckout">Place order</button>
							<p class="text-muted text-center">Complimentary Shipping &
								Returns</p>
						</div>
					</div>
				</div>
			</form:form>

		</div>
	</div>
	<!-- Checkout End -->
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
