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
							<div class="card-title">${empty messages[158] ? 'Update Supplier' : messages[158]}</div>
							<a href="http://localhost:6161/suppliers"><button class="btn btn-primary dairy-form-btn" >${empty messages[79] ? ' Back' : messages[79]}</button></a>
						</div>
						<div class="card-body dairy-card-body">
						 <jsp:include page="../successMessage/message.jsp" />
							<form class="row g-3 needs-validation" action="/suppliers/update"
								method="post" >
								
								<div class="col-md-6">
									<label class="form-label dairy-input-label required-field">${empty messages[154] ? 'Supplier Name' : messages[154]}</label>
									<input type="hidden" class="form-control dairy-form-input"  id="" name="id" value="${suppliers.id }">
									<input type="text" class="form-control dairy-form-input" placeholder="Enter Supplier Name" id="name" name="name" value="${suppliers.name}"required>
								</div>
								
								<div class="col-md-6">
									<label class="form-label dairy-input-label required-field">${empty messages[66] ? ' Contact' : messages[66]}</label>
									<div class="input-group has-validation">
										<span class="input-group-text" id="">+91</span>
										<input type="text" class="form-control dairy-form-input" placeholder="${empty messages[72] ? 'Enter Mobile Number' : messages[72]}." id="contactNumber" aria-describedby="inputGroupPrepend" name="contact" value="${suppliers.contact}" required>
									</div>
								</div>
								
								<div class="col-md-6">
									<label class="form-label dairy-input-label required-field">${empty messages[137] ? 'Date Of Joining' : messages[137]}</label> 
									<input type="datetime-local" class="form-control dairy-form-input" id="" name="dateOfRegistration" value="${suppliers.dateOfRegistration}"required>
								</div>
								
								<div class="col-md-6">
									<label class="form-label dairy-input-label">${empty messages[140] ? 'Bank Name' : messages[140]}</label>
									<input type="hidden" class="form-control dairy-form-input" id="" name="bankRequestDto.id" value="${suppliers.id}">
									<input type="text" class="form-control dairy-form-input" placeholder="${empty messages[146] ? 'Enter  Bank Name' : messages[146]}" id="" name="bankRequestDto.bankName" value="${suppliers.bankName}">
								</div>
								
								<div class="col-md-6">
									<label class="form-label dairy-input-label">${empty messages[64] ? ' Branch Name' : messages[64]}</label>
									<input type="text" class="form-control dairy-form-input" placeholder="${empty messages[147] ? 'Enter  Branch Name' : messages[147]}" id="" name="bankRequestDto.branchName" value="${suppliers.bankBranchName}">
								</div>
								
								<div class="col-md-6">
									<label class="form-label dairy-input-label">${empty messages[141] ? 'Account Number' : messages[141]}</label>
									<input type="text" class="form-control dairy-form-input" placeholder="${empty messages[148] ? 'Enter  Account Number' : messages[148]}" id="accountNumber" name="bankRequestDto.accountNumber" value="${suppliers.accountNumber}">
								</div>
								
								<div class="col-md-6">
									<label class="form-label dairy-input-label">${empty messages[142] ? 'IFSC Code' : messages[142]}</label>
									<input type="text" class="form-control dairy-form-input" placeholder="${empty messages[149] ? 'Enter IFSC Code' : messages[149]}" id="" name="bankRequestDto.ifscCode" value="${suppliers.ifscCode}">
								</div>
								
								<div class="col-md-6">
									<label class="form-label dairy-input-label">${empty messages[143] ? 'UPI Code' : messages[143]}</label>
									<input type="text" class="form-control dairy-form-input" placeholder="${empty messages[150] ? 'Enter UPI Code' : messages[150]}" id="" name="bankRequestDto.upiId" value="${suppliers.upiId}">
								</div>
								<div class="col-12">
									<label class="form-label dairy-input-label required-field">${empty messages[68] ? ' Address' : messages[68]}</label>
									<textarea class="col-12 dairy-textarea" rows="4" name="address" placeholder="${empty messages[155] ? 'Enter  Address' : messages[155]}" required>${suppliers.address}</textarea> 
								</div>
								<div class="col-md-12">
									<label class="form-label dairy-input-label">${empty messages[69] ? ' Remark' : messages[69]}</label>
									<textarea class="col-md-12 dairy-textarea" rows="4" name="remark" placeholder="${empty messages[74] ? 'Enter Remark Here' : messages[74]}">${suppliers.remark}</textarea> 
								</div>
								
								<div class="col-12">
									<button class="btn btn-primary dairy-form-btn" type="submit">${empty messages[78] ? ' submit' : messages[78]} </button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="../modules/footer.jsp" />