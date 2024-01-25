
<jsp:include page="../modules/header.jsp" />


<body>

	<div class="main-content app-content p-4">


		<div class="container-fluid">
			<div class="row">
				<div class="col-10 m-auto">
					<div class="card custom-card">
						<div class="card-header justify-content-between">
							<div class="card-title">Add Feed Company</div>
						</div>
						<div class="card-body">
							<form class="row g-3 needs-validation" action="/feedCompanies"
								method="post" novalidate>
								
								<div class="col-md-6">
									<label class="form-label dairy-input-label">Feed Company Name</label>
									<input type="text" class="form-control dairy-form-input" placeholder="Enter Feed Company Name" id="" name="name">
								</div>
								
								<div class="col-12">
									<label class="form-label dairy-input-label">Remark</label>
									<textarea class="col-md-12 dairy-textarea" rows="4" name="address" placeholder="Enter Remark Here"></textarea> 
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