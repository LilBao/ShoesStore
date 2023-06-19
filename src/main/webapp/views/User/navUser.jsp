<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!-- Top bar Start -->
<div class="top-bar">
	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-6">
				<i class="fa fa-envelope"></i> support@email.com
			</div>
			<div class="col-sm-6">
				<i class="fa fa-phone-alt"></i> +012-345-6789
			</div>
		</div>
	</div>
</div>
<!-- Top bar End -->

<!-- Nav Bar Start -->
<div class="nav">
	<div class="container-fluid">
		<nav class="navbar navbar-expand-md bg-dark navbar-dark">
			<a href="#" class="navbar-brand">MENU</a>
			<button type="button" class="navbar-toggler" data-toggle="collapse"
				data-target="#navbarCollapse">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div class="collapse navbar-collapse justify-content-between"
				id="navbarCollapse">
				<div class="navbar-nav mr-auto">
					<a href="${pageContext.request.contextPath }/home"
						class="nav-item nav-link">Home</a>
						 <a
						href="${pageContext.request.contextPath }/cart"
						class="nav-item nav-link">Cart</a> <a
						href="${pageContext.request.contextPath }/checkout"
						class="nav-item nav-link">Checkout</a>
					<div class="nav-item dropdown ">
						<a href="${pageContext.request.contextPath }/shop" class="nav-link dropdown-toggle"
							data-toggle="dropdown">Shop</a>
						<ul class="dropdown-menu">
							<li class="dropdown-item"><a class="nav-link" href="${pageContext.request.contextPath }/product-list"><i
									class=""></i>Shop All</a></li>
							<li class="dropdown-item"><a class="nav-link" href="${pageContext.request.contextPath }/product-list?category=SNK"><i
									class=""></i>Sneaker</a></li>
							<li class="dropdown-item"><a class="nav-link" href="${pageContext.request.contextPath }/product-list?category=B"><i
									class=""></i>Boots</a></li>
							<li class="dropdown-item"><a class="nav-link" href="${pageContext.request.contextPath }/product-list?category=KD"><i
									class=""></i>Kids</a></li>
							<li class="dropdown-item"><a class="nav-link" href="${pageContext.request.contextPath }/product-list?category=OF"><i
									class=""></i>Oxford</a></li>
							<li class="dropdown-item"><a class="nav-link" href="${pageContext.request.contextPath }/product-list?category=SD"><i
									class=""></i>Sandals</a></li>
							<li class="dropdown-item"><a class="nav-link" href="${pageContext.request.contextPath }/product-list?category=M"><i
									class=""></i>Mule</a></li>
							<li class="dropdown-item"><a class="nav-link" href="${pageContext.request.contextPath }/product-list?category=P"><i
									class=""></i>Pumps</a></li>
						</ul>
					</div>
				</div>
				<div class="navbar-nav ml-auto">
					<div class="nav-item dropdown">
						<c:if test="${not empty sessionScope.user}">
							<div class="nav-item dropdown">
								<a class="nav-link dropdown-toggle" href="#" id="userDropdown"
									role="button" data-toggle="dropdown" aria-haspopup="true"
									aria-expanded="false"> <span
									class="mr-2 d-none d-lg-inline text-gray-600 small">${sessionScope.user.fullname}</span>
								</a>
								<!-- Dropdown - User Information -->
								<div
									class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
									aria-labelledby="userDropdown">
									 <a href="${pageContext.request.contextPath }/my-account" class="dropdown-item" href="#"> <i
										class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>
										Settings
									</a> <a class="dropdown-item" href="#"> <i
										class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i>
										Activity Log
									</a>
									<c:if test="${sessionScope.user.admin !=2}">
										<a href="${pageContext.request.contextPath}/index" class="dropdown-item">
										<i class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>Manager</a>						
									</c:if>
									<div class="dropdown-divider"></div>
									<a class="dropdown-item" href="${pageContext.request.contextPath}/logout"> <i
										class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
										Logout
									</a>
								</div>
							</div>
						</c:if>
						<c:if test="${empty sessionScope.user}">
							<a href="${pageContext.request.contextPath}/login" class="nav-link">Login</a>						
						</c:if>
					</div>
				</div>
			</div>
		</nav>
	</div>
</div>
<!-- Nav Bar End -->

<!-- Bottom Bar Start -->
<div class="bottom-bar">
	<div class="container-fluid">
		<div class="row align-items-center">
			<div class="col-md-3">
				<div class="logo">
					<a href="${pageContext.request.contextPath }/home"> <img
						src="${pageContext.request.contextPath }/img/logo.png" alt="Logo">
					</a>
				</div>
			</div>
			<div class="col-md-6">
				<div class="search">
				<form action="">
					<input type="text" name="keyword" placeholder="Search">
					<button formaction="${pageContext.request.contextPath }/search-result">
						<i class="fa fa-search"></i>
					</button>
				</form>
				</div>
			</div>
			<div class="col-md-3">
				<div id="tag-cart" class="user">
					<a href="${pageContext.request.contextPath }/wishlist"
						class="btn wishlist"> <i class="fa fa-heart"></i> <span>(${sizeWishList ==null ? 0 : sizeWishList})</span>
					</a> <a href="${pageContext.request.contextPath}/cart" class="btn cart">
						<i class="fa fa-shopping-cart"></i> <span>(${size==null ? 0 : size})</span>
					</a>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- Bottom Bar End -->
