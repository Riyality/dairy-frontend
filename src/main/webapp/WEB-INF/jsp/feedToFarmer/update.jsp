
<jsp:include page="../modules/header.jsp" />
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>

</style>
<body>

	<div class="main-content app-content p-4">

		<div class="container-fluid">
			<div class="row">
				<div class="col-10 m-auto">
					<div class="card custom-card">
						<div class="card-header justify-content-between dairy-card-header">
							<div class="card-title">Update Feed Distribution</div>
							<a href="http://localhost:6161/feedToFarmers"><button class="btn btn-primary dairy-form-btn" >Back</button></a>
						</div>
						<div class="card-body dairy-card-body">
							<form class="row g-3 needs-validation" action="/feedToFarmers/update" method="post" >
								
								<input type="hidden"  class="form-control dairy-form-input"  name="id" value="${feedToFarmer.id}" >
								
								<div class="col-md-6">
									<label class="form-label dairy-input-label required-field">Farmer Name</label>
								<select class="form-select dairy-form-input" id=""
										name="farmerId" value="${feedToFarmer.farmerId}">
										<c:forEach items="${Farmers}" var="farmer">
											<option  selected="selected" value="${farmer.id}">${farmer.name}</option>
										</c:forEach>
									</select>
								</div>
								
								<div class="col-md-6">
									<label class="form-label dairy-input-label required-field">Date of distributions</label> 
									<input type="date" class="form-control dairy-form-input" id="" name="dateOfPurchase"  value="${feedToFarmer.dateOfPurchase}"required>
								</div>

								<div class="col-md-6">
									<label class="form-label dairy-input-label required-field">Feed Company</label> 
									 <select  class="form-select dairy-form-input"
										id="feedTypeList" name="feedCompanyId"  value="${feedToFarmer.feedCompanyId}">
										<option value="${feedToFarmer.feedCompanyId}" selected="selected" disabled="disabled">${feedToFarmer.feedCompanyName}</option>
										<c:forEach items="${feedCompany}" var="fc">
											<option value="${fc.id}">${fc.name}</option>
										</c:forEach>
									</select>
								</div>

								<div class="col-md-6">
									<label class="form-label dairy-input-label required-field">Feed Company Type</label> 
									<select class="form-select dairy-form-input"
										id="feedTypeList" name="feedTypeId" disabled="disabled" value="${feedToFarmer.feedCompanyId}">
										<option value="${feedToFarmer.feedTypeId}"  selected="selected" disabled="disabled" >${feedToFarmer.feedTypeName}</option>
										<%-- <c:forEach items="${feedType}" var="feed">
											<option  value="${feed.id}">${feed.type}</option>
										</c:forEach> --%>
									</select>
								</div>

								
								<div class="col-md-6">
									<label class="form-label dairy-input-label required-field">Feed Cost (1 unit)</label>
									<input type="text" class="form-control dairy-form-input" placeholder="Enter Feed Cost pre Unit" id="" name="feedRate"  value="${feedToFarmer.feedRate}"required>
								</div>
								
								<div class="col-md-6">
									<label class="form-label dairy-input-label required-field">Total Quantity</label>
									<input type="text" class="form-control dairy-form-input" placeholder="Enter Total Quantity" id="" name="quantity" value="${feedToFarmer.quantity}" required>
								</div>
								
								<div class="col-md-6">
									<label class="form-label dairy-input-label required-field">Total Amount</label>
									<input type="text" class="form-control dairy-form-input" placeholder="Total Amount" id="" name="totalAmount" value="${feedToFarmer.totalAmount}" required>
								</div>
								<div class="col-md-6">
									<label class="form-label dairy-input-label">Payment Status</label>
									<input type="text" class="form-control dairy-form-input" placeholder="payment status" id="" name="paymentStatus" value="${feedToFarmer.paymentStatus}">
								</div>
								
								<div class="col-12">
									<label class="form-label dairy-input-label">Remark</label>
									<textarea class="col-12 dairy-textarea" rows="4" name="remark" placeholder="Enter Remark Here" " >${feedToFarmer.remark}</textarea> 
								</div>
								
								<div class="col-12">
									<button class="btn btn-primary dairy-form-btn" type="submit">Submit </button>
									
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="../modules/footer.jsp" />