<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="../modules/header.jsp" />
<style>
</style>
<body>
    <div class="main-content app-content p-4">
        <div class="container-fluid">
            <div class="row">
                <div class="col-10 m-auto">
                    <div class="card custom-card">
                        <div class="card-header justify-content-between dairy-card-header">
                            <div class="card-title">Bonus To Farmer</div>
                        </div>
                        <div class="card-body dairy-card-body">
                            <form id="filterForm" class="row g-3 needs-validation" novalidate>
                                <div class="col-md-6">
                                    <label class="form-label dairy-input-label">Select From Date</label>
                                    <input type="date" class="form-control dairy-form-input" id="fromDate" name="fromDate" >
                                </div>

                                <div class="col-md-6">
                                    <label class="form-label dairy-input-label">Select To of Date</label>
                                    <input type="date" class="form-control dairy-form-input" id="toDate" name="toDate" >
                                </div>
                                 <div class="col-md-6">
                                    <label class="form-label dairy-input-label">Bonus Amount Per Liter</label>
                                    <input type="text" class="form-control dairy-form-input" name="bonusAmountPerLiter" id="bonusAmountPerLiter" placeholder="Enter Bonus amont per liter" name="toDate" >
                                </div>
                                 <div class="col-md-6">
                                    <label class="form-label dairy-input-label">Milk Type</label><br>
                                    <input  class="form-check-input" type="radio"   name="milkType" value="cow" />Cow
                                    <input  class="form-check-input" type="radio"  name="milkType" value="baffalo" />Buffalo
                                </div>
                                <div class="col-12">
                                   <button class="btn btn-primary dairy-form-btn" type="button" id="getFarmerRecords"  data-flag="bonusFlag">Get Records </button>

                                </div>
                            </form>

                            <table id="file-export" class="table table-bordered dataTable no-footer dairy-table-border mt-2">
                                <thead>
                                    <tr class="dairy-table-head">
                                        <th>Select </th>
                                        <th>Farmer Name</th>
                                         <th>Quantity</th>
                                        <th>Amount</th>
                                        <th>Bonus Amount</th>
                                    </tr>
                                </thead>
                                <tbody >
                                </tbody>
                            </table>
                            <form class="mt-2" id="pdfForm" action="generatePdfBonus" method="get" target="pdfIframe">
                                <input type="hidden" name="fromDate" />
                               <input type="hidden" name="toDate" />
                              <input type="hidden" name="milkType" />
                                <input type="hidden" name="bonusAmountPerLiter" />
                              <button type="submit">Generate PDF</button>
                          </form>
                            

                            <!-- Display PDF in iframe -->
                            <iframe id="pdfIframe" name="pdfIframe" width="100%" height="500"></iframe>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <jsp:include page="../modules/footer.jsp" />

  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

</body>




