<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%><%@ taglib
	uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
							<div class="card-title">${empty messages[42] ? 'Add Advance To Farmer' : messages[42]}  </div>
						</div>
						<div class="card-body dairy-card-body">		
						  
						   <jsp:include page="../successMessage/message.jsp" />
							<form class="row g-3 needs-validation" action="/advanceToFarmer"
								method="post" >
								
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
								
								<div class="col-md-6">
									<label class="form-label dairy-input-label required-field">${empty messages[208] ? ' Date Of Advance' : messages[208]}</label> 
									<input type="date" class="form-control dairy-form-input" id="" name="dateOfAdvance"required>
								</div>
								
								<div class="col-md-6">
									<label class="form-label dairy-input-label required-field">${empty messages[209] ? 'Advance Amount' : messages[209]}</label> 
									<input type="text" class="form-control dairy-form-input" placeholder="${empty messages[213] ? 'Advance Amount' : messages[213]}" id="AdvanceAmount" name="amount" required>
								</div>
								
								<div class="col-12">
									<label class="form-label dairy-input-label">${empty messages[69] ? ' Remark' : messages[69]}</label>
									<textarea class="col-md-12 dairy-textarea" rows="4" name="remark" placeholder="${empty messages[74] ? 'Enter Remark Here' : messages[74]}"></textarea> 
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
	
	
	