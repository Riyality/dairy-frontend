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
		        <div class="card-title">${empty messages[12] ? ' All Feed Distribution' : messages[12]}</div>
		       
		      </div>
		      <div class="card-body">
		      
		        <jsp:include page="../successMessage/message.jsp" />
		        <div class="table-responsive">
		     
      				<%-- <jsp:include page="../modules/dataTableHeader.jsp" /> --%>
		           
		            <table id="file-export" class="table table-bordered dataTable no-footer dairy-table-border">
		              <thead>
		                <tr class="dairy-table-head">
		                      <th>${empty messages[116] ? '  Farmer Name' : messages[116]}</th>
		                      <th>${empty messages[118] ? 'Feed Company' : messages[118]}</th>
		                      <th>${empty messages[120] ? 'Feed Tye' : messages[120]}</th>
		                      <th>${empty messages[109] ? 'Quantity' : messages[109]}</th>
		                      <th>${empty messages[110] ? 'Price Per Unit' : messages[110]}</th>
		                      <th>${empty messages[97] ? 'Total  Amount' : messages[97]}</th>
							  <th>${empty messages[121] ? 'Amount  Paid' : messages[121]}</th>
							  <th>${empty messages[122] ? 'Remaining  Amount' : messages[122]}</th>
		                      <th>${empty messages[69] ? ' Remark' : messages[69]}</th>
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
								<td>${feedToFarmer.paidAmount }</td>
								<td>${feedToFarmer.remainingAmount }</td>
								<td>${feedToFarmer.remark }</td>
                            <td>
                              <a href="http://localhost:6161/feedToFarmers/${feedToFarmer.id }">
                                   <button class="btn btn-sm btn-primary dairy-form-btn">Edit</button>
                              </a>
                            </td>
                          </tr>
                        </c:forEach>
		              
		              </tbody>
		            </table>
		             <div class="col-6">

                          <a href="http://localhost:6161/feedToFarmers/add-feedStock-page"><button class="btn btn-primary dairy-form-btn" >${empty messages[79] ? ' Back' : messages[79]}</button></a>

                      </div>
		        </div>
		      </div>
		    </div>
		  </div>
		</div>
      
      
    </div>
  </div>
  <jsp:include page="../modules/footer.jsp" />