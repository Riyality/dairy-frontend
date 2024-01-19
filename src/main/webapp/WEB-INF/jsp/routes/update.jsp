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
							<div class="card-title">Update Route</div>
						</div>
						<div class="card-body dairy-card-body">
							<form class="row g-3 needs-validation" action="/routes/update"
								method="post" novalidate>
								
								<div class="col-md-6">
									<label class="form-label dairy-input-label">Route Name</label>
									<input type="hidden" class="form-control dairy-form-input"  id="" name="id" value="${route.id }">
									<input type="text" class="form-control dairy-form-input" placeholder="Enter Route Name" id="" name="name" value="${route.name}">
								</div>
								
								<div class="col-12">
									<label class="form-label dairy-input-label">Remark</label>
									<textarea class="col-12 dairy-textarea" rows="4" name="remark" placeholder="Enter Remark Here" >${route.remark}"</textarea> 
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