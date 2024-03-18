
<jsp:include page="../modules/header.jsp" />

<body>

	<div class="main-content app-content p-4">


		<div class="container-fluid">
			<div class="row">
				<div class="col-10 m-auto">
					<div class="card custom-card">
						<div class="card-header justify-content-between">
							<div class="card-title">Add Equipment</div>
						</div>
						<div class="card-body">
						  <jsp:include page="../successMessage/message.jsp" />
							<form class="row g-3 needs-validation" action="/equipments"
								method="post" >
								
								<div class="col-md-6">
									<label class="form-label dairy-input-label required-field">Equipment Name</label>
									<input type="text" class="form-control dairy-form-input" placeholder="Enter Equipment Name"  id="equipmentName" name="name" required>
								</div>
								
								<div class="col-md-6">
									<label class="form-label dairy-input-label required-field">Date of Purchase</label> 
									<input type="datetime-local" class="form-control dairy-form-input" id="equipmentDateOfPurchase" name="dateOfPurchase">
								</div>
								
								<div class="col-md-6">
									<label class="form-label dairy-input-label required-field">Quantity</label> 
									<input type="text" class="form-control dairy-form-input" placeholder="Enter Quantity"  id="equipmentQuantity" name="quantity" required>
								</div>
								
								<div class="col-md-6">
									<label class="form-label dairy-input-label required-field">Price</label> 
									<input type="text" class="form-control dairy-form-input" placeholder="Enter Price per Unit"  id="equipmentPrice" name="price" required>
								</div>
								
								<div class="col-md-6">
									<label class="form-label dairy-input-label required-field">Total Amount</label> 
									<input type="text" class="form-control dairy-form-input" placeholder="Total Amount"  id="equipmentTotalAmount" name="totalAmount"  required>
								</div>
								
								<div class="col-12">
									<label class="form-label dairy-input-label">Remark</label>
									<textarea class="col-md-12 dairy-textarea" rows="4" name="remark" placeholder="Enter Remark Here"></textarea> 
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
