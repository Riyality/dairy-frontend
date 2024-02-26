
<jsp:include page="../modules/header.jsp" />
<style>
.spti-textarea-height {
	height: 100px;
	outline: none;
	border: 1px solid lightgray;
	border-radius: 4px;
	padding: 0px !important;
	font-size: 13px;
	padding: 3px;
}
</style>
<body>

	<div class="main-content app-content">


		<div class="container-fluid">
			<div class="row">
				<div class="col">
					<div class="card custom-card">
						<div class="card-header justify-content-between">
							<div class="card-title">Update Branch</div>
						</div>
						<div class="card-body">
							<form class="row g-3 needs-validation" action="/branches/update"
								method="post" >
								<div class="col-md-12">
									<label for="validationCustom01" class="form-label required-field">Name</label>
									<input type="hidden" name="id" class="col-md-12 spti-inpt" value="${branch.id }"> <input type="text" class="form-control" id="validationCustom01" name="name" value="${branch.name }" required>
									<div class="valid-feedback">Looks good!</div>
								</div>
								<div class="col-md-6">
									<label for="validationCustom02" class="form-label required-field">Owner Name</label> 
									<input type="text" class="form-control" id="validationCustom02" name="owner" value="${branch.owner }" required> 
									<div class="valid-feedback">Looks good!</div>
								</div>
								<div class="col-md-6">
									<label for="validationCustomUsername" class="form-label required-field">Owner Contact</label>
									<div class="input-group has-validation">
										<span class="input-group-text" id="inputGroupPrepend">+91</span>
										<input type="text" class="form-control" id="contactNumber" value="${branch.ownerContact }" name="ownerContact" required>
										<div class="invalid-feedback">Please choose a username.
										</div>
									</div>
								</div>
								<div class="col-md-12">
									<label for="validationCustom03" class="form-label required-field">Start Date</label>
									 <input type="datetime-local" class="form-control id="validationCustom03" required name="startDate" value="${branch.startDate }">
									<div class="invalid-feedback" >Please provide a valid city.
									</div>
								</div>
								<div class="col-md-12">
									<label for="validationCustom05" class="form-label">Address</label>
									<textarea class="col-md-12 spti-textarea-height" name="address" placeholder="eg.Hadpsar, pune">${branch.address }</textarea>
									<div class="invalid-feedback">Please provide a valid zip.
									</div>
								</div>
								<div class="col-md-12">
									<label class="form-label dairy-input-label">Remark</label>
									<textarea class="col-md-12 dairy-textarea" rows="4" name="remark" placeholder="Enter Remark Here">${branch.remark}</textarea> 
								</div>
								<div class="col-12">
									<button class="btn btn-primary" type="submit">Submit form</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="../modules/footer.jsp" />