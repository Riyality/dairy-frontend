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
		        <div class="card-title">All Branches</div>
		      </div>
		      <div class="card-body">
		       <jsp:include page="../successMessage/message.jsp" />
		       
		        <div class="table-responsive">
		     
      				<%-- <jsp:include page="../modules/dataTableHeader.jsp" /> --%>
		           
		            <table id="file-export" class="table table-bordered dataTable no-footer dairy-table-border">
		              <thead>
		                <tr class="dairy-table-head">
		                  <th>Branch Name</th>
		                  <th>Owner Name</th>
		                  <th>Owner Contact</th>
		                  <th>Start Date</th>
		                  <th>Address</th>
		                   <th>Remark</th>
		                  <th>Action</th>
		                  </tr>
		              </thead>
		              <tbody>
		              
		                <c:forEach items="${branches}" var="branch">
                          <tr class="gridjs-tr">
                            <td>${branch.name}</td>
                            <td>${branch.owner}</td>
                            <td>${branch.ownerContact}</td>
                            <td>${branch.startDate}</td>
                            <td>${branch.address}</td>
                            <td>${branch.remark}</td>
                            <td>
                              <a href="http://localhost:6161/branches/${branch.id }">
                                <i class="ti ti-color-picker" style="font-size: 14px">Edit</i>
                              </a>
                            </td>
                          </tr>
                        </c:forEach>
		              
		              </tbody>
		            </table>
		            <div class="col-6">
                       <a href="http://localhost:6161/branches/add-branch-page"><button class="btn btn-primary dairy-form-btn" >Back</button></a>
                    </div>
		        </div>
		      </div>
		    </div>
		  </div>
		</div>
      
      
    </div>
  </div>
  <jsp:include page="../modules/footer.jsp" />