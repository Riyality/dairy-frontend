<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="../modules/header.jsp" />

<body>
    <div class="main-content app-content p-4">
        <div class="container-fluid">
            <div class="row">
                <div class="col-12 m-auto">
                    <div class="card custom-card">
                        <div class="card-header justify-content-between dairy-card-header">
                            <ul class="nav nav-tabs" id="myTabs">
                                <li class="nav-item">
                                    <a class="nav-link active tabColor-tab" id="datewise-tab" data-toggle="tab" href="#datewise">${empty messages[255] ? 'Datewise' : messages[255]}</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link tabColor-tab" id="farmerwise-tab" data-toggle="tab" href="#farmerwise">${empty messages[254] ? 'Farmerswise' : messages[254]}	</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link tabColor-tab" id="companywise-tab" data-toggle="tab" href="#companywise">${empty messages[256] ? 'Feed Companywise' : messages[256]}	</a>
                                </li>
                            </ul>
                        </div>
                        <div class="card-body dairy-card-body">
                            <div class="tab-content">
                                <div class="tab-pane fade show active" id="datewise">
                                 	
                                    <form id="filterForm" class="row g-3 needs-validation" >
                                <div class="col-md-2">
                                    <label class="form-label dairy-input-label required-field">${empty messages[187] ? 'Select Date From' : messages[187]}</label>
                                    <input type="date" class="form-control dairy-form-input" id="fromDate" name="fromDate" required >
                                </div>
                               <div class="col-md-2">
                                 <label class="form-label dairy-input-label required-field">${empty messages[189] ? 'Select To Date' : messages[189]}</label>
                                    <input type="date" class="form-control dairy-form-input" id="toDate" name="toDate" required>
                                </div>
                              
							   <div class="col-12">
                                     <button class="btn btn-primary dairy-form-btn" type="button" id="getFeedRecordsDatewise" >${empty messages[177] ? 'View Report' : messages[177]}  </button>
                                </div>
                                </form>

                                <table id="file-export" class="table table-bordered dataTable no-footer dairy-table-border">
                                <thead>
                                    <tr class="dairy-table-head">
                                       <th>${empty messages[117] ? '  Date Of  Distribution' : messages[117]}</th>   
                                       <th>${empty messages[116] ? 'Farmer Name' : messages[116]}</th> 
                                        <th>${empty messages[120] ? 'Feed Tye' : messages[120]}</th>  
                                        <th>${empty messages[118] ? 'Feed Company' : messages[118]}</th>                                 
                                        <th>${empty messages[110] ? 'Price Per Unit' : messages[110]}</th>
                                        <th>${empty messages[109] ? 'Quantity' : messages[109]}</th>
                                        <th>${empty messages[97] ? 'Total  Amount' : messages[97]}</th>
                                        
                                    </tr>
                                </thead>
                                <tbody >
                                </tbody>
                             </table>
                                   
                          </div>
                                <div class="tab-pane fade" id="farmerwise">
                                
                                   <form id="filterForm" class="row g-3 needs-validation" >
                                <div class="col-md-2">
                                    <label class="form-label dairy-input-label required-field">${empty messages[187] ? 'Select Date From' : messages[187]}</label>
                                    <input type="date" class="form-control dairy-form-input" id="fromDateFarmer" name="fromDate" required >
                                </div>
									<div class="col-md-2">

                                    <label class="form-label dairy-input-label required-field">${empty messages[189] ? 'Select To Date' : messages[189]}</label>
                                    <input type="date" class="form-control dairy-form-input" id="toDateFarmer" name="toDate" required>
                                </div>
                                
									<div class="col-md-4">
									  <label class="form-label dairy-input-label required-field"> ${empty messages[252] ? 'Select' : messages[252]}</label><br>
									  <input type="radio" name="farmer" value="all" checked />${empty messages[253] ? 'All   Farmers' : messages[253]}
									  <input type="radio" name="farmer" value="farmerwise" />${empty messages[254] ? 'Farmerswise' : messages[254]}																	
									  <select class="form-select dairy-form-input" id="farmerSelect" style="display: none;">
									    <option value="" selected="selected" disabled="disabled">${empty messages[207] ? ' Select Farmer' : messages[207]}</option>
										<c:forEach items="${list}" var="farmer">
											<option value="${farmer.id}">${farmer.name}</option>
										</c:forEach>
									  </select>
									</div>
                               
                                <div class="col-12">
                                    <button class="btn btn-primary dairy-form-btn" type="button" id="getFeedRecordsFarmerwise" >${empty messages[177] ? 'View Report' : messages[177]}  </button>
                                </div>
                            </form>
                         <table id="file-export" class="table table-bordered dataTable no-footer dairy-table-border">
                                <thead>
                                    <tr class="dairy-table-head">
                                       <th>${empty messages[117] ? '  Date Of  Distribution' : messages[117]}</th>   
                                       <th>${empty messages[116] ? 'Farmer Name' : messages[116]}</th> 
                                        <th>${empty messages[120] ? 'Feed Tye' : messages[120]}</th>  
                                        <th>${empty messages[118] ? 'Feed Company' : messages[118]}</th>                                 
                                        <th>${empty messages[110] ? 'Price Per Unit' : messages[110]}</th>
                                        <th>${empty messages[109] ? 'Quantity' : messages[109]}</th>
                                        <th>${empty messages[97] ? 'Total  Amount' : messages[97]}</th>
                                    </tr>
                                </thead>
                                <tbody >
                                </tbody>
                            </table>
                                    
                                    
                                </div>


        <!-- Companywise -->   
        <div class="tab-pane fade" id="companywise">
                                
                                   <form id="filterForm" class="row g-3 needs-validation" >
                                <div class="col-md-2">
                                    <label class="form-label dairy-input-label required-field">${empty messages[187] ? 'Select Date From' : messages[187]}</label>
                                    <input type="date" class="form-control dairy-form-input" id="fromDateComp" name="fromDate" required >
                                </div>
									<div class="col-md-2">

                                    <label class="form-label dairy-input-label required-field">${empty messages[189] ? 'Select To Date' : messages[189]}</label>
                                    <input type="date" class="form-control dairy-form-input" id="toDateComp" name="toDate" required>
                                </div>
                                	
                                <div class="col-md-2">
									<label class="form-label dairy-input-label required-field">${empty messages[118] ? 'Feed Company' : messages[118]}</label> 
									 <select  class="form-select dairy-form-input"
										id="feedCompanyList" name="feedCompanyId">
										<option value="" selected="selected" disabled="disabled">${empty messages[119] ? 'Select Feed Company' : messages[119]}</option>
										<c:forEach items="${feedCompanyList}" var="fc">
											<option value="${fc.id}">${fc.name}</option>
										</c:forEach>
									</select>
								</div>
                               
                                <div class="col-12">
                                    <button class="btn btn-primary dairy-form-btn" type="button" id="getFeedRecordsCompanywise" >${empty messages[177] ? 'View Report' : messages[177]}  </button>
                                </div>
                            </form>
                         <table id="file-export" class="table table-bordered dataTable no-footer dairy-table-border">
                                <thead>
                                    <tr class="dairy-table-head">
                                       <th>${empty messages[117] ? '  Date Of  Distribution' : messages[117]}</th>   
                                       <th>${empty messages[116] ? 'Farmer Name' : messages[116]}</th> 
                                        <th>${empty messages[120] ? 'Feed Tye' : messages[120]}</th>  
                                        <th>${empty messages[118] ? 'Feed Company' : messages[118]}</th>                                 
                                        <th>${empty messages[110] ? 'Price Per Unit' : messages[110]}</th>
                                        <th>${empty messages[109] ? 'Quantity' : messages[109]}</th>
                                        <th>${empty messages[97] ? 'Total  Amount' : messages[97]}</th>
                                    </tr>
                                </thead>
                                <tbody >
                                </tbody>
                            </table>
                                </div>

 <!--  -->
  </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <jsp:include page="../modules/footer.jsp" />
    <style>
    #myTabs .tabColor-tab.nav-link.active {
    background-color: lightgray;
    color: black;
    border-color: red;
}

</style>
</body>
