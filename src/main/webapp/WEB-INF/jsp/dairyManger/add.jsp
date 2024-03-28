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
							<div class="card-title">${empty messages[238] ? 'Add New Entry ' : messages[238]}</div>
						</div>
						<div class="card-body dairy-card-body">
							<form class="row g-3 needs-validation" action="/dairyManger"
								method="post" >
								
								<div class="col-md-6">
									<label class="form-label dairy-input-label required-field">  ${empty messages[239] ? 'Name' : messages[239]}</label>
									<input type="text" class="form-control dairy-form-input" placeholder="${empty messages[242] ? 'Enter Name' : messages[242]}" id="name" name="name">
								</div>
								
								<div class="col-md-6">
									<label class="form-label dairy-input-label required-field">${empty messages[240] ? 'Date' : messages[240]}</label> 
									<input type="datetime-local" class="form-control dairy-form-input" id="" name="dateTransaction">
								</div>
								
								<div class="col-md-6">
									<label class="form-label dairy-input-label required-field">${empty messages[66] ? 'Contact' : messages[66]}</label> 
									<div class="input-group has-validation">
								   <span class="input-group-text" id="">+91</span>
									<input type="text" class="form-control dairy-form-input" placeholder="${empty messages[72] ? 'Enter Contact' : messages[72]}.." id="contactNumber" name="contact" required>
								  </div>
								</div>
								
								<div class="col-md-6">
									<label class="form-label dairy-input-label">${empty messages[241] ? 'Person Id' : messages[241]}</label> 
									<input type="text" class="form-control dairy-form-input" placeholder="${empty messages[241] ? 'Person Id' : messages[241]}" id="" name="personId" required>
								</div>
								
								<div class="col-md-6 offset-md-1" > 
								   <div class="row"> 
								     <label class="form-label mb-1 required-field">${empty messages[248] ? 'Transaction Type' : messages[248]} </label> 
								          <div class="col-md-4"> 
								             <div class="form-check"> 
								                   
								                   <label class="form-check-label">
								                      <input class="form-check-input" type="radio" name="transactionType" id="transactionType" value="Credit" checked> 
								                      ${empty messages[245] ? 'Credit' : messages[245]} 
								                   </label> 
								                   
								              </div> 
								             </div> 
								             <div class="col-md-4"> 
								               <div class="form-check"> 
								                   
								                   <label class="form-check-label">
								                      <input class="form-check-input" type="radio" name="transactionType" value="Debit" id="transactionType"  > 
													  ${empty messages[246] ? 'Debit' : messages[246]}  
								                   </label> 
								                   
								                 </div> 
								               </div> 
								         </div> 
								    </div>
								    
								    <div class="col-md-6">
									<label class="form-label dairy-input-label required-field">${empty messages[244] ? 'Amount' : messages[244]} </label> 
									<input type="text" class="form-control dairy-form-input" placeholder="${empty messages[243] ? 'Enter  Amount' : messages[243]} " id="DairyMangementAmount" name="amount" required>
								</div>
								
								<div class="col-md-12">
									<label class="form-label dairy-input-label">${empty messages[69] ? ' Remark' : messages[69]}</label>
									<textarea class="col-md-12 form-control dairy-textarea" rows="4" name="remark" placeholder="${empty messages[74] ? 'Enter Remark' : messages[74]}"></textarea> 
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