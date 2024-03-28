<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%><%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="../modules/header.jsp" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	
<body>
  <div class="main-content app-content">
    <div class="container-fluid">
      <div class="row">
		  <div class="col-11 mx-auto mt-4">
		    <div class="card custom-card">
		      <div class="card-header dairy-card-header">
		        <div class="card-title">${empty messages[210] ? 'All Advance Details' : messages[210]}</div>
		      </div>
		      <div class="card-body">
		      
		       <jsp:include page="../successMessage/message.jsp" />
		      
		        <div class="table-responsive">
		     
      				<%-- <jsp:include page="../modules/dataTableHeader.jsp" /> --%>
		           
		            <table id="file-export" class="table table-bordered dataTable no-footer dairy-table-border">
		              <thead>
		                <tr class="dairy-table-head">
		                  <th>${empty messages[116] ? '  Farmer Name' : messages[116]}</th>
		                  <th>${empty messages[209] ? 'Advance Amount' : messages[209]}</th>
		                  <th>${empty messages[211] ? 'Remaining Amount' : messages[211]}</th>
		                  <th>${empty messages[208] ? ' Date Of Advance' : messages[208]}</th>
		                  <th>${empty messages[69] ? ' Remark' : messages[69]}</th>
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
                      <a href="http://localhost:6161/advanceToFarmer/advanceToFarmer-add-page"><button class="btn btn-primary dairy-form-btn" >${empty messages[79] ? ' Back' : messages[79]}</button></a>
                   </div>
		            
		        </div>
		      </div>
		    </div>
		  </div>
		</div>
      
      
    </div>
  </div>
  <jsp:include page="../modules/footer.jsp" />