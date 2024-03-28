<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="../modules/header.jsp" />

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.11.5/css/dataTables.bootstrap4.min.css">

<body>
  <div class="main-content app-content">
    <div class="container-fluid">
      <div class="row">
        <div class="col-11 mx-auto mt-4">
          <div class="card custom-card">
            <div class="card-header dairy-card-header">
              <div class="card-title">${empty messages[82] ? ' Routes' : messages[82]} </div>
            </div>
            <div class="card-body">
            
             <div id="MessageBody" class="SuccessErrorMessageBody">
                <!-- Show success message -->
                <c:if test="${not empty successMessage}">
                  <div id="successAlert" class="alert alert-success alert-dismissible fade show SuccessErrorMessages" role="alert" >
                    ${successMessage}
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                      <span aria-hidden="true">&times;</span>
                    </button>
                  </div>
                  
                </c:if>
                <c:if test="${not empty errorMessage}">
                  <div id="errorAlert" class="alert alert-danger alert-dismissible fade show" role="alert" style="height: 10vh; width: 50vh; font-size: 22px;">
                    ${errorMessage}
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                      <span aria-hidden="true">&times;</span>
                    </button>
                  </div>
                </c:if>
              </div>
              
              <div class="table-responsive">
                <table id="file-export" class="table table-bordered dataTable no-footer dairy-table-border">
                  <thead>
                    <tr class="dairy-table-head">
                      <th>${empty messages[81] ? 'Name' : messages[81]} </th>
                      <th>${empty messages[69] ? ' Remark' : messages[69]}</th>
                      <th>Action</th>
                    </tr>
                  </thead>
                  <tbody>
                    <c:forEach items="${routes}" var="route">
                      <tr class="gridjs-tr">
                        <td>${route.name }</td>
                        <td>${route.remark }</td>
                        <td>
                          <a href="http://localhost:6161/routes/${route.id }">
                            <button class="btn btn-sm btn-primary dairy-form-btn">Edit</button>
                          </a>
                        </td>
                      </tr>
                    </c:forEach>
                  </tbody>
                </table>
                <div class="col-6">
                       <a href="http://localhost:6161/routes/add-route-page"><button class="btn btn-primary dairy-form-btn" >${empty messages[79] ? ' Back' : messages[79]}</button></a>
                 </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <jsp:include page="../modules/footer.jsp" />

</body>
