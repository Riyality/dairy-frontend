
<jsp:include page="../modules/header.jsp" />
<style>

</style>
<body>

	<div class="main-content app-content p-4">

		<div class="container-fluid">
			<div class="row">
				<div class="col-12 col-md-10 m-auto mt-5 mt-md-0">
					<div class="card custom-card">
						<div class="card-header justify-content-between dairy-card-header">
							<div class="card-title">Add Main Branch</div>
						</div>
						<div class="card-body dairy-card-body">
							<form class="row g-3 needs-validation" action="/mainBranchs"
								method="post" novalidate>
								
								<div class="col-md-6">
									<label class="form-label dairy-input-label required-field"> Branch Name</label>
									<input type="text" class="form-control dairy-form-input" placeholder="Enter Branch" id="" name="name"required>
								</div>
								
								<div class="col-md-4">
									<label class="form-label dairy-input-label required-field">Date</label> 
									<input type="datetime-local" class="form-control dairy-form-input" id="" name="dateOfCollection" required>
								</div>
								
								<div class="col-md-6 offset-md-1 mt-4" > 
								   <div class="row"> 
								     <label class="form-label mb-1 required-field">Animal Type</label> 
								          <div class="col-md-4"> 
								             <div class="form-check"> 
								                   
								                   <label class="form-check-label">
								                      <input class="form-check-input" type="radio" name="type" id="animalType" value="Cow" checked> 
								                      Cow 
								                   </label> 
								                   
								              </div> 
								             </div> 
								             <div class="col-md-6"> 
								               <div class="form-check"> 
								                   
								                   <label class="form-check-label">
								                      <input class="form-check-input" type="radio" name="type" value="Buffalo" id="animalType"  > 
								                      Buffalo 
								                   </label> 
								                   
								                 </div> 
								               </div> 
								         </div> 
								    </div>
								
								<div class="col-md-4 mt-4"> 
								   <div class="row"> 
								     <label class="form-label mb-1 required-field">Shift</label> 
								          <div class="col-md-6"> 
								             <div class="form-check"> 
								                   
								                   <label class="form-check-label">
								                      <input class="form-check-input" type="radio" name="shift" id="milkShift" value ="Morning" checked > 
								                      Morning 
								                   </label> 
								                   
								              </div> 
								             </div> 
								             <div class="col-md-6"> 
								               <div class="form-check"> 
								                   
								                   <label class="form-check-label">
								                      <input class="form-check-input" type="radio" name="shift" id="milkShift"  value="Evening"> 
								                      Evening 
								                   </label> 
								                   
								                 </div> 
								               </div> 
								         </div> 
								    </div>
								
								<div class="col-md-6">
									<label class="form-label dairy-input-label required-field">Milk Quantity </label> 
									<input type="text" class="form-control dairy-form-input" placeholder="Enter Quantity in liter" id="totalMilkQuantity" name="quantity" required>
								</div>
								
								<div class="col-md-6">
									<label class="form-label dairy-input-label required-field">Average Fat </label> 
									<input type="text" class="form-control dairy-form-input" placeholder="Enter Fat" id="avgFat" name="fat" required>
								</div>
								
								<div class="col-md-6">
									<label class="form-label dairy-input-label required-field">Average SNF </label> 
									<input type="text" class="form-control dairy-form-input" placeholder="Enter SNF" id="avgSnf" name="snf" required>
								</div>
								
								<div class="col-md-6">
									<label class="form-label dairy-input-label required-field">Protein</label>
									<input type="text" class="form-control dairy-form-input" placeholder="Enter protein" id="protein" name="protein" required>
								</div>
								
								<div class="col-md-6">
									<label class="form-label dairy-input-label required-field">Milk Rate</label>
									<input type="text" class="form-control dairy-form-input" placeholder="Milk Rate" id="RvgRate" name="rate"required>
								</div>
								
								<div class="col-md-6">
									<label class="form-label dairy-input-label required-field">Total Amount</label>
									<input type="text" class="form-control dairy-form-input" placeholder="Enter Total Amount" id="totalAmountMainBranch" name="totalAmount">
								</div>
				
								<div class="col-md-12">
									<label class="form-label dairy-input-label">Remark</label>
									<textarea class="col-md-12 form-control dairy-textarea" rows="4" name="remark" placeholder="Enter Remark Here"></textarea> 
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