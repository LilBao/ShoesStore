<%@ page
    pageEncoding="utf-8"%>
   <%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <title>E Store - eCommerce HTML Template</title>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
		<script src="${pageContext.request.contextPath}/js/customjs/ajax.js"></script>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="eCommerce HTML Template Free Download" name="keywords">
        <meta content="eCommerce HTML Template Free Download" name="description">

        <!-- Favicon -->
        <link href="${pageContext.request.contextPath }/img/favicon.ico" rel="icon">

        <!-- Google Fonts -->
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400|Source+Code+Pro:700,900&display=swap" rel="stylesheet">

        <!-- CSS Libraries -->
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath }/lib/slick/slick.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath }/lib/slick/slick-theme.css" rel="stylesheet">

        <!-- Template Stylesheet -->
        <link href="${pageContext.request.contextPath }/css/style.css" rel="stylesheet">
    </head>

    <body>
        <jsp:include page="${pageContext.request.contextPath }/views/User/navUser.jsp"></jsp:include>
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
        
         <!-- Wishlist Start -->
        <div class="wishlist-page">
            <div class="container-fluid">
                <div class="wishlist-page-inner">
                    <div class="row" id="wishlist">
                        <div class="col-md-12">
                            <div class="table-responsive">
                                <table class="table table-bordered">
                                    <thead class="thead-dark">
                                        <tr>
                                            <th>Product</th>
                                            <th>Price</th>                                       
                                            <th>Detail</th>
                                            <th>Remove</th>
                                        </tr>
                                    </thead>
                                    <tbody class="align-middle">
                                    <c:forEach var="item" items="${wishList}">
                                          <tr>
                                            <td>
                                            <input hidden="hidden" name="id" value="${item.id}">
                                                <div class="img">
                                                    <a href="#"><img src="${pageContext.request.contextPath }/img/${item.products.prdDetail[0].img[0]}" alt="Image"></a>
                                                    <p>${item.products.name}</p>
                                                </div>
                                            </td>
                                            <td>${item.products.price}$</td>
                                            <td><a class="btn" href="${pageContext.request.contextPath }/product?id=${item.products.id}">Detail</a></td>
                                            <td><button onclick="removeWishList('${item.id}')"><i class="fa fa-trash"></i></button></td>
                                        </tr>                             
                                    </c:forEach>                                                                         
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Wishlist End -->
        
        <!-- Checkout End -->
  		<jsp:include page="${pageContext.request.contextPath }/views/User/footerUser.jsp"></jsp:include>
  		
        
        <!-- Back to Top -->
        <a href="#" class="back-to-top"><i class="fa fa-chevron-up"></i></a>
        
        <!-- JavaScript Libraries -->
        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
        <script src="lib/easing/easing.min.js"></script>
        <script src="lib/slick/slick.min.js"></script>
        
        <!-- Template Javascript -->
        <script src="js/main.js"></script>
    </body>
</html>
