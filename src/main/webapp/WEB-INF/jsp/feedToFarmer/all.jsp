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
		        <div class="card-title">All Feed To  Farmers</div>
		       
		      </div>
		      <div class="card-body">
		        <div class="table-responsive">
		     
      				<%-- <jsp:include page="../modules/dataTableHeader.jsp" /> --%>
		           
		            <table id="file-export" class="table table-bordered dataTable no-footer dairy-table-border">
		              <thead>
		                <tr class="dairy-table-head">
		                      <th>Farmer Name</th>
		                      <th>Feed Company</th>
		                      <th>Feed Type</th>
		                      <th>Quantity</th>
		                      <th>Rate per Unit</th>
		                      <th>Total Amount</th>
		                      <th></th>
		                      <th>Action</th>
		                  </tr>
		              </thead>
		              <tbody>
		              
		                <c:forEach items="${feedToFarmers}" var="feedToFarmer">
                          <tr class="gridjs-tr">
                            <td>${feedToFarmer.farmerName }</td>
                             <td>${feedToFarmer.feedCompanyName }</td>
                              <td>${feedToFarmer.feedTypeName }</td>
                              <td>${feedToFarmer.quantity }</td>
                               <td>${feedToFarmer.feedRate}</td>
                                <td>${feedToFarmer.totalAmount }</td>
                            <td>
                              <a href="http://localhost:6161/feedTofarmers/${feedToFarmer.id }">
                                   <button class="btn btn-sm btn-primary dairy-form-btn">Check Feed Data</button>
                              </a>
                            </td>
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