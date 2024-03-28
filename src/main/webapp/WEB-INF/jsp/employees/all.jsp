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
		        <div class="card-title">${empty messages[151] ? 'All Employees' : messages[151]}</div>
		      </div>
		      <div class="card-body">
		        <div class="table-responsive">
		     
      				<%-- <jsp:include page="../modules/dataTableHeader.jsp" /> --%>
		           
		            <table id="file-export" class="table table-bordered dataTable no-footer dairy-table-border">
		              <thead>
		                <tr class="dairy-table-head">
		                  <th>${empty messages[136] ? 'Employee Name' : messages[136]}</th>
		                  <th>${empty messages[137] ? 'Date Of Joining' : messages[137]}</th>
		                  <th>${empty messages[138] ? 'Employee Role' : messages[138]}</th>
		                  <th>${empty messages[139] ? 'Employee Contact' : messages[139]}</th>
		                  <th>${empty messages[140] ? 'Bank' : messages[140]}</th>
		                  <th>${empty messages[64] ? ' Branch' : messages[64]}</th>
		                  <th>${empty messages[141] ? 'Account Number' : messages[141]}</th>
		                  <th>${empty messages[142] ? 'IFSC Code' : messages[142]}</th>
		                  <th>${empty messages[143] ? 'UPI Code' : messages[143]}</th>
		                  <th>${empty messages[68] ? ' Address' : messages[68]}</th>
		                   <th>${empty messages[69] ? ' Remark' : messages[69]}</th>
		                  <th>Action</th>
		                  </tr>
		              </thead>
		              <tbody>
		              
						<c:forEach items="${employee}" var="employee">
                          <tr class="gridjs-tr">
                            <td>${employee.name}</td>
                            <td>${employee.dateOfJoining}</td>
                            <td>${employee.role}</td>
                            <td>${employee.contact}</td>
                            <td>${employee.bankName}</td>
                            <td>${employee.bankBranchName}</td>
                            <td>${employee.accountNumber}</td>
                            <td>${employee.ifscCode}</td>
                            <td>${employee.upiId}</td>
                            <td>${employee.address}</td>
                            <td>${employee.remark}</td>
                            <td>
                              <a href="http://localhost:6161/employee/${employee.id }">
                                <i class="ti ti-color-picker" style="font-size: 14px">Edit</i>
                              </a>
                            </td>
                          </tr>
                        </c:forEach>
		              
		              </tbody>
		            </table>
                    <div class="col-6">
                       <a href="http://localhost:6161/employee/add-employee-page"><button class="btn btn-primary dairy-form-btn" >${empty messages[79] ? ' Back' : messages[79]}</button></a>
                    </div>
		        </div>
		      </div>
		    </div>
		  </div>
		</div>
      
      
    </div>
  </div>
  <jsp:include page="../modules/footer.jsp" />