
<jsp:include page="../modules/header.jsp" />


<body>

	<div class="main-content app-content p-4">


		<div class="container-fluid">
			<div class="row">
				<div class="col-10 m-auto">
					<div class="card custom-card">
						<div class="card-header justify-content-between">
							<div class="card-title">Add Feed Type</div>
						</div>
						<div class="card-body">
							<form class="row g-3 needs-validation" action="/branches"
								method="post" novalidate>

								<div class="col-md-6">
									<label class="form-label dairy-input-label">Feed Company Name</label> 
									<select class="form-select dairy-form-input" name="" id="">
										<option value="" selected="selected" disabled="disabled">Select Feed Company</option>
										<option value="1">Hindusthan</option> 
									</select>
								</div>

								<div class="col-md-6">
									<label class="form-label dairy-input-label">Feed Feed Type Name</label> 
										<input type="text" class="form-control dairy-form-input"
										placeholder="Enter Feed Type Name" id="" name="name">
								</div>

								<div class="col-12">
									<label class="form-label dairy-input-label">Remark</label>
									<textarea class="col-md-12 dairy-textarea" rows="4"
										name="address" placeholder="Enter Remark Here"></textarea>
								</div>
								<div class="col-12">
									<button class="btn btn-primary dairy-form-btn" type="submit">Submit
									</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="../modules/footer.jsp" />