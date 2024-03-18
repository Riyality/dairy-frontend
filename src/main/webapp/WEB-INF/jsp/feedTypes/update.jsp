<jsp:include page="../modules/header.jsp" />

 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<body>

	<div class="main-content app-content p-4">


		<div class="container-fluid">
			<div class="row">
				<div class="col-10 m-auto">
					<div class="card custom-card">
						<div class="card-header justify-content-between">
							<div class="card-title">Update Feed Type</div>
							 <a href="http://localhost:6161/feedTypes"><button class="btn btn-primary dairy-form-btn" >Back</button></a>
						</div>
						<div class="card-body">
						  <jsp:include page="../successMessage/message.jsp" />
							<form class="row g-3 needs-validation" action="/feedTypes/update"
								method="post" >

								<div class="col-md-6">
								  <input type="hidden" class="form-control dairy-form-input" id="" name="id" value="${feedType.id }">
								
									<label class="form-label dairy-input-label required-field">Feed Company Name</label> 
										
								      <select  class="form-select dairy-form-input"id="" name="feedCompanyId" value="${feedType.feedCompanyId }">
                                      <option value="${feedType.feedCompanyId }" selected="selected" >${feedType.feedCompanyName}</option>
										<c:forEach items="${feedCompany}" var="fc">
											<option  value="${fc.id}">${fc.name}</option>
										</c:forEach>
									</select>
								</div>

								<div class="col-md-6">
									<label class="form-label dairy-input-label required-field">Feed Type Name<span class="required-field">*</span></label> 
									<input type="text"class="form-control dairy-form-input" placeholder="Enter Feed Type Name" id="" name="type" value="${feedType.type }" required>
								</div>

								<div class="col-12">
									<label class="form-label dairy-input-label">Remark</label>
									<textarea class="col-md-12 dairy-textarea" rows="4"
										name="remark" placeholder="Enter Remark Here">${feedType.remark}</textarea>
								</div>
								<div class="col-12">
									<button class="btn btn-primary dairy-form-btn" type="submit">Submit</button>
									
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="../modules/footer.jsp" />