
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
							<div class="card-title">Add Branch</div>
						</div>
						<div class="card-body dairy-card-body">
						  <jsp:include page="../successMessage/message.jsp" />
							<form class="row g-3 needs-validation" action="/branches"
								method="post" id="branchForm">
								
								<div class="col-md-6">
									<label class="form-label dairy-input-label required-field">Name</label>
									<input type="text" class="form-control dairy-form-input" placeholder="Enter Branch Name" id="" name="name" required>
								</div>
								
								<div class="col-md-6">
									<label class="form-label dairy-input-label required-field">Owner Name</label> 
									<input type="text" class="form-control dairy-form-input" placeholder="Enter Owner Name" id="name" name="owner" required>
								</div>
								
								<div class="col-md-6">
									<label class="form-label dairy-input-label required-field">Owner Contact</label>
									<div class="input-group has-validation">
										<span class="input-group-text" id="">+91</span>
										<input type="text" class="form-control dairy-form-input" placeholder="Enter Mobile No." id="contactNumber" aria-describedby="inputGroupPrepend" name="ownerContact" required>
									</div>
								</div>
								
								<div class="col-md-6">
									<label class="form-label dairy-input-label required-field">Start Date</label> 
									<input type="datetime-local" class="form-control dairy-form-input" id="" name="startDate" required>
								</div>
								<div class="col-md-6">
									<label class="form-label dairy-input-label">Address</label>
									<textarea class="col-md-12 dairy-textarea" name="address" placeholder="Enter Address Here"></textarea> 
								</div>
								<div class="col-md-12">
									<label class="form-label dairy-input-label">Remark</label>
									<textarea class="col-md-12 dairy-textarea" rows="4" name="remark" placeholder="Enter Remark Here"></textarea> 
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
	  
    <!-- Display alert messages -->
    <input type="hidden" id="successMessage" value="${successMessage}" />
      <input type="hidden" id="errorMessage" value="${errorMessage}" />
								
   <script>
       
        let successMessage = document.getElementById('successMessage').value.trim();
        let errorMessage = document.getElementById('errorMessage').value.trim();

        
        function showAlert(message, type) {
            let alertDiv = document.createElement('div');
            alertDiv.classList.add('alert', 'fade', 'show');
            alertDiv.setAttribute('role', 'alert');
            if (type === 'success') {
                alertDiv.classList.add('alert-success');
            } else if (type === 'error') {
                alertDiv.classList.add('alert-danger');
            }
            alertDiv.innerHTML = message;

            // Append alert to the document body
            document.body.appendChild(alertDiv);

            // Automatically close the alert after 4 seconds
            setTimeout(function () {
                alertDiv.classList.remove('show');
                alertDiv.classList.add('hide');
                alertDiv.remove();
            }, 4000);
        }

        // Check if success message is not empty
        if (successMessage !== "") {
            showAlert(successMessage, 'success');
        }

        // Check if error message is not empty
        if (errorMessage !== "") {
            showAlert(errorMessage, 'error');
        }
    </script>

    <jsp:include page="../modules/footer.jsp" />
