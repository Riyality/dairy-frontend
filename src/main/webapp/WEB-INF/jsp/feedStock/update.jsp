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
							<div class="card-title">${empty messages[163] ? ' Update Feed Stock' : messages[163]}</div>
							<a href="http://localhost:6161/feedStock"><button class="btn btn-primary dairy-form-btn" >${empty messages[79] ? ' Back' : messages[79]}</button></a>
						</div>
						<div class="card-body dairy-card-body">
							<form class="row g-3 needs-validation" action="/feedStock/update"
								method="post" >
								
                          <input type="hidden" class="form-control dairy-form-input" id="" name="id" value="${feedstock.id }"> 
								<div class="col-md-6">
									<label class="form-label dairy-input-label required-field">${empty messages[154] ? 'Supplier Name' : messages[154]}</label> <select class="form-select dairy-form-input" id=""
										name="supplierId">
										<option value="${feedstock.supplierId}" selected="selected" >${feedstock.supplierName}</option>
										<c:forEach items="${suppliers}" var="supplier">
											<option value="${supplier.id}">${supplier.name}</option>
										</c:forEach>
									</select>

								</div>

								<div class="col-md-6">
									<label class="form-label dairy-input-label required-field">${empty messages[108] ? 'Date Of Purchase' : messages[108]}</label> <input type="date" class="form-control dairy-form-input"
										id="" name="dateOfPurchase" value="${feedstock.dateOfPurchase}" required>
								</div>

								<div class="col-md-6">
									<label class="form-label dairy-input-label required-field">${empty messages[127] ? 'Feed Company Name' : messages[127]}</label> <select class="form-select dairy-form-input" id=""
										name="feedCompanyId">
										<option value="${feedstock.feedCompanyId}" selected="selected" disabled="disabled">${feedstock.feedCompanyName}</option>
										<c:forEach items="${feedCompany}" var="fc">
											<option  value="${fc.id}">${fc.name}</option>
										</c:forEach>
									</select>


								</div>

								<div class="col-md-6">
									<label class="form-label dairy-input-label required-field">${empty messages[120] ? 'Feed Tye' : messages[120]}</label> <select class="form-select dairy-form-input"
										id="" name="feedTypeId">
										<option value="${feedstock.feedTypeId}"  selected="selected" disabled="disabled">${feedstock.feedTypeName}</option>
										<c:forEach items="${feedType}" var="feed">
											<option selected="selected" value="${feed.id}">${feed.type}</option>
										</c:forEach>
									</select>
								</div>

								<div class="col-md-6">
									<label class="form-label dairy-input-label required-field">${empty messages[110] ? 'Price Per Unit' : messages[110]}</label> <input type="text"
										class="form-control dairy-form-input"
										placeholder="${empty messages[113] ? 'Enter  Price Per Unit' : messages[113]}" id="feedStockCostPerUnit"
										name="feedCostPerUnit" value="${feedstock.feedCostPerUnit}" required>
								</div>

								<div class="col-md-6">
									<label class="form-label dairy-input-label required-field">${empty messages[112] ? 'Enter Total Quantity' : messages[112]}</label> <input type="text"
										class="form-control dairy-form-input"
										placeholder="${empty messages[112] ? 'Enter Total Quantity' : messages[112]}" id="feedStockQuantity" name="quantity" value="${feedstock.quantity}"required>
								</div>

								<div class="col-md-6">
									<label class="form-label dairy-input-label required-field">${empty messages[97] ? 'Total  Amount' : messages[97]}</label> <input type="text"
										class="form-control dairy-form-input"
										placeholder="${empty messages[103] ? 'Enter  Total  Amount' : messages[103]}" id="feedStockTotalAmount" name="totalAmount"  value="${feedstock.totalAmount}" required>
								</div>

								<div class="col-12">
									<label class="form-label dairy-input-label">${empty messages[69] ? ' Remark' : messages[69]}</label>
									<textarea class="col-12 dairy-textarea" rows="4" name="remark"
										placeholder="${empty messages[74] ? 'Enter Remark Here' : messages[74]}">${feedstock.remark}</textarea>
								</div>

								<div class="col-12">
									<button class="btn btn-primary dairy-form-btn" type="submit">${empty messages[78] ? ' submit' : messages[78]}</button>
									  
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="../modules/footer.jsp" />