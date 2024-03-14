
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="../modules/header.jsp" />

<body>
    <div class="main-content app-content p-4">
        <div class="container-fluid">
            <div class="row">
                <div class="col-12 m-auto">
                    <div class="card custom-card">
                        <div class="card-header justify-content-between dairy-card-header">
                            <ul class="nav nav-tabs" id="myTabs">
                                <li class="nav-item">
                                    <a class="nav-link active tabColor-tab" id="datewise-tab" data-toggle="tab" href="#todayMilk">TodaysMilkCollection</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link tabColor-tab" id="farmerwise-tab" data-toggle="tab" href="#datewise">DateWise</a>
                                </li>
                            </ul>
                        </div>      
                        <div class="card-body dairy-card-body">
                            <div class="tab-content">
                                <div class="tab-pane fade show active" id="todayMilk">
                                   
                                    <div class="table-responsive">
                                        <table id="file-export" class="table table-bordered dataTable no-footer dairy-table-border">
		               <thead>
		                <tr class="dairy-table-head">
		                      <th>Farmer Name</th>
			                  <th>Animal Type</th>
			                  <th> Date</th>
			                  <th> Fat</th>
			                  <th> SNF</th>
			                  <th>Shift</th>
			                  <th>Rate</th>
			                  <th>Total Milk</th>
			                  <th>Total Amount</th>
			                 
		                  </tr>
		              </thead>
		              <tbody>
		                 <c:set var="totalMilkQuantity" value="0" />
                         <c:set var="totalMilkAmount" value="0" />
		              
		                <c:forEach items="${list}" var="milkList">
                          <tr class="gridjs-tr">
                            <td>${milkList.farmerName}</td>
                            <td>${milkList.animalType}</td>
                             <td>${milkList.dateOfMilkCollection}</td>
                            <td>${milkList.milkFat}</td>
                            <td>${milkList.milkSNF}</td>
                            <td>${milkList.shift}</td>
                           <td>${milkList.milkRate}</td>
                            <td>${milkList.milkQuantity}</td>
                            <td>${milkList.totalMilkAmount}</td>
                            <c:set var="totalMilkQuantity" value="${totalMilkQuantity + milkList.milkQuantity}" />
                           <c:set var="totalMilkAmount" value="${totalMilkAmount + milkList.totalMilkAmount}" />
                           
                          </tr>
                        </c:forEach>
		                  <tr class="gridjs-tr">
                         <td colspan="7">Total:</td>
                          <td>${totalMilkQuantity}</td>
                           <td>${totalMilkAmount}</td>
                        </tr>
		              </tbody>
		            </table>
                                    </div>
                                </div>
                                <div class="tab-pane fade" id="datewise">
                                    <form id="filterForm" class="row g-3 needs-validation">
                                         <div class="col-md-3">
                                            <label class="form-label dairy-input-label required-field">Select Date</label>
                                            <input type="date" class="form-control dairy-form-input" id="selectedDate" name="selectedDate" required >
                                        </div>
                                      
                                       
                                            <div class="col-md-3">
                                            <label class="form-label dairy-input-label required-field">Select
                                                Shift </label> 
                                         <select  class="form-select dairy-form-input"
                                                id="shiftDropdown" name="shift" >
                                                <option value="" selected="selected" disabled="disabled">Select
                                                    Shift</option>
                                                    <option value="morning">Morning</option>
                                                    <option value="Evening">Evening</option>
                                                    <option value="morningEvening">Morning & Evening</option>
                                            </select>
                                            </div>
                                            
                                             <div class="col-md-4">
                                            <label class="form-label dairy-input-label required-field">Milk Type</label><br>
                                            <input type="radio" name="milkType" value="both" checked/>Both
                                            <input type="radio" name="milkType" value="cow" />Cow
                                            <input type="radio" name="milkType" value="buffalo" />Buffalo
                                        </div>
        
        
                                        <div class="col-12">
                                            <button class="btn btn-primary dairy-form-btn" type="button" id="getMilkCollectionDatewise" >Get List </button>
                                        </div>
                                    </form>
                                       <table id="file-export-datewise" class="table table-bordered dataTable no-footer dairy-table-border">
                                        <thead>
                                            <tr class="dairy-table-head">
                                               <th>Farmer Name</th> 
                                                <th>Date Of Collection</th>   
                                                <th>Shift</th>  
                                                <th>Type</th>                                 
                                                <th>Fat</th>
                                                <th>SNF</th>
                                                <th>Rate</th>
                                                <th>Milk Quantity</th>
                                                <th>Total Amount</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>

<jsp:include page="../modules/footer.jsp" />

<style>
    #myTabs .tabColor-tab.nav-link.active {
        background-color: lightgray;
        color: black;
        border-color: red;
    }
</style>

