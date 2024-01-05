
<jsp:include page="../modules/header.jsp" />
<style>

</style>
<body>

	<div class="main-content app-content p-4">

		<div class="container-fluid">
			<div class="row">
				<div class="col-10 m-auto">
					<div class="card custom-card">
						<div class="card-header justify-content-between dairy-card-header">
							<div class="card-title">Add Feed Distribution</div>
						</div>
						<div class="card-body dairy-card-body">
							<form class="row g-3 needs-validation" action="/branches"
								method="post" novalidate>
								
								<div class="col-md-6">
									<label class="form-label dairy-input-label">Person Name</label>
									<input type="text" class="form-control dairy-form-input" placeholder="Farmer	 Name" id="" name="name">
								</div>
								
								<div class="col-md-6">
									<label class="form-label dairy-input-label">Date of Credit or Debit</label> 
									<input type="date" class="form-control dairy-form-input" id="" name="startDate">
								</div>
								
								<div class="col-md-6 mt-4" > 
								   <div class="row"> 
								     <label class="form-label mb-1">Money Exchange</label> 
								          <div class="col-md-4"> 
								             <div class="form-check"> 
								                   
								                   <label class="form-check-label">
								                      <input class="form-check-input" type="radio" name="moneyExchange" id="moneyExchange" checked=""> 
								                      Took 
								                   </label> 
								                   
								              </div> 
								             </div> 
								             <div class="col-md-4"> 
								               <div class="form-check"> 
								                   
								                   <label class="form-check-label">
								                      <input class="form-check-input" type="radio" name="moneyExchange" id="moneyExchange"> 
								                      Gave 
								                   </label> 
								                   
								                 </div> 
								               </div> 
								         </div> 
								    </div>
								    
								<div class="col-md-6">
									<label class="form-label dairy-input-label">Person Contact</label>
									<div class="input-group has-validation">
										<span class="input-group-text" id="">+91</span>
										<input type="text" class="form-control dairy-form-input" placeholder="Enter Mobile No." id="" aria-describedby="inputGroupPrepend" name="ownerContact" required>
									</div>
								</div>
								
								<div class="col-md-6">
									<label class="form-label dairy-input-label">Amount</label>
									<input type="text" class="form-control dairy-form-input" placeholder="Enter Amount" id="" name="name">
								</div>
								
								<div class="col-12">
									<label class="form-label dairy-input-label">Remark</label>
									<textarea class="col-12 dairy-textarea" rows="4" name="address" placeholder="Enter Remark Here"></textarea> 
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