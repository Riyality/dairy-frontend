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
		        <div class="card-title">All Farmers Animal</div>
		      </div>
		      <div class="card-body">
		      
		       <jsp:include page="../successMessage/message.jsp" />
		       
		        <div class="table-responsive">
		           
		            <table id="file-export" class="table table-bordered dataTable no-footer dairy-table-border">
		              <thead>
		                <tr class="dairy-table-head">
		                  <th>${empty messages[116] ? '  Farmer Name' : messages[116]}</th>
		                  <th>${empty messages[86] ? 'Milk Type' : messages[86]}</th>
		                  <th>${empty messages[235] ? 'Conut' : messages[235]} </th>
		                   <th>${empty messages[69] ? ' Remark' : messages[69]}</th>
		                  <th>Action</th>
		                  </tr>
		              </thead>
		              <tbody>
		              
		                <c:forEach items="${farmerAnimal}" var="animal">
                          <tr class="gridjs-tr">
                            <td>${animal.farmerName}</td>
                            <td>${animal.type}</td>
                             <td>${animal.count}</td>
                              <td>${animal.remark}</td>
                            <td>
                              <a href="http://localhost:6161/farmerAnimalMapping/${animal.id}">
                              <button>Edit</button>
                                <i class="ti ti-color-picker" style="font-size: 14px"></i>
                              </a>
                            </td>
                          </tr>
                        </c:forEach>
		              
		              </tbody>
		            </table>
		            <div class="col-6">
                      <a href="http://localhost:6161/farmerAnimalMapping/add-animal-page"><button class="btn btn-primary dairy-form-btn" >${empty messages[79] ? ' Back' : messages[79]}</button></a>
                   </div>
		        </div>
		      </div>
		    </div>
		  </div>
		</div>
      
      
    </div>
  </div>
  <jsp:include page="../modules/footer.jsp" />