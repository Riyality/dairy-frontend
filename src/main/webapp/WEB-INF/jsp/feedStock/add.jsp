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
							<div class="card-title">${empty messages[159] ? 'Add Feed Stock' : messages[159]}</div>
						</div>
						<div class="card-body dairy-card-body">
						
						 <table id="file-export-feed" class="table table-bordered dataTable no-footer dairy-table-border">
                                <thead>
                                    <tr class="dairy-table-head">
                                        <th>${empty messages[154] ? 'Supplier Name' : messages[154]} </th>                                        
                                        <th>${empty messages[108] ? 'Date Of Purchase' : messages[108]}</th>
                                        <th>${empty messages[15] ? ' Feed Company' : messages[15]}</th>
                                        <th >${empty messages[131] ? 'Feed Tye ' : messages[131]}</th>
                                        <th >${empty messages[110] ? 'Price Per Unit' : messages[110]}</th>
                                        <th>${empty messages[109] ? 'Total Quantity' : messages[109]} </th>
                                        <th>${empty messages[97] ? 'Total  Amount' : messages[97]}</th> 
                                        <th>${empty messages[69] ? ' Remark' : messages[69]}</th> 
                                        <th>Action</th>     
                                    </tr>
                                </thead>
                                <tbody >
                                </tbody>
                            </table>
                              <div class="col-12">
                                <button id="submitButton" class="btn btn-primary dairy-form-btn" type="button">${empty messages[78] ? ' submit' : messages[78]}</button>
                            </div>
                            
							<form  id="feedStockForm" class="row g-3 needs-validation" action="/feedStock"
								method="post" >
								
                                     
                            <div class="col-md-6">
                                <label class="form-label dairy-input-label required-field">${empty messages[154] ? 'Supplier Name' : messages[154]}</label>
                                <select class="form-select dairy-form-input" id="supplierId" name="supplierId">
                                    <option value="" selected="selected" disabled="disabled">Select Supplier</option>
                                    <c:forEach items="${suppliers}" var="supplier">
                                        <option value="${supplier.id}">${supplier.name}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            
                            <div class="col-md-6">
                                <label class="form-label dairy-input-label required-field">${empty messages[108] ? 'Date Of Purchase' : messages[108]}</label>
                                <input type="date" class="form-control dairy-form-input" id="dateOfPurchase" name="dateOfPurchase" required>
                            </div>
                            
                             <div class="col-md-6">
                                <label class="form-label dairy-input-label required-field">${empty messages[127] ? 'Feed Company Name' : messages[127]}</label>
                                 <select class="form-select dairy-form-input" id="feedCompanyId" name="feedCompanyId">
                                   <option value="" selected="selected" disabled="disabled">${empty messages[119] ? 'Select Feed Company' : messages[119]}</option>
                                     <c:forEach items="${feedCompany}" var="fc">
                                          <option value="${fc.id}">${fc.name}</option>
                                     </c:forEach>
                                </select>
                          </div>

               
                       <div class="col-md-6">
                         <label class="form-label dairy-input-label required-field">${empty messages[120] ? 'Feed Tye' : messages[120]}</label>
                         <select class="form-select dairy-form-input" id="feedTypeId" name="feedTypeId">
                          <option value="" selected="selected" disabled="disabled">Select Feed Type</option>
                           <c:forEach items="${feedType}" var="feed">
                              <option value="${feed.id}">${feed.type}</option>
                           </c:forEach>
                        </select>
                      </div>
								<div class="col-md-6">
									<label class="form-label dairy-input-label required-field">${empty messages[110] ? 'Price Per Unit' : messages[110]}</label> <input type="text"
										class="form-control dairy-form-input"
										placeholder="${empty messages[113] ? 'Enter  Price Per Unit' : messages[113]}" id="feedStockCostPerUnit"
										name="feedCostPerUnit"  required>
								</div>

								<div class="col-md-6">
									<label class="form-label dairy-input-label required-field">${empty messages[109] ? 'Quantity' : messages[109]}</label> <input type="text"
										class="form-control dairy-form-input"
										placeholder="${empty messages[112] ? 'Enter Total Quantity' : messages[112]}" id="feedStockQuantity" name="quantity" required>
								</div>

								<div class="col-md-6">
									<label class="form-label dairy-input-label required-field">${empty messages[97] ? 'Total  Amount' : messages[97]}</label> <input type="text"
										class="form-control dairy-form-input"
										placeholder="${empty messages[103] ? 'Enter  Total  Amount' : messages[103]}" id="feedStockTotalAmount" name="totalAmount"   required>
								</div>

								<div class="col-12">
									<label class="form-label dairy-input-label">${empty messages[69] ? ' Remark' : messages[69]}</label>
									<textarea class="col-12 dairy-textarea" rows="4" name="remark"
										placeholder="${empty messages[74] ? 'Enter Remark Here' : messages[74]}"></textarea>
								</div>

								<div class="col-12">
									<button id="addRecordBtn" class="btn btn-primary dairy-form-btn" type="submit">${empty messages[160] ? 'Add Record' : messages[160]}</button>
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


	