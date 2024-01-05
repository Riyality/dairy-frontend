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
							<div class="card-title">Add Feed Stock</div>
						</div>
						<div class="card-body dairy-card-body">
							<form class="row g-3 needs-validation" action="/feedStock/update"
								method="post" novalidate>

								<div class="col-md-6">
									<input type="hidden" class="form-control dairy-form-input"
										id="" name="id" value="${feedstock.id }"> <label
										class="form-label dairy-input-label">Supplier Name</label> <select
										class="form-select dairy-form-input" id="" name="supplierId">
										<option value="" selected="selected" disabled="disabled">Select
											Supplier Company</option>
										<c:forEach items="${FeedStocks}" var="feedstock">
											<option value="${feedstock.supplierId}">${feedstock.supplierName}</option>
										</c:forEach>
									</select>


								</div>

								<div class="col-md-6">
									<label class="form-label dairy-input-label">Purchase
										Date</label> <input type="datetime-local"
										class="form-control dairy-form-input" id=""
										name="dateOfPurchase" value="${feedstock.dateOfPurchase}">
								</div>

								<div class="col-md-6">
									<label class="form-label dairy-input-label">Feed
										Company</label> <select class="form-select dairy-form-input" id=""
										name="feedCompanyId">
										<option value="" selected="selected" disabled="disabled">Select
											Feed Company</option>
										<c:forEach items="${FeedStocks}" var="feedstock">
											<option value="${feedstock.feedCompanyId}">${feedstock.feedCompanyName}</option>
										</c:forEach>
									</select>


								</div>

								<div class="col-md-6">
									<label class="form-label dairy-input-label">Feed
										Company Type</label> <select class="form-select dairy-form-input"
										id="" name="feedTypeId">
										<option value="" selected="selected" disabled="disabled">Select
											Feed Type</option>
										<c:forEach items="${FeedStocks}" var="feedstock">
											<option value="${feedstock.feedTypeId}">${feedstock.feedTypeName}</option>
										</c:forEach>
									</select>
								</div>

								<div class="col-md-6">
									<label class="form-label dairy-input-label">Feed Cost
										(1 unit)</label> <input type="text"
										class="form-control dairy-form-input"
										placeholder="Enter Feed Cost pre Unit" id=""
										name="feedCostPerUnit" value="${feedstock.feedCostPerUnit}">
								</div>

								<div class="col-md-6">
									<label class="form-label dairy-input-label">Total
										Quantity</label> <input type="text"
										class="form-control dairy-form-input"
										placeholder="Enter Total Quantity" id="" name="quantity"
										value="${feedstock.quantity}">
								</div>

								<div class="col-md-6">
									<label class="form-label dairy-input-label">Total
										Amount</label> <input type="text"
										class="form-control dairy-form-input"
										placeholder="Total Amount" id="" name="totalAmount"
										value="${feedstock.totalAmount}">
								</div>

								<div class="col-12">
									<label class="form-label dairy-input-label">Remark</label>
									<textarea class="col-12 dairy-textarea" rows="4" name="address"
										placeholder="Enter Remark Here"></textarea>
								</div>

								<div class="col-12">
									<button class="btn btn-primary dairy-form-btn" type="submit">Submit
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