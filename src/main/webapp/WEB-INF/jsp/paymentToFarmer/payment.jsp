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
                            <div class="card-title">${empty messages[188] ? 'Payment To Farmer' : messages[188]}</div>
                        </div>
                        <div class="card-body dairy-card-body">
                            <form id="filterForm" class="row g-3 needs-validation" >
                                <div class="col-md-3">
                                    <label class="form-label dairy-input-label required-field">${empty messages[187] ? 'Select Date From' : messages[187]}</label>
                                    <input type="date" class="form-control dairy-form-input" id="fromDate" name="fromDate" required >
                                </div>

                                <div class="col-md-3">
								
								<label class="form-label dairy-input-label required-field">${empty messages[189] ? 'Select To Date' : messages[189]}</label>
                                    <input type="date" class="form-control dairy-form-input" id="toDate" name="toDate" required>
                                </div>
                                <div class="col-md-4">
                                    <label class="form-label dairy-input-label required-field">${empty messages[86] ? 'Milk Type' : messages[86]}</label><br>
                                    <input type="radio" name="milkType" value="cow" />${empty messages[87] ? 'Cow' : messages[87]}
                                    <input type="radio" name="milkType" value="buffalo" /> ${empty messages[88] ? 'Buffalo' : messages[88]} 
                                </div>
                                <div class="col-md-3">
                                  <label class="form-label dairy-input-label required-field">${empty messages[190] ? 'Enter Advance Percentage To Be Deduct' : messages[190]} </label><br>
                                  <input type="text" class="form-control dairy-form-input" name="advanceDeductionPercentage" id="advancePercentage" required>

                                 
                              </div>
                               

                                <div class="col-12">
                                    <button class="btn btn-primary dairy-form-btn" type="button" id="getFarmerRecords"  data-flag="yourFlagValue">${empty messages[191] ? 'Get Records' : messages[191]} </button>
                                </div>
                            </form>

                            <table id="file-export" class="table table-bordered dataTable no-footer dairy-table-border">
                                <thead>
                                    <tr class="dairy-table-head">
                                        <th> <input type="checkbox" id="selectAllCheckbox" /> </th>
                                        <th>${empty messages[116] ? '  Farmer Name' : messages[116]}</th>                                        
                                        <th>${empty messages[92] ? 'Total Milk Quantity' : messages[92]}  </th>
                                        <th>${empty messages[97] ? 'Total Payment Amount' : messages[97]}</th>
                                        <th class="hide-column">Feed Total Amount</th>
                                        <th class="hide-column">Advance Total Amount</th>
                                        <th>${empty messages[192] ? 'View  Details' : messages[192]} </th>   
                                    </tr>
                                </thead>
                                <tbody >
                                </tbody>
                            </table>
                            <form id="pdfForm" action="/generatePdf" method="get" target="pdfIframe">
                                
                             <!-- <button class="btn btn-primary dairy-form-btn" type="submit" id="generateInvoice">Generate Invoice</button>  -->
                            </form>  
                            
                            <button class="btn btn-primary dairy-form-btn" data-bs-toggle="modal" data-bs-target="#makePayment" type="submit" id="GeneratePayment">${empty messages[38] ? 'Generate Payment' : messages[38]}</button>
                            
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
                                <th>${empty messages[168] ? 'Date OF Milk Collection' : messages[168]}</th>
                                <th>${empty messages[89] ? 'Shift' : messages[89]}</th>
                                <th>${empty messages[92] ? 'Milk Quantity' : messages[92]} </th>
                                <th>Fat</th>
                                <th>SNF</th>
                                <th>${empty messages[97] ? 'Amount' : messages[97]}</th>
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
                    <h6 class="modal-title" id="staticBackdropLabel">${empty messages[188] ? 'Payment To Farmer' : messages[188]}</h6>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form class="row g-3 needs-validation" action="" method="post" novalidate>
                        <div class="col-12">
                            <div class="row">
                                <b><span id="displayDates"> </span></b>
                                <div class="col-md-2">
                                    <label class="form-label dairy-input-label">${empty messages[193] ? 'Payment Date' : messages[193]}</label>
                                    <input type="date" class="form-control dairy-form-input" id="paymentDate" name="invoice_date">
                                </div>
                                <div class="col-md-3">
                                    <label class="form-label dairy-input-label">${empty messages[194] ? 'Payment Method' : messages[194]}</label>
                                    <select class="form-select dairy-form-input" id="paymentMethod" name="payment_method">
                                        <option value="" selected disabled>${empty messages[195] ? 'Select Payment Method' : messages[195]}</option>
                                        <option value="Cash" selected>${empty messages[196] ? 'Cash' : messages[196]}</option>
                                        <option value="Bank Transfer">${empty messages[197] ? 'Bank Transfer' : messages[197]}</option>
                                        <option value="check">${empty messages[198] ? 'Cheque' : messages[198]}</option>
                                        <option value="Other">${empty messages[199] ? 'Other' : messages[199]}</option>
                                    </select>
                                </div>
                                <div class="col-md-6">
                                    <label class="form-label dairy-input-label">${empty messages[200] ? 'Payment Note' : messages[200]}</label>
                                    <textarea class="col-md-12 dairy-textarea" id="paymentNote" placeholder="${empty messages[201] ? 'Enter Payment Note' : messages[201]}"></textarea>
                                </div>
                                <div class="col-md-12 mt-3"> <!-- Add full-width column for the table -->
                                    <table id="paymentGenerateList" class="table table-bordered dataTable no-footer dairy-table-border">
                                        <thead>
                                            <tr class="dairy-table-head">
                                                <th> <input type="checkbox" id="selectAllCheckbox" /> </th>
                                                <th class="hide-column">Farmer Id </th>
                                                <th>${empty messages[116] ? '  Farmer Name' : messages[116]} </th>
                                                <th>${empty messages[92] ? 'Total Milk Quantity(Ltr)' : messages[92]} </th>
                                                <th>${empty messages[97] ? 'Total Milk  Amount' : messages[97]}</th>
                                                <th>${empty messages[202] ? 'Total Remaining Feed  Amount' : messages[202]}</th>
                                                <th>${empty messages[203] ? 'Advance Total Amount' : messages[203]}</th>
                                                <th>${empty messages[204] ? 'Advance Amount After' : messages[204]} <span id="Percentage"></span>${empty messages[205] ? ' % Deduction' : messages[205]}</th>
                                                <th>${empty messages[206] ? 'Total Payment' : messages[206]}</th>
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
                            <button class="btn btn-primary dairy-form-btn mt-4" type="button" id="pay">${empty messages[39] ? 'Make Payment' : messages[39]}</button>
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