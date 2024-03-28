
<jsp:include page="../modules/header.jsp" />

<body>

	<div class="main-content app-content p-4">


		<div class="container-fluid">
			<div class="row">
				<div class="col-10 m-auto">
					<div class="card custom-card">
						<div class="card-header justify-content-between">
							<div class="card-title">${empty messages[10] ? ' Add Equipment' : messages[10]}</div>
						</div>
						<div class="card-body">
							<form class="row g-3 needs-validation" action="/equipments"
								method="post" >
								
								<div class="col-md-6">
									<label class="form-label dairy-input-label required-field">${empty messages[107] ? 'Equipment Name' : messages[107]}</label>
									<input type="text" class="form-control dairy-form-input" placeholder="${empty messages[111] ? 'Enter Equipment Name' : messages[111]}"  id="equipmentName" name="name" required>
								</div>
								
								<div class="col-md-6">
									<label class="form-label dairy-input-label required-field">${empty messages[108] ? 'Date Of Purchase' : messages[108]}</label> 
									<input type="datetime-local" class="form-control dairy-form-input" id="equipmentDateOfPurchase" name="dateOfPurchase">
								</div>
								
								<div class="col-md-6">
									<label class="form-label dairy-input-label required-field">${empty messages[109] ? 'Quantity' : messages[109]}</label> 
									<input type="text" class="form-control dairy-form-input" placeholder="${empty messages[112] ? 'Enter  Quantity' : messages[112]}"  id="equipmentQuantity" name="quantity" required>
								</div>
								
								<div class="col-md-6">
									<label class="form-label dairy-input-label required-field">${empty messages[110] ? 'Price Per Unit' : messages[110]}</label> 
									<input type="text" class="form-control dairy-form-input" placeholder="${empty messages[113] ? 'Enter  Price Per Unit' : messages[113]}"  id="equipmentPrice" name="price" required>
								</div>
								
								<div class="col-md-6">
									<label class="form-label dairy-input-label required-field">${empty messages[97] ? 'Total  Amount' : messages[97]}</label> 
									<input type="text" class="form-control dairy-form-input" placeholder="${empty messages[103] ? 'Enter  Total  Amount' : messages[103]}"  id="equipmentTotalAmount" name="totalAmount"  required>
								</div>
								
								<div class="col-12">
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
