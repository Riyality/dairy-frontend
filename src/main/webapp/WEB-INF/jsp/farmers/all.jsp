<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
                            <div class="card-title">${empty messages[182] ? 'All Farmers' : messages[182]}</div>
                            <div class="float-end">
                               <div class="dropdown">
                                    <button class=" btn btn-sm btn-primary dairy-form-btn" type="button" id="statusDropdown" data-bs-toggle="dropdown" aria-expanded="false">
                                      
                                    </button>
                                    <ul class="dropdown-menu" aria-labelledby="statusDropdown">
                                        <li><a class="dropdown-item" href="/farmers?filter=active" onclick="getFarmers('active')">Active</a></li>
                                        <li><a class="dropdown-item"  href="/farmers/InActiveFarmers?filter=inactive" onclick="getFarmers('inactive')">Inactive</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table id="file-export" class="table table-bordered dataTable no-footer dairy-table-border">
                                    <thead>
                                        <tr class="dairy-table-head">
                                            <th>${empty messages[116] ? '  Farmer Name' : messages[116]}</th>
                                            <th>${empty messages[137] ? 'Date Of Joining' : messages[137]}</th>
                                            <th>${empty messages[180] ? 'Farmer Contact' : messages[180]}</th>
                                            <th>${empty messages[178] ? 'Route' : messages[178]}</th>
                                            <th>${empty messages[140] ? 'Bank Name' : messages[140]}</th>
                                            <th>${empty messages[64] ? ' Branch Name' : messages[64]}</th>
                                            <th>${empty messages[141] ? 'Account Number' : messages[141]}</th>
                                            <th>${empty messages[142] ? 'IFSC Code' : messages[142]}</th>
                                            <th>${empty messages[68] ? ' Address' : messages[68]}</th>
                                             <th>${empty messages[69] ? ' Remark' : messages[69]}</th>
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
                               <a href="http://localhost:6161/farmers/addFarmerPage"><button class="btn btn-primary dairy-form-btn" >${empty messages[79] ? ' Back' : messages[79]}</button></a>
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
 