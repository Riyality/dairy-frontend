<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="../modules/header.jsp" />
<style>


    #eyeButton {
        color: blue;
  font-size: 16px; 
  padding: 4px 8px; 
  border: none;
  border-radius: 25px;
  background-color: transparent;
  cursor: pointer;
}
#eyeButton:hover {
  background-color: #e0e0e0; 
}
#farmerName{
    font-size: medium;
   font-weight: bold;
}
</style>
<body>
    <div class="main-content app-content p-4">
        <div class="container-fluid">
            <div class="row">
                <div class="col-12 m-auto">
                    <div class="card custom-card">
                        <div class="card-header justify-content-between dairy-card-header">
                            <div class="card-title">Payment To Farmer</div>
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
                                    <label class="form-label dairy-input-label">Milk Type</label><br>
                                    <input type="radio" name="milkType" value="cow" />Cow
                                    <input type="radio" name="milkType" value="baffalo" />Buffalo
                                </div>

                                <div class="col-12">
                                    <button class="btn btn-primary dairy-form-btn" type="button" id="getFarmerRecords"  data-flag="yourFlagValue">Get Records </button>
                                </div>
                            </form>

                            <table id="file-export" class="table table-bordered dataTable no-footer dairy-table-border">
                                <thead>
                                    <tr class="dairy-table-head">
                                        <th>Select </th>
                                        <th>Farmer Name</th>
                                        <!-- <th>Milk Type</th> -->
                                        <th>Quantity</th>
                                        <th>Amount</th>
                                        <th>View Details</th>   
                                    </tr>
                                </thead>
                                <tbody >
                                </tbody>
                            </table>
                            <form id="pdfForm" action="/generatePdf" method="get" target="pdfIframe">
                                
                                <button type="submit">Generate Invoice</button>
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

     

	<!-- Modal Start-->
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
                            <span id="farmerName"></span>
                           
                            </div>
                          </div>
                          
                      <div class="table-responsive">
                         
                          <table id="file-export2" class="table table-bordered dataTable no-footer dairy-table-border">
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


</body>
