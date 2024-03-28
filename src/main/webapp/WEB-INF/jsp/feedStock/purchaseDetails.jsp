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
		        <div class="card-title">${empty messages[161] ? 'Feed Stock Purchase Details' : messages[161]}</div>
		      </div>
		      <div class="card-body">
		      <jsp:include page="../successMessage/message.jsp" />
		        <div class="table-responsive">
		     
      				<%-- <jsp:include page="../modules/dataTableHeader.jsp" /> --%>
		           	 <table id="file-export" class="table table-bordered dataTable no-footer dairy-table-border">
		              <thead>
		                <tr class="dairy-table-head">
		                  <th>${empty messages[154] ? 'Supplier Name' : messages[154]}</th>
		                  <th>${empty messages[108] ? 'Purchase Date' : messages[108]}</th>
		                  <th>${empty messages[15] ? ' Feed Company' : messages[15]}</th>
		                  <th>${empty messages[131] ? 'Feed Tye ' : messages[131]}</th>
		                  <th>${empty messages[110] ? 'Price Per Unit' : messages[110]}</th>
		                  <th>${empty messages[109] ? 'Total Quantity' : messages[109]} </th>
		                  <th>${empty messages[97] ? 'Total  Amount' : messages[97]}</th>
		                  <th>${empty messages[69] ? ' Remark' : messages[69]}</th>
		                  <th>Action</th>
		                  </tr>
		              </thead>
		              <tbody>
		              
		                <c:forEach items="${FeedStocks}" var="feedstock">
                          <tr class="gridjs-tr">
                            <td>${feedstock.supplierName}</td>
                            <td>${feedstock.dateOfPurchase}</td>
                             <td>${feedstock.feedCompanyName}</td>
                            <td>${feedstock.feedTypeName}</td>
                            <td>${feedstock.feedCostPerUnit}</td>
                            <td>${feedstock.quantity}</td>
                            <td>${feedstock.totalAmount}</td>
                             <td>${feedstock.remark}</td>
                            <td>
                              <a href="http://localhost:6161/feedStock/${feedstock.id}">
                                <i class="ti ti-color-picker" style="font-size: 14px">Edit</i>
                              </a>
                            </td>
                          </tr>
                        </c:forEach>
		              
		              </tbody>
		            </table>
		            <div class="col-6">
                          <a href="http://localhost:6161/feedStock/add-feedStock-page"><button class="btn btn-primary dairy-form-btn">${empty messages[79] ? ' Back' : messages[79]}</button></a>
                      </div>
		        </div>
		      </div>
		    </div>
		  </div>
		</div>
      
      
    </div>
  </div>
  <jsp:include page="../modules/footer.jsp" />