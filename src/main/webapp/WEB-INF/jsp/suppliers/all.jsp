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
		        <div class="card-title">All Suppliers</div>
		      </div>
		      <div class="card-body">
		        <div class="table-responsive">
		     
      				<%-- <jsp:include page="../modules/dataTableHeader.jsp" /> --%>
		           
		            <table id="file-export" class="table table-bordered dataTable no-footer dairy-table-border">
		              <thead>
		                <tr class="dairy-table-head">
		                  <th>Suppliers Name</th>
		                  <th>Date of Joining</th>
		                  <th>Suppliers Contact</th>
		                  <th>Bank</th>
		                  <th>Branch</th>
		                  <th>Account No.</th>
		                  <th>IFSC Code</th>
		                  <th>UPIId</th>
		                  <th>Address</th>
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
                            <td>
                              <a href="http://localhost:6161/suppliers/${supplier.id }">
                                <i class="ti ti-color-picker" style="font-size: 14px">Edit</i>
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