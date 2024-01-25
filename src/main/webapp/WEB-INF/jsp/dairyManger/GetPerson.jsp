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
							<div class="card-title">Get Dairy Manger</div>
						</div>
						<div class="card-body dairy-card-body">
							<form class="row g-3 needs-validation" action="/dairyManger/dairyUpdates"
								method="post" novalidate>
								
								<div class="col-md-6">
									<label class="form-label dairy-input-label">  Name</label>
									<input type="hidden" class="form-control dairy-form-input"  id="" name="dairyMangerId" value="${dairy.id}" >
									<input type="text" class="form-control dairy-form-input" placeholder="Enter name" id="" name="name" value="${dairy.name}"disabled="disabled">
								</div>
								
								<div class="col-md-6">
								 <label class="form-label dairy-input-label">Contact</label> 
								<div class="input-group has-validation">
								   <span class="input-group-text" id="">+91</span>
									<input type="text" class="form-control dairy-form-input" placeholder="Enter  Contact No." id="" name="contact" value="${dairy.contact}" disabled="disabled" required>
								</div>
								</div>
								<div class="col-md-6">
									<label class="form-label dairy-input-label">Person-Id</label> 
									<input type="text" class="form-control dairy-form-input" placeholder="Person_Id" id="" name="personId" value="${dairy.personId}"disabled="disabled" required>
								</div>
				
								<div class="col-md-6">
									<label class="form-label dairy-input-label">Amount </label> 
									<input type="text" class="form-control dairy-form-input" placeholder="Enter Amount" id="amount" name="amount"value="${dairy.amount}"disabled="disabled" required>
								</div>
								<div class="col-md-6">
									<label class="form-label dairy-input-label">Balance</label> 
									<input type="text" class="form-control dairy-form-input" placeholder="Enter Balance" id="blance" name="balance" required>
								</div>
								
								<div class="col-md-4">
									<label class="form-label dairy-input-label">Date</label> 
									<input type="datetime-local" class="form-control dairy-form-input" id="" name="dateTransaction">
								</div>
								
								<div class="col-md-6 offset-md-1 mt-4" > 
								   <div class="row"> 
								     <label class="form-label mb-1">Transition Type</label> 
								          <div class="col-md-4"> 
								             <div class="form-check"> 
								                   
								                   <label class="form-check-label">
								                      <input class="form-check-input" type="radio" name="transactionType" id="transactionType" value="Credit" checked> 
								                      Credit 
								                   </label> 
								                   
								              </div> 
								             </div> 
								             <div class="col-md-6"> 
								               <div class="form-check"> 
								                   
								                   <label class="form-check-label">
								                      <input class="form-check-input" type="radio" name="transactionType" value="Debit" id="transactionType"  > 
								                      Debit 
								                   </label> 
								                   
								                 </div> 
								               </div> 
								         </div> 
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