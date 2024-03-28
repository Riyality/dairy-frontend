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
                            <div class="card-title">Bonus To Farmer</div>
                        </div>
                        <div class="card-body dairy-card-body">
                            <form id="filterForm" class="row g-3 needs-validation" >
                                <div class="col-md-6">
                                    <label class="form-label dairy-input-label required-field">Select From Date</label>
                                    <input type="date" class="form-control dairy-form-input" id="fromDate" name="fromDate"  required>
                                </div>

                                <div class="col-md-6">
                                    <label class="form-label dairy-input-label required-field">Select To of Date</label>
                                    <input type="date" class="form-control dairy-form-input" id="toDate" name="toDate" required >
                                </div>
                                 <div class="col-md-6">
                                    <label class="form-label dairy-input-label required-field">Bonus Amount Per Liter</label>
                                    <input type="text" class="form-control dairy-form-input" name="bonusAmountPerLiter" id="bonusAmountPerLiter" placeholder="Enter Bonus amont per liter" name="toDate" required>
                                </div>
                                 <div class="col-md-6">
                                    <label class="form-label dairy-input-label required-field">Milk Type</label><br>
                                    <input  class="form-check-input" type="radio"   name="milkType" value="cow"  checked/>Cow
                                    <input  class="form-check-input" type="radio"  name="milkType" value="baffalo" />Buffalo
                                </div>
                                <div class="col-12">
                                   <button class="btn btn-primary dairy-form-btn" type="button" id="getFarmerRecordsBonus"  data-flag="bonusFlag">Get Records </button>

                                </div>
                            </form>

                            <table id="file-export" class="table table-bordered dataTable no-footer dairy-table-border mt-2">
                                <thead>
                                    <tr class="dairy-table-head">
                                      <th><input type="checkbox" id="selectAllCheckbox"></th>
                                        <th>Farmer Name</th>
                                         <th>Total Milk</th>
                                        <th> TotalBonus Amount</th>
                                    </tr>
                                </thead>
                                <tbody >
                                </tbody>
                            </table>
                                       <div class="row">
                                         <div class="col-4">
                                        <div class="mt-2">
                                       <button type="submit" id="submitSelectedRecords" class="btn btn-primary">Submit</button>
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




