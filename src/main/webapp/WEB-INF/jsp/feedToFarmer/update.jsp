
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
							<div class="card-title">${empty messages[126] ? '  Update Feed Distribution' : messages[126]}</div>
							<a href="http://localhost:6161/feedToFarmers"><button class="btn btn-primary dairy-form-btn" >${empty messages[79] ? ' Back' : messages[79]}</button></a>
						</div>
						<div class="card-body dairy-card-body">
							<form class="row g-3 needs-validation" action="/feedToFarmers/update" method="post" >
								
								<input type="hidden"  class="form-control dairy-form-input"  name="id" value="${feedToFarmer.id}" >
								
								<div class="col-md-6">
									<label class="form-label dairy-input-label required-field">${empty messages[116] ? '  Farmer Name' : messages[116]}</label>
								<select class="form-select dairy-form-input" id=""
										name="farmerId" value="${feedToFarmer.farmerId}">
										<c:forEach items="${Farmers}" var="farmer">
											<option  selected="selected" value="${farmer.id}">${farmer.name}</option>
										</c:forEach>
									</select>
								</div>
								
								<div class="col-md-6">
									<label class="form-label dairy-input-label required-field">${empty messages[117] ? '  Date Of  Distribution' : messages[117]}</label> 
									<input type="date" class="form-control dairy-form-input" id="" name="dateOfPurchase"  value="${feedToFarmer.dateOfPurchase}"required>
								</div>

								<div class="col-md-6">
									<label class="form-label dairy-input-label required-field">${empty messages[118] ? 'Feed Company' : messages[118]}</label> 
									 <select  class="form-select dairy-form-input"
										id="feedTypeList" name="feedCompanyId"  value="${feedToFarmer.feedCompanyId}">
										<option value="${feedToFarmer.feedCompanyId}" selected="selected" disabled="disabled">${feedToFarmer.feedCompanyName}</option>
										<c:forEach items="${feedCompany}" var="fc">
											<option value="${fc.id}">${fc.name}</option>
										</c:forEach>
									</select>
								</div>

								<div class="col-md-6">
									<label class="form-label dairy-input-label required-field">${empty messages[120] ? 'Feed Tye' : messages[120]}</label> 
									<select class="form-select dairy-form-input"
										id="feedTypeList" name="feedTypeId" disabled="disabled" value="${feedToFarmer.feedCompanyId}">
										<option value="${feedToFarmer.feedTypeId}"  selected="selected" disabled="disabled" >${feedToFarmer.feedTypeName}</option>
										<%-- <c:forEach items="${feedType}" var="feed">
											<option  value="${feed.id}">${feed.type}</option>
										</c:forEach> --%>
									</select>
								</div>

								
								<div class="col-md-6">
									<label class="form-label dairy-input-label required-field">${empty messages[110] ? 'Price Per Unit' : messages[110]}</label>
									<input type="text" class="form-control dairy-form-input" placeholder="${empty messages[113] ? 'Enter  Price Per Unit' : messages[113]}" id="" name="feedRate"  value="${feedToFarmer.feedRate}"required>
								</div>
								
								<div class="col-md-6">
									<label class="form-label dairy-input-label required-field">${empty messages[109] ? 'Quantity' : messages[109]}</label>
									<input type="text" class="form-control dairy-form-input" placeholder="${empty messages[112] ? 'Enter Total Quantity' : messages[112]}" id="" name="quantity" value="${feedToFarmer.quantity}" required>
								</div>
								
								<div class="col-md-6">
									<label class="form-label dairy-input-label required-field">${empty messages[97] ? 'Total  Amount' : messages[97]}</label>
									<input type="text" class="form-control dairy-form-input" placeholder="Total Amount" id="" name="totalAmount" value="${feedToFarmer.totalAmount}" required>
								</div>
								
								
								<div class="col-12">
									<label class="form-label dairy-input-label">${empty messages[69] ? ' Remark' : messages[69]}</label>
									<textarea class="col-12 dairy-textarea" rows="4" name="remark" placeholder="${empty messages[74] ? 'Enter Remark Here' : messages[74]}" >${feedToFarmer.remark}</textarea> 
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