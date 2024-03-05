<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../modules/header.jsp" />

<style>
    /* Add any additional styles if needed */
</style>


    <div class="main-content app-content p-4">

        <div class="container-fluid">
            <div class="row">
            
                <div class="col-12 m-auto">
                    <div class="card custom-card">
                        <div class="card-header justify-content-between dairy-card-header">
                            <div class="card-title">Payment Report</div>
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
                                    <input type="radio" name="milkType" value="both" checked/>Both
                                    <input type="radio" name="milkType" value="cow" />Cow
                                    <input type="radio" name="milkType" value="buffalo" />Buffalo
                                </div>
                                
                                <div class="col-md-4">
									  <label class="form-label dairy-input-label required-field"> Select</label><br>
									  <input type="radio" name="farmer" value="all" checked />All Farmers
									  <input type="radio" name="farmer" value="farmerwise" />Farmerwise									
									  <select class="form-select dairy-form-input" id="farmerSelect" style="display: none;">
									    <option value="" selected="selected" disabled="disabled">Select Farmer</option>
										<c:forEach items="${list}" var="farmer">
											<option value="${farmer.id}">${farmer.name}</option>
										</c:forEach>
									  </select>
									</div>

                                <div class="col-12">
                                    <button class="btn btn-primary dairy-form-btn" type="button" id="getPaymentInvoiceRecords">Get Records </button>
                                </div>
                            </form>
								<table id="file-export" class="table table-bordered dataTable no-footer dairy-table-border">
                                <thead>
                                    <tr class="dairy-table-head">
                                        <th>Farmer Name</th>   
                                        <th>Payment Date</th>                                     
                                        <th>Total Milk Quantity</th>
                                        <th>Payment Amt</th>
                                        <th >Deducted Feed Amt</th>
                                        <th >Deducted Advance Amt</th>
                                    </tr>
                                </thead>
                                <tbody >
                                </tbody>
                            </table>
                	 </div>
                    </div>
                </div>

            </div>
        </div>
    </div>

    <jsp:include page="../modules/footer.jsp" />


<
