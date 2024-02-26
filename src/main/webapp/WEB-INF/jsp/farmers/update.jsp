<jsp:include page="../modules/header.jsp" />
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<body>

	<div class="main-content app-content p-4">


		<div class="container-fluid">
			<div class="row">
				<div class="col-10 m-auto">
					<div class="card custom-card">
						<div class="card-header justify-content-between">
							<div class="card-title">Update Farmer</div>
						</div>
						<div class="card-body">
							<form class="row g-3 needs-validation" action="/farmers/update"
								method="post" >
								
								<div class="col-md-6">
									<label class="form-label dairy-input-label required-field">Name</label>
									<input type="hidden" class="form-control dairy-form-input"  id="" name="id" value="${farmer.id}">
									<input type="text" class="form-control dairy-form-input" placeholder="Enter Name" id="name" name="name" value="${farmer.name}"required>
								</div>
								
								<div class="col-md-6">
									<label class="form-label dairy-input-label required-field">Date of Joining</label> 
									<input type="datetime-local" class="form-control dairy-form-input" id="" name="dateOfRegistration" value="${farmer.dateOfRegistration}"required>
								</div>

								<div class="col-md-6">
									<label class="form-label dairy-input-label required-field">Route</label>
									 <select class="form-select dairy-form-input" id=""
										name="route" value="${farmer.route}">
										<option  selected="selected" value="${farmer.route.id}">${farmer.route.name}</option>
										<c:forEach items="${routes}" var="route">
											<option  value="${route.id}">${route.name}</option>
										</c:forEach>
									</select>
								</div>
								
								<div class="col-md-6">
									<label class="form-label dairy-input-label required-field">Farmer Contact</label>
									<div class="input-group has-validation">
										<span class="input-group-text" id="">+91</span>
										<input type="text" class="form-control dairy-form-input" placeholder="Enter Mobile No." id="contactNumber" aria-describedby="inputGroupPrepend" name="contact" value="${farmer.contact}"  required>
									</div>
								</div>
								
								<div class="col-md-6">
									<label class="form-label dairy-input-label">Farmer Status</label> 
									<select class="form-select dairy-form-input" name="status" id="">
										<option value="active">Active</option>
										<option value="inactive">In-Active</option>  
									</select>
								</div>
								
								<div class="col-12">
									<label class="form-label dairy-input-label required-field">Address</label>
									<textarea class="col-md-12 dairy-textarea" rows="4" name="address"  required placeholder="Enter Address Here">${farmer.address}</textarea> 
								</div>
								
								<div class="col-md-6">
									<label class="form-label dairy-input-label">Bank Name</label> 
									<input type="hidden" class="form-control dairy-form-input"  id="" name="bankRequestDto.id" value="${farmer.bank.id}">						
									<input type="text" class="form-control dairy-form-input" placeholder="Enter Bank Name"  id="" name="bankRequestDto.bankName" value="${farmer.bank.bankName}">
								</div>
								
								<div class="col-md-6">
									<label class="form-label dairy-input-label">Branch Name</label> 
									<input type="text" class="form-control dairy-form-input" placeholder="Enter Branch Name"  id="" name="bankRequestDto.branchName" value="${farmer.bank.branchName}" >
								</div>
								
								<div class="col-md-6">
									<label class="form-label dairy-input-label">Account Number</label> 
									<input type="text" class="form-control dairy-form-input" placeholder="Enter Account Number"  id="accountNumber" name="bankRequestDto.accountNumber"value="${farmer.bank.accountNumber}" >
								</div>
								
								<div class="col-md-6">
									<label class="form-label dairy-input-label">IFSC Code</label> 
									<input type="text" class="form-control dairy-form-input" placeholder="Enter IFSC Code"  id="" name="bankRequestDto.ifscCode" value="${farmer.bank.ifscCode}" >
								</div>
								
								<div class="col-md-6">
									<label class="form-label dairy-input-label">UPI Code</label> 
									<input type="text" class="form-control dairy-form-input" placeholder="Enter UPI Code"  id="" name="bankRequestDto.upiId" value="${farmer.bank.upiId}" >
								</div>
								
								<div class="col-md-12">
									<label class="form-label dairy-input-label">Remark</label>
									<textarea class="col-md-12 dairy-textarea" rows="4" name="remark" placeholder="Enter Remark Here">${farmer.remark}</textarea> 
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