<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%><%@ taglib
	uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="../modules/header.jsp" />
<style>
</style>
<body>
	<div class="main-content app-content p-4">
		<div class="container-fluid">
			<div class="row">
				<div class="col-10 m-auto">
					<div class="card custom-card">
						<div class="card-header justify-content-between dairy-card-header">
							<div class="card-title">Add Feed Stock</div>
						</div>
						<div class="card-body dairy-card-body">
						  <jsp:include page="../successMessage/message.jsp" />
						
						 <table id="file-export-feed" class="table table-bordered dataTable no-footer dairy-table-border">
                                <thead>
                                    <tr class="dairy-table-head">
                                        <th>Supplier Name </th>                                        
                                        <th>Purchase Date</th>
                                        <th>Feed Company</th>
                                        <th >Feed Type</th>
                                        <th >Feed Cost(1 unit)</th>
                                        <th>Total Quantity </th>
                                        <th>Total Amount</th> 
                                        <th>Remark</th> 
                                        <th>Action</th>     
                                    </tr>
                                </thead>
                                <tbody >
                                </tbody>
                            </table>
                              <div class="col-12">
                                <button id="submitButton" class="btn btn-primary dairy-form-btn" type="button">Submit</button>
                            </div>
                            
							<form  id="feedStockForm" class="row g-3 needs-validation" action="/feedStock"
								method="post" >
								
                                     
                            <div class="col-md-6">
                                <label class="form-label dairy-input-label required-field">Supplier Name</label>
                                <select class="form-select dairy-form-input" id="supplierId" name="supplierId">
                                    <option value="" selected="selected" disabled="disabled">Select Supplier</option>
                                    <c:forEach items="${suppliers}" var="supplier">
                                        <option value="${supplier.id}">${supplier.name}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            
                            <div class="col-md-6">
                                <label class="form-label dairy-input-label required-field">Purchase Date</label>
                                <input type="date" class="form-control dairy-form-input" id="dateOfPurchase" name="dateOfPurchase" required>
                            </div>
                            
                             <div class="col-md-6">
                                <label class="form-label dairy-input-label required-field">Feed Company</label>
                                 <select class="form-select dairy-form-input" id="feedCompanyId" name="feedCompanyId">
                                   <option value="" selected="selected" disabled="disabled">Select Feed Company</option>
                                     <c:forEach items="${feedCompany}" var="fc">
                                          <option value="${fc.id}">${fc.name}</option>
                                     </c:forEach>
                                </select>
                          </div>

               
                       <div class="col-md-6">
                         <label class="form-label dairy-input-label required-field">Feed Company Type</label>
                         <select class="form-select dairy-form-input" id="feedTypeId" name="feedTypeId">
                          <option value="" selected="selected" disabled="disabled">Select Feed Type</option>
                           <c:forEach items="${feedType}" var="feed">
                              <option value="${feed.id}">${feed.type}</option>
                           </c:forEach>
                        </select>
                      </div>
								<div class="col-md-6">
									<label class="form-label dairy-input-label required-field">Feed Cost
										(1 unit)</label> <input type="text"
										class="form-control dairy-form-input"
										placeholder="Enter Feed Cost pre Unit" id="feedStockCostPerUnit"
										name="feedCostPerUnit"  required>
								</div>

								<div class="col-md-6">
									<label class="form-label dairy-input-label required-field">Total
										Quantity</label> <input type="text"
										class="form-control dairy-form-input"
										placeholder="Enter Total Quantity" id="feedStockQuantity" name="quantity" required>
								</div>

								<div class="col-md-6">
									<label class="form-label dairy-input-label required-field">Total
										Amount</label> <input type="text"
										class="form-control dairy-form-input"
										placeholder="Total Amount" id="feedStockTotalAmount" name="totalAmount"   required>
								</div>

								<div class="col-12">
									<label class="form-label dairy-input-label">Remark</label>
									<textarea class="col-12 dairy-textarea" rows="4" name="remark"
										placeholder="Enter Remark Here"></textarea>
								</div>

								<div class="col-12">
									<button id="addRecordBtn" class="btn btn-primary dairy-form-btn" type="submit">Add Record</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="../modules/footer.jsp" />

</body>


	