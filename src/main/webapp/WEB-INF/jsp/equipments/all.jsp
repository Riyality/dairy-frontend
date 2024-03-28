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
		        <div class="card-title">${empty messages[11] ? ' All Equipments' : messages[11]}</div>
		      </div>
		      <div class="card-body">
		        <div class="table-responsive">
		     
      				<%-- <jsp:include page="../modules/dataTableHeader.jsp" /> --%>
		           
		            <table id="file-export" class="table table-bordered dataTable no-footer dairy-table-border">
		              <thead>
		                <tr class="dairy-table-head">
		                  <th>${empty messages[107] ? 'Equipment Name' : messages[107]}</th>
		                  <th>${empty messages[108] ? 'Date Of Purchase' : messages[108]}</th>
		                  <th>${empty messages[109] ? 'Quantity' : messages[109]}</th>
		                  <th>${empty messages[110] ? 'Price Per Unit' : messages[110]}</th>
		                  <th>${empty messages[97] ? 'Total  Amount' : messages[97]}</th>
		                   <th>${empty messages[69] ? ' Remark' : messages[69]}</th>
		                  <th>Action</th>
		                  </tr>
		              </thead>
		              <tbody>
		              
		                <c:forEach items="${equipments}" var="equipment">
                          <tr class="gridjs-tr">
                            <td>${equipment.name}</td>
                            <td>${equipment.dateOfPurchase}</td>
                            <td>${equipment.quantity}</td>
                            <td>${equipment.price}</td>
                            <td>${equipment.totalAmount}</td>
                             <td>${equipment.remark}</td>
                            <td>
                              <a href="http://localhost:6161/equipments/${equipment.id }">
                                <i class="ti ti-color-picker" style="font-size: 14px">Edit</i>
                              </a>
                            </td>
                          </tr>
                        </c:forEach>
		              
		              </tbody>
		            </table>
                     <div class="col-6">
                       <a href="http://localhost:6161/equipments/add-equipment-page"><button class="btn btn-primary dairy-form-btn" >${empty messages[79] ? ' Back' : messages[79]}</button></a>
                    </div>
		        </div>
		      </div>
		    </div>
		  </div>
		</div>
      
      
    </div>
  </div>
  <jsp:include page="../modules/footer.jsp" />