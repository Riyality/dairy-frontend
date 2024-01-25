
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
							<div class="card-title">Add Milk</div>
							<button class="btn btn-primary dairy-form-btn" data-bs-toggle="modal" data-bs-target="#previousMilkList">Check Previous Milk </button>
						</div>
						<div class="card-body dairy-card-body">
							<form class="row g-3 needs-validation" action="/milkCollection"
								method="post" novalidate>
								
								<div class="col-md-6">
									<label class="form-label dairy-input-label">Farmer Id</label>
									<input type="hidden" class="form-control dairy-form-input" id="hiddenFarmerId">
									<input type="text" class="form-control dairy-form-input" placeholder="Enter Farmer Id" name="farmerId" value="${farmerId}" id="farmerId" disabled="disabled">
								</div>
								
								<div class="col-md-6">
									<label class="form-label dairy-input-label">Farmer Name</label>
									<input type="text" class="form-control dairy-form-input" placeholder="Enter  Farmer Name" name="farmerName" id="farmerName" value="${farmerName}" disabled="disabled">
								</div>
								
								<div class="col-md-4">
									<label class="form-label dairy-input-label">Date</label> 
									<input type="date" class="form-control dairy-form-input" name="dateOfMilkCollection" id="dateOfMilkCollection">
								</div>
								
								<div class="col-md-3 offset-md-1 mt-4" > 
								   <div class="row"> 
								     <label class="form-label mb-1">Animal Type</label> 
								          <div class="col-md-4"> 
								             <div class="form-check"> 
								                   
								                   <label class="form-check-label">
								                      <input class="form-check-input animalType" type="radio" name="animalType" id="" value="cow" checked="checked"> 
								                      Cow 
								                   </label> 
								                   
								              </div> 
								             </div> 
								             <div class="col-md-4"> 
								               <div class="form-check"> 
								                   
								                   <label class="form-check-label">
								                      <input class="form-check-input animalType" type="radio" name="animalType" id="" value="buffalo"> 
								                      Buffalo 
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
								                      <input class="form-check-input" type="radio" name="milkCollectionShift" id="milkShift_1" checked="" value="morning"> 
								                      Morning 
								                   </label> 
								                   
								              </div> 
								             </div> 
								             <div class="col-md-6"> 
								               <div class="form-check"> 
								                   
								                   <label class="form-check-label">
								                      <input class="form-check-input" type="radio" name="milkCollectionShift" id="milkShift_2" value="evening"> 
								                      Evening 
								                   </label> 
								                   
								                 </div> 
								               </div> 
								         </div> 
								    </div>
								
								<div class="col-md-4">
									<label class="form-label dairy-input-label">Milk Quantity </label> 
									<input type="text" class="form-control dairy-form-input calculateMilkData" placeholder="Enter Quantity in liter" id="milkQuantity" name="milkQuantity" required>
								</div>
								
								<div class="col-md-4">
									<label class="form-label dairy-input-label">Fat </label> 
									<input type="text" class="form-control dairy-form-input calculateMilkData" placeholder="Enter Fat" id="milkFat" name="milkFat" required>
								</div>
								
								<div class="col-md-4">
									<label class="form-label dairy-input-label">SNF </label> 
									<input type="text" class="form-control dairy-form-input calculateMilkData" placeholder="Enter SNF" id="milkSNF" name="milkSNF" required>
								</div>
								
								<div class="col-md-6">
									<label class="form-label dairy-input-label">Milk Rate</label>
									<input type="text" class="form-control dairy-form-input" placeholder="Milk Rate" id="milkRate" name="milkRate">
								</div>
								
								<div class="col-md-6">
									<label class="form-label dairy-input-label">Total Amount</label>
									<input type="text" class="form-control dairy-form-input" placeholder="Enter Total Amount" id="totalMilkAmount" name="totalMilkAmount">
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
	
	<!-- Modal -->
<div class="modal fade modal-lg" id="previousMilkList" data-bs-keyboard="false" tabindex="-1" aria-labelledby="previousMilkListLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h6 class="modal-title" id="staticBackdropLabel">Previous Milk List</h6>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        
        <div class="col-12">
        
		          <div class="row mb-3">
					  <div class="col-md-4">
						<label class="form-label dairy-input-label">View Milk From</label> 
						<input type="date" class="form-control dairy-form-input" id="" name="startDate">
					  </div>
					</div>
					
		        <div class="table-responsive">
		           
		            <table id="file-export" class="table table-bordered dataTable no-footer dairy-table-border">
		              <thead>
		                <tr class="dairy-table-head">
		                  <th>Date</th>
		                  <th>Morning Shift</th>
		                  <th>Evening Shift</th>
		                  <th>Total Milk</th>
		                  <th>FAT</th>
		                  <th>SNF</th>
		                  <th>Amount</th>
		                  </tr>
		              </thead>
		              <tbody>
		              
		                <c:forEach items="${branches}" var="branch">
                          <tr class="gridjs-tr">
                            <td>22/12/2023</td>
                            <td>22.5</td>
                            <td>18.9</td>
                            <td>41.4</td>
                            <td>3.5</td>
                            <td>8.5</td>
                            <td>1567.88</td>
                          </tr>
                        </c:forEach>
		              
		              </tbody>
		            </table>
		        </div>
        
      </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>
	
	<jsp:include page="../modules/footer.jsp" />