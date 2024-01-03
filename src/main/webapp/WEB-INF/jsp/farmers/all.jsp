<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%><%@ taglib
	uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%><%@ taglib
	uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="../modules/header.jsp" />

<body>
	<div class="main-content app-content">
		<div class="container-fluid">
			<div class="row">
				<div class="col-11 mx-auto mt-4">
					<div class="card custom-card">
						<div class="card-header dairy-card-header">
							<div class="card-title">All Farmers</div>
						</div>
						<div class="card-body">
							<div class="table-responsive">

								<%-- <jsp:include page="../modules/dataTableHeader.jsp" /> --%>

								<table id="file-export"
									class="table table-bordered dataTable no-footer dairy-table-border">
									<thead>
										<tr class="dairy-table-head">
											<th>Farmers Name</th>
											<th>Date of Joining</th>
											<th>Contact</th>
											<th>Route</th>
											<th>Bank</th>
											<th>Branch</th>
											<th>Account No.</th>
											<th>IFSC Code</th>
											<th>Address</th>
											<th>Action</th>
										</tr>
									</thead>
									<tbody>

										<c:forEach items="${list}" var="farmer">
											<tr class="gridjs-tr">
												<td>${farmer.name }</td>
												<td>${farmer.dateOfRegistration }</td>
												<td>${farmer.contact }</td>
												<td>${farmer.route }</td>
												<td>${farmer.bank.bankName }</td>
												<td>${farmer.bank.branchName }</td>
												<td>${farmer.bank.accountNumber }</td>
												<td>${farmer.bank.ifscCode }</td>
												<td>${farmer.address }</td>
												<td><a
													href="http://localhost:6161/branches/${branch.id }"> <i
														class="ti ti-color-picker" style="font-size: 14px"></i>
												</a></td>
											</tr>
										</c:forEach>

									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>


		</div>
	</div>
	<jsp:include page="../modules/footer.jsp" />