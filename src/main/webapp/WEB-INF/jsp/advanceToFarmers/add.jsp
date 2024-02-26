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
							<div class="card-title">Add Advance Amount to Farmers</div>
						</div>
						<div class="card-body dairy-card-body">
							<form class="row g-3 needs-validation" action="/advanceToFarmer"
								method="post" novalidate>
								
								<div class="col-md-6">
									<label class="form-label dairy-input-label">Farmer Name<span class="required-field">*</span></label> 
					
									<select class="form-select dairy-form-input" id=""
										name="farmerId">
										<option value="" selected="selected" disabled="disabled">Select Farmer</option>
										<c:forEach items="${list}" var="farmer">
											<option value="${farmer.id}">${farmer.name}</option>
										</c:forEach>
									</select>
									
								</div>
								
								<div class="col-md-6">
									<label class="form-label dairy-input-label">Date of Advance<span class="required-field">*</span></label> 
									<input type="date" class="form-control dairy-form-input" id="" name="dateOfAdvance"required>
								</div>
								
								<div class="col-md-6">
									<label class="form-label dairy-input-label">Advance Amount<span class="required-field">*</span></label> 
									<input type="text" class="form-control dairy-form-input" placeholder="Enter Advance Amount" id="AdvanceAmount" name="amount" required>
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
	
	
	