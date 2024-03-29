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
							<div class="card-title">All Transaction</div>
						</div>
						<div class="card-body">
						 <jsp:include page="../successMessage/message.jsp" />
							<div class="table-responsive">

								<table id="file-export"
									class="table table-bordered dataTable no-footer dairy-table-border">
									<thead>
										<tr class="dairy-table-head">
											<th>${empty messages[239] ? 'Name' : messages[239]}</th>
											<th>${empty messages[66] ? 'Contact' : messages[66]}</th>
											<th>${empty messages[240] ? 'Date Of Transaction' : messages[240]}</th>
											<th>${empty messages[248] ? 'Type Of Transaction' : messages[248]}</th>
											<th>${empty messages[244] ? 'Amount' : messages[244]}</th>
											<th>${empty messages[249] ? 'Balance' : messages[249]}</th>
											<th>${empty messages[69] ? ' Remark' : messages[69]}</th>

										</tr>
									</thead>
									<tbody>

										<c:forEach items="${dairyMangerUpdate}" var="dairy">
											<tr class="gridjs-tr">
												<td>${dairy.dairyManagerResponseDto.name}</td>
												<td>${dairy.dairyManagerResponseDto.contact}</td>
												<td>${dairy.dateTransaction}</td>
												<td>${dairy.transactionType}</td>
												<td>${dairy.dairyManagerResponseDto.amount}</td>
												<td>${dairy.balance}</td>
												<td>${dairy.remark}</td>
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