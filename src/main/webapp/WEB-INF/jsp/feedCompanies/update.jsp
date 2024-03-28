<jsp:include page="../modules/header.jsp" />


<body>

	<div class="main-content app-content p-4">


		<div class="container-fluid">
			<div class="row">
				<div class="col-10 m-auto">
					<div class="card custom-card">
						<div class="card-header justify-content-between">
							<div class="card-title">${empty messages[130] ? 'Update Feed Company' : messages[130]}</div>
							 <a href="http://localhost:6161/feedCompanies"><button class="btn btn-primary dairy-form-btn" >${empty messages[79] ? ' Back' : messages[79]}</button></a>
						</div>
						<div class="card-body">
						 <jsp:include page="../successMessage/message.jsp" />
							<form class="row g-3 needs-validation" action="/feedCompanies/update"
								method="post" >
								
								<div class="col-md-6">
									<label class="form-label dairy-input-label required-field">${empty messages[127] ? 'Feed Company Name' : messages[127]}</label>
									<input type="hidden" class="form-control dairy-form-input"  id="" name="id" value="${feedCompany.id }">
									<input type="text" class="form-control dairy-form-input" placeholder="${empty messages[128] ? 'Enter Feed Company Name' : messages[128]}" id="" name="name" value="${feedCompany. name}" required>
								</div>
								
								<div class="col-12">
									<label class="form-label dairy-input-label">${empty messages[69] ? ' Remark' : messages[69]}</label>
									<textarea class="col-md-12 dairy-textarea" rows="4" name="remark" placeholder="${empty messages[74] ? 'Enter Remark Here' : messages[74]}" >${feedCompany.remark}</textarea> 
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