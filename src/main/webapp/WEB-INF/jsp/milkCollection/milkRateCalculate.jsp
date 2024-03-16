
<jsp:include page="../modules/header.jsp" />
<style>
        table {
            border-collapse: collapse;
            margin-top: 20px;
             overflow: auto;
           
        }
        table, th, td {
           padding: 2px;
        }
        th {
         
            padding: 1px;
            text-align: center;
        }
        td input{ border-radius: 4px;
		}
        #tableContainer {
        width: 100%;
        overflow:auto 
        }

    </style>
<body>

	<div class="main-content app-content p-4">

		<div class="container-fluid">
			<div class="row">
				<div class="col-10 m-auto">
					<div class="card custom-card">
						<div class="card-header justify-content-between dairy-card-header">
							<div class="card-title">Milk Rate</div>
						</div>
						<div class="card-body dairy-card-body">
						 <jsp:include page="../successMessage/message.jsp" />
							<form class="row g-3 needs-validation" action="/milkRate"
								method="post" id="milkRatesForm">
								
								<div class="col-md-6">
									<label class="form-label dairy-input-label required-field">Milk Type</label><br>
									<input type="radio"  name="milkType" value="cow" />Cow
									<input type="radio"  name="milkType" value="buffalo"/>Buffalo
								</div>
								
								<div class="col-md-6">
									<label class="form-label dairy-input-label required-field">Date Of Rate</label> 
									<input type="datetime-local" class="form-control dairy-form-input" id="dateOfRate" name="dateOfRate" required>
								</div>
								
								<div class="col-md-6">
									<label class="form-label dairy-input-label required-field">Fat From</label>
									<div class="input-group has-validation">
									<input type="text" class="form-control dairy-form-input" placeholder="Enter Fat From." id="fatFrom"  name="fatFrom" required>
									</div>
								</div>
								
								<div class="col-md-6">
									<label class="form-label dairy-input-label required-field">Fat To</label>
									<div class="input-group has-validation">
									<input type="text" class="form-control dairy-form-input" placeholder="Enter Fat To." name="fatTo" id="fatTo" required>
									</div>
								</div>
								<div class="col-md-6">
									<label class="form-label dairy-input-label required-field">SNF From</label>
									<input type="text" class="form-control dairy-form-input" placeholder="Enter SNF From." id="snfFrom"  name="fatTo" required> 
								</div>
								<div class="col-md-6">
									<label class="form-label dairy-input-label required-field">SNF To</label>
									<input type="text" class="form-control dairy-form-input" placeholder="Enter SNF To." id="snfTo"  name="fatTo" required>  
								</div>
                                <div class="col-md-6">
									<label class="form-label dairy-input-label">Remark</label>
									<input type="text" class="form-control dairy-form-input" placeholder="remark" id="remark"  name="remark" >  
								</div>
                                <div class="col-md-6 mt-5">
                                    <form id="tableForm" enctype="multipart/form-data">
                                        <input type="file" accept="image/*" id="imageInput" />
                                        <button type="button" onclick="processImage()">Process Image</button>
                                    </form>
                                    
								</div>
								<div class="col-12">
									<button class="btn btn-primary dairy-form-btn"  type="button" onclick="generateTableFronSNFAndRate()">Submit </button>
									
								</div>
							</form>
							
							<div id="tableContainer"></div>
                            

                            <!-- <form id="tableForm" enctype="multipart/form-data">
                                <input type="file" accept="image/*" id="imageInput" />
                                <button type="button" onclick="processImage()">Process Image</button>
                            </form> -->
                            
                            <!-- Loader and Error/Message elements -->
                            <h3 id="loader" style="display: none;">Processing...</h3>
                            <p id="errorMessage" style="color: red; display: none;">Please Select a image.</p>
                            <p id="noTextMessage" style="color: blue; display: none;">No text found on the uploaded image.</p>
                            
                           
                            <table id="output-table"></table>

						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="../modules/footer.jsp" />

	<script>

var currentDate = new Date().toISOString().slice(0, 16);

// Set the default value of the input field to the current date
document.getElementById('dateOfRate').value = currentDate;
 var fatFrom, fatTo, snfFrom, snfTo;

function generateTableFronSNFAndRate() {
    var milkType = document.querySelector('input[name="milkType"]:checked').value;
    fatFrom = parseFloat(document.getElementById("fatFrom").value);
    fatTo = parseFloat(document.getElementById("fatTo").value);
    snfFrom = parseFloat(document.getElementById("snfFrom").value);
    snfTo = parseFloat(document.getElementById("snfTo").value);


    var dateOfRate = document.getElementById("dateOfRate").value;
    var remark = document.getElementById("remark").value;
    var table = '<table>';
    table += '<tr><th>Fat/SNF</th>';
      
    // Create header row with SNF values
    for (var snf = snfFrom; snf <= snfTo+0.1; snf += 0.1) {
        table += '<th>'+ snf.toFixed(1) + '</th>';
    }

    table += '</tr>';

    // Create rows with textboxes for each Fat and SNF combination
    for (var fat = fatFrom; fat <= fatTo + 0.1; fat += 0.1) {
        table += '<tr>';
        table += '<td>' + fat.toFixed(1) + '</td>';

        for (var snf = snfFrom; snf <= snfTo + 0.1; snf += 0.1) {
            //table += '<td><input type="text" id="rate_'+ fat.toFixed(1) + '_' + snf.toFixed(1) + ' " size="1" ></td>';
            table += '<td><input type="text" id="rate_' + fat.toFixed(1) + '_' + snf.toFixed(1) + '" size="1" ></td>';
            
        }

        table += '</tr>';
    }

    table += '</table>';
    table += '<button type="button" class="btn btn-primary dairy-form-btn" onclick="calculateMilkRate()">Save Rates</button>';
    document.getElementById("tableContainer").innerHTML = table;

    additionalData = {
        animalType: milkType,
        date_of_rate: dateOfRate,
        remark: remark
    };
}
function calculateMilkRate() {
    var rates = [];

    for (let fat = fatFrom; fat <= fatTo+0.1; fat += 0.1) {
        for (let snf = snfFrom; snf <= snfTo+0.1; snf += 0.1) {
           var rateInput = document.getElementById('rate_'+fat.toFixed(1)+'_'+snf.toFixed(1));

            var rateValue = parseFloat(rateInput.value);
  
            // Check if the value is a valid number
            if (!isNaN(rateValue)) {
                rates.push({ milkFat: fat.toFixed(1), milkSNF: snf.toFixed(1), milkRate: rateValue });
            } else {
                console.error('Invalid rate value for fat=' + fat.toFixed(1) + ', snf=' + snf.toFixed(1));
            }
        }
    }
    rates.forEach(rate => {
        rate['animalType'] = additionalData.animalType;
        rate['date_of_rate'] = additionalData.date_of_rate;
        rate['remark'] = additionalData.remark;
    });

    console.log(rates);
    var requestBody = JSON.stringify(rates);

    // Make sure to set the Content-Type header to application/json
    var xhr = new XMLHttpRequest();
    xhr.open("POST", "/milkRate/saveMilkRates", true);
    xhr.setRequestHeader("Content-Type", "application/json");

    xhr.onreadystatechange = function () {
        if (xhr.readyState === 4 && xhr.status === 200) {
            console.log("Response:");
            alert("Milk Rates Saved")
            $("#milkRatesForm")[0].reset();
        }
    };

    xhr.send(requestBody);

}

//Table Generation From Image
function processImage() {
        var input = document.getElementById('imageInput');
        var loader = document.getElementById('loader');
        var errorMessage = document.getElementById('errorMessage');
        var noTextMessage = document.getElementById('noTextMessage');
        var outputTable = document.getElementById('output-table');

        // Hide previous messages
        errorMessage.style.display = 'none';
        noTextMessage.style.display = 'none';

        if (input.files && input.files[0]) {
            var formData = new FormData();
            formData.append('file', input.files[0]);

            // Show loader while processing
            loader.style.display = 'block';

            // Send image file to the server
            fetch('/processImage', {
                method: 'POST',
                body: formData
            })
            .then(response => response.json())
            .then(data => {
                // Hide loader after processing
                loader.style.display = 'none';

                if (data.length > 1) {
                    generateTable(data, outputTable);
                } else {
                    // Display message for no text found
                    noTextMessage.style.display = 'block';
                }
            })
            .catch(error => {
                // Hide loader in case of error
                loader.style.display = 'none';
                // Display error message
                errorMessage.style.display = 'block';
                console.error('Error:', error);
            });
        } else {
            // Display error message for no selected file
            errorMessage.style.display = 'block';
        }
    }

    function generateTable(data, outputTable) {
        // Clear existing table content
        outputTable.innerHTML = '';

        // Create header row
        var headerRow = outputTable.insertRow();
        data[0].forEach(header => {
            var headerCell = headerRow.insertCell();
            headerCell.innerHTML = header;
        });

        // Create data rows
        for (var i = 1; i < data.length; i++) {
            var dataRow = outputTable.insertRow();
            data[i].forEach(cell => {
                var dataCell = dataRow.insertCell();
                dataCell.innerHTML = cell;
            });
        }
        logTableData(data);
    }
    function logTableData(data) {
        console.log('Table Data:');
        var headers = data[0];
        var rows = data.slice(1);

        console.log('Headers:', headers.join(', '));

        rows.forEach(row => {
            console.log(row.join(', '));
        });
    }
    

</script>