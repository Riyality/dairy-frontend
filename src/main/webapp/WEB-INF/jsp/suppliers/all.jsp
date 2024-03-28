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
		        <div class="card-title">${empty messages[157] ? 'All Suppliers' : messages[157]}</div>
		      </div>
		      <div class="card-body">
		        <div class="table-responsive">
		     
      				<%-- <jsp:include page="../modules/dataTableHeader.jsp" /> --%>
		           
		            <table id="file-export" class="table table-bordered dataTable no-footer dairy-table-border">
		              <thead>
		                <tr class="dairy-table-head">
		                  <th>${empty messages[154] ? 'Supplier Name' : messages[154]}</th>
		                  <th>${empty messages[137] ? 'Date Of Joining' : messages[137]}</th>
		                  <th>${empty messages[66] ? ' Contact' : messages[66]}</th>
		                  <th>${empty messages[140] ? 'Bank' : messages[140]}</th>
		                  <th>${empty messages[64] ? ' Branch' : messages[64]}</th>
		                  <th>${empty messages[141] ? 'Account Number' : messages[141]}</th>
		                  <th>${empty messages[142] ? 'IFSC Code' : messages[142]}</th>
		                  <th>${empty messages[143] ? 'UPI id' : messages[143]}</th>
		                  <th>${empty messages[68] ? ' Address' : messages[68]}</th>
		                  <th>${empty messages[69] ? ' Remark' : messages[69]}</th>
		                  <th>Action</th>
		                  </tr>
		              </thead>
		              <tbody>
		              
		                <c:forEach items="${suppliers}" var="supplier">
                          <tr class="gridjs-tr">
                            <td>${supplier.name}</td>
                            <td>${supplier.dateOfRegistration}</td>
                            <td>${supplier.contact}</td>
                            <td>${supplier.bankName}</td>
                            <td>${supplier.bankBranchName}</td>
                            <td>${supplier.accountNumber}</td>
                            <td>${supplier.ifscCode}</td>
                            <td>${supplier.upiId}</td>
                             <td>${supplier.address}</td>
                              <td>${supplier.remark}</td>
                            <td>
                              <a href="http://localhost:6161/suppliers/${supplier.id }">
                                <i class="ti ti-color-picker" style="font-size: 14px">Edit</i>
                              </a>
                            </td>
                          </tr>
                        </c:forEach>
		             
		              </tbody>
		            </table>
		            <div class="col-6">
                       <a href="http://localhost:6161/suppliers/add-supplier-page"><button class="btn btn-primary dairy-form-btn" >${empty messages[79] ? ' Back' : messages[79]}</button></a>
                 </div>
		        </div>
		      </div>
		    </div>
		  </div>
		</div>
      
      
    </div>
  </div>
  <jsp:include page="../modules/footer.jsp" />