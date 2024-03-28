
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
							<div class="card-title">${empty messages[32] ? 'Add Milk Collection' : messages[32]}</div>
							<div class="ms-auto">
							<button class="btn btn-primary dairy-form-btn" data-bs-toggle="modal" data-bs-target="#previousMilkList">${empty messages[171] ? 'Previous  Milk  Collection' : messages[171]}</button>
							<a href="http://localhost:6161/milkCollection/get-farmer-list-page"><button class="btn btn-primary dairy-form-btn" >${empty messages[79] ? ' Back' : messages[79]}</button></a>
						  </div>
						</div>
						<div class="card-body dairy-card-body">
							<form class="row g-3 needs-validation" action="/milkCollection"
								method="post" >
								
								<div class="col-md-6">
									<label class="form-label dairy-input-label required-field">${empty messages[115] ? '  Farmer ID' : messages[115]}</label>
									<input type="hidden" class="form-control dairy-form-input" id="hiddenFarmerId">
									<input type="text" class="form-control dairy-form-input" placeholder="Enter Farmer Id" name="farmerId" value="${farmerId}" id="farmerId" >
								</div>
								
								<div class="col-md-6">
									<label class="form-label dairy-input-label required-field">${empty messages[116] ? '  Farmer Name' : messages[116]}</label>
									<input type="text" class="form-control dairy-form-input" placeholder="${empty messages[123] ? 'Enter Farmer Name' : messages[123]}" name="farmerName" id="farmerName" value="${farmerName}" >
								</div>
								
								<div class="col-md-4">
									<label class="form-label dairy-input-label required-field">${empty messages[168] ? 'Date OF Milk Collection' : messages[168]}</label> 
									<input type="date" class="form-control dairy-form-input" name="dateOfMilkCollection" id="dateOfMilkCollection" required>
								</div>
								
								<div class="col-md-3 offset-md-1 mt-4" > 
								   <div class="row"> 
								     <label class="form-label mb-1 required-field">${empty messages[86] ? 'Milk Type' : messages[86]}</label> 
								          <div class="col-md-4"> 
								             <div class="form-check"> 
								                   
								                   <label class="form-check-label">
								                      <input class="form-check-input animalType" type="radio" name="animalType" id="" value="cow" checked="checked"> 
													  ${empty messages[87] ? 'Cow' : messages[87]}
								                   </label> 
								                   
								              </div> 
								             </div> 
								             <div class="col-md-4"> 
								               <div class="form-check"> 
								                   
								                   <label class="form-check-label">
								                      <input class="form-check-input animalType" type="radio" name="animalType" id="" value="buffalo"> 
								                      ${empty messages[88] ? 'Buffalo' : messages[88]}  
								                   </label> 
								                   
								                 </div> 
								               </div> 
								         </div> 
								    </div>
								
								<div class="col-md-4 mt-4"> 
								   <div class="row"> 
								     <label class="form-label mb-1 required-field">${empty messages[89] ? 'Shift' : messages[89]}</label> 
								          <div class="col-md-6"> 
								             <div class="form-check"> 
								                   
								                   <label class="form-check-label">
								                      <input class="form-check-input" type="radio" name="milkCollectionShift" id="milkShift_1" checked="" value="morning"> 
								                      ${empty messages[90] ? 'Morning' : messages[90]}   
								                   </label> 
								                   
								              </div> 
								             </div> 
								             <div class="col-md-6"> 
								               <div class="form-check"> 
								                   
								                   <label class="form-check-label">
								                      <input class="form-check-input" type="radio" name="milkCollectionShift" id="milkShift_2" value="evening"> 
													  ${empty messages[91] ? 'Evening' : messages[91]}  
								                   </label> 
								                   
								                 </div> 
								               </div> 
								         </div> 
								    </div>
								
								<div class="col-md-4">
									<label class="form-label dairy-input-label required-field"> ${empty messages[92] ? 'Milk Quantity' : messages[92]}  </label> 
									<input type="text" class="form-control dairy-form-input calculateMilkData" placeholder="${empty messages[92] ? 'Enter Milk Quantity' : messages[92]}" id="milkQuantity" name="milkQuantity" required>
								</div>
								
								<div class="col-md-4">
									<label class="form-label dairy-input-label required-field">Fat </label> 
									<input type="text" class="form-control dairy-form-input calculateMilkData" placeholder=" ${empty messages[169] ? 'Enter Fat' : messages[169]} " id="milkFat" name="milkFat" required>
								</div>
								
								<div class="col-md-4">
									<label class="form-label dairy-input-label required-field">SNF </label> 
									<input type="text" class="form-control dairy-form-input calculateMilkData" placeholder="${empty messages[170] ? 'Enter SNF' : messages[170]}" id="milkSNF" name="milkSNF" required>
								</div>
								
								<div class="col-md-6">
									<label class="form-label dairy-input-label required-field">${empty messages[96] ? 'Milk Rate' : messages[96]}</label>
									<input type="text" class="form-control dairy-form-input" placeholder="${empty messages[102] ? 'Enter  Milk Rate' : messages[102]}" id="milkRate" name="milkRate" required>
								</div>
								
								<div class="col-md-6">
									<label class="form-label dairy-input-label required-field">${empty messages[97] ? 'Total  Amount' : messages[97]}</label>
									<input type="text" class="form-control dairy-form-input" placeholder="${empty messages[103] ? 'Enter  Total  Amount' : messages[103]}" id="totalMilkAmount" name="totalMilkAmount" required>
								</div>
								
								<div class="col-md-12">
									<label class="form-label dairy-input-label">${empty messages[69] ? ' Remark' : messages[69]}</label>
									<textarea class="col-md-12 form-control dairy-textarea" rows="4" name="remark" placeholder="${empty messages[74] ? 'Enter Remark Here' : messages[74]}"></textarea> 
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
	
	<!-- Modal -->
<div class="modal fade modal-lg" id="previousMilkList" data-bs-keyboard="false" tabindex="-1" aria-labelledby="previousMilkListLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h6 class="modal-title" id="staticBackdropLabel">${empty messages[171] ? 'Previous  Milk  Collection' : messages[171]}</h6>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        
        <div class="col-12">
        
		          <div class="row mb-3">
					  <div class="col-md-4">
						<label class="form-label dairy-input-label">${empty messages[172] ? 'View  Milk  From' : messages[172]}</label> 
						<input type="date" class="form-control dairy-form-input" id="" name="startDate">
					  </div>
					</div>
					
		        <div class="table-responsive">
		           
		            <table id="file-export" class="table table-bordered dataTable no-footer dairy-table-border">
		              <thead>
		                <tr class="dairy-table-head">
		                  <th>${empty messages[168] ? 'Date OF Milk Collection' : messages[168]}</th>
		                  <th>${empty messages[89] ? 'Shift' : messages[89]}</th>
		                  <th>FAT</th>
		                  <th>SNF</th>
		                  <th>${empty messages[97] ? 'Total  Amount' : messages[97]}</th>
		                  </tr>
		              </thead>
		              <tbody>
		              
		                <!-- <c:forEach items="${branches}" var="branch">
                          <tr class="gridjs-tr">
                            <td>22/12/2023</td>
                            <td>22.5</td>
                           
                            <td>41.4</td>
                            <td>3.5</td>
                            <td>8.5</td>
                            <td>1567.88</td>
                          </tr>
                        </c:forEach>
		               -->
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