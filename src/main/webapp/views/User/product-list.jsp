<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>product-list</title>
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="eCommerce HTML Template Free Download" name="keywords">
<meta content="eCommerce HTML Template Free Download" name="description">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="${pageContext.request.contextPath}/js/customjs/ajax.js"></script>
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
	<!-- Product List Start -->
	<div class="product-view">
		<div class="container-fluid">
			<div class="row">
				<!-- Side Bar Start -->
				<div class="col-lg-3 sidebar">
					<div class="sidebar-widget category">
						<h2 class="title">Category</h2>
						<nav class="navbar bg-light sidebar-widget brands">
							<ul class="navbar-nav ">
								<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath }/product-list"><i
									class=" "></i>Shop All</a></li>
								<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath }/product-list?category=SNK"><i
									class=" "></i>Sneaker</a></li>
								<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath }/product-list?category=B"><i
									class=" "></i>Boots</a></li>
								<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath }/product-list?category=KD"><i
									class=" "></i>Kids</a></li>
								<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath }/product-list?category=OF"><i
									class=" "></i>Oxford</a></li>
								<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath }/product-list?category=SD"><i
									class=" "></i>Sandals</a></li>
								<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath }/product-list?category=M"><i
									class=" "></i>Mule</a></li>
								<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath }/product-list?category=P"><i
									class=" "></i>Pumps</a></li>
							</ul>
						</nav>
					</div>

					<div class="sidebar-widget brands" id="range">
						<h2 class="title">Range cost</h2>
						<ul>
							<li><a onclick="sortPrdList('${category}','${color}','0','${Float.MAX_VALUE-100}','${brand }','${page}','${sortField }','${reverseSortDir }')"> All price</a><span></span></li>
							<li><a onclick="sortPrdList('${category}','${color}','0','100','${brand }','${page}','${sortField }','${reverseSortDir }')"> <100$</a><span></span></li>
							<li><a onclick="sortPrdList('${category}','${color}','100','300','${brand }','${page}','${sortField }','${reverseSortDir }')">100$ - 300$ </a><span></span></li>
							<li><a onclick="sortPrdList('${category}','${color}','300','600','${brand }','${page}','${sortField }','${reverseSortDir }')">300$ - 600$ </a><span></span></li>
							<li><a onclick="sortPrdList('${category}','${color}','600','1000','${brand }','${page}','${sortField }','${reverseSortDir }')">600$ - 1000$</a><span></span></li>
							<li><a onclick="sortPrdList('${category}','${color}','1000','2000','${brand }','${page}','${sortField }','${reverseSortDir }')">1000$ - 2000$</a><span></span></li>
							<li><a onclick="sortPrdList('${category}','${color}','2000','${Float.MAX_VALUE-100}','${brand }','${page}','${sortField }','${reverseSortDir }')"> >2000$ </a><span></span></li>
						</ul>
					</div>

					<div class="sidebar-widget tag">
						<h2 class="title">Tags Cloud</h2>
						<a href="#">Balenciaga</a> <a href="#">Luis Vuiton</a> <a href="#">Nike</a>
						<a href="#">Suppreme</a> <a href="#">Channel</a> <a href="#">Dior</a>
						<a href="#">Bitis hunter</a> <a href="#">Saint Laurent </a> <a href="#">
						Adidas</a> <a href="#">Jordan</a> <a href="#">orci luctus</a> <a
							href="#">MLB</a>
					</div>
				</div>
				<!-- Side Bar End -->
				<div class="col-lg-9" id="producList">
					<div class="row">
						<div class="col-md-12">
							<div class="product-view-top">
								<div class="row">
									<div class="col-md-4">
										<div class="input-group mb-3 align-items-center">									
										<input style="border-right:none" onchange="sortPrdList('${category}','${color}','${min }','${max }',this.value,'${page}','${sortField }','${reverseSortDir }')" class="form-control" placeholder="${brand eq '' ? 'brand' : brand}"> 
										<button style="border-radius:0px;border-left:none" class="btn border border-start-0" onclick="sortPrdList('${category}','${color}','${min }','${max }','','${page}','${sortField }','${reverseSortDir }')" class="">X</button > 
										</div>
									</div>	
									<div class="col-md-4">
										<div class="product-short">
											<div class="dropdown">
												<div class="dropdown-toggle" data-toggle="dropdown">Color</div>
												<div class="dropdown-menu dropdown-menu-right">
													<a
														onclick="sortPrdList('${category}','','${min }','${max }','${brand }','${page}','${sortField }','${reverseSortDir }')"
														class="dropdown-item">None</a>
													<c:forEach var="item" items="${listColor }">
														<a
															onclick="sortPrdList('${category}','${item.key}','${min }','${max }','${brand }','${page}','${sortField }','${reverseSortDir }')"
															class="dropdown-item">${item.value}</a>
													</c:forEach>
												</div>
											</div>
										</div>
									</div>
									<div class="col-md-4">
										<div class="product-price-range" id="priority">
											<div class="dropdown">
												<div class="dropdown-toggle" data-toggle="dropdown">Priority</div>
												<div class="dropdown-menu dropdown-menu-right">
													<a
														onclick="sortPrdList('${category}','${color}','${min }','${max }','${brand }','${page}','createdate','desc')"
														class="dropdown-item">Latest</a> <a
														onclick="sortPrdList('${category}','${color}','${min }','${max }','${brand }','${page}','price','asc')"
														class="dropdown-item">Price Increase</a> <a
														onclick="sortPrdList('${category}','${color}','${min }','${max }','${brand }','${page}','price','desc')"
														class="dropdown-item">Price Decrease</a>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!--  sản phẩm -->
					<div class="row">
						<c:forEach var="item" items="${list}">
							<div class="col-md-3 col-sm-6">
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


					<!-- Pagination Start -->
					<div class="col-md-12">
						<nav aria-label="Page navigation example">
							  <ul class="pagination justify-content-center my-5">
									<li class="page-item"><a class="page-link"
										href="${pageContext.request.contextPath }/product-list?category=${category}&color=${color}&min=${min }&max=${max }&brand=${brand }&page=0&sortField=${sortField }&sortDir=${reverseSortDir }">First</a></li>
									<li class="page-item"><a class="page-link"
										href="${pageContext.request.contextPath }/product-list?category=${category}&color=${color}&min=${min }&max=${max }&brand=${brand }&page=${currentPage-1}&sortField=${sortField }&sortDir=${reverseSortDir }">Back</a></li>
									<li class="page-item"><a class="page-link"
										href="${pageContext.request.contextPath }/product-list?category=${category}&color=${color}&min=${min }&max=${max }&brand=${brand }&page=${currentPage+1}&sortField=${sortField }&sortDir=${reverseSortDir }">Next</a></li>
									<li class="page-item"><a class="page-link"
										href="${pageContext.request.contextPath }/product-list?category=${category}&color=${color}&min=${min }&max=${max }&brand=${totalPages-1 }&page=${currentPage-1}&sortField=${sortField }&sortDir=${reverseSortDir }">Last</a></li>
								</ul>
						</nav>
					</div>
					<!-- Pagination Start -->
				</div>
			</div>
		</div>
	</div>
	<!-- Product List End -->

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
	<script
		src="${pageContext.request.contextPath }/lib/easing/easing.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/lib/slick/slick.min.js"></script>

	<!-- Template Javascript -->
	<script src="${pageContext.request.contextPath }/js/main.js"></script>
</body>
</html>