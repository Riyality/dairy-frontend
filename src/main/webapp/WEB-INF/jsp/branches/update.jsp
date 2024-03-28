	
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
							<div class="card-title">${empty messages[77] ? ' Update Branch' : messages[77]}</div>
							<a href="http://localhost:6161/branches"><button class="btn btn-primary dairy-form-btn" >${empty messages[79] ? ' Back' : messages[79]} </button></a>
						</div>
						<div class="card-body dairy-card-body">
						  <jsp:include page="../successMessage/message.jsp" />
							<form class="row g-3 needs-validation" action="/branches/update"
								method="post" >
								
								<div class="col-md-6">
									<label class="form-label dairy-input-label required-field">${empty messages[64] ? ' Name' : messages[64]}</label>
									<input type="hidden" name="id" class="form-control dairy-form-input" value="${branch.id }"> 
									<input type="text"  class="form-control dairy-form-input"  name="name" value="${branch.name }" required>
								</div>
								
								<div class="col-md-6">
									<label class="form-label dairy-input-label required-field">${empty messages[65] ? ' Owner Name' : messages[65]}</label>
									<input type="text" class="form-control dairy-form-input"  id="name"  value="${branch.owner }" name="owner" required>
								</div>
								
								<div class="col-md-6">
									<label class="form-label dairy-input-label required-field">${empty messages[66] ? ' Owner Contact' : messages[66]}</label>
									<div class="input-group has-validation">
										<span class="input-group-text" id="">+91</span>
										<input type="text" class="form-control dairy-form-input" id="contactNumber" aria-describedby="inputGroupPrepend"  value="${branch.ownerContact }" name="ownerContact" required>
									</div>
								</div>
								
								<div class="col-md-6">
									<label class="form-label dairy-input-label required-field">${empty messages[67] ? ' Start Date' : messages[67]}</label> 
									<input type="datetime-local" class="form-control dairy-form-input" id="" value="${branch.startDate }" name="startDate" required>
								</div>
								<div class="col-md-6">
									<label class="form-label dairy-input-label">${empty messages[68] ? ' Address' : messages[68]}</label>
									<textarea class="col-md-12 dairy-textarea" name="address" >${branch.address}</textarea> 
								</div>
								<div class="col-md-12">
									<label class="form-label dairy-input-label">${empty messages[69] ? ' Remark' : messages[69]}</label>
									<textarea class="col-md-12 dairy-textarea" rows="4" name="remark" >${branch.remark}</textarea> 
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
	</body>
	<jsp:include page="../modules/footer.jsp" />
	