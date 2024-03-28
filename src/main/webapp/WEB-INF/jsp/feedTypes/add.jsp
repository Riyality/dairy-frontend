
<jsp:include page="../modules/header.jsp" />

 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<body>

	<div class="main-content app-content p-4">


		<div class="container-fluid">
			<div class="row">
				<div class="col-10 m-auto">
					<div class="card custom-card">
						<div class="card-header justify-content-between">
							<div class="card-title">${empty messages[19] ? 'Add Feed Type' : messages[19]}</div>
						</div>
						<div class="card-body">
							<form class="row g-3 needs-validation" action="/feedTypes"
								method="post" >

								<div class="col-md-6">
									<label class="form-label dairy-input-label required-field">${empty messages[127] ? 'Feed Company Name' : messages[127]}</label> 
										
										

								 <select  class="form-select dairy-form-input"
										id="" name="feedCompanyId">
										<option value="" selected="selected" disabled="disabled">${empty messages[119] ? 'Select Feed Company' : messages[119]}</option>
										<c:forEach items="${feedCompany}" var="fc">
											<option value="${fc.id}">${fc.name}</option>
										</c:forEach>
									</select>
								</div>

								<div class="col-md-6">
									<label class="form-label dairy-input-label required-field">${empty messages[131] ? 'Feed Tye Name' : messages[131]}</label> <input type="text"
										class="form-control dairy-form-input"
										placeholder="${empty messages[134] ? 'Enter Feed Tye Name' : messages[134]}" id="" name="type" required>
								</div>

								<div class="col-12">
									<label class="form-label dairy-input-label">${empty messages[69] ? ' Remark' : messages[69]}</label>
									<textarea class="col-md-12 dairy-textarea" rows="4"
										name="remark" placeholder="${empty messages[74] ? 'Enter Remark Here' : messages[74]}"></textarea>
								</div>
								<div class="col-12">
									<button class="btn btn-primary dairy-form-btn" type="submit">${empty messages[78] ? ' submit' : messages[78]}
									</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="../modules/footer.jsp" />