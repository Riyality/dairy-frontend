<%-- <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%> --%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<meta http-equiv="content-type" content="text/html;charset=UTF-8" />

<meta name='viewport' content='width=device-width, initial-scale=1.0, user-scalable=no'>

<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="Description" content="Laravel Bootstrap Responsive Admin Web Dashboard Template">
<meta name="Author" content="Spruko Technologies Private Limited">
<meta name="keywords" content="">

<!-- TITLE -->
<title> Dairy Management </title>

<!-- FAVICON -->
<link rel="icon" href="<c:url value="/resources/assets/images/brand-logos/favicon.ico"/>" type="image/x-icon">

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

<!-- BOOTSTRAP CSS -->
<link id="style" href="<c:url value="/resources/assets/libs/bootstrap/css/bootstrap.min.css"/>" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">

<!-- ICONS CSS -->
<link href="<c:url value="/resources/assets/icon-fonts/icons.css"/>" rel="stylesheet">

<!-- APP SCSS -->
<link rel="preload" as="style" href="<c:url value="/resources/assets/app-fce3f544.css"/>" />
<link rel="stylesheet" href="<c:url value="/resources/assets/app-fce3f544.css"/>" />

<!-- NODE WAVES CSS -->
<link href = "<c:url value="/resources/assets/libs/node-waves/waves.min.css"/>" rel="stylesheet">

<!-- SIMPLEBAR CSS -->
<link rel="stylesheet" href="<c:url value="/resources/assets/libs/simplebar/simplebar.min.css"/>">

<!-- COLOR PICKER CSS -->
<link rel="stylesheet" href="<c:url value="/resources/assets/libs/flatpickr/flatpickr.min.css"/>">
<link rel="stylesheet" href="<c:url value="/resources/assets/libs/%40simonwep/pickr/themes/nano.min.css"/>">

<!-- CHOICES CSS -->
<link rel="stylesheet" href="<c:url value="/resources/assets/libs/choices.js/public/assets/styles/choices.min.css"/>">

<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>

<!-- CHOICES JS -->
<script src="<c:url value="/resources/assets/libs/choices.js/public/assets/scripts/choices.min.js"/>"></script>

<!-- MAIN JS -->
<script src="<c:url value="/resources/assets/main.js"/>"></script>

<script src="js/feed-distribution.js"></script>

<link rel="stylesheet" href="<c:url value="/resources/assets/css/custom.css"/>" />

</head>

<body>

    <!-- LOADER -->
    <div id="loader">
        <img src="<c:url value="/resources/assets/images/media/loader.svg"/>" alt="">
    </div>
    <!-- END LOADER -->

    <!-- PAGE -->
    <div class="page">

        <!-- HEADER -->

        <header class="app-header">

            <!-- Start::main-header-container -->
            <div class="main-header-container container-fluid">
                <!-- Start::header-content-left -->
                <div class="header-content-left">

                    <!-- Start::header-element -->
                    <div class="header-element">
                        <div class="horizontal-logo">
                            <a href="index.html" class="header-logo">
                                <img src="<c:url value="/resources/assets/images/brand-logos/logo.png"/>" alt="logo" class="desktop-logo" style="height: 100px">
                 			   <img src="<c:url value="/resources/assets/images/brand-logos/logo.png"/>" alt="logo" class="toggle-dark" style="height: 100px">
                            </a>
                        </div>
                    </div>
                    <!-- End::header-element -->

                    <!-- Start::header-element -->
                    <div class="header-element">
                        <!-- Start::header-link -->
                        <a aria-label="Hide Sidebar" class="sidemenu-toggle header-link animated-arrow hor-toggle horizontal-navtoggle" data-bs-toggle="sidebar" href="javascript:void(0);"><span></span></a>
                        <!-- End::header-link -->
                    </div>
                    <!-- End::header-element -->

                </div>
                <!-- End::header-content-left -->

                <!-- Start::header-content-right -->
                <div class="header-content-right">

                    <!-- Start::header-element -->
                    <div class="header-element country-selector">
                        <!-- Start::header-link|dropdown-toggle -->
                        <a href="javascript:void(0);" class="header-link dropdown-toggle" data-bs-auto-close="outside" data-bs-toggle="dropdown">
                            <img src="<c:url value="/resources/assets/images/flags/us_flag.jpg"/>" alt="img" class="rounded-circle header-link-icon">
                        </a>
                        <!-- End::header-link|dropdown-toggle -->
                        <ul class="main-header-dropdown dropdown-menu dropdown-menu-end" data-popper-placement="none">
                            <li>
                                <a class="dropdown-item d-flex align-items-center" href="javascript:void(0);">
                                    <span class="avatar avatar-xs lh-1 me-2">
        <img src="<c:url value="/resources/assets/images/flags/us_flag.jpg"/>" alt="img">
        </span> English
                                </a>
                            </li>
                           
                            <li>
                                <a class="dropdown-item d-flex align-items-center" href="javascript:void(0);">
                                    <span class="avatar avatar-xs lh-1 me-2">
        <img src="<c:url value="/resources/assets/images/flags/russia_flag.jpg"/>" alt="img" >
        </span> Russian
                                </a>
                            </li>
                        </ul>
                    </div>
                    <!-- End::header-element -->
                    
                    <select id="language-select" onchange="changeLanguage()">
                        <option value="">Select Lang</option>
					    <option value="en" <c:if test="${lang eq 'en'}">selected</c:if>>English</option>
					    <option value="mr" <c:if test="${lang eq 'mr'}">selected</c:if>>मराठी</option>
					</select>

                    <!-- Start::header-element -->
                    <div class="header-element header-theme-mode">
                        <!-- Start::header-link|layout-setting -->
                    </div>
                    <!-- End::header-element -->

                    <!-- Start::header-element -->
                    <div class="header-element">
                        <!-- Start::header-link|dropdown-toggle -->
                        <a href="javascript:void(0);" class="header-link dropdown-toggle" id="mainHeaderProfile" data-bs-toggle="dropdown" data-bs-auto-close="outside" aria-expanded="false">
                            <div class="d-flex align-items-center">
                                <div class="me-sm-2 me-0">
                                    <img src="<c:url value="/resources/assets/images/faces/9.jpg"/>" alt="img" width="32" height="32" class="rounded-circle">
                                </div>
                                <div class="d-sm-block d-none">
                                    <p class="fw-semibold mb-0 lh-1">${sessionScope.name}</p>
                                    <span class="op-7 fw-normal d-block fs-11">${sessionScope.role}</span>
                                </div>
                            </div>
                        </a>
                        <!-- End::header-link|dropdown-toggle -->
                        <ul class="main-header-dropdown dropdown-menu pt-0 overflow-hidden header-profile-dropdown dropdown-menu-end" aria-labelledby="mainHeaderProfile">
                            <li><a class="dropdown-item d-flex" href="profile.html"><i class="ti ti-user-circle fs-18 me-2 op-7"></i>Profile</a></li>
                            <li><a class="dropdown-item d-flex" href="mail.html"><i class="ti ti-inbox fs-18 me-2 op-7"></i>Inbox <span class="badge bg-success-transparent ms-auto">25</span></a></li>
                            <li><a class="dropdown-item d-flex border-block-end" href="todo-list.html"><i class="ti ti-clipboard-check fs-18 me-2 op-7"></i>Task Manager</a></li>
                            <li><a class="dropdown-item d-flex" href="mail-settings.html"><i class="ti ti-adjustments-horizontal fs-18 me-2 op-7"></i>Settings</a></li>
                            <li><a class="dropdown-item d-flex border-block-end" href="javascript:void(0);"><i class="ti ti-wallet fs-18 me-2 op-7"></i>Bal: $7,12,950</a></li>
                            <li><a class="dropdown-item d-flex" href="chat.html"><i class="ti ti-headset fs-18 me-2 op-7"></i>Support</a></li>
                            <li><a class="dropdown-item d-flex" href="signin-cover.html"><i class="ti ti-logout fs-18 me-2 op-7"></i>Log Out</a></li>
                        </ul>
                    </div>
                    <!-- End::header-element -->

                </div>
                <!-- End::header-content-right -->

            </div>
            <!-- End::main-header-container -->

        </header>
        <!-- END HEADER -->

        <!-- SIDEBAR -->

        <aside class="app-sidebar sticky" id="sidebar">

            <!-- Start::main-sidebar-header -->
            <div class="main-sidebar-header">
                <a href="index.html" class="header-logo">
                    <img src="<c:url value="/resources/assets/images/brand-logos/logo.png"/>" alt="logo" class="desktop-logo" style="height:6em">
                    <img src="<c:url value="/resources/assets/images/brand-logos/logo.png"/>" alt="logo" class="toggle-logo" style="height: 40px">
                </a>
            </div>
            <!-- End::main-sidebar-header -->

            <!-- Start::main-sidebar -->
            <div class="main-sidebar" id="sidebar-scroll">

                <!-- Start::nav -->
                <nav class="main-menu-container nav nav-pills flex-column sub-open">
                    <div class="slide-left" id="slide-left">
                        <svg xmlns="http://www.w3.org/2000/svg" fill="#7b8191" width="24" height="24" viewBox="0 0 24 24">
                            <path d="M13.293 6.293 7.586 12l5.707 5.707 1.414-1.414L10.414 12l4.293-4.293z"></path>
                        </svg>
                    </div>
                    <ul class="main-menu">
                        <!-- Start::slide__category -->
                        <li class="slide__category"><span class="category-name">Main</span></li>
                        <!-- End::slide__category -->

                        <!-- Start::slide -->
                        <li class="slide has-sub">
                            <a href="index.html" class="side-menu__item">
                                <i class="fa-solid fa-gauge listIcons"></i>
                                <span class="side-menu__label">Dashboards</span>
                            </a>
                            <ul class="slide-menu child1"></ul>
                        </li>
                        <!-- End::slide -->

                        <!-- Start::slide__category -->
                        <li class="slide__category"><span class="category-name">Pages</span></li>
                        <!-- End::slide__category -->

                        <!-- Start Branch slide -->
                        
                        <li class="slide has-sub">
                            <a href="javascript:void(0);" class="side-menu__item">
                                <i class="fa-solid fa-shop listIcons"></i>
                                <span class="side-menu__label">Branch</span>
                                <i class="fe fe-chevron-right side-menu__angle"></i>
                            </a>
                            <ul class="slide-menu child1">
                                <li class="slide">
                                    <a href="/branches/add-branch-page" class="side-menu__item">
                                    <i class="fa fa-plus-square-o listIcons" aria-hidden="true"></i>Add Branch</a>
                                </li>
                                 <li class="slide">
                                    <a href="/branches" class="side-menu__item">
                                    <i class="fa fa-table listIcons" aria-hidden="true"></i>All Branches</a>
                                </li>
                                
                            </ul>
                        </li>
                        <!-- End Branch slide -->

                        <!-- Start routes slide -->
                        
                        <li class="slide has-sub">
                            <a href="javascript:void(0);" class="side-menu__item">
                                <i class="fa-solid fa-road listIcons"></i>
                                <span class="side-menu__label">Routes</span>
                            </a>
                            <ul class="slide-menu child1">
                                <li class="slide">
                                    <a href="/routes/add-route-page" class="side-menu__item">
                                    <i class="fa fa-plus-square-o listIcons" aria-hidden="true"></i>Add Routes</a>
                                </li>
                                 <li class="slide">
                                    <a href="/routes" class="side-menu__item">
                                    <i class="fa fa-table listIcons" aria-hidden="true"></i>All Routes</a>
                                </li>
                                
                            </ul>
                        </li>
                        <!-- End routes slide -->
                        
                        
                        <!-- Start Main Branch slide -->
                        
                        <li class="slide has-sub">
                            <a href="javascript:void(0);" class="side-menu__item">
                                <i class="fa-solid fa-building listIcons" aria-hidden="true"></i>
                                <span class="side-menu__label">Main Branch</span>
                                <i class="fe fe-chevron-right side-menu__angle"></i>
                            </a>
                            <ul class="slide-menu child1">
                                <li class="slide">
                                    <a href="/mainBranchs/add-mainBranch-page" class="side-menu__item">
                                    <i class="fa fa-plus-square-o listIcons" aria-hidden="true"></i>Add Main Branch</a>
                                </li>
                                 <li class="slide">
                                    <a href="/mainBranchs" class="side-menu__item">
                                    <i class="fa fa-table listIcons" aria-hidden="true"></i>All Main Branches</a>
                                </li>
                                
                            </ul>
                        </li>
                        <!-- End  Main Branch slide -->
                        
                        <!-- Start Equipment slide -->
                        
                        <li class="slide has-sub">
                            <a href="javascript:void(0);" class="side-menu__item">
                            <i class="fa-solid fa-screwdriver-wrench listIcons"></i>
                                <span class="side-menu__label">Equipments</span>
                                <i class="fe fe-chevron-right side-menu__angle"></i>
                            </a>
                            <ul class="slide-menu child1">
                                <li class="slide">
                                    <a href="/equipments/add-equipment-page" class="side-menu__item">
                                    <i class="fa fa-plus-square-o listIcons" aria-hidden="true"></i>Add Equipments</a>
                                </li>
                                 <li class="slide">
                                    <a href="/equipments" class="side-menu__item">
                                    <i class="fa fa-table listIcons" aria-hidden="true"></i>All Equipments</a>
                                    </li>
                                
                            </ul>
                        </li>
                        <!-- End Equipment slide -->
                        
                         <!-- Start Feed Distribution slide -->
                                           
                        <li class="slide has-sub">
                            <a href="javascript:void(0);" class="side-menu__item">
                                <i class="fa-solid fa-truck listIcons"></i>
                                <span class="side-menu__label">Feed Distribution</span>
                                <i class="fe fe-chevron-right side-menu__angle"></i>
                            </a>
                            <ul class="slide-menu child1">
                                <li class="slide">
                                    <a href="/feedToFarmers/feedToFarmer-add-page" class="side-menu__item">
                                    <i class="fa fa-plus-square-o listIcons" aria-hidden="true"></i>Add Feed Distribution</a>
                                </li>
                                 <li class="slide">
                                    <a href="/feedToFarmers" class="side-menu__item">
                                <i     class="fa fa-table listIcons" aria-hidden="true"></i>All Feed Distribution</a>
                                </li>
                                
                            </ul>
                        </li>
                        <!-- End Feed Distribution slide -->
                        
                       <!-- Start Feed Company slide -->
                                           
                        <li class="slide has-sub">
                            <a href="javascript:void(0);" class="side-menu__item">
                                <i class="fa-solid fa-industry listIcons"></i>
                                <span class="side-menu__label">Feed Company</span>
                                <i class="fe fe-chevron-right side-menu__angle"></i>
                            </a>
                            <ul class="slide-menu child1">
                                <li class="slide">
                                    <a href="/feedCompanies/add-feed-company" class="side-menu__item">
                                    <i class="fa fa-plus-square-o listIcons" aria-hidden="true"></i>Add Feed Company</a>
                                </li>
                                 <li class="slide">
                                    <a href="/feedCompanies" class="side-menu__item">
                                <i     class="fa fa-table listIcons" aria-hidden="true"></i>All Feed Companies</a>
                                </li>
                                
                            </ul>
                        </li>
                        <!-- End Feed Company slide -->

                        <!-- Start Feed Type slide -->
                        
                        <li class="slide has-sub">
                            <a href="javascript:void(0);" class="side-menu__item">
                                <i class="fa-solid fa-list-ol listIcons" aria-hidden="true"></i>
                                <span class="side-menu__label">Feed Type </span>
                                <i class="fe fe-chevron-right side-menu__angle"></i>
                            </a>
                            <ul class="slide-menu child1">
                                <li class="slide">
                                    <a href="/feedTypes/add-feed-type" class="side-menu__item">
                                    <i class="fa fa-plus-square-o listIcons" aria-hidden="true"></i>Add Feed Type </a>
                                </li>
                                 <li class="slide">
                                    <a href="/feedTypes" class="side-menu__item">
                                    <i class="fa fa-table listIcons" aria-hidden="true"></i>All Feed Types</a>
                                </li>
                                
                            </ul>
                        </li>
                        <!-- End  Feed Type slide -->

                        <!-- Start Employee slide -->
                        
                        <li class="slide has-sub">
                            <a href="javascript:void(0);" class="side-menu__item">
                               		 <i class="fa-solid fa-person listIcons"></i>
                                <span class="side-menu__label">Employee </span>
                                <i class="fe fe-chevron-right side-menu__angle"></i>
                            </a>
                            <ul class="slide-menu child1">
                                <li class="slide">
                                    <a href="/employee/add-employee-page" class="side-menu__item">
                               		 <i class="fa fa-user-plus listIcons" aria-hidden="true"></i>
                                    <i class="fa fa-plus-square-o listIcons" aria-hidden="true"></i>Add Employee </a>
                                </li>
                                 <li class="slide">
                                    <a href="/employee" class="side-menu__item">
                               		 <i class="fa fa-user-table listIcons" aria-hidden="true"></i>
                                <i class="fa fa    -table listIcons" aria-hidden="true"></i>All Employee</a>
                                </li>
                                
                            </ul>
                        </li>
                        <!-- End Employee slide -->

                        <!-- Start Supplier slide -->
                        
                        <li class="slide has-sub">
                            <a href="javascript:void(0);" class="side-menu__item">
                                <i class="fa fa-truck listIcons" aria-hidden="true"></i>
                                <span class="side-menu__label">Supplier </span>
                                <i class="fe fe-chevron-right side-menu__angle"></i>
                            </a>
                            <ul class="slide-menu child1">
                                <li class="slide">
                                    <a href="/suppliers/add-supplier-page" class="side-menu__item">
                               		 <i class="fa fa-user-plus listIcons" aria-hidden="true"></i>
                                    Add Supplier </a>
                                </li>
                                 <li class="slide">
                                    <a href="/suppliers" class="side-menu__item">
                                    <i class="fa fa-table listIcons" aria-hidden="true"></i>All Supplier</a>
                                </li>
                                
                            </ul>
                        </li>
                        <!-- End Supplier slide -->
                        
                        <!-- Start Feed Stock slide -->
                        
                        <li class="slide has-sub">
                            <a href="javascript:void(0);" class="side-menu__item">
                                <i class="fa-solid fa-chart-gantt listIcons" aria-hidden="true"></i>
                                <span class="side-menu__label">Feed Stock </span>
                                <i class="fe fe-chevron-right side-menu__angle"></i>
                            </a>
                            <ul class="slide-menu child1">
                                <li class="slide">
                                    <a href="/feedStock/add-feedStock-page" class="side-menu__item">
                                    <i class="fa fa-plus-square-o listIcons" aria-hidden="true"></i>Add Feed Stock </a>
                                </li>
                                 <li class="slide">
                                    <a href="/feedStock" class="side-menu__item">
                                    <i class="fa fa-table listIcons" aria-hidden="true"></i>All Feed Stock</a>
                                </li>
                                
                            </ul>
                        </li>
                        <!-- End Feed Stock slide -->
                        
                        <!-- Start Feed Stock slide -->
                        
                        <li class="slide has-sub">
                            <a href="javascript:void(0);" class="side-menu__item">
                               <!-- <i class="fa-solid fa-bottle-droplet listIcons"></i> -->
                               <i class="fa-solid fa-jar listIcons"></i>
                                <span class="side-menu__label">Milk Collection </span>
                                <i class="fe fe-chevron-right side-menu__angle"></i>
                            </a>
                            <ul class="slide-menu child1">
                                <li class="slide">
                                    <a href="/milkCollection/get-farmer-list-page" class="side-menu__item">
                                    <i class="fa fa-plus-square-o listIcons" aria-hidden="true"></i>Add Milk Collection </a>
                                </li>
                                <li class="slide">
                                    <a href="/milkCollection/byTodaysDate" class="side-menu__item">
                                    <i class="fa-regular fa-calendar listIcons"></i>Date wise  </a>
                                </li>
                                 <li class="slide">
                                    <a href="/milkCollection" class="side-menu__item">
                                <i     class="fa fa-table listIcons" aria-hidden="true"></i>All Milk Collection</a>
                                </li>
                                
                            </ul>
                        </li>
                        <!-- End Feed Stock slide -->

                          
                        <!-- Start Farmer slide -->
                        
                        <li class="slide has-sub">
                            <a href="javascript:void(0);" class="side-menu__item">
                                <i class="fa-regular fa-id-card listIcons"></i>
                                <span class="side-menu__label">Farmers </span>
                                <i class="fe fe-chevron-right side-menu__angle"></i>
                            </a>
                            <ul class="slide-menu child1">
                                <li class="slide">
                                    <a href="/farmers/addFarmerPage" class="side-menu__item">
                               		 <i class="fa fa-user-plus listIcons" aria-hidden="true"></i>
                                    Add Farmer </a>
                                </li>
                                 <li class="slide">
                                    <a href="/farmers" class="side-menu__item">
                               		 <i class="fa fa-table listIcons" aria-hidden="true"></i>
                                    All Farmers</a>
                                </li>
                                
                            </ul>
                        </li>
                        <!-- End Farmer slide -->
                        
                        <!-- Start Payment to Farmer slide -->
                        
                        <li class="slide has-sub">
                            <a href="javascript:void(0);" class="side-menu__item">
                                <i class="fa-regular fa-money-bill-1 listIcons"></i>
                                <span class="side-menu__label"> Payment to Farmers </span>
                                <i class="fe fe-chevron-right side-menu__angle"></i>
                            </a>
                            <ul class="slide-menu child1">
                                <li class="slide">
                                    <a href="/paymentToFarmer/add-payment-page" class="side-menu__item"> 
                                    <i class ="fa fa-plus-square-o listIcons" aria-hidden="true"></i>Payment to Farmer </a>
                                </li>
                                 <li class="slide">
                                    <a href="/farmers" class="side-menu__item">
                                    <i class="fa fa-table listIcons" aria-hidden="true"></i>All Farmers</a>
                                </li>
                                
                            </ul>
                        </li>
                        <!-- End Payment to Farmer slide -->
                        
                          <!-- Start Feed to Farmer slide -->
                        
                        <li class="slide has-sub">
                            <a href="javascript:void(0);" class="side-menu__item">
                                <i class="fa-solid fa-truck-fast listIcons"></i>
                                <span class="side-menu__label">Feed to Farmer </span>
                                <i class="fe fe-chevron-right side-menu__angle"></i>
                            </a>
                            <ul class="slide-menu child1">
                                <li class="slide">
                                    <a href="/branches/add-branch-page" class="side-menu__item">
                                    <i class="fa fa-plus-square-o listIcons" aria-hidden="true"></i>Add Feed to Farmer </a>
                                </li>
                                 <li class="slide">
                                    <a href="/branches" class="side-menu__item">
                                    <i class="fa fa-table listIcons" aria-hidden="true"></i>All Feed to Farmer</a>
                                </li>
                                
                            </ul>
                        </li>
                        <!-- End Feed to Farmer slide -->

                        <!-- Start Advance to Farmer slide -->
                        
                        <li class="slide has-sub">
                            <a href="javascript:void(0);" class="side-menu__item">
                                <i class="fa-solid fa-money-bill-trend-up listIcons"></i>
                                <span class="side-menu__label">Advance to Farmer </span>
                                <i class="fe fe-chevron-right side-menu__angle"></i>
                            </a>
                            <ul class="slide-menu child1">
                                <i class="fa fa-tachometer listIcons" aria-hidden="true"></i>
                                <li class="slide">
                                    <a href="/advanceToFarmer/advanceToFarmer-add-page" class="side-menu__item">
                                    <i class="fa fa-plus-square-o listIcons" aria-hidden="true"></i>Add Advance to Farmer </a>
                                </li>
                                 <li class="slide">
                                    <a href="/advanceToFarmer" class="side-menu__item">
                                <i class="fa fa-table listIcons" aria-hidden="true"></i>All Advance to Farmer</a>
                                </li>
                                
                            </ul>
                        </li>
                        <!-- End Advance to Farmer slide -->
                        
                        <!-- Start Invoice  slide  -->
                        
                        <li class="slide has-sub">
                            <a href="javascript:void(0);" class="side-menu__item">
                                <i class="fa-solid fa-file-invoice-dollar listIcons"></i>
                                <span class="side-menu__label">Invoice </span>
                                <i class="fe fe-chevron-right side-menu__angle"></i>
                            </a>
                            <ul class="slide-menu child1">
                                <li class="slide">
                                    <a href="/add-invoice-page" class="side-menu__item">Milk Collection Invoice</a>
                                </li>
                                 
                                
                            </ul>
                        </li>
                        <!-- End  Invoice slide -->
                        
                        
                        <!-- Start Milkrate  slide  -->
                        
                        <li class="slide has-sub">
                            <a href="javascript:void(0);" class="side-menu__item">
                            <i class="fa-solid fa-table-cells listIcons"></i>
                                <span class="side-menu__label">Milk Rates </span>
                                <i class="fe fe-chevron-right side-menu__angle"></i>
                            </a>
                            <ul class="slide-menu child1">
                                <li class="slide">
                                    <a href="/milkRate/milkrate-page" class="side-menu__item">Milk Rates</a>
                                </li>
                                 
                                
                            </ul>
                        </li>
                        <!-- End Bonus slide -->
                        
                         <!-- Start farmer animal slide -->
                         
                          <!-- Start Milkrate  slide  -->
                        
                        <li class="slide has-sub">
                            <a href="javascript:void(0);" class="side-menu__item"> 
                                <i class="fa-solid fa-money-bill-1-wave listIcons" aria-hidden="true"></i>
                                <span class="side-menu__label">Bonus</span>
                                <i class="fe fe-chevron-right side-menu__angle"></i>
                            </a>
                            <ul class="slide-menu child1">
                                <li class="slide">
                                    <a href="/bonusToFarmer" class="side-menu__item">Genarte Bonus</a>
                                </li>
                                 
                                
                            </ul>
                        </li>
                        <!-- End Bonus slide -->
                        
                         <!-- Start farmer animal slide -->
                        
                        <li class="slide has-sub">
                            <a href="javascript:void(0);" class="side-menu__item">
                                <i class="fa-solid fa-cow listIcons" aria-hidden="true"></i>
                                <span class="side-menu__label">Farmer Animals</span>
                                <i class="fe fe-chevron-right side-menu__angle"></i>
                            </a>
                            <ul class="slide-menu child1">
                                <li class="slide">
                                    <a href="/farmerAnimalMapping//add-animal-page" class="side-menu__item">
                                    <i class="fa fa-plus-square-o listIcons" aria-hidden="true"></i>Add Animals</a>
                                </li>
                                 <li class="slide">
                                    <a href="/farmerAnimalMapping" class="side-menu__item">
                                <i class ="fa fa-table listIcons" aria-hidden="true"></i>All Animals</a>
                                </li>
                                
                            </ul>
                        </li>
                        <!-- End farmer animal slide -->
                        
                        
                        <!-- Start DairyManger Transactions slide -->
                        
                        <li class="slide has-sub">
                            <a href="javascript:void(0);" class="side-menu__item">
                                <i class="fa fa-tachometer listIcons" aria-hidden="true"></i>
                                <span class="side-menu__label">DairyManger Transactions</span>
                                <i class="fe fe-chevron-right side-menu__angle"></i>
                            </a>
                            <ul class="slide-menu child1">
                                <li class="slide">
                                    <a href="/dairyManger/add-dairyManger-Page" class="side-menu__item">
                                    <i class="fa fa-plus-square-o listIcons" aria-hidden="true"></i>Add DairyManger</a>
                                </li>
                                 <li class="slide">
                                    <a href="/dairyManger" class="side-menu__item">
                                    <i class="fa fa-table listIcons" aria-hidden="true"></i>All Dairy Manager</a>
                                </li>
                                
                            </ul>
                        </li>
                        <!-- End DairyManger Transactions slide -->
                         
                    </ul>
                    
                    <div class="slide-right" id="slide-right">
                        <svg xmlns="http://www.w3.org/2000/svg" fill="#7b8191" width="24" height="24" viewBox="0 0 24 24">
                            <path d="M10.707 17.707 16.414 12l-5.707-5.707-1.414 1.414L13.586 12l-4.293 4.293z"></path>
                        </svg>
                    </div>
                </nav>
                <!-- End::nav -->

            </div>
            <!-- End::main-sidebar -->

        </aside>
        <!-- END SIDEBAR -->