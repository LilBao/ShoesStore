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
				<li class="breadcrumb-item"><a href="#">Home</a></li>
				<li class="breadcrumb-item"><a href="#">Products</a></li>
				<li class="breadcrumb-item active">Product Detail</li>
			</ul>
		</div>
	</div>
	<!-- Breadcrumb End -->

	<!-- Product Detail Start -->
	<div class="product-detail">
		<div class="container-fluid">
			<div class="row">
				<div class="col-md-12" id="detail">
					<div class="product-detail-top">
						<div class="row d-flex">
							<div class="col-md-7 d-flex flex-wrap">
								<c:forEach var="item" items="${listImgSize.img }">
									<img class="img-thumbnail w-50 px-1 py-1"
										src="${pageContext.request.contextPath }/img/${item}"
										alt="Product Image">
								</c:forEach>
							</div>
							<div class="col-md-5">
								<div class="product-content">
									<input hidden="hidden" type="text" name="id" value=${prd.id }>
									<div class="title">
										<h2>${prd.name}</h2>
									</div>
									<div class="price">
										<h4>Price:</h4>
										<p>${prd.price }
											<span>$149</span>
										</p>
									</div>
									<div class="quantity">
										<h4>Brand:</h4>
										<span>${prd.brand }</span>
									</div>
									<div class="p-color d-flex">
										<h4>Color:</h4>
										<c:forEach var="item" items="${listColor}">
											<img id="color" class="mr-2" height="15%" width="15%"
												onclick="detail('${prd.id}','${item.color}')" alt=""
												src="${pageContext.request.contextPath }/img/${item.img[0]}">
											<input type="radio" hidden="hidden" class="form-check-input"
												value="${item.color}" name="color" />
										</c:forEach>
									</div>
									<div class="quantity d-flex">
										<h4 class="">Quantity:</h4>
										<select id="quantity" onchange="assignValue(this)" class="form-control mr-5">
											<c:forEach var="item" items="${quantity}">
												<option value="${item}">${item }</option>
											</c:forEach>
										</select>
									</div>
									<div class="p-size options">
										<h4>Size:</h4>
										<div class="d-flex flex-wrap">
										
										<c:forEach var="item" items="${listImgSize.size}">
											<div class="my-radio">
												<input type="radio" id="size-${item}" name="size"
													onclick="getValue(this)" value="${item}"> <label
													for="size-${item}">${item}</label>
											</div>
										</c:forEach>
										</div>
									</div>
									<div class="action">
										<a class="btn"
											onclick="addToCart('${prd.id}','${color}','${size}','${quantity }')"><i
											class="fa fa-shopping-cart"></i>Add to Cart</a>
										<c:if test="${usid !=null}">
										<a class="btn" onclick="addToWishList('${prd.id}','${usid}')">Favorite<i class="fa fa-heart"></i></a>
										</c:if>
										<c:if test="${usid ==null}">
										<a class="btn" href="${pageContext.request.contextPath }/login">Favorite<i class="fa fa-heart"></i></a>
										</c:if>
									</div>
								</div>
								
								<div class="row product-detail-bottom">
						<div class="col-lg-12">
							<ul class="nav nav-pills nav-justified">
								<li class="nav-item"><a class="nav-link active"
									data-toggle="pill" href="#description">Description</a></li>
								<li class="nav-item"><a class="nav-link" data-toggle="pill"
									href="#reviews">Reviews (1)</a></li>
							</ul>

							<div class="tab-content">
								<div id="description" class="container tab-pane active">
									<h4>Product description</h4>
									<p>${prd.description }</p>
								</div>
								<div id="reviews" class="container tab-pane fade">
									<div class="reviews-submitted">
										<div class="reviewer">
											Phasellus Gravida
										</div>
										<p>Sed ut perspiciatis unde omnis iste natus error sit
											voluptatem accusantium doloremque laudantium, totam rem
											aperiam.</p>
									</div>
									<div class="reviews-submit">
										<h4>Give your Review:</h4>
										<div class="row form">
											<div class="col-sm-12">
												<textarea placeholder="Review"></textarea>
											</div>
											<div class="col-sm-12">
												<button>Submit</button>
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
					<div class="product">
						<div class="section-header">
							<h1>Related Products</h1>
						</div>

						<div
							class="row align-items-center product-slider product-slider-3">
							<c:forEach var="item" items="${listRelated }">
								<div class="col-md-3 col-sm-6 col-md-12">
									<div class="product-grid">
										<div class="product-image">
											<a class="img"> <img
												src="${pageContext.request.contextPath }/img/${item.prdDetail[0].img[0] }"
												alt="Product Image">
											</a>
											<ul class="product-links">
												<li><a onclick="addToWishList('${item.id}','${usid}')"><i
														class="fa fa-heart"></i></a></li>
												<li><a
													href="${pageContext.request.contextPath}/product?id=${item.id}"><i
														class="fa fa-search"></i></a></li>
											</ul>
										</div>
										<div class="product-content">
											<div class="price">$${item.price}</div>
											<h3 class="title">
												<a href="${pageContext.request.contextPath}/product?id=${item.id}">${item.name }</a>
											</h3>
										</div>
									</div>
								</div>
							</c:forEach>
						</div>
					</div>
				</div>

				<!-- Side Bar Start -->
				<!-- Side Bar End -->
			</div>
		</div>
	</div>
	<!-- Product Detail End -->

	<!-- Brand Start -->
	<div class="brand">
		<div class="container-fluid">
			<div class="brand-slider">
				<div class="brand-item">
					<img src="${pageContext.request.contextPath}/img/logoadidas.jpg"
						alt="">
				</div>
				<div class="brand-item">
					<img src="${pageContext.request.contextPath}/img/logoconverse.jpg"
						alt="">
				</div>
				<div class="brand-item">
					<img src="${pageContext.request.contextPath}/img/logodior.png"
						alt="">
				</div>
				<div class="brand-item">
					<img src="${pageContext.request.contextPath}/img/logovans.png"
						alt="">
				</div>
				<div class="brand-item">
					<img
						src="${pageContext.request.contextPath}/img/logolouisvuitton.jpg"
						alt="">
				</div>
				<div class="brand-item">
					<img src="${pageContext.request.contextPath}/img/logonike.jpg"
						alt="">
				</div>
			</div>
		</div>
	</div>
	<!-- Brand End -->

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
	<script type="text/javascript">
		$(document).ready(function() {
			$(document).on('input', 'input[name="quantity"]', function() {
				var value = $(this).val();
				console.log(value)
			});
		})
	</script>
</body>
</html>
