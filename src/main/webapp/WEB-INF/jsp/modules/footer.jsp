        <!-- FOOTER -->
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
        <footer class="footer mt-auto py-3 bg-white text-center">
            <div class="container">
                <span class="text-muted"> Copyright Â© <span id="year"></span> <a href="javascript:void(0);" class="text-dark fw-semibold">Riyality</a>. Designed by
                <a href="https://www.riyalitysoftwares.com/" target="_blank">
                    <span class="fw-semibold text-primary text-decoration-underline">Riyality Softwares</span>
                </a> All rights reserved
                </span>
            </div>
        </footer>
        <!-- END FOOTER -->

    </div>
    <!-- END PAGE-->

    <!-- SCRIPTS -->
    
    <script>
	    function changeLanguage() {
	        var lang = document.getElementById("language-select").value;
	        window.location.href = "${pageContext.request.contextPath}/changeLanguage?lang=" + lang;
	    }
	</script>

    <!-- SCROLL-TO-TOP -->
    <div class="scrollToTop">
        <span class="arrow"><i class="ri-arrow-up-s-fill fs-20"></i></span>
    </div>
    <div id="responsive-overlay"></div>

    <!-- POPPER JS -->
    <script src="<c:url value="/resources/assets/libs/%40popperjs/core/umd/popper.min.js"/>"></script>

    <!-- BOOTSTRAP JS -->
    <script src="<c:url value="/resources/assets/libs/bootstrap/js/bootstrap.bundle.min.js"/>"></script>

    <!-- NODE WAVES JS -->
    <script src="<c:url value="/resources/assets/libs/node-waves/waves.min.js"/>"></script>

    <!-- SIMPLEBAR JS -->
    <script src="<c:url value="/resources/assets/libs/simplebar/simplebar.min.js"/>"></script>
    <link rel="modulepreload" href="<c:url value="/resources/assets/simplebar-635bad04.js"/>" />
    <script type="module" src="<c:url value="/resources/assets/simplebar-635bad04.js"/>"></script>

    <!-- COLOR PICKER JS -->
    <script src="<c:url value="/resources/assets/libs/%40simonwep/pickr/pickr.es5.min.js"/>"></script>

    <!-- JSVECTOR MAPS JS -->
    <script src="<c:url value="/resources/assets/libs/jsvectormap/js/jsvectormap.min.js"/>"></script>
    <script src="<c:url value="/resources/assets/libs/jsvectormap/maps/world-merc.js"/>"></script>

    <!-- APEX CHARTS JS -->
    <script src="<c:url value="/resources/assets/libs/apexcharts/apexcharts.min.js"/>"></script>

    <!-- CHARTJS CHART JS -->
    <script src="<c:url value="/resources/assets/libs/chart.js/chart.min.js"/>"></script>

    <!-- CRM-Dashboard -->
    <link rel="modulepreload" href="<c:url value="/resources/assets/crm-dashboard-5975eef2.js"/>" />
    <script type="module" src="<c:url value="/resources/assets/crm-dashboard-5975eef2.js"/>"></script>


    <!-- STICKY JS -->
    <script src="<c:url value="/resources/assets/sticky.js"/>"></script>

    <!-- APP JS -->
    <link rel="modulepreload" href="<c:url value="/resources/assets/app-3cade095.js"/>" />
    <script type="module" src="<c:url value="/resources/assets/app-3cade095.js"/>"></script>

    <!-- CUSTOM-SWITCHER JS -->
    <link rel="modulepreload" href="<c:url value="/resources/assets/custom-switcher-383b6a5b.js"/>" />
    <script type="module" src="<c:url value="/resources/assets/custom-switcher-383b6a5b.js"/>"></script>

    <!-- END SCRIPTS -->
      <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
  
  <!-- CUSTOM JS -->
	<script src="<c:url value="/resources/assets/js/custom.js"/>"></script>
	<script src="<c:url value="/resources/assets/js/custom-datatable.js"/>"></script>
	<script src="<c:url value="/resources/assets/js/custom-validation.js"/>"></script>
	
	<!-- default-custom-script JS -->
	<script src="<c:url value="/resources/assets/js/default-custom-script.js"/>"></script>
	  
  
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  <script src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>
  <script src="https://cdn.datatables.net/1.11.5/js/dataTables.bootstrap4.min.js"></script>
  <!-- Include DataTables Buttons extension -->
  <script src="https://cdn.datatables.net/buttons/2.2.2/js/dataTables.buttons.min.js"></script>
  <script src="https://cdn.datatables.net/buttons/2.2.2/js/buttons.html5.min.js"></script>
  <script src="https://cdn.datatables.net/buttons/2.2.2/js/buttons.print.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/pdfmake.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/vfs_fonts.js"></script>

</body>

</html>
