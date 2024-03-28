
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
							<div class="card-title">${empty messages[13] ? ' Add Feed Distribution' : messages[13]}</div>
							 <a href="http://localhost:6161/milkCollection/get-farmer-list-page"><button class="btn btn-primary dairy-form-btn" >${empty messages[79] ? ' Back' : messages[79]}</button></a>
						</div>
						<div class="card-body dairy-card-body">
							<form class="row g-3 needs-validation" action="/feedToFarmers"
								method="Post" >
								
							
								<div class="col-md-6">
									<label class="form-label dairy-input-label">${empty messages[115] ? '  Farmer ID' : messages[115]}</label>
									<input type="hidden" class="form-control dairy-form-input" name="farmerId" id="hiddenFarmerId" value="${farmerId}" id="farmerId">
									<input type="text" class="form-control dairy-form-input" placeholder="Enter Farmer Id" name="farmerId" value="${farmerId}" id="farmerId" disabled="disabled">
								</div>
								
								<div class="col-md-6">
									<label class="form-label dairy-input-label">${empty messages[116] ? '  Farmer Name' : messages[116]}</label>
									<input type="text" class="form-control dairy-form-input" placeholder="${empty messages[123] ? 'Enter Farmer Name' : messages[123]}" name="farmerName" id="farmerName" value="${farmerName}" disabled="disabled">
								</div>
								 
								<div class="col-md-6">
									<label class="form-label dairy-input-label required-field">${empty messages[117] ? '  Date Of  Distribution' : messages[117]}</label> 
									<input type="date" class="form-control dairy-form-input" id="dateOfPurchase" name="dateOfPurchase" required>
								</div>

								<div class="col-md-6">
									<label class="form-label dairy-input-label required-field">${empty messages[118] ? 'Feed Company' : messages[118]}</label> 
									 <select  class="form-select dairy-form-input"
										id="feedCompanyList" name="feedCompanyId">
										<option value="" selected="selected" disabled="disabled">${empty messages[119] ? 'Select Feed Company' : messages[119]}</option>
										<c:forEach items="${feedCompany}" var="fc">
											<option value="${fc.id}">${fc.name}</option>
										</c:forEach>
									</select>
								</div>

								<div class="col-md-6">
									<label class="form-label dairy-input-label required-field">${empty messages[120] ? 'Feed Tye' : messages[120]}</label> 
									<select class="form-select dairy-form-input"
										id="feedTypeList" name="feedTypeId" disabled="disabled">
										<!-- <option value="" selected="selected" disabled="disabled">Select
											Feed Type</option> -->
										<%-- <c:forEach items="${feedType}" var="feed">
											<option value="${feed.id}">${feed.type}</option>
										</c:forEach> --%>
									</select>
								</div>
								
								<div class="col-md-6">
									<label class="form-label dairy-input-label required-field">${empty messages[109] ? 'Quantity' : messages[109]}</label>
									<input type="text" class="form-control dairy-form-input" placeholder="${empty messages[112] ? 'Enter Total Quantity' : messages[112]}" id="feedQuantity" name="quantity" required>
								</div>
								
								<div class="col-md-6">
									<label class="form-label dairy-input-label required-field">${empty messages[110] ? 'Price Per Unit' : messages[110]}</label>
									<input type="text" class="form-control dairy-form-input" placeholder="${empty messages[113] ? 'Enter  Price Per Unit' : messages[113]}" id="feedCostPerUnit" name="feedRate" required>
								</div>
								
								<div class="col-md-6">
									<label class="form-label dairy-input-label required-field">${empty messages[97] ? 'Total  Amount' : messages[97]}</label>
									<input type="text" class="form-control dairy-form-input" placeholder="${empty messages[103] ? 'Enter  Total  Amount' : messages[103]}" id="FeedTotalAmount" name="totalAmount"required>
								</div>
								<div class="col-md-6">
									<label class="form-label dairy-input-label">${empty messages[121] ? 'Amount  Paid' : messages[121]}</label>
									<input type="text" class="form-control dairy-form-input" placeholder="${empty messages[124] ? ' Amount Paid' : messages[124]}" id="FeedAmountPaid" name="paidAmount">
								</div>
								<div class="col-md-6">
									<label class="form-label dairy-input-label">${empty messages[122] ? 'Remaining  Amount' : messages[122]}</label>
									<input type="text" class="form-control dairy-form-input" placeholder="${empty messages[125] ? ' Enter Remaining Amount' : messages[125]}" id="FeedremainingAmount" name="remainingAmount">
								</div>
								<div class="col-12">
									<label class="form-label dairy-input-label">${empty messages[69] ? ' Remark' : messages[69]}</label>
									<textarea class="col-12 dairy-textarea" rows="4" name="remark" placeholder="${empty messages[74] ? 'Enter Remark Here' : messages[74]}"></textarea> 
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
	
	<script type="text/javascript">
	
	/*Set Default Milk Collection Date Script Start*/
	
			 function setDefaultDate() {
		
		//alert("kljj")
				 
			        var today = new Date();
			        var year = today.getFullYear();
			        var month = ('0' + (today.getMonth() + 1)).slice(-2);
			        var day = ('0' + today.getDate()).slice(-2);
			      /*   var hours = ('0' + today.getHours()).slice(-2);
			        var minutes = ('0' + today.getMinutes()).slice(-2); */
			
			        var formattedDateAndTime = year + '-' + month + '-' + day /* + 'T' + hours + ':' + minutes */;
			
			        document.getElementById('dateOfPurchase').value = formattedDateAndTime;
				    }
				    
				    /*Set Default Milk Collection Date Script End*/
				    
				   function onLoad() {
					    setDefaultDate();
					}
				    window.onload = onLoad;
	
	</script>
	
	
	