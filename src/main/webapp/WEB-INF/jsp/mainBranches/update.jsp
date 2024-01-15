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
							<div class="card-title">Update Main Branch</div>
						</div>
						<div class="card-body dairy-card-body">
							<form class="row g-3 needs-validation" action="/mainBranchs/update"
								method="post" novalidate>
								
								<div class="col-md-6">
									<label class="form-label dairy-input-label"> Branch Name</label>
									<input type="hidden" class="form-control dairy-form-input"  id="" name="id" value="${mainBranch.id }">
									<input type="text" class="form-control dairy-form-input" placeholder="Enter Branch" id="" name="name"  value="${mainBranch.name }">
								</div>
								
								<div class="col-md-4">
									<label class="form-label dairy-input-label">Date</label> 
									<input type="datetime-local" class="form-control dairy-form-input" id="" name="dateOfCollection"  value="${mainBranch.dateOfCollection }">
								</div>
								
								<div class="col-md-6 offset-md-1 mt-4" > 
								   <div class="row"> 
								     <label class="form-label mb-1">Animal Type</label> 
								          <div class="col-md-4"> 
								             <div class="form-check"> 
								                   
								                   <label class="form-check-label">
								                    <input class="form-check-input" type="radio" name="type" id="animalType"  value="Cow" value="Cow" ${mainBranch.type == 'Cow' ? 'checked' : ''}
                                                     /> Cow
								                   </label> 
								                   
								              </div> 
								             </div> 
								             <div class="col-md-4"> 
								               <div class="form-check"> 
								                   
								                   <label class="form-check-label">
								                    <input class="form-check-input" type="radio" name="type" value="Buffalo"  value="Buffalo" ${mainBranch.type == 'Buffalo' ? 'checked' : ''}
                                                     /> Buffalo
								                     
								                   </label> 
								                   
								                 </div> 
								               </div> 
								         </div> 
								    </div>
								
								<div class="col-md-4 mt-4"> 
								   <div class="row"> 
								     <label class="form-label mb-1">Shift</label> 
								          <div class="col-md-6"> 
								             <div class="form-check"> 
								                   
								                   <label class="form-check-label">
								                   
								                      <input class="form-check-input" type="radio" name="shift" id="milkShift"  value="Morning" ${mainBranch.shift == 'Morning' ? 'checked' : ''}>
 
								                     Morning
								                     </label> 
								                   
								              </div> 
								             </div> 
								             <div class="col-md-6"> 
								               <div class="form-check"> 
								                   
								                   <label class="form-check-label">
								                      <input class="form-check-input" type="radio" name="shift" id="milkShift"  value="Evening" ${mainBranch.shift == 'Evening' ? 'checked' : ''} > 
								                      Evening 
								                   </label> 
								                   
								                 </div> 
								               </div> 
								         </div> 
								    </div>
								
								<div class=""col-md-6"">
									<label class="form-label dairy-input-label">Milk Quantity </label> 
									<input type="text" class="form-control dairy-form-input" placeholder="Enter Quantity in liter" id="" name="quantity"  required value="${mainBranch.quantity }">
								</div>
								
								<div class=""col-md-6"">
									<label class="form-label dairy-input-label">Average Fat </label> 
									<input type="text" class="form-control dairy-form-input" placeholder="Enter Fat" id="" name="fat" required  value="${mainBranch.fat }">
								</div>
								
								<div class=""col-md-6"">
									<label class="form-label dairy-input-label">Average SNF </label> 
									<input type="text" class="form-control dairy-form-input" placeholder="Enter SNF" id="" name="snf" required value="${mainBranch.snf }" >
								</div>
								
								<div class="col-md-6">
									<label class="form-label dairy-input-label">Protein</label>
									<input type="text" class="form-control dairy-form-input" placeholder="Enter protein" id=""   name="protein"  value="${mainBranch.protein }">
								</div>
								
								<div class="col-md-6">
									<label class="form-label dairy-input-label">Milk Rate</label>
									<input type="text" class="form-control dairy-form-input" placeholder="Milk Rate" id=""  name="rate"  value="${mainBranch.rate }">
								</div>
								
								<div class="col-md-6">
									<label class="form-label dairy-input-label">Total Amount</label>
									<input type="text" class="form-control dairy-form-input" placeholder="Enter Total Amount" id="" name="totalAmount"  value="${mainBranch.totalAmount }">
								</div>
				
								<div class="col-md-12">
									<label class="form-label dairy-input-label">Remark</label>
									<textarea class="col-md-12 form-control dairy-textarea" rows="4" name="address" placeholder="Enter Remark Here"></textarea> 
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