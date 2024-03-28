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
							<div class="card-title">${empty messages[234] ? 'Add Animal Mapping' : messages[234]}</div>
						</div>
						<div class="card-body dairy-card-body">
						    <jsp:include page="../successMessage/message.jsp" />
							<form class="row g-3 needs-validation" id="animalMappingForm" action="/farmerAnimalMapping"
								method="Post" >
								
								<div class="col-md-6">
									<label class="form-label dairy-input-label required-field">${empty messages[116] ? '  Farmer Name' : messages[116]}</label> 
					
									<select class="form-select dairy-form-input" id=""
										name="farmerId">
										<option value="" selected="selected" disabled="disabled">${empty messages[207] ? ' Select Farmer' : messages[207]}</option>
										<c:forEach items="${list}" var="farmer">
											<option value="${farmer.id}">${farmer.name}</option>
										</c:forEach>
									</select>
								</div>
								
								<div class="col-md-3 offset-md-1 mt-4" > 
								   <div class="row"> 
								     <label class="form-label mb-1 required-field">${empty messages[86] ? 'Milk Type' : messages[86]}</label> 
								          <div class="col-md-4"> 
								             <div class="form-check"> 
								                   
								                   <label class="form-check-label">
								                      <input class="form-check-input animalType" type="radio" name="type" id="" value="cow" checked="checked"> 
								                      ${empty messages[87] ? 'Cow' : messages[87]} 
								                   </label> 
								                   
								              </div> 
								             </div> 
								             <div class="col-md-4"> 
								               <div class="form-check"> 
								                   
								                   <label class="form-check-label">
								                      <input class="form-check-input animalType" type="radio" name="type" id="" value="buffalo"> 
													  ${empty messages[88] ? 'Buffalo' : messages[88]}  
								                   </label> 
								                   
								                 </div> 
								               </div> 
								         </div> 
								    </div>
								
								<div class="col-md-6">
									<label class="form-label dairy-input-label required-field"> ${empty messages[235] ? 'Conut' : messages[235]} </label>
									<input type="text" class="form-control dairy-form-input" placeholder="${empty messages[236] ? 'Enter Count' : messages[236]}" id="count" name="count" required>
								</div>
								
								<div class="col-12">
									<label class="form-label dairy-input-label">${empty messages[69] ? ' Remark' : messages[69]}</label>
									<textarea class="col-12 dairy-textarea" rows="4" name="remark" placeholder="${empty messages[74] ? 'Enter Remark Here' : messages[74]}"></textarea> 
								</div>
								
								<div class="col-12">
									<button class="btn btn-primary dairy-form-btn" type="submit">${empty messages[78] ? ' submit' : messages[78]}  </button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="../modules/footer.jsp" />
