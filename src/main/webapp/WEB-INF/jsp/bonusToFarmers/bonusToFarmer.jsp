<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="../modules/header.jsp" />
<style>


    .button-container {
        display: flex;
        justify-content: space-between;
    }

    .button-container button {
        margin: 0;
    }

</style>
<body>
    <div class="main-content app-content p-4">
        <div class="container-fluid">
            <div class="row">
                <div class="col-10 m-auto">
                    <div class="card custom-card">
                        <div class="card-header justify-content-between dairy-card-header">
                            <div class="card-title">${empty messages[223] ? 'Bonus To Farmer' : messages[223]}</div>
                        </div>
                        <div class="card-body dairy-card-body">
                            <form id="filterForm" class="row g-3 needs-validation" >
                                <div class="col-md-6">
                                    <label class="form-label dairy-input-label required-field">${empty messages[187] ? 'Select Date From' : messages[187]}</label>
                                    <input type="date" class="form-control dairy-form-input" id="fromDate" name="fromDate"  required>
                                </div>

                                <div class="col-md-6">
                                    <label class="form-label dairy-input-label required-field">${empty messages[189] ? 'Select To Date' : messages[189]}</label>
                                    <input type="date" class="form-control dairy-form-input" id="toDate" name="toDate" required >
                                </div>
                                 <div class="col-md-6">
                                    <label class="form-label dairy-input-label required-field">${empty messages[228] ? 'Bonus Amount Per Litre' : messages[228]}</label>
                                    <input type="text" class="form-control dairy-form-input" name="bonusAmountPerLiter" id="bonusAmountPerLiter" placeholder="${empty messages[230] ? 'Enter Bonus Amount Per liter' : messages[230]}" name="toDate" required>
                                </div>
                                 <div class="col-md-6">
                                    <label class="form-label dairy-input-label required-field">${empty messages[86] ? 'Milk Type' : messages[86]}</label><br>
                                    <input  class="form-check-input" type="radio"   name="milkType" value="cow" />${empty messages[87] ? 'Cow' : messages[87]}
                                    <input  class="form-check-input" type="radio"  name="milkType" value="baffalo" />${empty messages[88] ? 'Buffalo' : messages[88]} 
                                </div>
                                <div class="col-12">
                                   <button class="btn btn-primary dairy-form-btn" type="button" id="getFarmerRecordsBonus"  data-flag="bonusFlag">${empty messages[177] ? 'Get List' : messages[177]}  </button>

                                </div>
                            </form>

                            <table id="file-export" class="table table-bordered dataTable no-footer dairy-table-border mt-2">
                                <thead>
                                    <tr class="dairy-table-head">
                                      <th><input type="checkbox" id="toggleAll"></th>
                                        <th>${empty messages[116] ? '  Farmer Name' : messages[116]}</th>
                                         <th>${empty messages[92] ? 'Total Milk Quantity' : messages[92]}</th>
                                        <th>${empty messages[229] ? 'Total Bonus Amont' : messages[229]}</th>
                                    </tr>
                                </thead>
                                <tbody >
                                </tbody>
                            </table>
                                       <div class="row">
                                         <div class="col-4">
                                        <div class="mt-2">
                                       <button type="submit" id="submitSelectedRecords" class="btn btn-primary">${empty messages[78] ? ' submit' : messages[78]}</button>
                                     </div>
                                   </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
 
</body>
  <jsp:include page="../modules/footer.jsp" />




