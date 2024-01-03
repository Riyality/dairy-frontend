
 <jsp:include page="modules/header.jsp" />
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


        <!-- MAIN-CONTENT -->

        <div class="main-content app-content">


    <div class="container-fluid">

        <!-- Start::page-header -->

        <div class="d-md-flex d-block align-items-center justify-content-between my-4 page-header-breadcrumb">
            <div>
                <p class="fw-semibold fs-18 mb-0">Welcome back, Json Taylor !</p>
                <span class="fs-semibold text-muted">Track your sales activity, leads and deals here.</span>
            </div>         
         </div>

<!-- End::page-header -->

<!-- Start::row-1 -->
<div class="row">
    <div class="col-xxl-9 col-xl-12">
        <div class="row">
            <div class="col-xl-4">
                <div class="col-xl-12">
                    <div class="card custom-card">
                        <div class="card-header  justify-content-between">
                            <div class="card-title">
                                Top Deals
                            </div>
                            <div class="dropdown">
                                <a aria-label="anchor" href="javascript:void(0);" class="btn btn-icon btn-sm btn-light" data-bs-toggle="dropdown" aria-expanded="false">
                                    <i class="fe fe-more-vertical"></i>
                                </a>
                                <ul class="dropdown-menu">
                                    <li><a class="dropdown-item" href="javascript:void(0);">Week</a></li>
                                    <li><a class="dropdown-item" href="javascript:void(0);">Month</a></li>
                                    <li><a class="dropdown-item" href="javascript:void(0);">Year</a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="card-body">
                            <ul class="list-unstyled crm-top-deals mb-0">
                                <li>
                                    <div class="d-flex align-items-top flex-wrap">
                                        <div class="me-2">
                                            <span class="avatar avatar-sm avatar-rounded">
<img src="<c:url value="/resources/assets/images/faces/10.jpg"/>" alt="">
</span>
                                        </div>
                                        <div class="flex-fill">
                                            <p class="fw-semibold mb-0">Michael Jordan</p>
                                            <span class="text-muted fs-12">michael.jordan@example.com</span>
                                        </div>
                                        <div class="fw-semibold fs-15">$2,893</div>
                                    </div>
                                </li>
                                <li>
                                    <div class="d-flex align-items-top flex-wrap">
                                        <div class="me-2">
                                            <span class="avatar avatar-sm avatar-rounded bg-warning-transparent fw-semibold">
EK
</span>
                                        </div>
                                        <div class="flex-fill">
                                            <p class="fw-semibold mb-0">Emigo Kiaren</p>
                                            <span class="text-muted fs-12">emigo.kiaren@gmail.com</span>
                                        </div>
                                        <div class="fw-semibold fs-15">$4,289</div>
                                    </div>
                                </li>
                                <li>
                                    <div class="d-flex align-items-top flex-wrap">
                                        <div class="me-2">
                                            <span class="avatar avatar-sm avatar-rounded">
<img src="<c:url value="/resources/assets/images/faces/12.jpg"/>" alt="">
</span>
                                        </div>
                                        <div class="flex-fill">
                                            <p class="fw-semibold mb-0">Randy Origoan</p>
                                            <span class="text-muted fs-12">randy.origoan@gmail.com</span>
                                        </div>
                                        <div class="fw-semibold fs-15">$6,347</div>
                                    </div>
                                </li>
                                
                                <li>
                                    <div class="d-flex align-items-top flex-wrap">
                                        <div class="me-2">
                                            <span class="avatar avatar-sm avatar-rounded bg-primary-transparent fw-semibold">
KA
</span>
                                        </div>
                                        <div class="flex-fill">
                                            <p class="fw-semibold mb-0">Kiara Advain</p>
                                            <span class="text-muted fs-12">kiaraadvain214@gmail.com</span>
                                        </div>
                                        <div class="fw-semibold fs-15">$2,679</div>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                
            </div>
            <div class="col-xl-8">
                <div class="row">
                    <div class="col-xxl-6 col-lg-6 col-md-6">
                        <div class="card custom-card overflow-hidden">
                            <div class="card-body">
                                <div class="d-flex align-items-top justify-content-between">
                                    <div>
                                        <span class="avatar avatar-md avatar-rounded bg-primary">
<i class="ti ti-users fs-16"></i>
</span>
                                    </div>
                                    <div class="flex-fill ms-3">
                                        <div class="d-flex align-items-center justify-content-between flex-wrap">
                                            <div>
                                                <p class="text-muted mb-0">Total Customers</p>
                                                <h4 class="fw-semibold mt-1">1,02,890</h4>
                                            </div>
                                            <div id="crm-total-customers"></div>
                                        </div>
                                        <div class="d-flex align-items-center justify-content-between mt-1">
                                            <div>
                                                <a class="text-primary" href="javascript:void(0);">View All<i class="ti ti-arrow-narrow-right ms-2 fw-semibold d-inline-block"></i></a>
                                            </div>
                                            <div class="text-end">
                                                <p class="mb-0 text-success fw-semibold">+40%</p>
                                                <span class="text-muted op-7 fs-11">this month</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xxl-6 col-lg-6 col-md-6">
                        <div class="card custom-card overflow-hidden">
                            <div class="card-body">
                                <div class="d-flex align-items-top justify-content-between">
                                    <div>
                                        <span class="avatar avatar-md avatar-rounded bg-secondary">
<i class="ti ti-wallet fs-16"></i>
</span>
                                    </div>
                                    <div class="flex-fill ms-3">
                                        <div class="d-flex align-items-center justify-content-between flex-wrap">
                                            <div>
                                                <p class="text-muted mb-0">Total Revenue</p>
                                                <h4 class="fw-semibold mt-1">$56,562</h4>
                                            </div>
                                            <div id="crm-total-revenue"></div>
                                        </div>
                                        <div class="d-flex align-items-center justify-content-between mt-1">
                                            <div>
                                                <a class="text-secondary" href="javascript:void(0);">View All<i class="ti ti-arrow-narrow-right ms-2 fw-semibold d-inline-block"></i></a>
                                            </div>
                                            <div class="text-end">
                                                <p class="mb-0 text-success fw-semibold">+25%</p>
                                                <span class="text-muted op-7 fs-11">this month</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xxl-6 col-lg-6 col-md-6">
                        <div class="card custom-card overflow-hidden">
                            <div class="card-body">
                                <div class="d-flex align-items-top justify-content-between">
                                    <div>
                                        <span class="avatar avatar-md avatar-rounded bg-success">
<i class="ti ti-wave-square fs-16"></i>
</span>
                                    </div>
                                    <div class="flex-fill ms-3">
                                        <div class="d-flex align-items-center justify-content-between flex-wrap">
                                            <div>
                                                <p class="text-muted mb-0">Conversion Ratio</p>
                                                <h4 class="fw-semibold mt-1">12.08%</h4>
                                            </div>
                                            <div id="crm-conversion-ratio"></div>
                                        </div>
                                        <div class="d-flex align-items-center justify-content-between mt-1">
                                            <div>
                                                <a class="text-success" href="javascript:void(0);">View All<i class="ti ti-arrow-narrow-right ms-2 fw-semibold d-inline-block"></i></a>
                                            </div>
                                            <div class="text-end">
                                                <p class="mb-0 text-danger fw-semibold">-12%</p>
                                                <span class="text-muted op-7 fs-11">this month</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xxl-6 col-lg-6 col-md-6">
                        <div class="card custom-card overflow-hidden">
                            <div class="card-body">
                                <div class="d-flex align-items-top justify-content-between">
                                    <div>
                                        <span class="avatar avatar-md avatar-rounded bg-warning">
<i class="ti ti-briefcase fs-16"></i>
</span>
                                    </div>
                                    <div class="flex-fill ms-3">
                                        <div class="d-flex align-items-center justify-content-between flex-wrap">
                                            <div>
                                                <p class="text-muted mb-0">Total Deals</p>
                                                <h4 class="fw-semibold mt-1">2,543</h4>
                                            </div>
                                            <div id="crm-total-deals"></div>
                                        </div>
                                        <div class="d-flex align-items-center justify-content-between mt-1">
                                            <div>
                                                <a class="text-warning" href="javascript:void(0);">View All<i class="ti ti-arrow-narrow-right ms-2 fw-semibold d-inline-block"></i></a>
                                            </div>
                                            <div class="text-end">
                                                <p class="mb-0 text-success fw-semibold">+19%</p>
                                                <span class="text-muted op-7 fs-11">this month</span>
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
    </div>

</div>
<!-- End::row-1 -->

</div>


        </div>
        <!-- END MAIN-CONTENT -->

 <jsp:include page="modules/footer.jsp" />
