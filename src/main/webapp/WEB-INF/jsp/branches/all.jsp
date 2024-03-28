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
		        <div class="card-title">${empty messages[75] ? 'All Branches' : messages[75]}</div>
		      </div>
		      <div class="card-body">
		       <jsp:include page="../successMessage/message.jsp" />
		       
		        <div class="table-responsive">
		     
      				<%-- <jsp:include page="../modules/dataTableHeader.jsp" /> --%>
		           
		            <table id="file-export" class="table table-bordered dataTable no-footer dairy-table-border">
		              <thead>
		                <tr class="dairy-table-head">
		                  <th>${empty messages[64] ? 'Branch  Name' : messages[64]}</th>
		                  <th>${empty messages[65] ? ' Owner Name' : messages[65]}</th>
		                  <th>${empty messages[66] ? ' Owner Contact' : messages[66]}</th>
		                  <th>${empty messages[67] ? ' Start Date' : messages[67]}</th>
		                  <th>${empty messages[68] ? ' Address' : messages[68]}</th>
		                   <th>${empty messages[69] ? ' Remark' : messages[69]}</th>
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
                       <a href="http://localhost:6161/branches/add-branch-page"><button class="btn btn-primary dairy-form-btn" >${empty messages[79] ? ' Back' : messages[79]}</button></a>
                    </div>
		        </div>
		      </div>
		    </div>
		  </div>
		</div>
      
      
    </div>
  </div>
  <jsp:include page="../modules/footer.jsp" />