
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
						</div>
						<div class="card-body dairy-card-body">
							<form class="row g-3 needs-validation" action="/feedToFarmer/update" method="post" novalidate>
								
								<input type="hidden"  class="form-control dairy-form-input"  name="id" value="${feedToFarmer.id}" >
								
								<div class="col-md-6">
									<label class="form-label dairy-input-label">Farmer Name</label>
								<select class="form-select dairy-form-input" id=""
										name="farmerId" value="${feedToFarmer.farmerId}">
										<c:forEach items="${Farmers}" var="farmer">
											<option  selected="selected" value="${farmer.id}">${farmer.name}</option>
										</c:forEach>
									</select>
								</div>
								
								<div class="col-md-6">
									<label class="form-label dairy-input-label">Date of distributions</label> 
									<input type="datetime-local" class="form-control dairy-form-input" id="" name="dateOfPurchase"  value="${feedToFarmer.dateOfPurchase}">
								</div>

								<div class="col-md-6">
									<label class="form-label dairy-input-label">Feed Company</label> 
									 <select  class="form-select dairy-form-input"
										id="" name="feedCompanyId"  value="${feedToFarmer.feedCompanyId}">
										<c:forEach items="${feedCompany}" var="fc">
											<option selected="selected"value="${fc.id}">${fc.name}</option>
										</c:forEach>
									</select>
								</div>

								<div class="col-md-6">
									<label class="form-label dairy-input-label">Feed Company Type</label> 
									<select class="form-select dairy-form-input"
										id="" name="feedTypeId"  value="${feedToFarmer.feedTypeId}">
										<c:forEach items="${feedType}" var="feed">
											<option selected="selected" value="${feed.id}">${feed.type}</option>
										</c:forEach>
									</select>
								</div>
								
								<div class="col-md-6">
									<label class="form-label dairy-input-label">Feed Cost (1 unit)</label>
									<input type="text" class="form-control dairy-form-input" placeholder="Enter Feed Cost pre Unit" id="" name="feedRate"  value="${feedToFarmer.feedRate}">
								</div>
								
								<div class="col-md-6">
									<label class="form-label dairy-input-label">Total Quantity</label>
									<input type="text" class="form-control dairy-form-input" placeholder="Enter Total Quantity" id="" name="quantity" value="${feedToFarmer.quantity}">
								</div>
								
								<div class="col-md-6">
									<label class="form-label dairy-input-label">Total Amount</label>
									<input type="text" class="form-control dairy-form-input" placeholder="Total Amount" id="" name="totalAmount" value="${feedToFarmer.totalAmount}">
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