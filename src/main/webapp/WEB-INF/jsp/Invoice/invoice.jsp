<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../modules/header.jsp" />

<style>
    /* Add any additional styles if needed */
</style>

<body>

    <div class="main-content app-content p-4">

        <div class="container-fluid">
            <div class="row">

                <!-- Your existing table with data -->
                

                <!-- Form to generate PDF -->
                <form id="pdfForm" action="/generatePdf" method="get" target="pdfIframe">
                    <input type="hidden"  name="tableData" value="<c:out value='${yourTableDataInSomeFormat}'/>">
                    <button type="submit">Generate PDF</button>
                </form>
                
                
                

                <!-- Display PDF in iframe -->
                <iframe id="pdfIframe" name="pdfIframe" width="100%" height="500"></iframe>

            </div>
        </div>
    </div>

    <jsp:include page="../modules/footer.jsp" />

    <!-- Add JavaScript to set iframe source after form submission -->
    <script>
        // Attach the submit event listener to the form
        document.getElementById("pdfForm").addEventListener("submit", function (event) {
            // Encode the table data and set it as a parameter in the URL
            var tableData = encodeURIComponent(document.getElementById("tableData").value);
            document.getElementById("pdfForm").action = "/generatePdf?tableData=" + tableData;

          
            // event.preventDefault();

            // Call the function to set the iframe source
            generatePdf();
        });

        function generatePdf() {
            document.getElementById("pdfIframe").src = "/generatePdf";
        }
    </script>

</body>
