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
							<div class="card-title">${empty messages[104] ? 'Update Main   Branch' : messages[104]}</div>
							 <a href="http://localhost:6161/mainBranchs"><button class="btn btn-primary dairy-form-btn" >${empty messages[79] ? ' Back' : messages[79]}</button></a>
						</div>
						<div class="card-body dairy-card-body">
						  <jsp:include page="../successMessage/message.jsp" />
							<form class="row g-3 needs-validation" action="/mainBranchs/update"
								method="post" novalidate>
								
								<div class="col-md-6">
									<label class="form-label dairy-input-label required-field"> ${empty messages[85] ? 'Branch Name' : messages[85]}</label>
									<input type="hidden" class="form-control dairy-form-input"  id="" name="id" value="${mainBranch.id }">
									<input type="text" class="form-control dairy-form-input" placeholder="Enter Branch" id="" name="name"  value="${mainBranch.name }">
								</div>
								
								<div class="col-md-4">
									<label class="form-label dairy-input-label required-field">${empty messages[106] ? 'Date Of Collection' : messages[106]}</label> 
									<input type="datetime-local" class="form-control dairy-form-input" id="" name="dateOfCollection"  value="${mainBranch.dateOfCollection }">
								</div>
								
								<div class="col-md-6 offset-md-1 mt-4" > 
								   <div class="row"> 
								     <label class="form-label mb-1 required-field">${empty messages[86] ? 'Animal Type' : messages[86]}</label> 
								          <div class="col-md-4"> 
								             <div class="form-check"> 
								                   
								                   <label class="form-check-label">
								                    <input class="form-check-input" type="radio" name="type" id="animalType"  value="Cow" value="Cow" ${mainBranch.type == 'Cow' ? 'checked' : ''}
                                                     /> ${empty messages[87] ? 'Cow' : messages[87]}
								                   </label> 
								                   
								              </div> 
								             </div> 
								             <div class="col-md-4"> 
								               <div class="form-check"> 
								                   
								                   <label class="form-check-label">
								                    <input class="form-check-input" type="radio" name="type" value="Buffalo"  value="Buffalo" ${mainBranch.type == 'Buffalo' ? 'checked' : ''}
                                                     /> ${empty messages[88] ? 'Buffalo' : messages[88]} 
								                     
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
								                   
								                      <input class="form-check-input" type="radio" name="shift" id="milkShift"  value="Morning" ${mainBranch.shift == 'Morning' ? 'checked' : ''}>
 
													  ${empty messages[90] ? 'Morning' : messages[90]} 
								                     </label> 
								                   
								              </div> 
								             </div> 
								             <div class="col-md-6"> 
								               <div class="form-check"> 
								                   
								                   <label class="form-check-label">
								                      <input class="form-check-input" type="radio" name="shift" id="milkShift"  value="Evening" ${mainBranch.shift == 'Evening' ? 'checked' : ''} > 
													  ${empty messages[91] ? 'Evening' : messages[91]}   
								                   </label> 
								                   
								                 </div> 
								               </div> 
								         </div> 
								    </div>
								
								<div class="col-md-6">
									<label class="form-label dairy-input-label required-field">${empty messages[92] ? 'Milk Quantity' : messages[92]} </label> 
									<input type="text" class="form-control dairy-form-input" placeholder="Enter Quantity in liter" id="totalMilkQuantity" name="quantity"  required value="${mainBranch.quantity }">
								</div>
								
								<div class="col-md-6">
									<label class="form-label dairy-input-label required-field">${empty messages[93] ? 'Average Fat' : messages[93]}  </label> 
									<input type="text" class="form-control dairy-form-input" placeholder="Enter Fat" id="avgFat" name="avgFat" required  value="${mainBranch.fat }">
								</div>
								
								<div class="col-md-6">
									<label class="form-label dairy-input-label required-field">${empty messages[94] ? 'Average SNF' : messages[94]}  </label> 
									<input type="text" class="form-control dairy-form-input" placeholder="Enter SNF" id="avgSnf" name="avgSnf" required value="${mainBranch.snf }" >
								</div>
								
								<div class="col-md-6">
									<label class="form-label dairy-input-label required-field">${empty messages[95] ? 'Protein' : messages[95]}</label>
									<input type="text" class="form-control dairy-form-input" placeholder="Enter protein" id="protein"   name="protein"  value="${mainBranch.protein }">
								</div>
								
								<div class="col-md-6">
									<label class="form-label dairy-input-label required-field">${empty messages[96] ? 'Milk Rate' : messages[96]}</label>
									<input type="text" class="form-control dairy-form-input" placeholder="Milk Rate" id="RvgRate"  name="rate"  value="${mainBranch.rate }">
								</div>
								
								<div class="col-md-6">
									<label class="form-label dairy-input-label required-field">${empty messages[97] ? 'Total  Amount' : messages[97]}</label>
									<input type="text" class="form-control dairy-form-input" placeholder="Enter Total Amount" id="totalAmountMainBranch" name="totalAmount"  value="${mainBranch.totalAmount }">
								</div>
				
								<div class="col-md-12">
									<label class="form-label dairy-input-label">${empty messages[69] ? ' Remark' : messages[69]}</label>
									<textarea class="col-md-12 form-control dairy-textarea" rows="4" name="reamrk" placeholder="${empty messages[74] ? 'Enter Remark Here' : messages[74]}"> ${mainBranch.remark}</textarea> 
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
	