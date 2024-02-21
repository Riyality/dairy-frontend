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
		        <div class="card-title">Milk Collection</div>
					 
		      </div>
		      <div class="card-body">
		        <div class="table-responsive">
		     
      				<%-- <jsp:include page="../modules/dataTableHeader.jsp" /> --%>
		           
		            <table id="file-export" class="table table-bordered dataTable no-footer dairy-table-border">
		              <thead>
		                <tr class="dairy-table-head">
		                      <th>MainBranch Name</th>
			                  <th>Date Of Collection</th>
			                  <th>Shift</th>
			                  <th>Milk Type</th>
			                  <th>Avg. Fat</th>
			                  <th>Avg. SNF</th>
			                  <th>Protien</th>
			                  <th>Total Milk</th>
			                  <th>Milk Rate</th>
			                  <th>Total Amount</th>
			                   <th>Remark</th>
			                  <th>Action</th>
		                  </tr>
		              </thead>
		              <tbody>
		              
		                <c:forEach items="${mainBranches}" var="mainBranch">
                          <tr class="gridjs-tr">
                            <td>${mainBranch.name }</td>
                            <td>${mainBranch.dateOfCollection }</td>
                            <td>${mainBranch.shift }</td>
                            <td>${mainBranch.type }</td>
                            <td>${mainBranch.fat }</td>
                            <td>${mainBranch.snf }</td>
                            <td>${mainBranch.protein }</td>
                            <td>${mainBranch.quantity }</td>
                            <td>${mainBranch.rate }</td>
                            <td>${mainBranch.totalAmount }</td>
                            <td>${mainBranch.remark}</td>
                            <td>
                              <a href="http://localhost:6161/mainBranchs/${mainBranch.id }">
                                 <button>Edit</button>
                                <i class="ti ti-eye" style="font-size: 14px"></i>
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