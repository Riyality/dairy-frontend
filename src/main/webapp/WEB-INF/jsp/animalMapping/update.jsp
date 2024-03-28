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
							<div class="card-title">${empty messages[237] ? 'Update Animal Mapping' : messages[237]}</div>
							<a href="http://localhost:6161/farmerAnimalMapping"><button class="btn btn-primary dairy-form-btn" >${empty messages[79] ? ' Back' : messages[79]}</button></a>
						</div>
						<div class="card-body dairy-card-body">
							<form class="row g-3 needs-validation" action="/farmerAnimalMapping/update"
								method="Post" >
								
								<div class="col-md-6">
								<input type="hidden" class="form-control dairy-form-input"  id="" name="id" value="${animal.id}">
									<label class="form-label dairy-input-label required-field">${empty messages[116] ? '  Farmer Name' : messages[116]}</label> 
					
									<select class="form-select dairy-form-input" id=""
										name="farmerId"  value="${animal.farmerId}">
										<option  selected="selected" value="${animal.farmerId}">${animal.farmerName}</option>
										<c:forEach items="${list}" var="farmer">
											<option  value="${farmer.id}">${farmer.name}</option>
										</c:forEach>
									</select>
								</div>
								
								<div class="col-md-6 offset-md-1 mt-4" > 
								   <div class="row"> 
								     <label class="form-label mb-1 required-field">${empty messages[86] ? 'Milk Type' : messages[86]}</label> 
								          <div class="col-md-4"> 
								             <div class="form-check"> 
								                   
								                   <label class="form-check-label">
								                    <input class="form-check-input" type="radio" name="type" id="type"  value="Cow" value="Cow" ${animal.type == 'Cow' ? 'checked' : ''}
                                                     /> ${empty messages[87] ? 'Cow' : messages[87]} 
								                   </label> 
								                   
								              </div> 
								             </div> 
								             <div class="col-md-4"> 
								               <div class="form-check"> 
								                   
								                   <label class="form-check-label">
								                    <input class="form-check-input" type="radio" name="type"  value="Buffalo" ${animal.type == 'Buffalo' ? 'checked' : ''}
                                                     />  ${empty messages[88] ? 'Buffalo' : messages[88]}    
								                   </label> 
								                   
								                 </div> 
								               </div> 
								         </div> 
								    </div>
								
								<div class="col-md-6">
									<label class="form-label dairy-input-label required-field">${empty messages[235] ? 'Conut' : messages[235]}</label>
									<input type="text" class="form-control dairy-form-input" placeholder="${empty messages[236] ? 'Enter Count' : messages[236]}" id="count" name="count"  value="${animal.count}" >
								</div>
								
								<div class="col-12">
									<label class="form-label dairy-input-label">${empty messages[69] ? ' Remark' : messages[69]}</label>
									<textarea class="col-12 dairy-textarea" rows="4" name="remark" placeholder="${empty messages[74] ? 'Enter Remark Here' : messages[74]}">${animal.remark}</textarea> 
								</div>
								
								<div class="col-12">
									<button class="btn btn-primary dairy-form-btn" type="submit">${empty messages[78] ? ' submit' : messages[78]}   </button>
									 
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="../modules/footer.jsp" />