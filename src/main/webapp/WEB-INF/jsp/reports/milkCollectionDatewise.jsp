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
							<div class="card-title">Datewise Milk Collection</div></div>
                        <div class="card-body dairy-card-body">
                            <form id="filterForm" class="row g-3 needs-validation" >
                                <div class="col-md-3">
                                    <label class="form-label dairy-input-label required-field">Select From Date</label>
                                    <input type="date" class="form-control dairy-form-input" id="fromDate" name="fromDate" required >
                                </div>
                               <div class="col-md-3">
                                 <label class="form-label dairy-input-label required-field">Select To Date</label>
                                    <input type="date" class="form-control dairy-form-input" id="toDate" name="toDate" required>
                                </div>
                                <div class="col-md-4">
                                    <label class="form-label dairy-input-label required-field">Milk Type</label><br>
                                    <input type="radio" name="milkType" value="cow" />Cow
                                    <input type="radio" name="milkType" value="buffalo" />Buffalo
                                </div>

									<div class="col-md-4">
									<label class="form-label dairy-input-label required-field">Select
										Shift </label> 
								 <select  class="form-select dairy-form-input"
										id="shiftDropdown" name="shift" required>
										<option value="" selected="selected" disabled="disabled">Select
											Shift</option>
											<option value="morning">Morning</option>
											<option value="Evening">Evening</option>
									</select>
									</div>

                                <div class="col-12">
                                    <button class="btn btn-primary dairy-form-btn" type="button" id="getMilkCollectionRecords" >View Report </button>
                                </div>
                            </form>

                            <table id="file-export" class="table table-bordered dataTable no-footer dairy-table-border">
                                <thead>
                                    <tr class="dairy-table-head">
                                       <th>Farmer Name</th> 
                                        <th>Date Of Collection</th>   
                                        <th>Shift</th>  
                                        <th>Type</th>                                 
                                       	<th>Fat</th>
                                        <th>SNF</th>
                                        <th>Rate</th>
                                        <th>Milk Quantity</th>
                                        <th>Amount</th>
                                    </tr>
                                </thead>
                                <tbody >
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <jsp:include page="../modules/footer.jsp" />

      
</body>