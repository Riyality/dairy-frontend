<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%><%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<jsp:include page="../modules/header.jsp" />

<body>
	<div class="main-content app-content">
		<div class="container-fluid">
			<div class="row">
				<div class="col-11 mx-auto mt-4">
					<div class="card custom-card">
						<div class="card-header dairy-card-header">
							<div class="card-title">All dairyManger</div>
						</div>
						<div class="card-body">
							<div class="table-responsive">

								<table id="file-export"
									class="table table-bordered dataTable no-footer dairy-table-border">
									<thead>
										<tr class="dairy-table-head">
											<th>Name</th>
											<th>Date of Transaction</th>
											<th>Transaction Type</th>
											<th>Contact</th>
											<th>Amount</th>
											<th>Remark</th>
											<th>Action</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${dairyMangers}" var="dairy">

											<tr class="gridjs-tr">
												<td>${dairy.name}</td>
												<td>${dairy.dateTransaction}</td>
												<td>${dairy.transactionType}</td>
												<td>${dairy.contact}</td>
												<td>${dairy.amount}</td>
												<td>${dairy.remark}</td>
												<td><a
													href="http://localhost:6161/dairyManger/${dairy.id}">
														<button>Add Transaction</button>
												</a></td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
								 <div class="col-6">
                                 <a href="http://localhost:6161/dairyManger/add-dairyManger-Page"><button  class="btn btn-primary dairy-form-btn">Back</button></a>
                               </div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="../modules/footer.jsp" />