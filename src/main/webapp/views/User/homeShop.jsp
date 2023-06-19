<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Home</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="${pageContext.request.contextPath}/js/customjs/ajax.js"></script>
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="eCommerce HTML Template Free Download" name="keywords">
<meta content="eCommerce HTML Template Free Download" name="description">

<!-- Favicon -->
<link href="${pageContext.request.contextPath}/img/favicon.ico"
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
<link href="${pageContext.request.contextPath}/lib/slick/slick.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/lib/slick/slick-theme.css"
	rel="stylesheet">

<!-- Template Stylesheet -->
<link href="${pageContext.request.contextPath}/css/style.css"
	rel="stylesheet">
</head>
<body>
	<jsp:include
		page="${pageContext.request.contextPath }/views/User/navUser.jsp"></jsp:include>

	<!-- Main Slider Start -->
	<div class="header">
		<div class="container-fluid">
			<div class="row">				
				<div class="col-md-9">
					<div class="header-slider normal-slider">
						<div class="header-slider-item" >
							<img class="w-100" height="400px" src="${pageContext.request.contextPath}/img/slider-1.jpg"
								alt="Slider Image" />
							<div class="header-slider-caption">
								<p>Discover an extraordinary collection of footwear for
									every occasion</p>
								<a class="btn" href=""><i class="fa fa-shopping-cart"></i>Shop
									Now</a>
							</div>
						</div>
						<div class="header-slider-item">
							<img  class="w-100" height="400px" src="${pageContext.request.contextPath}/img/slider-2.jpg"
								alt="Slider Image" />
							<div class="header-slider-caption">
								<p>Swift and seamless payment methods for your convenience</p>
								<a class="btn" href=""><i class="fa fa-shopping-cart"></i>Shop
									Now</a>
							</div>
						</div>
						<div class="header-slider-item">
							<img  class="w-100" height="400px"  src="${pageContext.request.contextPath}/img/slider-3.jpg"
								alt="Slider Image" />
							<div class="header-slider-caption">
								<p>Effortless and expedited delivery services</p>
								<a class="btn" href=""><i class="fa fa-shopping-cart"></i>Shop
									Now</a>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-3">
					<div class="header-img">
						<div class="img-item">
							<img class="w-100" src="${pageContext.request.contextPath}/img/sneaker_01.png" />
							<a class="img-text" href="">
								<p>Sneakers</p>
							</a>
						</div>
						<div class="img-item">
							<img class="w-100" src="${pageContext.request.contextPath}/img/leather_01.jpg" />
							<a class="img-text" href="">
								<p>Leather Shoes</p>
							</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Main Slider End -->

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

	<!-- Feature Start-->
	<div class="feature">
		<div class="container-fluid">
			<div class="row align-items-center">
				<div class="col-lg-3 col-md-6 feature-col">
					<div class="feature-content">
						<i class="fab fa-cc-mastercard"></i>
						<h2>Secure Payment</h2>
						<p>Lorem ipsum dolor sit amet consectetur elit</p>
					</div>
				</div>
				<div class="col-lg-3 col-md-6 feature-col">
					<div class="feature-content">
						<i class="fa fa-truck"></i>
						<h2>Worldwide Delivery</h2>
						<p>Lorem ipsum dolor sit amet consectetur elit</p>
					</div>
				</div>
				<div class="col-lg-3 col-md-6 feature-col">
					<div class="feature-content">
						<i class="fa fa-sync-alt"></i>
						<h2>90 Days Return</h2>
						<p>Lorem ipsum dolor sit amet consectetur elit</p>
					</div>
				</div>
				<div class="col-lg-3 col-md-6 feature-col">
					<div class="feature-content">
						<i class="fa fa-comments"></i>
						<h2>24/7 Support</h2>
						<p>Lorem ipsum dolor sit amet consectetur elit</p>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Feature End-->

	<!-- Category Start-->
	<div class="category">
		<div class="container-fluid">
			<div class="row">
				<div class="col-md-3">
					<div class="category-item ch-400">
						<img src="${pageContext.request.contextPath}/img/unisex_01.jpg" />
						<a class="category-name" href="">
							<p>Unisex Shoes</p>
						</a>
					</div>
				</div>
				<div class="col-md-3">
					<div class="category-item ch-250">
						<img src="${pageContext.request.contextPath}/img/Men_01.jpg" /> <a
							class="category-name" href="">
							<p>Men's Shoes</p>
						</a>
					</div>
					<div class="category-item ch-150">
						<img src="${pageContext.request.contextPath}/img/Kids_01.jpg" />
						<a class="category-name" href="">
							<p>Kids' Shoes</p>
						</a>
					</div>
				</div>
				<div class="col-md-3">
					<div class="category-item ch-150">
						<img src="${pageContext.request.contextPath}/img/sport_01.jpeg" />
						<a class="category-name" href="">
							<p>Sport Shoes</p>
						</a>
					</div>
					<div class="category-item ch-250">
						<img src="${pageContext.request.contextPath}/img/Women_01.jpg" />
						<a class="category-name" href="">
							<p>Women's Shoes</p>
						</a>
					</div>
				</div>
				<div class="col-md-3">
					<div class="category-item ch-400">
						<img src="${pageContext.request.contextPath}/img/leather_02.jpg" />
						<a class="category-name" href="">
							<p>Leather Shoes</p>
						</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Category End-->

	<!-- Call to Action Start -->
	<div class="call-to-action">
		<div class="container-fluid">
			<div class="row align-items-center">
				<div class="col-md-6">
					<h1>call us for any queries</h1>
				</div>
				<div class="col-md-6">
					<a href="tel:0123456789">+012-345-6789</a>
				</div>
			</div>
		</div>
	</div>
	<!-- Call to Action End -->

	<!-- Featured Product Start -->
	<div class="featured-product product">
		<div class="container-fluid">
			<div class="section-header">
				<h1>Featured Product</h1>
			</div>
			<div class="row align-items-center product-slider product-slider-4">
				<c:forEach var="item" items="${listFeature }">
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
									<a
										href="${pageContext.request.contextPath}/product?id=${item.id}">${item.name }</a>
								</h3>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
	<!-- Featured Product End -->

	<!-- Newsletter Start -->
	<div class="newsletter">
		<div class="container-fluid">
			<div class="row">
				<div class="col-md-6">
					<h1>Subscribe Our Newsletter</h1>
				</div>
				<div class="col-md-6">
					<div class="form">
						<input type="email" value="Your email here">
						<button>Submit</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Newsletter End -->

	<!-- Recent Product Start -->
	<div class="recent-product product">
		<div class="container-fluid">
			<div class="section-header">
				<h1>Recent Product</h1>
			</div>
			<div class="row align-items-center product-slider product-slider-4">
				<c:forEach var="item" items="${listRecent }">
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
									<a
										href="${pageContext.request.contextPath}/product?id=${item.id}">${item.name }</a>
								</h3>
							</div>
						</div>
					</div>
				</c:forEach>
				</div>				
			</div>
		</div>
	<!-- Recent Product End -->

	<!-- Review Start -->
	<div class="review">
		<div class="container-fluid">
			<div class="row align-items-center review-slider normal-slider">
				<div class="col-md-6">
					<div class="review-slider-item">
						<div class="review-img">
							<img src="${pageContext.request.contextPath}/img/review-1.jpg"
								alt="Image">
						</div>
						<div class="review-text">
							<h2>Customer Name</h2>
							<h3>Profession</h3>
							<div class="ratting">
								<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
									class="fa fa-star"></i> <i class="fa fa-star"></i> <i
									class="fa fa-star"></i>
							</div>
							<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.
								Curabitur vitae nunc eget leo finibus luctus et vitae lorem</p>
						</div>
					</div>
				</div>
				<div class="col-md-6">
					<div class="review-slider-item">
						<div class="review-img">
							<img src="${pageContext.request.contextPath}/img/review-2.jpg"
								alt="Image">
						</div>
						<div class="review-text">
							<h2>Customer Name</h2>
							<h3>Profession</h3>
							<div class="ratting">
								<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
									class="fa fa-star"></i> <i class="fa fa-star"></i> <i
									class="fa fa-star"></i>
							</div>
							<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.
								Curabitur vitae nunc eget leo finibus luctus et vitae lorem</p>
						</div>
					</div>
				</div>
				<div class="col-md-6">
					<div class="review-slider-item">
						<div class="review-img">
							<img src="${pageContext.request.contextPath}/img/review-3.jpg"
								alt="Image">
						</div>
						<div class="review-text">
							<h2>Customer Name</h2>
							<h3>Profession</h3>
							<div class="ratting">
								<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
									class="fa fa-star"></i> <i class="fa fa-star"></i> <i
									class="fa fa-star"></i>
							</div>
							<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.
								Curabitur vitae nunc eget leo finibus luctus et vitae lorem</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Review End -->

	<jsp:include
		page="${pageContext.request.contextPath }/views/User/footerUser.jsp"></jsp:include>

	<!-- Back to Top -->
	<a href="#" class="back-to-top"><i class="fa fa-chevron-up"></i></a>


	<!-- JavaScript Libraries -->
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/lib/easing/easing.min.js"></script>
	<script src="${pageContext.request.contextPath}/lib/slick/slick.min.js"></script>

	<!-- Template Javascript -->
	<script src="${pageContext.request.contextPath}/js/main.js"></script>
</body>
</html>