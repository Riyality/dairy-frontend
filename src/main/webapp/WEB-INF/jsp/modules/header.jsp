<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<meta http-equiv="content-type" content="text/html;charset=UTF-8" />

<meta charset="UTF-8">
    
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
<link rel="stylesheet" href="<c:url value="/resources/assets/css/custom.css"/>" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
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
                    

                    <!-- Start::header-element -->
                    <div class="header-element header-theme-mode">
                        <!-- Start::header-link|layout-setting -->
                    </div>
                    <!-- End::header-element -->

                    
                   
                    <!-- Start::header-element -->
                    <div class="header-element">

                        <form action="">
                             <select name="languageSelect" id="changeLanguage">
                                <option value="mr" ${sessionScope.lang == 'mr' ? 'selected' : ''}>Marathi</option> 
                                <option value="en" ${sessionScope.lang == 'en' ? 'selected' : ''}>English</option>     
                            </select>    
                        </form>

                       



                        <!-- Start::header-link|dropdown-toggle -->
                        <a href="javascript:void(0);" class="header-link dropdown-toggle" id="mainHeaderProfile" data-bs-toggle="dropdown" data-bs-auto-close="outside" aria-expanded="false">
                            <div class="d-flex align-items-center">
                                <div class="me-sm-2 me-0">
                                    <img src="<c:url value="/resources/assets/images/faces/9.jpg"/>" alt="img" width="32" height="32" class="rounded-circle">
                                </div>
                                <div class="d-sm-block d-none">
                                    
                                    <p class="fw-semibold mb-0 lh-1">${sessionScope.name}</p>
                                    <span class="op-7 fw-normal d-block fs-11">${sessionScope.role}</span>
                                    <span class="op-7 fw-normal d-block fs-11">${sessionScope.lang }</span>
                                </div>
                            </div>
                        </a>
                       
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

                      
                            <a href="/logins/index" class="side-menu__item">

                                <i class="fa-solid fa-gauge listIcons"></i>
                                <span class="side-menu__label">Dashboard </span>
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
                                <span class="side-menu__label"> ${empty messages[0] ? 'Branch' : messages[0]}</span>
                                <i class="fe fe-chevron-right side-menu__angle"></i>
                            </a>
                            <ul class="slide-menu child1">
                                <li class="slide">
                                    <a href="/branches/add-branch-page" class="side-menu__item">
                                    <i class="fa fa-plus-square-o listIcons" aria-hidden="true"></i>${empty messages[1] ? ' Add Branch' : messages[1]}</a>
                                </li>
                                 <li class="slide">
                                    <a href="/branches" class="side-menu__item">
                                    <i class="fa fa-table listIcons" aria-hidden="true"></i>${empty messages[2] ? 'All Branches' : messages[2]}</a>
                                </li>
                                
                            </ul>
                        </li>
                        <!-- End Branch slide -->

                        <!-- Start routes slide -->
                        
                        <li class="slide has-sub">
                            <a href="javascript:void(0);" class="side-menu__item">
                                <i class="fa-solid fa-road listIcons"></i>
                                <span class="side-menu__label">${empty messages[3] ? 'Routes' : messages[3]}</span>
                            </a>
                            <ul class="slide-menu child1">
                                <li class="slide">
                                    <a href="/routes/add-route-page" class="side-menu__item">
                                    <i class="fa fa-plus-square-o listIcons" aria-hidden="true"></i>${empty messages[4] ? ' Add Route' : messages[4]}</a>
                                </li>
                                 <li class="slide">
                                    <a href="/routes" class="side-menu__item">
                                    <i class="fa fa-table listIcons" aria-hidden="true"></i>${empty messages[5] ? 'All Routes' : messages[5]}</a>
                                </li>
                                
                            </ul>
                        </li>
                        <!-- End routes slide -->
                        
                        
                        <!-- Start Main Branch slide -->
                        
                        <li class="slide has-sub">
                            <a href="javascript:void(0);" class="side-menu__item">
                                <i class="fa-solid fa-building listIcons" aria-hidden="true"></i>
                                <span class="side-menu__label">${empty messages[6] ? 'Main Branch' : messages[6]}</span>
                                <i class="fe fe-chevron-right side-menu__angle"></i>
                            </a>
                            <ul class="slide-menu child1">
                                <li class="slide">
                                    <a href="/mainBranchs/add-mainBranch-page" class="side-menu__item">
                                    <i class="fa fa-plus-square-o listIcons" aria-hidden="true"></i>${empty messages[7] ? 'Add Main Branch' : messages[7]}</a>
                                </li>
                                 <li class="slide">
                                    <a href="/mainBranchs" class="side-menu__item">
                                    <i class="fa fa-table listIcons" aria-hidden="true"></i>${empty messages[8] ? ' All Branches' : messages[8]}</a>
                                </li>
                                
                            </ul>
                        </li>
                        <!-- End  Main Branch slide -->
                        
                        <!-- Start Equipment slide -->
                        
                        <li class="slide has-sub">
                            <a href="javascript:void(0);" class="side-menu__item">
                            <i class="fa-solid fa-screwdriver-wrench listIcons"></i>
                                <span class="side-menu__label">${empty messages[9] ? ' Equipments' : messages[9]}</span>
                                <i class="fe fe-chevron-right side-menu__angle"></i>
                            </a>
                            <ul class="slide-menu child1">
                                <li class="slide">
                                    <a href="/equipments/add-equipment-page" class="side-menu__item">
                                    <i class="fa fa-plus-square-o listIcons" aria-hidden="true"></i>${empty messages[10] ? ' Add Equipments' : messages[10]}</a>
                                </li>
                                 <li class="slide">
                                    <a href="/equipments" class="side-menu__item">
                                    <i class="fa fa-table listIcons" aria-hidden="true"></i>${empty messages[11] ? ' All Equipments' : messages[11]}</a>
                                    </li>
                                
                            </ul>
                        </li>
                        <!-- End Equipment slide -->
                        
                         <!-- Start Feed Distribution slide -->
                                           
                        <li class="slide has-sub">
                            <a href="javascript:void(0);" class="side-menu__item">
                                <i class="fa-solid fa-truck listIcons"></i>
                                <span class="side-menu__label">${empty messages[12] ? ' Feed Distribution' : messages[12]}</span>
                                <i class="fe fe-chevron-right side-menu__angle"></i>
                            </a>
                            <ul class="slide-menu child1">
                                <li class="slide">
                                    <a href="/feedToFarmers/feedToFarmer-add-page" class="side-menu__item">
                                    <i class="fa fa-plus-square-o listIcons" aria-hidden="true"></i>${empty messages[13] ? ' Add Feed Distribution' : messages[13]}</a>
                                </li>
                                 <li class="slide">
                                    <a href="/feedToFarmers" class="side-menu__item">
                                <i     class="fa fa-table listIcons" aria-hidden="true"></i>${empty messages[14] ? ' All  Distribution' : messages[14]}</a>
                                </li>
                                
                            </ul>
                        </li>
                        <!-- End Feed Distribution slide -->
                        
                       <!-- Start Feed Company slide -->
                                           
                        <li class="slide has-sub">
                            <a href="javascript:void(0);" class="side-menu__item">
                                <i class="fa-solid fa-industry listIcons"></i>
                                <span class="side-menu__label">${empty messages[15] ? ' Feed Company' : messages[15]}</span>
                                <i class="fe fe-chevron-right side-menu__angle"></i>
                            </a>
                            <ul class="slide-menu child1">
                                <li class="slide">
                                    <a href="/feedCompanies/add-feed-company" class="side-menu__item">
                                    <i class="fa fa-plus-square-o listIcons" aria-hidden="true"></i>${empty messages[16] ? ' Add Feed Company' : messages[16]}</a>
                                </li>
                                 <li class="slide">
                                    <a href="/feedCompanies" class="side-menu__item">
                                <i     class="fa fa-table listIcons" aria-hidden="true"></i>${empty messages[17] ? ' All Feed Company' : messages[17]}</a>
                                </li>
                                
                            </ul>
                        </li>
                        <!-- End Feed Company slide -->

                        <!-- Start Feed Type slide -->
                        
                        <li class="slide has-sub">
                            <a href="javascript:void(0);" class="side-menu__item">
                                <i class="fa-solid fa-list-ol listIcons" aria-hidden="true"></i>
                                <span class="side-menu__label">${empty messages[18] ? 'Feed Type' : messages[18]} </span>
                                <i class="fe fe-chevron-right side-menu__angle"></i>
                            </a>
                            <ul class="slide-menu child1">
                                <li class="slide">
                                    <a href="/feedTypes/add-feed-type" class="side-menu__item">
                                    <i class="fa fa-plus-square-o listIcons" aria-hidden="true"></i>${empty messages[19] ? 'Add Feed Type' : messages[19]} </a>
                                </li>
                                 <li class="slide">
                                    <a href="/feedTypes" class="side-menu__item">
                                    <i class="fa fa-table listIcons" aria-hidden="true"></i>${empty messages[20] ? 'All Feed Type' : messages[20]} </a>
                                </li>
                                
                            </ul>
                        </li>
                        <!-- End  Feed Type slide -->

                        <!-- Start Employee slide -->
                        
                        <li class="slide has-sub">
                            <a href="javascript:void(0);" class="side-menu__item">
                               		 <i class="fa-solid fa-person listIcons"></i>
                                <span class="side-menu__label">${empty messages[21] ? 'Employee' : messages[21]}  </span>
                                <i class="fe fe-chevron-right side-menu__angle"></i>
                            </a>
                            <ul class="slide-menu child1">
                                <li class="slide">
                                    <a href="/employee/add-employee-page" class="side-menu__item">

                               		 
                                    <i class="fa fa-plus-square-o listIcons" aria-hidden="true"></i>${empty messages[22] ? 'Add Employee' : messages[22]}</a>
                                </li>
                                 <li class="slide">
                                    <a href="/employee" class="side-menu__item">
                               		 <i class="fa fa-user-table listIcons" aria-hidden="true"></i>
                                <i class="fa fa-table listIcons" aria-hidden="true"></i>${empty messages[23] ? 'All Employee' : messages[23]}</a>

                                </li>
                                
                            </ul>
                        </li>
                        <!-- End Employee slide -->

                        <!-- Start Supplier slide -->
                        
                        <li class="slide has-sub">
                            <a href="javascript:void(0);" class="side-menu__item">
                                <i class="fa fa-truck listIcons" aria-hidden="true"></i>
                                <span class="side-menu__label">${empty messages[24] ? ' Supplier' : messages[24]} </span>
                                <i class="fe fe-chevron-right side-menu__angle"></i>
                            </a>
                            <ul class="slide-menu child1">
                                <li class="slide">
                                    <a href="/suppliers/add-supplier-page" class="side-menu__item">
                               		 <i class="fa fa-user-plus listIcons" aria-hidden="true"></i>
                                        ${empty messages[25] ? ' Add Supplier' : messages[25]}  </a>
                                </li>
                                 <li class="slide">
                                    <a href="/suppliers" class="side-menu__item">
                                    <i class="fa fa-table listIcons" aria-hidden="true"></i>${empty messages[26] ? ' All Supplier' : messages[26]}</a>
                                </li>
                                
                            </ul>
                        </li>
                        <!-- End Supplier slide -->
                        
                        <!-- Start Feed Stock slide -->
                        
                        <li class="slide has-sub">
                            <a href="javascript:void(0);" class="side-menu__item">
                                <i class="fa-solid fa-chart-gantt listIcons" aria-hidden="true"></i>
                                <span class="side-menu__label">${empty messages[27] ? ' Feed Stock' : messages[27]} </span>
                                <i class="fe fe-chevron-right side-menu__angle"></i>
                            </a>
                            <ul class="slide-menu child1">
                                <li class="slide">
                                    <a href="/feedStock/add-feedStock-page" class="side-menu__item">
                                    <i class="fa fa-plus-square-o listIcons" aria-hidden="true"></i>${empty messages[28] ? ' Add Feed Stock' : messages[28]} </a>
                                </li>
                                 <li class="slide">
                                    <a href="/feedStock/add-purchaseDetails-page" class="side-menu__item">
                                    <i class="fa fa-table listIcons" aria-hidden="true"></i> ${empty messages[29] ? 'Feed Stock Details' : messages[29]}</a>
                                </li>
                                <li class="slide">
                                    <a href="/feedStock/add-feedDetails-page" class="side-menu__item">
                                    <i class="fa fa-table listIcons" aria-hidden="true"></i>${empty messages[30] ? 'All Stock' : messages[30]}</a>
                                </li>
                                
                            </ul>
                        </li>
                        <!-- End Feed Stock slide -->
                        
                        <!-- Start Feed Stock slide -->
                        
                        <li class="slide has-sub">
                            <a href="javascript:void(0);" class="side-menu__item">
                               <!-- <i class="fa-solid fa-bottle-droplet listIcons"></i> -->
                               <i class="fa-solid fa-jar listIcons"></i>
                                <span class="side-menu__label">${empty messages[31] ? 'Milk Collection' : messages[31]} </span>
                                <i class="fe fe-chevron-right side-menu__angle"></i>
                            </a>
                            <ul class="slide-menu child1">
                                <li class="slide">
                                    <a href="/milkCollection/get-farmer-list-page" class="side-menu__item">
                                    <i class="fa fa-plus-square-o listIcons" aria-hidden="true"></i>${empty messages[32] ? 'Add Milk Collection' : messages[32]} </a>
                                </li>
                                <li class="slide">
                                    <a href="/milkCollection/byTodaysDate" class="side-menu__item">
                                    <i class="fa-regular fa-calendar listIcons"></i>${empty messages[33] ? 'Datewise Collection' : messages[33]}   </a>
                                </li>
                                 <li class="slide">
                                    <a href="/milkCollection" class="side-menu__item">
                                <i     class="fa fa-table listIcons" aria-hidden="true"></i>${empty messages[34] ? 'All Milk Collection' : messages[34]} </a>
                                </li>
                                
                            </ul>
                        </li>
                        <!-- End Feed Stock slide -->

                          
                        <!-- Start Farmer slide -->
                        
                        <li class="slide has-sub">
                            <a href="javascript:void(0);" class="side-menu__item">
                                <i class="fa-regular fa-id-card listIcons"></i>
                                <span class="side-menu__label">${empty messages[35] ? 'Farmer' : messages[35]} </span>
                                <i class="fe fe-chevron-right side-menu__angle"></i>
                            </a>
                            <ul class="slide-menu child1">
                                <li class="slide">
                                    <a href="/farmers/addFarmerPage" class="side-menu__item">
                               		 <i class="fa fa-user-plus listIcons" aria-hidden="true"></i>
                                        ${empty messages[36] ? 'Add Farmer' : messages[36]} </a>
                                </li>
                                 <li class="slide">
                                    <a href="/farmers" class="side-menu__item">
                               		 <i class="fa fa-table listIcons" aria-hidden="true"></i>
                                        ${empty messages[37] ? 'All Farmer' : messages[37]}</a>
                                </li>
                                
                            </ul>
                        </li>
                        <!-- End Farmer slide -->
                        
                        <!-- Start Payment to Farmer slide -->
                        
                        <li class="slide has-sub">
                            <a href="javascript:void(0);" class="side-menu__item">
                                <i class="fa-regular fa-money-bill-1 listIcons"></i>
                                <span class="side-menu__label">${empty messages[38] ? 'Payment' : messages[38]}</span>
                                <i class="fe fe-chevron-right side-menu__angle"></i>
                            </a>
                            <ul class="slide-menu child1">
                                <li class="slide">
                                    <a href="/paymentToFarmer/add-payment-page" class="side-menu__item"> 
                                    <i class ="fa fa-plus-square-o listIcons" aria-hidden="true"></i>${empty messages[39] ? 'Payment To Farmer' : messages[39]} </a>
                                </li>
                                 <li class="slide">
                                    <a href="/paymentToFarmer" class="side-menu__item">
                                    <i class="fa fa-table listIcons" aria-hidden="true"></i>${empty messages[40] ? 'All Payment' : messages[40]}</a>
                                </li>
                                
                            </ul>
                        </li>
                        <!-- End Payment to Farmer slide -->


                        <!-- Start Advance to Farmer slide -->
                        
                        <li class="slide has-sub">
                            <a href="javascript:void(0);" class="side-menu__item">
                                <i class="fa-solid fa-money-bill-trend-up listIcons"></i>
                                <span class="side-menu__label">${empty messages[41] ? 'Advance To Farmer' : messages[41]} </span>
                                <i class="fe fe-chevron-right side-menu__angle"></i>
                            </a>
                            <ul class="slide-menu child1">
                                <i class="fa fa-tachometer listIcons" aria-hidden="true"></i>
                                <li class="slide">
                                    <a href="/advanceToFarmer/advanceToFarmer-add-page" class="side-menu__item">
                                    <i class="fa fa-plus-square-o listIcons" aria-hidden="true"></i>${empty messages[42] ? 'Add Advance To Farmer' : messages[42]}  </a>
                                </li>
                                 <li class="slide">
                                    <a href="/advanceToFarmer" class="side-menu__item">
                                <i class="fa fa-table listIcons" aria-hidden="true"></i>${empty messages[43] ? 'All Advance To Farmer' : messages[43]} </a>
                                </li>
                                
                            </ul>
                        </li>
                        <!-- End Advance to Farmer slide -->
                        
                        <!-- Start Invoice  slide  -->
                        
                        <li class="slide has-sub">
                            <a href="javascript:void(0);" class="side-menu__item">
                                <i class="fa-solid fa-file-invoice-dollar listIcons"></i>
                                <span class="side-menu__label">${empty messages[44] ? 'Invoice' : messages[44]}  </span>
                                <i class="fe fe-chevron-right side-menu__angle"></i>
                            </a>
                            <ul class="slide-menu child1">
                                <li class="slide">
                                    <a href="/add-invoice-page" class="side-menu__item">${empty messages[45] ? 'Payment Invoice' : messages[45]}</a>
                                </li>
                                 
                                
                            </ul>
                        </li>
                        <!-- End  Invoice slide -->
                      
                        
                        <!-- Start Milkrate  slide  -->
                        
                        <li class="slide has-sub">
                            <a href="javascript:void(0);" class="side-menu__item">
                            <i class="fa-solid fa-table-cells listIcons"></i>
                                <span class="side-menu__label">${empty messages[46] ? 'Milk Rates' : messages[46]} </span>
                                <i class="fe fe-chevron-right side-menu__angle"></i>
                            </a>
                            <ul class="slide-menu child1">
                                <li class="slide">
                                    <a href="/milkRate/milkrate-page" class="side-menu__item">${empty messages[47] ? 'Add Milk Rates' : messages[47]}</a>
                                </li>
                                 
                                
                            </ul>
                        </li>
                      
                         
                          <!-- end Milkrate  slide  -->
                          
                            <!-- Start Bonus slide -->
                        
                        <li class="slide has-sub">
                            <a href="javascript:void(0);" class="side-menu__item"> 
                                <i class="fa-solid fa-money-bill-1-wave listIcons" aria-hidden="true"></i>
                                <span class="side-menu__label">${empty messages[48] ? 'Bonus' : messages[48]}</span>
                                <i class="fe fe-chevron-right side-menu__angle"></i>
                            </a>
                            <ul class="slide-menu child1">
						         <li class="slide side-menu__label1">
						         <a href="javascript:void(0);"> </a></li>
						         <li class="slide"><a href="/bonusToFarmer/page"
							       class="side-menu__item">${empty messages[49] ? 'Add Bonus' : messages[49]}</a></li>
						        <li class="slide"><a href="/bonusToFarmer"
							     class="side-menu__item">${empty messages[50] ? 'All Bonus Records' : messages[50]}</a></li>
					
					  </ul>
					</li>
                        <!-- End Bonus slide -->
                        
                         <!-- Start farmer animal slide -->
                        
                        <li class="slide has-sub">
                            <a href="javascript:void(0);" class="side-menu__item">
                                <i class="fa-solid fa-cow listIcons" aria-hidden="true"></i>
                                <span class="side-menu__label">${empty messages[51] ? 'Farmer  Animal Mapping' : messages[51]}</span>
                                <i class="fe fe-chevron-right side-menu__angle"></i>
                            </a>
                            <ul class="slide-menu child1">
                                <li class="slide">
                                    <a href="/farmerAnimalMapping//add-animal-page" class="side-menu__item">
                                    <i class="fa fa-plus-square-o listIcons" aria-hidden="true"></i>${empty messages[52] ? 'Add  Animals' : messages[52]}</a>
                                </li>
                                 <li class="slide">
                                    <a href="/farmerAnimalMapping" class="side-menu__item">
                                <i class ="fa fa-table listIcons" aria-hidden="true"></i>${empty messages[53] ? 'All  Animals' : messages[53]}</a>
                                </li>
                                
                            </ul>
                        </li>
                        <!-- End farmer animal slide -->
                        
                        
                        <!-- Start DairyManger Transactions slide -->
                        
                        <li class="slide has-sub">
                            <a href="javascript:void(0);" class="side-menu__item">
                                <i class="fa fa-tachometer listIcons" aria-hidden="true"></i>
                                <span class="side-menu__label">${empty messages[54] ? 'Dairy  Manager' : messages[54]}</span>
                                <i class="fe fe-chevron-right side-menu__angle"></i>
                            </a>
                            <ul class="slide-menu child1">
                                <li class="slide">
                                    <a href="/dairyManger/add-dairyManger-Page" class="side-menu__item">
                                    <i class="fa fa-plus-square-o listIcons" aria-hidden="true"></i>${empty messages[55] ? 'Add Manager' : messages[55]}</a>
                                </li>
                                 <li class="slide">
                                    <a href="/dairyManger" class="side-menu__item">
                                    <i class="fa fa-table listIcons" aria-hidden="true"></i>${empty messages[56] ? 'All Dairy Manager' : messages[56]}</a>
                                </li>
                                
                            </ul>
                        </li>
                        <!-- End DairyManger Transactions slide -->
                        
                        
                        
                        
                         <!-- Start Reports slide -->
                        
                        <li class="slide has-sub">
                            <a href="javascript:void(0);" class="side-menu__item">
                                <i class="fa fa-tachometer listIcons" aria-hidden="true"></i>
                                <span class="side-menu__label">${empty messages[57] ? 'Reports' : messages[57]}</span>
                                <i class="fe fe-chevron-right side-menu__angle"></i>
                            </a>
                            <ul class="slide-menu child1">
                                <li class="slide">
                                    <a href="/reports/add-milkcollectionReport-page" class="side-menu__item">
                                    <i class="fa-solid fa-jar listIcons" aria-hidden="true"></i>${empty messages[58] ? 'Milk Collection Report' : messages[58]} </a>
                              </li>
                                
                                <li class="slide">
                                    <a href="/reports/add-paymetReport-page" class="side-menu__item">
                                    <i class="fa-regular fa-money-bill-1 listIcons" aria-hidden="true"></i>${empty messages[59] ? ' Payment' : messages[59]}  </a>
                                </li>
                                 <li class="slide">
                                    <a href="/reports/add-feedReport-page" class="side-menu__item">
                                    <i class="fa-solid fa-truck-fast listIcons" aria-hidden="true"></i>${empty messages[60] ? ' Feed' : messages[60]}  </a>
                                </li>
                                <li class="slide">
                                    <a href="/reports/add-advanceReport-page" class="side-menu__item">
                                    <i class="fa-solid fa-money-bill-trend-up listIcons"  aria-hidden="true"></i>${empty messages[61] ? ' Advance' : messages[61]}  </a>
                                </li>
                                <li class="slide">
                                    <a href="/reports/add-BonusReport-page" class="side-menu__item">
                                     <i class="fa-solid fa-money-bill-1-wave listIcons" aria-hidden="true"></i>${empty messages[62] ? ' Bonus' : messages[62]}</a>
                                </li>
                            </ul>
                        </li>
                        <!-- End Reports slide -->
                        
                        
                         <!-- Start TakeBackupDB slide -->
                         
                         	<!-- <li><a href="/patients/add-form" class="nav_link"> <i
								class="fa-solid fa-hospital-user"></i><span class="nav_name">Take BackupDB</span></a>
							</li> -->
							 <li class="slide">
                                    <a href="/DBBackup/page" class="side-menu__item">
                                    <i class="fa-solid fa-jar listIcons" aria-hidden="true"></i>Take BackupDB</a>
                                </li>
                        
                        <!-- Start TakeBackupDB slide -->
                        
                         
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