<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%><%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%><%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="../modules/header.jsp" />

  <div class="main-content app-content">
    <div class="container-fluid">
        <div class="row">
            <div class="col-11 mx-auto mt-4">
                <div class="card custom-card">
                    <div class="card-header dairy-card-header">
                        <div class="card-title">Bonus Records</div>
                        <div class="ms-auto">
                        <a href="http://localhost:6161/bonusToFarmer/page"><button class="btn btn-primary dairy-form-btn bonusBtn">Back</button></a>
                        </div>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table id="file-export-bonus" class="table table-bordered dataTable no-footer dairy-table-border">
                                <thead>
                                    <tr class="dairy-table-head">
                                        <th><input type="checkbox" id="selectAll"></th>
                                        <th>FormDate</th>
                                        <th>ToDate</th>
                                        <th>Farmer Name</th>
                                        <th>TotalMilkQuntity</th>
                                        <th>Bonus Per Liter</th>
                                        <th>Total Bonus Amount</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${list}" var="bonusList">
                                        <tr class="gridjs-tr">
                                            <td><input type="checkbox" value="${bonusList.farmerId}"data-farmer-id="${bonusList.farmerId}"></td>
                                            <td>${bonusList.fromDate}</td>
                                            <td>${bonusList.toDate}</td>
                                            <td>${bonusList.farmerName}</td>
                                            <td>${bonusList.totalQuantity}</td>
                                            <td>${bonusList.bonusAmountPerLiter}</td>
                                            <td>${bonusList.totalBonusAmount}</td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>

                           <div class="col-md-12 text-right">
                                <form class="mt-2 col-4" id="pdfFormBonus" action="generatePdfBonus" method="get" target="pdfIframeBonus">
                                    <button type="submit">Generate PDF</button>
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
  