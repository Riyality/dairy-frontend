<jsp:include page="modules/header.jsp" />
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


        <!-- MAIN-CONTENT -->

        <div class="main-content app-content">


    <div class="container-fluid">

        <!-- Start::page-header -->

        <div class="d-md-flex d-block align-items-center justify-content-between my-4 page-header-breadcrumb">
            <div>
                <p class="fw-semibold fs-18 mb-0">Welcome back, ${sessionScope.name}</p>
            </div>         
         </div>

<!-- End::page-header -->

<!-- Start::row-1 -->
<div class="row">
    <div class="col-xxl-9 col-xl-12">
        <div class="row">
        
        <div class="col-xl-12">
                <div class="row">
                
                    <div class="col-xxl-4 col-lg-4 col-md-4">
                        <div class="card custom-card overflow-hidden">
                            <div class="card-body">
                                <div class="d-flex align-items-top justify-content-between">
                                   
                                    <div class="flex-fill ms-3">
                                        <div class="d-flex align-items-center justify-content-between flex-wrap">
                                            <div>
                                                <p class="text-darkRed text-size-15 mb-0"><b>Total Active Farmers</b></p>
                                                <h4 class="fw-semibold mt-1">${activeFarmersCount}</h4>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                
                    <div class="col-xxl-4 col-lg-4 col-md-4">
                        <div class="card custom-card overflow-hidden">
                            <div class="card-body">
                                <div class="d-flex align-items-top justify-content-between">
                                   
                                    <div class="flex-fill ms-3">
                                        <div class="d-flex align-items-center justify-content-between flex-wrap">
                                            <div>
                                                <p class="text-darkRed text-size-15 mb-0"><b>Total InActive Farmers</b></p>
                                                <h4 class="fw-semibold mt-1">${inActiveFarmersCount}</h4>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                
                    <div class="col-xxl-4 col-lg-4 col-md-4">
                        <div class="card custom-card overflow-hidden">
                            <div class="card-body">
                                <div class="d-flex align-items-top justify-content-between">
                                   
                                    <div class="flex-fill ms-3">
                                        <div class="d-flex align-items-center justify-content-between flex-wrap">
                                            <div>
                                                <p class="text-darkRed text-size-15 mb-0"><b>Total Feed Stock</b></p>
                                                <h4 class="fw-semibold mt-1">${totalFeedStock}</h4>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                      </div>
               
                    </div>
                    
                     <div class="d-md-flex d-block align-items-center justify-content-between my-4 page-header-breadcrumb">
			            <div>
			               <p class="fw-semibold fs-18 mb-0">Today's Milk Collection</p>
			            </div>         
			         </div>
                    
                    <div class="row">
                       <div class="col-xxl-4 col-xl-4">
                           <div class="row">
                               <div class="col-xl-12 col-xl-6">
                                   <div class="card custom-card">
                                       <div class="card-header justify-content-between">
                                           <div class="card-title">
                                              Cow
                                           </div>
                                       </div>
                                       <div class="card-body p-0 overflow-hidden">
                                           <div class="row row-cols-12 border-top border-block-start-dashed">
                                               <div class="col p-0">
                                                   <div class="ps-4 py-3 pe-3 text-center border-end border-inline-end-dashed">
                                                       <span class="text-muted fs-12 mb-1 crm-lead-legend mobile d-inline-block">Morning
                                                       </span>
                                                       <div><span class="fs-16 fw-semibold">${buffaloMorningMilkCollection}</span>
                                                       </div>
                                                   </div>
                                               </div>
                                               <div class="col p-0">
                                                   <div class="p-3 text-center">
                                                       <span class="text-muted fs-12 mb-1 crm-lead-legend tablet d-inline-block">Evening
                                                       </span>
                                                       <div><span class="fs-16 fw-semibold">${cowEveningMilkCollection}</span></div>
                                                   </div>
                                               </div>
                                           </div>
                                       </div>
                                   </div>
                               </div>
                           </div>
                       </div>
                       
                       <div class="col-xxl- 4 col-xl-4">
                           <div class="row">
                               <div class="col-xl-12 col-xl-6">
                                   <div class="card custom-card">
                                       <div class="card-header justify-content-between">
                                           <div class="card-title">
                                              Buffalo
                                           </div>
                                       </div>
                                       <div class="card-body p-0 overflow-hidden">
                                           <div class="row row-cols-12 border-top border-block-start-dashed">
                                               <div class="col p-0">
                                                   <div class="ps-4 py-3 pe-3 text-center border-end border-inline-end-dashed">
                                                       <span class="text-muted fs-12 mb-1 crm-lead-legend mobile d-inline-block">Morning
                                                       </span>
                                                       <div><span class="fs-16 fw-semibold">${buffaloMorningMilkCollection}</span>
                                                       </div>
                                                   </div>
                                               </div>
                                               <div class="col p-0">
                                                   <div class="p-3 text-center">
                                                       <span class="text-muted fs-12 mb-1 crm-lead-legend tablet d-inline-block">Evening
                                                       </span>
                                                       <div><span class="fs-16 fw-semibold">${buffaloEveningMilkCollection}</span></div>
                                                   </div>
                                               </div>
                                           </div>
                                       </div>
                                   </div>
                               </div>
                           </div>
                       </div>
                       
                       <div class="col-xxl-4 col-xl-4">
                           <div class="row">
                               <div class="col-xl-12 col-xl-6">
                                   <div class="card custom-card">
                                       <div class="card-header justify-content-between">
                                           <div class="card-title">
                                              Others
                                           </div>
                                       </div>
                                       <div class="card-body p-0 overflow-hidden">
                                           <div class="row row-cols-12 border-top border-block-start-dashed">
                                               <div class="col p-0">
                                                   <div class="ps-4 py-3 pe-3 text-center border-end border-inline-end-dashed">
                                                       <span class="text-muted fs-12 mb-1 crm-lead-legend mobile d-inline-block">Morning
                                                       </span>
                                                       <div><span class="fs-16 fw-semibold">624</span>
                                                       </div>
                                                   </div>
                                               </div>
                                               <div class="col p-0">
                                                   <div class="p-3 text-center">
                                                       <span class="text-muted fs-12 mb-1 crm-lead-legend tablet d-inline-block">Evening
                                                       </span>
                                                       <div><span class="fs-16 fw-semibold">679</span></div>
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

        <!-- END MAIN-CONTENT -->

 <jsp:include page="modules/footer.jsp" />