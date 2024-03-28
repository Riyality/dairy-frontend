<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%><%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<jsp:include page="../modules/header.jsp" />

<body>
	<div class="main-content app-content">
		<div class="container-fluid">
			<div class="row">
				<div class="col-11 mx-auto mt-4">
					<div class="card custom-card">
						<div class="card-header dairy-card-header">
							<div class="card-title">${empty messages[247] ? 'All Dairy Manager' : messages[247]}</div>
						</div>
						<div class="card-body">
						 <jsp:include page="../successMessage/message.jsp" />
							<div class="table-responsive">

								<table id="file-export"
									class="table table-bordered dataTable no-footer dairy-table-border">
									<thead>
										<tr class="dairy-table-head">
											<th>${empty messages[239] ? 'Name' : messages[239]}</th>
											<th>${empty messages[240] ? 'Date' : messages[240]}</th>
											<th>${empty messages[248] ? 'Type Of Transaction' : messages[248]}</th>
											<th>${empty messages[66] ? 'Contact' : messages[66]}</th>
											<th>${empty messages[244] ? 'Amount' : messages[244]} </th>
											<th>${empty messages[69] ? ' Remark' : messages[69]}</th>
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