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
		        <div class="card-title">${empty messages[105] ? 'All Main Branches' : messages[105]}</div>
					 
		      </div>
		      <div class="card-body">
		       <jsp:include page="../successMessage/message.jsp" />
		        <div class="table-responsive">
		     
      				<%-- <jsp:include page="../modules/dataTableHeader.jsp" /> --%>
		           
		            <table id="file-export" class="table table-bordered dataTable no-footer dairy-table-border">
		              <thead>
		                <tr class="dairy-table-head">
		                      <th>${empty messages[85] ? 'Branch Name' : messages[85]}</th>
			                  <th>${empty messages[106] ? 'Date Of Collection' : messages[106]}</th>
			                  <th>${empty messages[89] ? 'Shift' : messages[89]}</th>
			                  <th>${empty messages[86] ? 'Milk Type' : messages[86]}</th>
			                  <th>${empty messages[93] ? 'Average Fat' : messages[93]} </th>
			                  <th>${empty messages[94] ? 'Average SNF' : messages[94]}</th>
			                  <th>${empty messages[95] ? 'Protein' : messages[95]}</th>
			                  <th>${empty messages[92] ? 'Milk Quantity' : messages[92]} </th>
			                  <th>${empty messages[96] ? 'Milk Rate' : messages[96]}</th>
			                  <th>${empty messages[97] ? 'Total  Amount' : messages[97]}</th>
			                   <th>${empty messages[69] ? ' Remark' : messages[69]}</th>
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
		              <div class="col-6">
                          <a href="http://localhost:6161/mainBranchs/add-mainBranch-page"><button class="btn btn-primary dairy-form-btn" >${empty messages[79] ? ' Back' : messages[79]}</button></a>
                      </div>
		        </div>
		      </div>
		    </div>
		  </div>
		</div>
      
      
    </div>
  </div>
  <jsp:include page="../modules/footer.jsp" />