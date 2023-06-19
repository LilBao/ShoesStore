<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>product-list</title>
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
	<div class="container-fluid col-10">
		<!-- Side Bar End -->
		<div class="col-12">
			<div class="row">
				<c:forEach var="item" items="${list}">
					<div class="col-md-3 col-sm-6 my-2">
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
			</div >
			<center>
			<a class="btn justify-content-center" href="${pageContext.request.contextPath}/product-list" class="btn">More
				Product</a>	
			</div>
			</center>
	</div>

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