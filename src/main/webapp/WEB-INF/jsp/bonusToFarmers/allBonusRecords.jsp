<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%><%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="../modules/header.jsp" />

  <div class="main-content app-content">
    <div class="container-fluid">
        <div class="row">
            <div class="col-11 mx-auto mt-4">
                <div class="card custom-card">
                    <div class="card-header dairy-card-header">
                        <div class="card-title">${empty messages[232] ? ' Bonus Records' : messages[232]}</div>
                        <div class="ms-auto">
                        <a href="http://localhost:6161/bonusToFarmer/page"><button class="btn btn-primary dairy-form-btn bonusBtn">${empty messages[79] ? ' Back' : messages[79]}</button></a>
                        </div>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table id="file-export-bonus" class="table table-bordered dataTable no-footer dairy-table-border">
                                <thead>
                                    <tr class="dairy-table-head">
                                        <th><input type="checkbox" id="selectAll"></th>
                                        <th>${empty messages[231] ? 'Bonus Date' : messages[231]}</th>
                                        <th>${empty messages[116] ? '  Farmer Name' : messages[116]}</th>
                                        <th>${empty messages[92] ? 'Total Milk Quantity' : messages[92]}</th>
                                        <th>${empty messages[228] ? 'Bonus Amount Per Litre' : messages[228]}</th>
                                        <th>${empty messages[229] ? 'Total Bonus Amount' : messages[229]}</th>
                                         <th>${empty messages[187] ? 'Date From' : messages[187]}</th>
                                        <th>${empty messages[189] ? 'Date To' : messages[189]}</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${list}" var="bonusList">
                                        <tr class="gridjs-tr">
                                            <td><input type="checkbox" value="${bonusList.farmerId}"data-farmer-id="${bonusList.farmerId}"></td>
                                            <td>${bonusList.bonusDate}</td>
                                            <td>${bonusList.farmerName}</td>
                                            <td>${bonusList.totalQuantity}</td>
                                            <td>${bonusList.bonusAmountPerLiter}</td>
                                            <td>${bonusList.totalBonusAmount}</td>
                                            <td>${bonusList.fromDate}</td>
                                            <td>${bonusList.toDate}</td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>

                           <div class="col-md-12 text-right">
                                <form class="mt-2 col-4" id="pdfFormBonus" action="generatePdfBonus" method="get" target="pdfIframeBonus">
                                    <button type="submit">${empty messages[233] ? 'Generate Pdf' : messages[233]}</button>
                                </form>
                            </div> 
                            <!-- Display PDF in iframe -->
                            <iframe id="pdfIframeBonus" name="pdfIframeBonus" width="100%" height="500"></iframe>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <jsp:include page="../modules/footer.jsp" />
</div>  
   </body>
  