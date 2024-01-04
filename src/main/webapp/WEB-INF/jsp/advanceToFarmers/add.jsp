
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
							<form class="row g-3 needs-validation" action="/branches"
								method="post" novalidate>
								
								<div class="col-md-6">
									<label class="form-label dairy-input-label">Farmer Id</label>
									<input type="text" class="form-control dairy-form-input" placeholder="Enter Farmer Id" id="" name="name">
								</div>
								
								<div class="col-md-6">
									<label class="form-label dairy-input-label">Farmer Name</label> 
									<input type="text" class="form-control dairy-form-input" placeholder="Enter Farmer Name" id="" name="owner" required>
								</div>
								
								<div class="col-md-6">
									<label class="form-label dairy-input-label">Date</label> 
									<input type="date" class="form-control dairy-form-input" id="" name="startDate">
								</div>
								
								<div class="col-md-6">
									<label class="form-label dairy-input-label">Advance Amount</label> 
									<input type="text" class="form-control dairy-form-input" placeholder="Enter Advance Amount" id="" name="owner" required>
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
	
	
	