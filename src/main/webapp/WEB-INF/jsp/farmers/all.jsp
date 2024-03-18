<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="../modules/header.jsp" />

<body>
    <div class="main-content app-content">
        <div class="container-fluid">
            <div class="row">
                <div class="col-11 mx-auto mt-4">
                    <div class="card custom-card">
                        <div class="card-header dairy-card-header">
                            <div class="card-title">All Farmers</div>
                            <div class="float-end">
                               <div class="dropdown">
                                    <button class=" btn btn-sm btn-primary dairy-form-btn" type="button" id="statusDropdown" data-bs-toggle="dropdown" aria-expanded="false">
                                      Active
                                    </button>
                                    <ul class="dropdown-menu" aria-labelledby="statusDropdown">
                                        <li><a class="dropdown-item" href="/farmers?filter=active" onclick="getFarmers('active')">Active</a></li>
                                        <li><a class="dropdown-item"  href="/farmers/InActiveFarmers?filter=inactive" onclick="getFarmers('inactive')">Inactive</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="card-body">
                        
                         <jsp:include page="../successMessage/message.jsp" />
                            <div class="table-responsive">
                                <table id="file-export" class="table table-bordered dataTable no-footer dairy-table-border">
                                    <thead>
                                        <tr class="dairy-table-head">
                                            <th>Farmers Name</th>
                                            <th>Date of Joining</th>
                                            <th>Contact</th>
                                            <th>Route</th>
                                            <th>Bank</th>
                                            <th>Branch</th>
                                            <th>Account No.</th>
                                            <th>IFSC Code</th>
                                            <th>Address</th>
                                             <th>Remark</th>
                                            <th>Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${list}" var="farmer">
                                            <tr class="gridjs-tr">
                                                <td>${farmer.name }</td>
                                                <td>${farmer.dateOfRegistration }</td>
                                                <td>${farmer.contact }</td>
                                                <td>${farmer.route.name }</td>
                                                <td>${farmer.bank.bankName }</td>
                                                <td>${farmer.bank.branchName }</td>
                                                <td>${farmer.bank.accountNumber }</td>
                                                <td>${farmer.bank.ifscCode }</td>
                                                <td>${farmer.address }</td>
                                                <td>${farmer.remark}</td>
                                                <td><a href="http://localhost:6161/farmers/id/${farmer.id }"> <i class="ti ti-color-picker" style="font-size: 14px"></i> <button class="btn btn-sm btn-primary dairy-form-btn">Edit</button> </a></td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                              <div class="col-6">
                               <a href="http://localhost:6161/farmers/addFarmerPage"><button class="btn btn-primary dairy-form-btn" >Back</button></a>
                            </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <jsp:include page="../modules/footer.jsp" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script> 

</body>
</html>
 