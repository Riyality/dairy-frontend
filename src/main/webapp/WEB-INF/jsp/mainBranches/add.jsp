
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
							<div class="card-title">${empty messages[7] ? 'Add Main Branch' : messages[7]}</div>
						</div>
						<div class="card-body dairy-card-body">
						  <jsp:include page="../successMessage/message.jsp" />
							<form class="row g-3 needs-validation" action="/mainBranchs"
								method="post" >
								
								<div class="col-md-6">
									<label class="form-label dairy-input-label required-field"> ${empty messages[85] ? 'Branch Name' : messages[85]}</label>
									<input type="text" class="form-control dairy-form-input" placeholder="${empty messages[98] ? 'Enter Branch Name' : messages[98]}" id="" name="name"required>
								</div>
								
								<div class="col-md-4">
									<label class="form-label dairy-input-label required-field">${empty messages[106] ? 'Date Of Collection' : messages[106]}</label> 
									<input type="datetime-local" class="form-control dairy-form-input" id="" name="dateOfCollection" required>
								</div>
								
								<div class="col-md-6 offset-md-1 mt-4" > 
								   <div class="row"> 
								     <label class="form-label mb-1 required-field">${empty messages[86] ? 'Milk Type' : messages[86]}</label> 
								          <div class="col-md-4"> 
								             <div class="form-check"> 
								                   
								                   <label class="form-check-label">
								                      <input class="form-check-input" type="radio" name="type" id="animalType" value="Cow" checked> 
								                      ${empty messages[87] ? 'Cow' : messages[87]} 
								                   </label> 
								                   
								              </div> 
								             </div> 
								             <div class="col-md-6"> 
								               <div class="form-check"> 
								                   
								                   <label class="form-check-label">
								                      <input class="form-check-input" type="radio" name="type" value="Buffalo" id="animalType"  > 
								                      ${empty messages[88] ? 'Buffalo' : messages[88]}  
								                   </label> 
								                   
								                 </div> 
								               </div> 
								         </div> 
								    </div>
								
								<div class="col-md-4 mt-4"> 
								   <div class="row"> 
								     <label class="form-label mb-1 required-field">${empty messages[89] ? 'Shift' : messages[89]} </label> 
								          <div class="col-md-6"> 
								             <div class="form-check"> 
								                   
								                   <label class="form-check-label">
								                      <input class="form-check-input" type="radio" name="shift" id="milkShift" value ="Morning" checked > 
								                      ${empty messages[90] ? 'Morning' : messages[90]}  
								                   </label> 
								                   
								              </div> 
								             </div> 
								             <div class="col-md-6"> 
								               <div class="form-check"> 
								                   
								                   <label class="form-check-label">
								                      <input class="form-check-input" type="radio" name="shift" id="milkShift"  value="Evening"> 
													  ${empty messages[91] ? 'Evening' : messages[91]}  
								                   </label> 
								                   
								                 </div> 
								               </div> 
								         </div> 
								    </div>
								
								<div class="col-md-6">
									<label class="form-label dairy-input-label required-field"> ${empty messages[92] ? 'Milk Quantity' : messages[92]}  </label> 
									<input type="text" class="form-control dairy-form-input" placeholder="${empty messages[92] ? 'Enter Milk Quantity' : messages[92]} " id="totalMilkQuantity" name="quantity" required>
								</div>
								
								<div class="col-md-6">
									<label class="form-label dairy-input-label required-field">${empty messages[93] ? 'Average Fat' : messages[93]}  </label> 
									<input type="text" class="form-control dairy-form-input" placeholder="${empty messages[99] ? 'Enter  FAT' : messages[99]}" id="avgFat" name="fat" required>
								</div>
								
								<div class="col-md-6">
									<label class="form-label dairy-input-label required-field">${empty messages[94] ? 'Average SNF' : messages[94]} </label> 
									<input type="text" class="form-control dairy-form-input" placeholder="${empty messages[100] ? 'Enter  SNF' : messages[100]}" id="avgSnf" name="snf" required>
								</div>
								
								<div class="col-md-6">
									<label class="form-label dairy-input-label required-field">${empty messages[95] ? 'Protein' : messages[95]}</label>
									<input type="text" class="form-control dairy-form-input" placeholder="${empty messages[101] ? 'Enter  Protein' : messages[101]}" id="protein" name="protein" required>
								</div>
								
								<div class="col-md-6">
									<label class="form-label dairy-input-label required-field">${empty messages[96] ? 'Milk Rate' : messages[96]}</label>
									<input type="text" class="form-control dairy-form-input" placeholder="${empty messages[102] ? 'Enter  Milk Rate' : messages[102]}" id="RvgRate" name="rate"required>
								</div>
								
								<div class="col-md-6">
									<label class="form-label dairy-input-label required-field">${empty messages[97] ? 'Total  Amount' : messages[97]}</label>
									<input type="text" class="form-control dairy-form-input" placeholder="${empty messages[103] ? 'Enter  Total  Amount' : messages[103]}" id="totalAmountMainBranch" name="totalAmount">
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
	<jsp:include page="../modules/footer.jsp" />