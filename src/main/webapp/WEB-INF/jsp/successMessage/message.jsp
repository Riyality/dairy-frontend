<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
.SuccessErrorMessages{
   font-size: 22px;
   display: inline-block;
}

.SuccessErrorMessageBody{
	position: fixed;
	 top: 10vh;
	 right: 10vh; 
     z-index: 1000;
}
</style>
<div id="MessageBody" class="SuccessErrorMessageBody">
    <!-- Show success message -->
    <c:if test="${not empty successMessage}">
        <div id="successAlert" class="alert alert-success alert-dismissible fade show SuccessErrorMessages" role="alert">
            ${successMessage}
            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                <span aria-hidden="true">&times;</span>
            </button>
        </div>
    </c:if>
    <!-- Show error message -->
    <c:if test="${not empty errorMessage}">
        <div id="errorAlert" class="alert alert-danger alert-dismissible fade show SuccessErrorMessages" >
            ${errorMessage}
            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                <span aria-hidden="true">&times;</span>
            </button>
        </div>
    </c:if>
</div>
<script type="text/javascript">
function handleSubmit() {
    var submissionSuccessful = false;

    if (!submissionSuccessful) {
        $('#errorAlert').alert('show'); 
    } else {
        $('#successAlert').alert('show'); 
    }
}


setTimeout(function() {
    $('#successAlert').alert('close');
  }, 5000);
setTimeout(function() {
   $('#errorAlert').alert('close');
 }, 5000);
</script>
