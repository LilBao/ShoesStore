<%@ page 
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
 <meta charset="utf-8">
        <title>Shopping Cart</title>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
		<script src="${pageContext.request.contextPath}/js/customjs/ajax.js"></script>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="eCommerce HTML Template Free Download" name="keywords">
        <meta content="eCommerce HTML Template Free Download" name="description">

        <!-- Favicon -->
        <link href="${pageContext.request.contextPath}/img/favicon.ico" rel="icon">

        <!-- Google Fonts -->
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400|Source+Code+Pro:700,900&display=swap" rel="stylesheet">

        <!-- CSS Libraries -->
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/lib/slick/slick.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/lib/slick/slick-theme.css" rel="stylesheet">
        
          <!-- Template Stylesheet -->
        <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">
</head>
<body>
        <jsp:include page="${pageContext.request.contextPath }/views/User/navUser.jsp"></jsp:include>
        
        <!-- Breadcrumb Start -->
        <div class="breadcrumb-wrap">
            <div class="container-fluid">
                <ul class="breadcrumb">
                    <li class="breadcrumb-item"><a href="#">Home</a></li>
                    <li class="breadcrumb-item"><a href="#">Products</a></li>
                    <li class="breadcrumb-item active">Cart</li>
                </ul>
            </div>
        </div>
        <!-- Breadcrumb End -->
        
        <!-- Cart Start -->
        <div class="cart-page" >
            <div class="container-fluid">
                <div class="row" id="listProd">
                    <div class="col-lg-8">
                        <div class="cart-page-inner">
                            <div class="table-responsive">
                            	<button class="btn btn-danger mb-3 bg-danger text-light"
								onclick="removeAllCart()">Remove All</button>
                                <table class="table table-bordered">
                                    <thead class="thead-dark">
                                        <tr>
                                            <th>Product</th>
                                            <th>Price</th>
                                            <th>Quantity</th>
                                            <th>Size</th>
                                            <th>Total</th>
                                            <th>Remove</th>
                                        </tr>
                                    </thead>
                                    <tbody class="align-middle">
                                    <c:forEach var="item" items="${listCart }">
                                    	<tr>                       
                                            <td>
                                                <div class="img">
                                                     <a href="#"><img src="${pageContext.request.contextPath}/img/${item.value.prdDetail[0].img[0]}" alt="Image"></a>
                                                     <p>${item.value.name }</p>
                                                </div>
                                            </td>
                                            <td>${item.value.price }$</td>
                                            <td>
                                            <form action="${pageContext.request.contextPath}/api/cart/update">
                                            <input name="id" hidden="hidden" value="${item.key}">
                                            	<div class="qty">
                                                    <button value="${item.value.quantity}" onblur="this.form.submit()" class="btn-minus"><i class="fa fa-minus"></i></button>
                                                    <input name="quantity" value="${item.value.quantity}" onblur="this.form.submit()">
                                                    <button value="${item.value.quantity}" onblur="this.form.submit()" class="btn-plus"><i class="fa fa-plus"></i></button>
                                                </div>
                                            </form>                                        
                                            </td>
                                            <td>${item.value.prdDetail[0].size[0]}</td>
                                            <td>${item.value.price * item.value.quantity}$</td>
                                            <td><button onclick="removeCart('${item.key}')"><i class="fa fa-trash"></i></button></td>
                                        </tr>
                                    </c:forEach> 
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="cart-page-inner">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="coupon">
                                        <input type="text" placeholder="Coupon Code">
                                        <button>Apply Code</button>
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="cart-summary">
                                        <div class="cart-content">
                                            <h1>Cart Summary</h1>
                                            <p>Sub Total<span>$99</span></p>
                                            <p>Shipping Cost<span>$1</span></p>
                                            <h2>Grand Total<span>${amount }$</span></h2>
                                        </div>
                                        <div class="cart-btn d-flex justify-content-between">
                                            <a class="btn px-5 py-2 my-3" href="${pageContext.request.contextPath}/cart">Update cart</a>
                                            <a class="btn px-5 py-2 my-3" href="${pageContext.request.contextPath}/checkout">Checkout</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Cart End -->
        
         <jsp:include page="${pageContext.request.contextPath }/views/User/footerUser.jsp"></jsp:include>   
        
        <!-- Back to Top -->
        <a href="#" class="back-to-top"><i class="fa fa-chevron-up"></i></a>
        
        <!-- JavaScript Libraries -->
        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
        <script src="${pageContext.request.contextPath}/lib/easing/easing.min.js"></script>
        <script src="${pageContext.request.contextPath}/lib/slick/slick.min.js"></script>
        
        <!-- Template Javascript -->
        <script src="${pageContext.request.contextPath}/js/main.js"></script>
    </body>
</html>