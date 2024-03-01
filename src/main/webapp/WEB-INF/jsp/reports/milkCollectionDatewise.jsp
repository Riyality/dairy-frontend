<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="../modules/header.jsp" />
<style>
  .hide-column {
      display: none;
  }
</style>
<body>
    <div class="main-content app-content p-4">
        <div class="container-fluid">
            <div class="row">
                <div class="col-12 m-auto">
                    <div class="card custom-card">
                        <div class="card-header justify-content-between dairy-card-header">
                            <div class="card-title">Milk Collection Report</div>
                        </div>
                        <div class="card-body dairy-card-body">
                            <form id="filterForm" class="row g-3 needs-validation" >
                                <div class="col-md-3">
                                    <label class="form-label dairy-input-label required-field">Select From Date</label>
                                    <input type="date" class="form-control dairy-form-input" id="fromDate" name="fromDate" required >
                                </div>

                                <div class="col-md-3">

                                  

                                    <label class="form-label dairy-input-label required-field">Select To Date</label>
                                    <input type="date" class="form-control dairy-form-input" id="toDate" name="toDate" required>
                                </div>
                                <div class="col-md-4">
                                    <label class="form-label dairy-input-label required-field">Milk Type</label><br>
                                    <input type="radio" name="milkType" value="cow" />Cow
                                    <input type="radio" name="milkType" value="buffalo" />Buffalo
                                </div>
                                <div class="col-md-3">
                                  <label class="form-label dairy-input-label required-field">Enter Advance Percentage</label><br>
                                  <input type="text" class="form-control dairy-form-input" name="advanceDeductionPercentage" id="advancePercentage" required>

                                 
                              </div>
                               

                                <div class="col-12">
                                    <button class="btn btn-primary dairy-form-btn" type="button" id="getFarmerRecords"  data-flag="yourFlagValue">Get Records </button>
                                </div>
                            </form>

                            <table id="file-export" class="table table-bordered dataTable no-footer dairy-table-border">
                                <thead>
                                    <tr class="dairy-table-head">
                                        <th> <input type="checkbox" id="selectAllCheckbox" /> </th>
                                        <th>Farmer Name</th>                                        
                                        <th>Total Milk Quantity</th>
                                        <th>Total Payment Amount</th>
                                        <th class="hide-column">Feed Total Amount</th>
                                        <th class="hide-column">Advance Total Amount</th>
                                        <th>View Details </th>   
                                    </tr>
                                </thead>
                                <tbody >
                                </tbody>
                            </table>
                            <form id="pdfForm" action="/generatePdf" method="get" target="pdfIframe">
                                
                             <button class="btn btn-primary dairy-form-btn" type="submit" id="generateInvoice">Generate Invoice</button> 
                            </form>  
                            
                            <button class="btn btn-primary dairy-form-btn" data-bs-toggle="modal" data-bs-target="#makePayment" type="submit" id="GeneratePayment">Generate Payment</button>
                            
                            <!-- Display PDF in iframe -->
                            <iframe id="pdfIframe" name="pdfIframe" width="100%" height="500"></iframe>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <jsp:include page="../modules/footer.jsp" />

     

	<!--Milk Collection List Modal Start-->
    <div class="modal fade modal-lg" id="milkList" data-bs-keyboard="false" tabindex="-1" aria-labelledby="previousMilkListLabel" aria-hidden="true">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <h6 class="modal-title" id="staticBackdropLabel"></h6>
              <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
              
              <div class="col-12">
              
                        <div class="row mb-3">
                            <div class="col-md-4" >
                            <span id="DisplayfarmerName"></span>                     
                            </div>
                        </div>           
                      <div class="table-responsive">                       
                          <table id="FarmerwiseMilkList" class="table table-bordered dataTable no-footer dairy-table-border">
                            <thead>
                              <tr class="dairy-table-head">
                                <th  >Date</th>
                                <th>Shift</th>
                                <th>Quantity</th>
                                <th>Fat</th>
                                <th>SNF</th>
                                <th>Amount</th>
                                </tr>
                            </thead>
                            <tbody>
                            </tbody>
                          </table>
                      </div>
              
                </div>
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
            </div>
          </div>
        </div>
    </div>
      <!-- Modal End-->


      <!--Payment Modal Start-->
      <div class="modal fade modal-xl" id="makePayment" data-bs-keyboard="false" data-bs-backdrop="static" tabindex="-1" aria-labelledby="makePayment" aria-hidden="true">
        <div class="modal-dialog modal-dialog-scrollable"> <!-- Add modal-dialog-scrollable class -->
            <div class="modal-content">
                <div class="modal-header">
                    <h6 class="modal-title" id="staticBackdropLabel">Payment</h6>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form class="row g-3 needs-validation" action="" method="post" novalidate>
                        <div class="col-12">
                            <div class="row">
                                <b><span id="displayDates"> </span></b>
                                <div class="col-md-2">
                                    <label class="form-label dairy-input-label">Date</label>
                                    <input type="date" class="form-control dairy-form-input" id="paymentDate" name="invoice_date">
                                </div>
                                <div class="col-md-3">
                                    <label class="form-label dairy-input-label">Payment Method</label>
                                    <select class="form-select dairy-form-input" id="paymentMethod" name="payment_method">
                                        <option value="" selected disabled>Select Payment Method</option>
                                        <option value="Cash" selected>Cash</option>
                                        <option value="Bank Transfer">Bank Transfer</option>
                                        <option value="check">Check</option>
                                        <option value="Other">Other</option>
                                    </select>
                                </div>
                                <div class="col-md-6">
                                    <label class="form-label dairy-input-label">Payment Note</label>
                                    <textarea class="col-md-12 dairy-textarea" id="paymentNote" placeholder="Enter Payment Note"></textarea>
                                </div>
                                <div class="col-md-12 mt-3"> <!-- Add full-width column for the table -->
                                    <table id="paymentGenerateList" class="table table-bordered dataTable no-footer dairy-table-border">
                                        <thead>
                                            <tr class="dairy-table-head">
                                                <th> <input type="checkbox" id="selectAllCheckbox" /> </th>
                                                <th class="hide-column">Farmer Id </th>
                                                <th>Farmer </th>
                                                <th>Total Milk Quantity(Ltr)</th>
                                                <th>Total Milk Amount</th>
                                                <th>Total Remaining Feed Amount</th>
                                                <th>Advance Total Amount</th>
                                                <th>Advance Amt After <span id="Percentage"></span>% Deduction</th>
                                                <th>Total Payment</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <!-- Your table body content -->
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3 mt-4">
                            <button class="btn btn-primary dairy-form-btn mt-4" type="button" id="pay">Make Payment</button>
                        </div>
                        <span id="feedAmount"></span>
                        <span id="advanceAmount"></span>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
    
  
      <!--Payment Modal End-->

      
</body>