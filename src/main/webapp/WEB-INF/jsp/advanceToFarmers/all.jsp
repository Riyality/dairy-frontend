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
		        <div class="card-title">All AdvanceDetails</div>
		      </div>
		      <div class="card-body">
		        <div class="table-responsive">
		     
      				<%-- <jsp:include page="../modules/dataTableHeader.jsp" /> --%>
		           
		            <table id="file-export" class="table table-bordered dataTable no-footer dairy-table-border">
		              <thead>
		                <tr class="dairy-table-head">
		                  <th>Farmer Name</th>
		                  <th>Advance Amount</th>
		                  <th>Remaining Amount</th>
		                  <th>Date</th>
		                  <th>Remark</th>
		                  <th>Action</th>
		                  </tr>
		              </thead>
		              <tbody>
		              
		                <c:forEach items="${advances}" var="advanceTofarmer">
                          <tr class="gridjs-tr">
                            <td>${advanceTofarmer.farmerName}</td>
                            <td>${advanceTofarmer.amount}</td>
                              <td>${advanceTofarmer.remainingAmount}</td>
                            <td>${advanceTofarmer.dateOfAdvance}</td>
                            <td>${advanceTofarmer.remark}</td>
                            <td>
                              <a href="http://localhost:6161/advanceToFarmer/${advanceTofarmer.id}">
                                <i class="ti ti-color-picker" style="font-size: 14px">Edit</i>
                              </a>
                            </td>
                          </tr>
                        </c:forEach>
		              
		              </tbody>
		            </table>

                  <div class="col-6">
                      <a href="http://localhost:6161/advanceToFarmer/advanceToFarmer-add-page"><button class="btn btn-primary dairy-form-btn" >Back</button></a>
                   </div>
		            
		        </div>
		      </div>
		    </div>
		  </div>
		</div>
      
      
    </div>
  </div>
  <jsp:include page="../modules/footer.jsp" />