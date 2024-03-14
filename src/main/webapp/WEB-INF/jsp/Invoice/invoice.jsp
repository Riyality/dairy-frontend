<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../modules/header.jsp" />
<style>
    .hide-column {
        display: none;
    }
  </style>


    <div class="main-content app-content p-4">

        <div class="container-fluid">
            <div class="row">
            
                <div class="col-12 m-auto">
                    <div class="card custom-card">
                        <div class="card-header justify-content-between dairy-card-header">
                            <div class="card-title">Payment Invoice</div>
                        </div>
                        <div class="card-body dairy-card-body">
                            <form id="filterForm" class="row g-3 needs-validation" >
                                <div class="col-md-3">
                                    <label class="form-label dairy-input-label required-field">Select Payment From Date</label>
                                    <input type="date" class="form-control dairy-form-input" id="fromDate" name="fromDate" required >
                                </div>

                                <div class="col-md-3">

                                    <label class="form-label dairy-input-label required-field">Select Payment To Date</label>
                                    <input type="date" class="form-control dairy-form-input" id="toDate" name="toDate" required>
                                </div>
                                <div class="col-md-4">
                                    <label class="form-label dairy-input-label required-field">Milk Type</label><br>
                                    <input type="radio" name="milkType" value="cow" />Cow
                                    <input type="radio" name="milkType" value="buffalo" />Buffalo
                                </div>

                                <div class="col-12">
                                    <button class="btn btn-primary dairy-form-btn" type="button" id="getInvoiceRecords">Get Records </button>
                                </div>
                            </form>

                            <table id="file-export" class="table table-bordered dataTable no-footer dairy-table-border">
                                <thead>
                                    <tr class="dairy-table-head">
                                        <th> <input type="checkbox" id="selectAllCheckbox" /> </th>
                                        <th>Farmer Name</th>   
                                        <th>Payment Date</th>                                     
                                        <th>Total Milk Quantity</th>
                                        <th>Total Payment Amount</th>
                                        <th >Feed Deducted Amount</th>
                                        <th >Advance Deducted Amount</th>
                                         
                                    </tr>
                                </thead>
                                <tbody >
                                </tbody>
                            </table>
                            <form id="pdfForm" action="/generatePdf" method="get" target="pdfIframe">
                                
                             <button class="btn btn-primary dairy-form-btn" type="submit" id="generateInvoice">Generate Invoice</button> 
                            </form>  
      
                            <!-- Display PDF in iframe -->
                            <iframe id="pdfIframe" name="pdfIframe" width="100%" height="500"></iframe>

                        </div>
                    </div>
                </div>

                <!-- Display PDF in iframe -->
                <iframe id="pdfIframe" name="pdfIframe" width="100%" height="500"></iframe>

            </div>
        </div>
    </div>

    <jsp:include page="../modules/footer.jsp" />



