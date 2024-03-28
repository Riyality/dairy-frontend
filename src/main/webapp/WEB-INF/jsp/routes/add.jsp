<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%><%@ taglib
	uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="../modules/header.jsp" />
<style>

</style>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	
<body>

	<div class="main-content app-content p-4">

		<div class="container-fluid">
			<div class="row">
				<div class="col-10 m-auto">
					<div class="card custom-card">
						<div class="card-header justify-content-between dairy-card-header">
							<div class="card-title">${empty messages[4] ? ' Add Route' : messages[4]}</div>
						</div>
						<div class="card-body dairy-card-body">

						
                         <jsp:include page="../successMessage/message.jsp" />
                   

							<form class="row g-3 needs-validation" action="/routes"
								method="post" >
								
								<div class="col-md-6">
									<label class="form-label dairy-input-label required-field">${empty messages[81] ? ' Route Name' : messages[81]}</label>
									<input type="text" class="form-control dairy-form-input" placeholder="${empty messages[84] ? ' Enter Route Name' : messages[84]}" id="" name="name" required>
								</div>
								
								<div class="col-12">
									<label class="form-label dairy-input-label">${empty messages[69] ? ' Remark' : messages[69]}</label>
									<textarea class="col-12 dairy-textarea" rows="4" name="remark" placeholder="${empty messages[74] ? 'Enter Remark' : messages[74]}"></textarea> 
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