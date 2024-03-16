<jsp:include page="../modules/header.jsp" />
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>

</style>
<body>

	<div class="main-content app-content p-4">

		<div class="container-fluid">
			<div class="row">
				<div class="col-10 m-auto">
					<div class="card custom-card">
						<div class="card-header justify-content-between dairy-card-header">
							<div class="card-title">Add Animal Mapping</div>
						</div>
						<div class="card-body dairy-card-body">
						    <jsp:include page="../successMessage/message.jsp" />
							<form class="row g-3 needs-validation" id="animalMappingForm" action="/farmerAnimalMapping"
								method="Post" >
								
								<div class="col-md-6">
									<label class="form-label dairy-input-label required-field">Farmer Name</label> 
					
									<select class="form-select dairy-form-input" id=""
										name="farmerId">
										<option value="" selected="selected" disabled="disabled">Select Farmer</option>
										<c:forEach items="${list}" var="farmer">
											<option value="${farmer.id}">${farmer.name}</option>
										</c:forEach>
									</select>
								</div>
								
								<div class="col-md-3 offset-md-1 mt-4" > 
								   <div class="row"> 
								     <label class="form-label mb-1 required-field">Animal Type</label> 
								          <div class="col-md-4"> 
								             <div class="form-check"> 
								                   
								                   <label class="form-check-label">
								                      <input class="form-check-input animalType" type="radio" name="type" id="" value="cow" checked="checked"> 
								                      Cow 
								                   </label> 
								                   
								              </div> 
								             </div> 
								             <div class="col-md-4"> 
								               <div class="form-check"> 
								                   
								                   <label class="form-check-label">
								                      <input class="form-check-input animalType" type="radio" name="type" id="" value="buffalo"> 
								                      Buffalo 
								                   </label> 
								                   
								                 </div> 
								               </div> 
								         </div> 
								    </div>
								
								<div class="col-md-6">
									<label class="form-label dairy-input-label required-field">Count</label>
									<input type="text" class="form-control dairy-form-input" placeholder="Enter Count" id="count" name="count" required>
								</div>
								
								<div class="col-12">
									<label class="form-label dairy-input-label">Remark</label>
									<textarea class="col-12 dairy-textarea" rows="4" name="remark" placeholder="Enter Remark Here"></textarea> 
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
