
<jsp:include page="../modules/header.jsp" />
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<body>

	<div class="main-content app-content p-4">


		<div class="container-fluid">
			<div class="row">
				<div class="col-10 m-auto">
					<div class="card custom-card">
						<div class="card-header justify-content-between">
							<div class="card-title"> ${empty messages[36] ? 'Add Farmer' : messages[36]}</div>
						</div>
						<div class="card-body">
						  <jsp:include page="../successMessage/message.jsp" />
							<form class="row g-3 needs-validation" action="/farmers"
								method="post" >
								
								<div class="col-md-6">
									<label class="form-label dairy-input-label required-field">${empty messages[116] ? '  Farmer Name' : messages[116]}</label>
									<input type="text" class="form-control dairy-form-input" placeholder="${empty messages[181] ? 'Enter Name' : messages[181]}" id="name" name="name">
								</div>
								
								<div class="col-md-6">
									<label class="form-label dairy-input-label required-field">${empty messages[137] ? 'Date Of Joining' : messages[137]}</label> 
									<input type="datetime-local" class="form-control dairy-form-input" id="" name="dateOfRegistration">
								</div>

								<div class="col-md-6">
									<label class="form-label dairy-input-label required-field">${empty messages[178] ? 'Route' : messages[178]}</label>
									 <select class="form-select dairy-form-input" id=""

										name="route">
										<option value="" selected="selected" disabled="disabled">${empty messages[179] ? 'Select Route' : messages[179]}</option>

										<c:forEach items="${routes}" var="route">
											<option value="${route.id}">${route.name}</option>
										</c:forEach>
									</select>
								</div>
								
								<div class="col-md-6">
									<label class="form-label dairy-input-label required-field">${empty messages[180] ? 'Farmer Contact' : messages[180]}</label>
									<div class="input-group has-validation">
										<span class="input-group-text" id="">+91</span>
										<input type="text" class="form-control dairy-form-input" placeholder="${empty messages[72] ? 'Enter Mobile Number' : messages[72]}" id="contactNumber" aria-describedby="inputGroupPrepend" name="contact" required>
									</div>
								</div>
								
								<div class="col-12">
									<label class="form-label dairy-input-label required-field">${empty messages[68] ? ' Address' : messages[68]}</label>
									<textarea class="col-md-12 dairy-textarea" rows="4" name="address" required placeholder="${empty messages[155] ? 'Enter  Address' : messages[155]}"></textarea> 
								</div>
								
								<div class="col-md-6">
									<label class="form-label dairy-input-label">${empty messages[140] ? 'Bank Name' : messages[140]}</label> 
									<input type="text" class="form-control dairy-form-input" placeholder="${empty messages[146] ? 'Enter  Bank Name' : messages[146]}"  id="" name="bankRequestDto.bankName" >
								</div>
								
								<div class="col-md-6">
									<label class="form-label dairy-input-label">${empty messages[64] ? ' Branch Name' : messages[64]}</label> 
									<input type="text" class="form-control dairy-form-input" placeholder="${empty messages[147] ? 'Enter  Branch Name' : messages[147]}"  id="" name="bankRequestDto.branchName" >
								</div>
								
								<div class="col-md-6">
									<label class="form-label dairy-input-label">${empty messages[141] ? 'Account Number' : messages[141]}</label> 
									<input type="text" class="form-control dairy-form-input" placeholder="${empty messages[148] ? 'Enter  Account Number' : messages[148]}"  id="accountNumber" name="bankRequestDto.accountNumber" >
								</div>
								
								<div class="col-md-6">
									<label class="form-label dairy-input-label">${empty messages[142] ? 'IFSC Code' : messages[142]}</label> 
									<input type="text" class="form-control dairy-form-input" placeholder="${empty messages[149] ? 'Enter IFSC Code' : messages[149]}"  id="" name="bankRequestDto.ifscCode" >
								</div>
								
								<div class="col-md-6">
									<label class="form-label dairy-input-label">${empty messages[143] ? 'UPI Code' : messages[143]}</label> 
									<input type="text" class="form-control dairy-form-input" placeholder="${empty messages[150] ? 'Enter UPI Code' : messages[150]}"  id="" name="bankRequestDto.upiId" >
								</div>
								
								<div class="col-md-12">
									<label class="form-label dairy-input-label">${empty messages[69] ? ' Remark' : messages[69]}</label>
									<textarea class="col-md-12 dairy-textarea" rows="4" name="remark" placeholder="${empty messages[74] ? 'Enter Remark Here' : messages[74]}"></textarea> 
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