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
		        <div class="card-title">Milk Collection</div>
		        
		             <div class="col-md-3 ms-auto">
			             <select class="form-select dairy-form-input" name="" id="">
							<option value="" selected="selected" disabled="disabled">Select Animal Type</option>
							<option value="1">Buffalo</option> 
							<option value="1">Cow</option> 
						 </select>
					 </div>
					 
		      </div>
		      <div class="card-body">
		        <div class="table-responsive">
		     
      				<%-- <jsp:include page="../modules/dataTableHeader.jsp" /> --%>
		           
		            <table id="file-export" class="table table-bordered dataTable no-footer dairy-table-border">
		              <thead>
		                <tr class="dairy-table-head">
		                      <th>Farmer Name</th>
			                  <th>Animal Type</th>
			                  <th>Milk Start From</th>
			                  <th>Avg. Fat</th>
			                  <th>Avg. SNF</th>
			                  <th>Total Milk</th>
			                  <th>Action</th>
		                  </tr>
		              </thead>
		              <tbody>
		              
		                <c:forEach items="${branches}" var="branch">
                          <tr class="gridjs-tr">
                            <td>Chandu Chavan</td>
                            <td>Cow</td>
                            <td>22/12/2022</td>
                            <td>4.1</td>
                            <td>6.7</td>
                            <td>1244.7</td>
                            <td>
                              <a href="http://localhost:6161/branches/${branch.id }">
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