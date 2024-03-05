<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%><%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%><%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="../modules/header.jsp" />

<body>
  <div class="main-content app-content">
    <div class="container-fluid">
      <div class="row">
		  <div class="col-11 mx-auto mt-4">
		    <div class="card custom-card">
		      <div class="card-header dairy-card-header">
		        <div class="card-title">All Payments</div>
		      </div>
		      <div class="card-body">
		        <div class="table-responsive">
		     
      				<%-- <jsp:include page="../modules/dataTableHeader.jsp" /> --%>
		           
		            <table id="file-export" class="table table-bordered dataTable no-footer dairy-table-border">
		              <thead>
		                <tr class="dairy-table-head">
		                    <th>Farmer Name</th>
		                  <th>Invoice Date</th>               
		                  <th>Total Milk Quantity</th>
		                  <th>Total Payment Amount</th>
		                  <th>From Date</th>
		                  <th>To Date</th>
		                  </tr>
		              </thead>
		              <tbody>
		              
						<c:forEach items="${payment}" var="paymentList">
                          <tr class="gridjs-tr">
                            <td>${paymentList.farmerName}</td>
                            <td>${paymentList.invoice_date}</td>                                                
                            <td>${paymentList. total_collected_milk}</td>
                              <td>${paymentList.amount}</td>
                             <td>${paymentList.from_date}</td>
                             <td>${paymentList.to_date}</td>
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