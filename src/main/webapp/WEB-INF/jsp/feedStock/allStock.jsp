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
		        <div class="card-title">${empty messages[162] ? 'All  Feed Stock' : messages[162]}</div>
		      </div>
		      <div class="card-body">
		        <div class="table-responsive">
		     
      				<%-- <jsp:include page="../modules/dataTableHeader.jsp" /> --%>
		           
		            <table id="file-export" class="table table-bordered dataTable no-footer dairy-table-border">
		              <thead>
		                <tr class="dairy-table-head">
		                 <th>${empty messages[127] ? 'Feed Company Name' : messages[127]}</th>
		                  <th>${empty messages[120] ? 'Feed Tye' : messages[120]}</th>
		                  <th>${empty messages[109] ? 'Quantity' : messages[109]}</th>
		                  </tr>
		              </thead>
		              <tbody>
		              
		                <c:forEach items="${FeedDetails}" var="feed">
                          <tr class="gridjs-tr">
                            <td>${feed.feedCompanyName}</td>
                            <td>${feed.feedTypeName}</td>
                            <td>${feed.quantity}</td>
                          </tr>
                        </c:forEach>
		              </tbody>
		            </table>
		            <div class="col-6">
                          <a href="http://localhost:6161/feedStock/add-feedStock-page"><button class="btn btn-primary dairy-form-btn" >${empty messages[79] ? ' Back' : messages[79]}</button></a>
                      </div>
		        </div>
		      </div>
		    </div>
		  </div>
		</div>
      
      
    </div>
  </div>
  <jsp:include page="../modules/footer.jsp" />