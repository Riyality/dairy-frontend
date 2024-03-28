

<jsp:include page="../modules/header.jsp" />

<body>

	<div class="main-content app-content p-4">


		<div class="container-fluid">
			<div class="row">
				<div class="col-10 m-auto">
					<div class="card custom-card">
						<div class="card-header justify-content-between">
							<div class="card-title">${empty messages[114] ? ' Update Equipments' : messages[114]}</div>
							<a href="http://localhost:6161/equipments"><button class="btn btn-primary dairy-form-btn" >${empty messages[79] ? ' Back' : messages[79]}</button></a>
						</div>
						<div class="card-body">
							<form class="row g-3 needs-validation" action="/equipments/update"
								method="post" >
								
								<div class="col-md-6">
									<label class="form-label dairy-input-label required-field">${empty messages[107] ? 'Equipment Name' : messages[107]}</label>
									<input type="hidden" class="form-control dairy-form-input" id="equipmentId" name="id" value="${equipment.id }">
									<input type="text" class="form-control dairy-form-input" placeholder="Enter Equipment Name" id="equipmentName" name="name" value="${equipment.name }">
								</div>
								
								<div class="col-md-6">
									<label class="form-label dairy-input-label required-field">${empty messages[108] ? 'Date Of Purchase' : messages[108]}</label> 
									<input type="datetime-local" class="form-control dairy-form-input" id="equipmentDateOfPurchase" name="dateOfPurchase" value="${equipment.dateOfPurchase }">
								</div>
								
								<div class="col-md-6">
									<label class="form-label dairy-input-label required-field">${empty messages[109] ? 'Quantity' : messages[109]}</label> 
									<input type="text" class="form-control dairy-form-input" placeholder="Enter Quantity"  id="equipmentQuantity" name="quantity"  value="${equipment.quantity }" required>
								</div>
								
								<div class="col-md-6">
									<label class="form-label dairy-input-label required-field">${empty messages[110] ? 'Price Per Unit' : messages[110]}</label> 
									<input type="text" class="form-control dairy-form-input" placeholder="Enters Price per Unit"  id="equipmentPrice" name="price" value="${equipment.price }" required>
								</div>
								
								<div class="col-md-6">
									<label class="form-label dairy-input-label required-field">${empty messages[97] ? 'Total  Amount' : messages[97]}</label> 
									<input type="text" class="form-control dairy-form-input" placeholder="Total Amount"  id="equipmentTotalAmount" name="totalAmount" value="${equipment.totalAmount }" required>
								</div>
								
								<div class="col-12">
									<label class="form-label dairy-input-label">${empty messages[69] ? ' Remark' : messages[69]}</label>
									<textarea class="col-md-12 dairy-textarea" rows="4" name="remark" placeholder="Enter Remark Here">${equipment.remark}</textarea> 
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


