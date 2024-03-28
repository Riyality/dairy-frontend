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
		        <div class="card-title">${empty messages[40] ? 'All Payments' : messages[40]}</div>
		      </div>
		      <div class="card-body">
		        <div class="table-responsive">
		     
      				<%-- <jsp:include page="../modules/dataTableHeader.jsp" /> --%>
		           
		            <table id="file-export" class="table table-bordered dataTable no-footer dairy-table-border">
		              <thead>
		                <tr class="dairy-table-head">
		                    <th>${empty messages[116] ? '  Farmer Name' : messages[116]}</th>
		                  <th>${empty messages[193] ? 'Payment Date' : messages[193]}</th>               
		                  <th>${empty messages[92] ? ' Total Milk Quantity' : messages[92]}</th>
		                  <th>${empty messages[206] ? 'Total Payment Amount' : messages[206]}</th>
		                  <th>${empty messages[187] ? 'From Date' : messages[187]}</th>
		                  <th>${empty messages[189] ? 'To Date' : messages[189]}</th>
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