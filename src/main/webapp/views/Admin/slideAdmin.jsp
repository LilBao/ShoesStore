<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!-- Sidebar -->
          <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

            <!-- Sidebar - Brand -->
            <a class="sidebar-brand d-flex align-items-center justify-content-center" href="${pageContext.request.contextPath }/home">
                <div class="sidebar-brand-icon rotate-n-15">
                    <i class="fas fa-laugh-wink"></i>
                </div>
                <div class="sidebar-brand-text mx-3">Admin <sup>E</sup></div>
            </a>

            <!-- Divider -->
            <hr class="sidebar-divider my-0">

            <!-- Nav Item - Dashboard -->
            <li class="nav-item active">
                <a class="nav-link" href="${pageContext.request.contextPath }/index">
                    <i class="fas fa-fw fa-tachometer-alt"></i>
                    <span>Dashboard</span></a>
            </li>

            <!-- Divider -->
            <hr class="sidebar-divider">

          
            <!-- Heading -->
            <div class="sidebar-heading">
             	Management
            </div>
         <!-- Order Table-->
            <!-- Nav Item - Pages Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseDH"
                    aria-expanded="true" aria-controls="collapseDH">
                    <i class="fas fa-fw fa-cog"></i>
                    <span>Order</span>
                </a>
                <div id="collapseDH" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header">Order</h6>
                        <a class="collapse-item" href="${pageContext.request.contextPath }/index/order?status=1">Order</a>                     
                   		<div class="collapse-divider"></div>
                        <h6 class="collapse-header">Pending Request:</h6>
                        <a class="collapse-item" href="${pageContext.request.contextPath}/index/order?status=0">Orders Request</a>
                        <a class="collapse-item" href="${pageContext.request.contextPath}/index/order?status=2">Cancellation Request</a>  
                    </div>
                </div>
            </li>


                <!-- Loại hàng -->
                <li class="nav-item">
                    <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseLH"
                        aria-expanded="true" aria-controls="collapseLH">
                        <i class="fas fa-fw fa-wrench"></i>
                        <span>Category</span>
                    </a>
                    <div id="collapseLH" class="collapse" aria-labelledby="headingUtilities"
                        data-parent="#accordionSidebar">
                        <div class="bg-white py-2 collapse-inner rounded">
                            <h6 class="collapse-header">List:</h6>
                            <a class="collapse-item" href="${pageContext.request.contextPath }/index/category">Category</a> 
                        </div>
                    </div>
                </li>

                <!-- Sản Phẩm -->
            <!-- Nav Item - Utilities Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseSP"
                    aria-expanded="true" aria-controls="collapseSP">
                    <i class="fas fa-fw fa-wrench"></i>
                    <span>Product</span>
                </a>
                <div id="collapseSP" class="collapse" aria-labelledby="headingUtilities"
                    data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header">Edit Product:</h6>
                        <a class="collapse-item" href="${pageContext.request.contextPath }/index/product">Product</a> 
                        
                        <div class="collapse-divider"></div>
                        <h6 class="collapse-header">Additional Information:</h6>
                        <a class="collapse-item" href="${pageContext.request.contextPath }/index/product/basic">Basic</a>
                        <a class="collapse-item" href="${pageContext.request.contextPath }/index/product/advance">Detail</a>
                    </div>
                </div>
            </li>

            <!-- Khách hàng -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseKH"
                    aria-expanded="true" aria-controls="collapseKH">
                    <i class="fas fa-fw fa-wrench"></i>
                    <span>Customer</span>
                </a>
                <div id="collapseKH" class="collapse" aria-labelledby="headingUtilities"
                    data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header">List Customer:</h6>
                        <a class="collapse-item" href="${pageContext.request.contextPath}/index/user">Customer</a>
                
                    </div>
                </div>
            </li>



            <!-- Divider -->
            <hr class="sidebar-divider">

            <!-- Heading -->
            <div class="sidebar-heading">
                Statistics
            </div>

            <!-- Nav Item - Pages Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTK"
                    aria-expanded="true" aria-controls="collapseTK">
                    <i class="fas fa-fw fa-folder"></i>
                    <span>Product</span>
                </a>
                <div id="collapseTK" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header">Type 1:</h6>
                        <a class="collapse-item" href="${pageContext.request.contextPath}/index/statistic/best-selling">Best selling</a>
                        <a class="collapse-item" href="${pageContext.request.contextPath}/index/statistic/favorite">Favorite</a>
                 
                        <div class="collapse-divider"></div>
                        <h6 class="collapse-header">Type 2:</h6>
                        <a class="collapse-item" href="${pageContext.request.contextPath}/index/statistic/inventory">Inventory</a>
                      
                    </div>
                </div>
            </li>

            <!-- Thống Kê  Doanh Thu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseDT"
                    aria-expanded="true" aria-controls="collapseDT">
                    <i class="fas fa-fw fa-folder"></i>
                    <span>Earning Statistic</span>
                </a>
                <div id="collapseDT" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header">Earning:</h6>
                        <a class="collapse-item" href="#">Week</a>
                        <a class="collapse-item" href="#">Month</a>
                        <a class="collapse-item" href="#">Year</a>
                       
               
                    </div>
                </div>
            </li>

            <!-- Divider -->
            <hr class="sidebar-divider d-none d-md-block">
            <div class="sidebar-heading">
               
              Setting
            </div>
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo"
                    aria-expanded="true" aria-controls="collapseTwo">
                    <i class="fas fa-fw fa-cog"></i>
                    <span>Account</span>
                </a>
                <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header">Modify</h6>
                        <a class="collapse-item" href="${pageContext.request.contextPath}/index/changepassword">Change password</a>
                        <a class="collapse-item" href="${pageContext.request.contextPath}/index/editaccount">Change information</a>
                    </div>
                </div>
            </li>


               <!-- Divider -->
               <hr class="sidebar-divider d-none d-md-block">
            <!-- Sidebar Toggler (Sidebar) -->
            <div class="text-center d-none d-md-inline">
                <button class="rounded-circle border-0" id="sidebarToggle"></button>
            </div>
        </ul>