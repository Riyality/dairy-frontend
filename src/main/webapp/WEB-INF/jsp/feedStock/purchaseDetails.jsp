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
		        <div class="card-title">Feed Stock Purchase Details</div>
		      </div>
		      <div class="card-body">
		        <div class="table-responsive">
		     
      				<%-- <jsp:include page="../modules/dataTableHeader.jsp" /> --%>
		           	 <table id="file-export" class="table table-bordered dataTable no-footer dairy-table-border">
		              <thead>
		                <tr class="dairy-table-head">
		                  <th>Suppliers Name</th>
		                  <th>Purchase Date</th>
		                  <th>Feed Company</th>
		                  <th>Feed Type</th>
		                  <th>Feed Cost</th>
		                  <th>Total Quantity</th>
		                  <th>Total Amount</th>
		                  <th>Remark</th>
		                  <th>Action</th>
		                  </tr>
		              </thead>
		              <tbody>
		              
		                <c:forEach items="${FeedStocks}" var="feedstock">
                          <tr class="gridjs-tr">
                            <td>${feedstock.supplierName}</td>
                            <td>${feedstock.dateOfPurchase}</td>
                             <td>${feedstock.feedCompanyName}</td>
                            <td>${feedstock.feedTypeName}</td>
                            <td>${feedstock.feedCostPerUnit}</td>
                            <td>${feedstock.quantity}</td>
                            <td>${feedstock.totalAmount}</td>
                             <td>${feedstock.remark}</td>
                            <td>
                              <a href="http://localhost:6161/feedStock/${feedstock.id}">
                                <i class="ti ti-color-picker" style="font-size: 14px">Edit</i>
                              </a>
                            </td>
                          </tr>
                        </c:forEach>
		              
		              </tbody>
		            </table>
		            <div class="col-6">
                          <a href="http://localhost:6161/feedStock/add-feedStock-page"><button class="btn btn-primary dairy-form-btn" >Back</button></a>
                      </div>
		        </div>
		      </div>
		    </div>
		  </div>
		</div>
      
      
    </div>
  </div>
  <jsp:include page="../modules/footer.jsp" />