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
							<div class="card-title">Update Advance Amount to Farmers</div>
						</div>
						<div class="card-body dairy-card-body">
							<form class="row g-3 needs-validation" action="/advanceToFarmer/update"
								method="post" novalidate>
								
								<input type="hidden" class="form-control dairy-form-input"  id="id" name="id" value="${advance.id }">
								
								<div class="col-md-6">
									<label class="form-label dairy-input-label">Farmer Name</label> 
					
									<select class="form-select dairy-form-input" id="" name="farmerId" value="${advance.farmerId }">
									<option  selected="selected" value="${advance.farmerId}">${advance.farmerName}</option>
										<c:forEach items="${list}" var="farmer">
											<option   value="${farmer.id}">${farmer.name}</option>
										</c:forEach>
									</select>
									
								</div>
								
								<div class="col-md-6">
									<label class="form-label dairy-input-label">Date of Advance</label> 
									<input type="date" class="form-control dairy-form-input" id="" name="dateOfAdvance" value="${advance.dateOfAdvance }">
								</div>
								
								<div class="col-md-6">
									<label class="form-label dairy-input-label">Advance Amount</label> 
									<input type="text" class="form-control dairy-form-input" placeholder="Enter Advance Amount" id="AdvanceAmount" name="amount" value="${advance.amount }" required>
								</div>
								
								<div class="col-md-6">
									<label class="form-label dairy-input-label"> Deduction </label> 
									<input type="text" class="form-control dairy-form-input" placeholder="Enter Advance Amount" id="deduction" name="deduction" value="${advance.deduction }" required>
								</div>
								<div class="col-md-6">
									<label class="form-label dairy-input-label">Remaining Amount</label> 
									<input type="text" class="form-control dairy-form-input" placeholder="Enter Advance Amount" id="remeninigAmount" name="remainingAmount" value="${advance.remainingAmount }" required>
								</div>
								<div class="col-12">
									<label class="form-label dairy-input-label">Remark</label>
									<textarea class="col-md-12 dairy-textarea" rows="4" name="remark" placeholder="Enter Remark Here"></textarea> 
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
	
	
