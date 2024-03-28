<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../modules/header.jsp" />
    <div class="main-content app-content p-4">

        <div class="container-fluid">
            <div class="row">
            
                <div class="col-12 m-auto">
                    <div class="card custom-card">
                        <div class="card-header justify-content-between dairy-card-header">
                            <div class="card-title"></i>${empty messages[59] ? ' Payment Report' : messages[59]} </div>
                        </div>
                        <div class="card-body dairy-card-body">
                            <form id="filterForm" class="row g-3 needs-validation" >
                                <div class="col-md-2">
                                    <label class="form-label dairy-input-label required-field">${empty messages[187] ? 'Select Date From' : messages[187]}</label>
                                    <input type="date" class="form-control dairy-form-input" id="fromDate" name="fromDate" required >
                                </div>

                                <div class="col-md-2">
									<label class="form-label dairy-input-label required-field">${empty messages[189] ? 'Select To Date' : messages[189]}</label>
                                    <input type="date" class="form-control dairy-form-input" id="toDate" name="toDate" required>
                                </div>
                                <div class="col-md-5">
                                    <label class="form-label dairy-input-label required-field">${empty messages[86] ? 'Milk Type' : messages[86]}</label><br>
                                    <input type="radio" name="milkType" value="both" checked/>${empty messages[176] ? 'Both' : messages[176]}
                                    <input type="radio" name="milkType" value="cow" />${empty messages[87] ? 'Cow' : messages[87]}
                                    <input type="radio" name="milkType" value="buffalo" />${empty messages[88] ? 'Buffalo' : messages[88]} 
                                </div>
                                
                                <div class="col-md-4">
									  <label class="form-label dairy-input-label required-field"> ${empty messages[252] ? 'Select' : messages[252]}</label><br>
									  <input type="radio" name="farmer" value="all" checked />${empty messages[253] ? 'All   Farmers' : messages[253]}
									  <input type="radio" name="farmer" value="farmerwise" />${empty messages[254] ? 'Farmerswise' : messages[254]}										
									  <select class="form-select dairy-form-input" id="farmerSelect" style="display: none;">
									    <option value="" selected="selected" disabled="disabled">${empty messages[207] ? ' Select Farmer' : messages[207]}</option>
										<c:forEach items="${list}" var="farmer">
											<option value="${farmer.id}">${farmer.name}</option>
										</c:forEach>
									  </select>
									</div>

                                <div class="col-12">
                                    <button class="btn btn-primary dairy-form-btn" type="button" id="getPaymentInvoiceRecords">${empty messages[177] ? 'Get List' : messages[177]} </button>
                                </div>
                            </form>
								<table id="file-export" class="table table-bordered dataTable no-footer dairy-table-border">
                                <thead>
                                    <tr class="dairy-table-head">
                                        <th>${empty messages[116] ? '  Farmer Name' : messages[116]}</th>   
                                        <th>${empty messages[193] ? 'Payment Date' : messages[193]}</th>                                     
                                        <th>${empty messages[92] ? 'Total Milk Quantity(Ltr)' : messages[92]}</th>
                                        <th>${empty messages[206] ? 'Total Payment' : messages[206]}</th>
                                        <th >${empty messages[214] ? 'Feed Deducted Amount' : messages[214]}</th>
                                        <th >${empty messages[215] ? 'Advance Deducted Amount' : messages[215]}</th>
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



