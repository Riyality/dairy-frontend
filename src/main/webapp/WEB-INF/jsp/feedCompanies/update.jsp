<jsp:include page="../modules/header.jsp" />


<body>

	<div class="main-content app-content p-4">


		<div class="container-fluid">
			<div class="row">
				<div class="col-10 m-auto">
					<div class="card custom-card">
						<div class="card-header justify-content-between">
							<div class="card-title">Update Feed Company</div>
							 <a href="http://localhost:6161/feedCompanies"><button class="btn btn-primary dairy-form-btn" >Back</button></a>
						</div>
						<div class="card-body">
							<form class="row g-3 needs-validation" action="/feedCompanies/update"
								method="post" >
								
								<div class="col-md-6">
									<label class="form-label dairy-input-label required-field">Feed Company Name</label>
									<input type="hidden" class="form-control dairy-form-input"  id="" name="id" value="${feedCompany.id }">
									<input type="text" class="form-control dairy-form-input" placeholder="Enter Feed Company Name" id="" name="name" value="${feedCompany. name}" required>
								</div>
								
								<div class="col-12">
									<label class="form-label dairy-input-label">Remark</label>
									<textarea class="col-md-12 dairy-textarea" rows="4" name="remark" placeholder="Enter Remark Here" >${feedCompany.remark}</textarea> 
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