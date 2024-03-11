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
                                    <a class="nav-link active tabColor-tab" id="datewise-tab" data-toggle="tab" href="#datewise">Datewise</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link tabColor-tab" id="farmerwise-tab" data-toggle="tab" href="#farmerwise">Farmerwise</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link tabColor-tab" id="companywise-tab" data-toggle="tab" href="#companywise">Feed Companywise</a>
                                </li>
                            </ul>
                        </div>
                        <div class="card-body dairy-card-body">
                            <div class="tab-content">
                                <div class="tab-pane fade show active" id="datewise">
                                 	
                                    <form id="filterForm" class="row g-3 needs-validation" >
                                <div class="col-md-2">
                                    <label class="form-label dairy-input-label required-field">Select From Date</label>
                                    <input type="date" class="form-control dairy-form-input" id="fromDate" name="fromDate" required >
                                </div>
                               <div class="col-md-2">
                                 <label class="form-label dairy-input-label required-field">Select To Date</label>
                                    <input type="date" class="form-control dairy-form-input" id="toDate" name="toDate" required>
                                </div>
                              
							   <div class="col-12">
                                     <button class="btn btn-primary dairy-form-btn" type="button" id="getFeedRecordsDatewise" >View Report </button>
                                </div>
                                </form>

                                <table id="file-export" class="table table-bordered dataTable no-footer dairy-table-border">
                                <thead>
                                    <tr class="dairy-table-head">
                                       <th>Date Of Purchase</th>   
                                       <th>Farmer Name</th> 
                                        <th>Feed Type</th>  
                                        <th>Company</th>                                 
                                        <th>Rate</th>
                                        <th>Quantity</th>
                                        <th>Amount</th>
                                        
                                    </tr>
                                </thead>
                                <tbody >
                                </tbody>
                             </table>
                                   
                          </div>
                                <div class="tab-pane fade" id="farmerwise">
                                
                                   <form id="filterForm" class="row g-3 needs-validation" >
                                <div class="col-md-2">
                                    <label class="form-label dairy-input-label required-field">Select From Date</label>
                                    <input type="date" class="form-control dairy-form-input" id="fromDateFarmer" name="fromDate" required >
                                </div>
									<div class="col-md-2">

                                    <label class="form-label dairy-input-label required-field">Select To Date</label>
                                    <input type="date" class="form-control dairy-form-input" id="toDateFarmer" name="toDate" required>
                                </div>
                                
									<div class="col-md-4">
									  <label class="form-label dairy-input-label required-field"> Select</label><br>
									  <input type="radio" name="farmer" value="all" checked />All Farmers
									  <input type="radio" name="farmer" value="farmerwise" />Farmerwise									
									  <select class="form-select dairy-form-input" id="farmerSelect" style="display: none;">
									    <option value="" selected="selected" disabled="disabled">Select Farmer</option>
										<c:forEach items="${list}" var="farmer">
											<option value="${farmer.id}">${farmer.name}</option>
										</c:forEach>
									  </select>
									</div>
                               
                                <div class="col-12">
                                    <button class="btn btn-primary dairy-form-btn" type="button" id="getFeedRecordsFarmerwise" >Get Records </button>
                                </div>
                            </form>
                         <table id="file-export" class="table table-bordered dataTable no-footer dairy-table-border">
                                <thead>
                                    <tr class="dairy-table-head">
                                       <th>Date Of Purchase</th>   
                                       <th>Farmer Name</th> 
                                        <th>Feed Type</th>  
                                        <th>Company</th>                                 
                                        <th>Rate</th>
                                        <th>Quantity</th>
                                        <th>Amount</th>
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
                                    <label class="form-label dairy-input-label required-field">Select From Date</label>
                                    <input type="date" class="form-control dairy-form-input" id="fromDateComp" name="fromDate" required >
                                </div>
									<div class="col-md-2">

                                    <label class="form-label dairy-input-label required-field">Select To Date</label>
                                    <input type="date" class="form-control dairy-form-input" id="toDateComp" name="toDate" required>
                                </div>
                                	
                                <div class="col-md-2">
									<label class="form-label dairy-input-label required-field">Feed Company</label> 
									 <select  class="form-select dairy-form-input"
										id="feedCompanyList" name="feedCompanyId">
										<option value="" selected="selected" disabled="disabled">Select
											Feed Company</option>
										<c:forEach items="${feedCompanyList}" var="fc">
											<option value="${fc.id}">${fc.name}</option>
										</c:forEach>
									</select>
								</div>
                               
                                <div class="col-12">
                                    <button class="btn btn-primary dairy-form-btn" type="button" id="getFeedRecordsCompanywise" >Get Records </button>
                                </div>
                            </form>
                         <table id="file-export" class="table table-bordered dataTable no-footer dairy-table-border">
                                <thead>
                                    <tr class="dairy-table-head">
                                       <th>Date Of Purchase</th>   
                                       <th>Farmer Name</th> 
                                        <th>Feed Type</th>  
                                        <th>Company</th>                                 
                                        <th>Rate</th>
                                        <th>Quantity</th>
                                        <th>Amount</th>
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
