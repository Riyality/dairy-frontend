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
		        <div class="card-title">${empty messages[164] ? 'Rootwise Farmers' : messages[164]}</div>
		        
		             <div class="col-md-3 ms-auto">
			             <select class="form-select dairy-form-input" name="name" id="routeName">
							<option value="" selected="selected" disabled="disabled">${empty messages[165] ? 'Select Route' : messages[165]}</option>
							    <c:forEach items="${routes}" var="route">
								  <option value="${route.id}">${route.name}</option> 
								</c:forEach>
						 </select>
					 </div>
					 
		      </div>
		      <div class="card-body">
		        <div class="table-responsive">
		     
      				<%-- <jsp:include page="../modules/dataTableHeader.jsp" /> --%>
		           
		            <table id="file-export" class="table table-bordered dataTable no-footer dairy-table-border">
		              <thead>
		                <tr class="dairy-table-head">
		                      <th>${empty messages[166] ? 'Farmer Name' : messages[166]}</th>
			                  <th>Action</th>
		                  </tr>
		              </thead>
		              <tbody id="milkTableBody">
		                
		                	<%-- <c:choose>
			                	<c:when test="${dataFromController == true}">
				                	<c:forEach items="${list}" var="farmer">
			                          <tr class="gridjs-tr">
			                            <td id="farmerName">${farmer.name }</td>
			                            <td>
			                              <a href="http://localhost:6161/milkCollection/add-milkCollection-page/${farmer.id }/${farmer.name }">
			                                   <button class="btn btn-sm btn-primary dairy-form-btn">Collect Milk 1</button>
			                              </a>
			                              <a href="http://localhost:6161/milkCollection/${farmer.id }">
			                                   <button class="btn btn-sm btn-danger dairy-form-btn">Distribute Feed</button>
			                              </a>
			                            </td>
			                          </tr>
			                        </c:forEach>
			                	</c:when>
		                	
		                	</c:choose> --%>
		              
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