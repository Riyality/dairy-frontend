 $(document).ready(function() {

 	/*Feed Distribution Script Start*/

 	function calculateTotalFeedAmount() {

 		var feedQuantity = $("#feedQuantity").val();
 		var feedCostPerUnit = $("#feedCostPerUnit").val();
 		$("#FeedTotalAmount").val(feedQuantity * feedCostPerUnit);


 	};

 	$('#feedQuantity, #feedCostPerUnit').on('keyup', function() {
 		var value = $(this).val().trim();
        var regex = /^0+|[^0-9.]/g;
        
        if (value.match(regex)) {
            $(this).val(value.replace(regex, ''));
        }
 		
 		calculateTotalFeedAmount();
 	});


 	function calculateRemainingAmount() {
 		var amountPaid = parseFloat($("#FeedAmountPaid").val()) || 0;
 		var totalAmount = parseFloat($("#FeedTotalAmount").val()) || 0;
 		if (amountPaid > totalAmount) {
 			alert("Amount paid cannot be greater than total amount");
 			$("#FeedAmountPaid").val(totalAmount);
 			amountPaid = totalAmount;
 		}
 		var remainingAmount = totalAmount - amountPaid;
 		$("#FeedremainingAmount").val(remainingAmount);
 	}
 	$('#FeedAmountPaid').on('keyup', function() {
 		calculateRemainingAmount();
 	});

 	/*Feed Distribution Script End*/


 	/*Equipment Script Start*/

 	$("#equipmentQuantity").on("blur", function() {

 		var equipmentQuantity = $("#equipmentQuantity").val();
 		var equipmentPrice = $("#equipmentPrice").val();
 		$("#equipmentTotalAmount").val(equipmentQuantity * equipmentPrice);

 	});

 	/*Feed Distribution Script End*/

 	/*Equipment Script Start*/

 	$("#equipmentPrice").on("blur", function() {

 		var equipmentQuantity = $("#equipmentQuantity").val();
 		var equipmentPrice = $("#equipmentPrice").val();
 		$("#equipmentTotalAmount").val(equipmentQuantity * equipmentPrice);

 	});

 	/*Equipment Script End*/

 	/*Feed Company Script Start*/

 	$("#feedCompanyList").on("change", function() {

 		var id = $("#feedCompanyList").val();

 		$.ajax({
 			url: 'http://localhost:6161/feedStock/getFeedTypeByFeedCompanyId/' + id,
 			type: 'GET',
 			dataType: 'json',
 			success: function(result) {
 				console.log(result)
 				$("#feedTypeList").empty();
 				$("#feedTypeList").prop("disabled", false);
 				$("#feedTypeList").append(
 					`<option value="" selected="selected" disabled="disabled">Select
											Feed Type</option>`
 				);
 				$.each(result, function(key, value) {
 					$("#feedTypeList").append(
 						`<option value="${value.id}">${value.type}</option>`
 					);
 				});
 			},
 			error: function(error) {
 				console.error('Error fetching data:', error);
 			}
 		});
 	});

 	/*Feed Company Script End*/

 	/*Milk Data Script Start*/
 	$("#milkTableBodyFromJS").hide();

 	$("#milkCollectionByDate").on("change", function() {

 		var date = $("#milkCollectionByDate").val();

 		$.ajax({
 			url: 'http://localhost:6161/milkCollection/selectedDateForMilkData/' + date,
 			type: 'GET',
 			dataType: 'json',
 			success: function(result) {

 				$("#milkTableBody").hide();
 				$("#milkTableBodyFromJS").show();

 				$.each(result, function(key, data) {
 					$("#milkTableBodyFromJS").append(`
			                                <tr>
			                                    <td>${data.farmerId }</td>
					                            <td>${data.farmerName }</td>
					                            <td>${data.dateOfMilkCollection }</td>
					                            <td>${data.shift }</td>
					                            <td>${data.animalType }</td>
					                            <td >${data.milkQuantity }</td>
					                            <td>${data.milkFat }</td>
					                            <td>${data.milkSNF }</td>
					                            <td>${data.milkRate }</td>
					                            <td>${data.totalMilkAmount }</td>
			                                    <td>
				                                    <a id="milkForm" href="http://localhost:6161/milkCollection/add-milkCollection-page/${data.farmerId }/${data.farmerName }">
				                                      <button class="btn btn-sm btn-primary dairy-form-btn">Collect Milk</button>
				                                    </a>
			                                    </td>
			                                </tr>`);
 				});

 			},
 			error: function(error) {
 				console.error('Error fetching data:', error);
 			}
 		});
 	});

 	/*Milk Data Script End*/


 	/*Route Name Script Start*/

 	/*$("#routeName").on("change", function() {

 		var id = $("#routeName").val();

 		$.ajax({
 			url: 'http://localhost:6161/milkCollection/' + id,
 			type: 'GET',
 			dataType: 'json',
 			success: function(result) {
 				$("#milkTableBody").empty();
 				$.each(result, function(key, value) {
 					$("#milkTableBody").append(`
			                                <tr>
			                                    <td>${value.name}</td>
			                                    <td>
				                                    <a id="milkForm" href="http://localhost:6161/milkCollection/add-milkCollection-page/${value.id }/${value.name }">
				                                      <button class="btn btn-sm btn-primary dairy-form-btn">Collect Milk</button>
				                                    </a>
			                                    	 <a href="http://localhost:6161/feedToFarmers/add-feedToFarmer-page/${value.id }/${value.name }">
						                                   <button class="btn btn-sm btn-danger dairy-form-btn">Distribute Feed</button>
						                             </a>
			                                    </td>
			                                </tr>`);
 					farmerId = value.id;
 				});
 				console.log(result);
 			},
 			error: function(error) {
 				console.error('Error fetching data:', error);
 			}
 		});
 	});
*/
 	
 	var selectedRoute = sessionStorage.getItem("selectedRoute");
    if (selectedRoute) {
        
        $("#routeName").val(selectedRoute);
       
        fetchFarmers(selectedRoute);
    }

   
    $("#routeName").on("change", function() {
        var id = $(this).val();
        sessionStorage.setItem("selectedRoute", id);
        fetchFarmers(id);
    });

   
    function fetchFarmers(routeId) {
        $.ajax({
            url: 'http://localhost:6161/milkCollection/' + routeId,
            type: 'GET',
            dataType: 'json',
            success: function(result) {
                $("#milkTableBody").empty();
                $.each(result, function(key, value) {
                    $("#milkTableBody").append(`
                        <tr>
                            <td>${value.name}</td>
                            <td>
                                <a id="milkForm" href="http://localhost:6161/milkCollection/add-milkCollection-page/${value.id }/${value.name }">
                                    <button class="btn btn-sm btn-primary dairy-form-btn">Collect Milk</button>
                                </a>
                                <a href="http://localhost:6161/feedToFarmers/add-feedToFarmer-page/${value.id }/${value.name }">
                                    <button class="btn btn-sm btn-danger dairy-form-btn">Distribute Feed</button>
                                </a>
                            </td>
                        </tr>`);
                    farmerId = value.id;
                });
                console.log(result);
            },
            error: function(error) {
                console.error('Error fetching data:', error);
            }
        });
    }
 	/*Route Name Script End*/


 	/*Milk Collection Script Start*/

 	function updateMilkRateAndAmount() {

 		var milkQuantity = $("#milkQuantity").val();
 		var milkFat = $("#milkFat").val();
 		var milkSNF = $("#milkSNF").val();
 		var animalType = document.querySelector('input[name="animalType"]:checked').value;

 		if (animalType && milkFat && milkSNF) {
 			$.ajax({
 				url: 'http://localhost:6161/milkRate/type/' + encodeURIComponent(animalType) + '/fat/' + encodeURIComponent(milkFat) + '/snf/' + encodeURIComponent(milkSNF),
 				type: 'GET',
 				dataType: 'json',
 				success: function(result) {
 					$("#milkRate").val(result);
 					$("#totalMilkAmount").val(milkQuantity * result);
 				},
 				error: function(error) {
 					console.error('Error fetching data:', error);
 				}
 			});
 		}
 	}

 	updateMilkRateAndAmount();

 	$('input[name="animalType"]').on('change', function() {
 		updateMilkRateAndAmount();
 	});

 	$('#milkFat, #milkSNF').on('keyup', function() {
 		updateMilkRateAndAmount();
 	});

 	$('#milkQuantity').on('keyup', function() {

 		var milkQuantity = $("#milkQuantity").val();
 		var milkRate = $("#milkRate").val();

 		if (milkRate !== 0 || milkRate !== "" || milkRate !== null) {
 			$("#totalMilkAmount").val(milkQuantity * milkRate);
 		}

 	});





 });

 /*Milk Collection Script End*/

	 

 /*Payment To Farmer Script Start*/
 var fDate
 var tDate;
 var AnimalType;
 var TotalMilkQuantity;
 var TotalMilkAmount;
 var farmerName;
 var farmeID;
 var TotalFeedRemainingAmount;
 var TotalAdvanceAmount;
 var TotalDeductionForFeed;
 var TotalDeductionForAdvance;
 $(document).ready(function() { 
 	var today = new Date().toISOString().split('T')[0];
 	$("#paymentDate").val(today);
 	$("#generateInvoice").prop("disabled", true);
 	$("#payment").prop("disabled", true);
 	$("#getFarmerRecords").on("click", function() {
 		fDate = fromDate
 		var fromDate = $("#fromDate").val();
 		var toDate = $("#toDate").val();
 		fDate = fromDate
 		tDate = toDate
 		var milkType = document.querySelector('input[name="milkType"]:checked').value;
 		AnimalType = milkType
 		$.ajax({
 			url: 'http://localhost:6161/paymentToFarmer/' + fromDate + '/' + toDate + '/' + milkType,
 			type: 'GET',
 			dataType: 'json',
 			success: function(result) {
 				console.log(result)
 				$("#file-export tbody").empty(); // Clear existing table rows
 				for (var i = 0; i < result.length; i++) {
 					var farmer = result[i];
 					var newRow = '<tr class="gridjs-tr">' +
 						'<td>' + '<input type="checkbox"  data-farmer-id="' + farmer.farmerId + '"> ' + '</td>' +
 						'<td>' + farmer.farmerName + '</td>' +
 						'<td>' + farmer.milkQuantity + '</td>' +
 						'<td>' + farmer.totalMilkAmount + '</td>' +
 						'<td class="hide-column">' + farmer.totalFeedRemainingAmount + '</td>' +
 						'<td class="hide-column">' + farmer.totalAdvanceAmount + '</td>' +
 						'<td>' + '<button type="button" id="eyeButton" data-farmer-id="' + farmer.farmerId + '" data-bs-toggle="modal" data-bs-target="#milkList"><b>i</b></button>' + '</td>' +
 						'</tr>';
 					$("#file-export tbody").append(newRow);
 				}
 			},
 			error: function(error) {
 				console.error('Error fetching data:', error);
 			}
 		});
 	});
 	$("#file-export").on("click", "#eyeButton", function() {
 		var farmerId = $(this).data("farmer-id");
 		$.ajax({
 			url: 'http://localhost:6161/paymentToFarmer/getMilkCollectionDataBy/' + farmerId + "/" + fDate + "/" + tDate + "/" + AnimalType,
 			type: 'GET',
 			dataType: 'json',
 			success: function(result) {
 				$("#FarmerwiseMilkList tbody").empty();
 				var prevDate = null;
 				for (var i = 0; i < result.length; i++) {
 					var farmer = result[i];
 					var formattedDate = new Date(farmer.dateOfMilkCollection).toISOString().split('T')[0];
 					var newRow = '<tr class="gridjs-tr">';
 					if (prevDate === formattedDate) {
 						newRow += '<td></td>'; // Empty cell for rowspan
 					} else {
 						newRow += '<td>' + formattedDate + '</td>'; // Show the date only once
 					}
 					newRow += '<td>' + farmer.shift + '</td>' +
 						'<td>' + farmer.milkQuantity + '</td>' +
 						'<td>' + farmer.milkFat + '</td>' +
 						'<td>' + farmer.milkSNF + '</td>' +
 						'<td>' + farmer.totalMilkAmount + '</td>' +
 						'</tr>';
 					$("#FarmerwiseMilkList tbody").append(newRow);
 					document.getElementById("DisplayfarmerName").innerHTML = farmer.farmerName;
 					prevDate = formattedDate; // Update prevDate for the next iteration
 				}
 			},
 			error: function(error) {
 				console.error('Error fetching data:', error);
 			}
 		});
 	});

 	function generatePdf(selectedFarmerIds) {
 		var encodedId = encodeURIComponent(selectedFarmerIds);
 		$("#pdfIframe").attr("src", "/generatePdf?farmerId=" + encodedId + "&fromDate=" + fDate + "&toDate=" + tDate + "&animalType=" + AnimalType);
 	}
 	$("#pdfForm").submit(function(event) {
 		generatePdf(selectedFarmerIds);
 		event.preventDefault();
 	});

 	var selectedFarmerIds = [];
$("#GeneratePayment").prop("disabled", true);
 	$("#file-export").on("change", ":checkbox", function() {
 		var anyCheckboxChecked = $("input[type='checkbox']:checked").length > 0;
 		$("#generateInvoice").prop("disabled", !anyCheckboxChecked);
 		$("#GeneratePayment").prop("disabled", !anyCheckboxChecked);
 		updateSelectedFarmerIds();
 		updateSelectAllCheckbox();		
 	});
 	
 	$("#selectAllCheckbox").change(function() {
 		var isChecked = this.checked;
 		$("#file-export :checkbox").prop("checked", isChecked); // Update individual checkboxes based on "Select All" state		
 		updateSelectedFarmerIds(); // Update the selectedFarmerIds array
 	});

 	function updateSelectedFarmerIds() {
 		selectedFarmerIds = $("#file-export :checkbox:checked").map(function() {

 			return $(this).data("farmer-id");
 		}).get();
 	}

 	function updateSelectAllCheckbox() {
 		var allCheckboxes = $("#file-export :checkbox");
 		$("#selectAllCheckbox").prop("checked", allCheckboxes.length === allCheckboxes.filter(":checked").length);
 	}

 				
 				var selectedFarmers = [];
			 	function calculatePaymentDetails(totalMilkAmount, totalRemainingFeedAmount, totalAdvanceAmount, advancePercentage) {
				var advanceAdded=0;	
			    var amountAfterDeduction = ((totalMilkAmount - totalRemainingFeedAmount) * advancePercentage) / 100;
			    var remainingAmount = totalMilkAmount - totalRemainingFeedAmount;
			    var paymentAmount = remainingAmount - amountAfterDeduction;
	
				if (totalAdvanceAmount < amountAfterDeduction) {
			    paymentAmount = Math.max(0, amountAfterDeduction - totalAdvanceAmount);
			    if (remainingAmount > totalAdvanceAmount) {
			        paymentAmount = Math.max(0, remainingAmount - totalAdvanceAmount);
			    }
			} else if (totalAdvanceAmount > amountAfterDeduction && remainingAmount > totalAdvanceAmount) {
			    paymentAmount = Math.max(0, remainingAmount - amountAfterDeduction);
			}
			if (totalAdvanceAmount == 0) {
			    amountAfterDeduction = 0;
			}
			if (Number(totalMilkAmount) < Number(totalRemainingFeedAmount)) {
		    advanceAdded = totalRemainingFeedAmount - totalMilkAmount;
		  	}
			if (totalRemainingFeedAmount > totalMilkAmount) {
			    var remainingAmountAfterFeedDeduction = Math.max(0, totalRemainingFeedAmount - totalMilkAmount);
			    if (remainingAmountAfterFeedDeduction !== 0) {
			        totalAdvanceAmount += remainingAmountAfterFeedDeduction;
			        advavamountAfterDeduction = 0;
			        paymentAmount = 0;
			    }
			    amountAfterDeduction = 0;
			}
			//console.log('Feed Deduction:', TotalDeductionForFeed);
			//console.log('Advance Deduction:', TotalDeductionForAdvance)
		    return {
			        amountAfterDeduction: amountAfterDeduction,
			        remainingAmount: remainingAmount,
			        paymentAmount: paymentAmount,
			        advanceAdded:advanceAdded
			    };
			}
			
			$("#GeneratePayment").on("click", function() {
			    var advancePercentage = $("#advancePercentage").val();
			    $("#Percentage").html(advancePercentage);
			    $("#displayDates").html("From " + fDate + " To " + tDate);		
			    if (selectedFarmerIds.length > 0) {
			        $("#paymentGenerateList tbody").empty();
			        for (var i = 0; i < selectedFarmerIds.length; i++) {
			            var farmerId = selectedFarmerIds[i];
			            var selectedRow = $("#file-export tbody").find('input[data-farmer-id="' + farmerId + '"]').closest('tr');
			            var farmerName = selectedRow.find('td:eq(1)').text();
			            var milkQuantity = selectedRow.find('td:eq(2)').text();
			            var totalMilkAmount = parseFloat(selectedRow.find('td:eq(3)').text());
			            var totalRemainingFeedAmount = selectedRow.find('td:eq(4)').text();
			            var totalAdvanceAmount = selectedRow.find('td:eq(5)').text();					
			            var paymentDetails = calculatePaymentDetails(totalMilkAmount, totalRemainingFeedAmount, totalAdvanceAmount, advancePercentage);						
			            var newRow = '<tr>' +
			                '<td><input type="checkbox" data-farmer-id="' + farmerId + '"></td>' +		
			                '<td>' + farmerName + '-' + farmerId + '</td>' +
			                '<td>' + milkQuantity + '</td>' +
			                '<td>' + totalMilkAmount + '</td>' +
			                '<td>' + totalRemainingFeedAmount + '</td>' +
			                '<td>' + (Number(totalAdvanceAmount)+Number(paymentDetails.advanceAdded)).toFixed(1)+ '</td>' +			               
			                '<td>' + paymentDetails.amountAfterDeduction + '</td>' +
			                '<td>' + Number(paymentDetails.paymentAmount).toFixed(1) + '</td>' +
			                '</tr>';
			            $("#paymentGenerateList tbody").append(newRow);			           
			        }
			    } 
			    $('#pay').prop('disabled', true);
			});
	
			$('#paymentGenerateList tbody').on('change', 'input[type="checkbox"]', function () {			
			if ($(this).prop('checked')) {
			        $('#pay').prop('disabled', false); // Enable the "Pay" button when a checkbox is checked
			    } else {
			        if ($('#paymentGenerateList tbody').find('input[type="checkbox"]:checked').length === 0) {
			            $('#pay').prop('disabled', true); // Disable the "Pay" button when all checkboxes are unchecked
			        }
			    }			
			    var $row = $(this).closest('tr');
			    var farmerId = $(this).data('farmer-id');
			    var total_collected_milk = $row.find('td:eq(2)').text();
			    var TotalMilkAmount = $row.find('td:eq(3)').text();
			    TotalDeductionForFeed = Number($row.find('td:eq(4)').text());
				var AdvanceTotalAmount = Number($row.find('td:eq(5)').text());
			    var TotalDeductionForAdvance = Number($row.find('td:eq(6)').text());
    			if(Number(TotalDeductionForAdvance) > Number(AdvanceTotalAmount)){
				TotalDeductionForAdvance=Number(AdvanceTotalAmount);
				}
				if(Number(TotalDeductionForFeed) > Number(TotalMilkAmount)){
				console.log((TotalDeductionForFeed-TotalMilkAmount));
				TotalDeductionForFeed=Number(TotalMilkAmount)
				}
			    var TotalPaymentAmount = $row.find('td:eq(7)').text();
			    var invoiceDate = $('#paymentDate').val();
			    var paymentMethod = $('#paymentMethod').val();
			    var paymentNote = $('#paymentNote').val();			
			    if ($(this).prop('checked')) {
			        selectedFarmers.push({
			            invoice_date: invoiceDate,
			            from_date: fDate,
			            to_date: tDate,
			            amount: TotalPaymentAmount,
			            farmer: farmerId,
			            total_collected_milk: total_collected_milk,
			            milktype: AnimalType,
			            feed_deduction: TotalDeductionForFeed,
			            advance_deduction: TotalDeductionForAdvance,
			            payment_method: paymentMethod,
			            payment_note: paymentNote
			        });
			    } else {
			        selectedFarmers = selectedFarmers.filter(farmer => farmer.farmer !== farmerId);
			    }     
			});
			function deleteSelectedRow(farmerId) {
		     $('#paymentGenerateList tbody').find('input[type="checkbox"][data-farmer-id="' + farmerId + '"]').closest('tr').hide();
			}
			$('#pay').click(function () {
				 $(this).prop('disabled', true);
			    console.log(selectedFarmers);
			    $.ajax({
			        type: 'POST',
			        url: 'http://localhost:6161/paymentToFarmer',
			        contentType: 'application/json',
			        data: JSON.stringify(selectedFarmers),
			        success: function (response) {
			            console.log('Payment submitted successfully:', response);
			            alert(response)
				            for (var i = 0; i < selectedFarmers.length; i++) {
				                var farmerId = selectedFarmers[i].farmer;
				                deleteSelectedRow(farmerId);
				            }
				              selectedFarmers = [];
				            $('#paymentNote').val("")     
			              $(this).prop('disabled', true); 
			        },
			        error: function (error) {
			            console.error('Error submitting payment:', error);
			        }
			    });		    
			});



 	
 });	

 /*Payment To Farmer End Start*/



/*Milkcollection Invoice Script Start*/ 
		var milkType,fromDate,toDate;
		 
	$(document).ready(function() {
    var selectedFarmersData = [];
    var flag="invoice";
  $("#getInvoiceRecords").on("click", function() {
        fromDate = $("#fromDate").val();
        toDate  = $("#toDate").val();
         milkType = document.querySelector('input[name="milkType"]:checked').value;
		$.ajax({
             url: 'http://localhost:6161/paymentToFarmer/datewise/' + fromDate + '/' + toDate + '/' + milkType+"/"+flag,
            type: 'GET',
            dataType: 'json',
            success: function(result) {
                $("#file-export tbody").empty(); // Clear existing table rows
                for (var i = 0; i < result.length; i++) {
                    var farmer = result[i];
                    var newRow = '<tr class="gridjs-tr">' +
                        '<td>' + '<input type="checkbox" data-farmer-id="' + farmer.farmer + '"> ' + '</td>' +
                        '<td>' + farmer.farmerName + '</td>' +
                        '<td>' + farmer.invoice_date + '</td>' +
                        '<td>' + farmer.total_collected_milk + '</td>' +
                        '<td>' + farmer.amount + '</td>' +
                        '<td>' + farmer.feed_deduction + '</td>' +
                        '<td>' + farmer.advance_deduction + '</td>' +
                        '</tr>';
                    $("#file-export tbody").append(newRow);
                }
            },
            error: function(error) {
                console.error('Error fetching data:', error);
            }
        });
    });

    function generatePdf(selectedFarmersData) {
		console.log(selectedFarmersData)
       var encodedId = selectedFarmersData.map(function(farmerData) {
        return encodeURIComponent(farmerData.farmerId);
    }).join(',');
    
    
    
    var amounts = selectedFarmersData.map(function(farmerData) {
        return farmerData.amount;
    });

    var feedDeductions = selectedFarmersData.map(function(farmerData) {
        return farmerData.feedDeduction;
    });

    var advanceDeductions = selectedFarmersData.map(function(farmerData) {
        return farmerData.advanceDeduction;
    });
     //var encodedIds = farmerIds.join(',');
    var encodedAmount = amounts.join(',');
    var encodedFeedDeduction = feedDeductions.join(',');
    var encodedAdvanceDeduction = advanceDeductions.join(',');
    
       console.log(encodedId)
 		$("#pdfIframe").attr("src", "/generatePdf?farmerId=" + encodedId + "&fromDate=" + fromDate + "&toDate=" + toDate + "&animalType=" + milkType+"&amount="+encodedAmount+"&feedDeduction="+encodedFeedDeduction+"&advanceDeduction="+encodedAdvanceDeduction);
    }

    $("#pdfForm").submit(function(event) {
        generatePdf(selectedFarmersData);
        event.preventDefault();
    });

    $("#GeneratePayment").prop("disabled", true);

    $("#file-export").on("change", ":checkbox", function() {
        updateSelectedFarmersData();
        updateGeneratePaymentButton();
    });

    $("#selectAllCheckbox").change(function() {
        $("#file-export :checkbox").prop("checked", this.checked);
        updateSelectedFarmersData();
        updateGeneratePaymentButton();
    });

    function updateSelectedFarmersData() {
        selectedFarmersData = $("#file-export :checkbox:checked").map(function() {
			console.log(selectedFarmersData)
            var $row = $(this).closest("tr");
            return {
                farmerId: $(this).data("farmer-id"),
                amount: $row.find("td:eq(4)").text(),
                feedDeduction: $row.find("td:eq(5)").text(),
                advanceDeduction: $row.find("td:eq(6)").text()
            };
        }).get();
    }

    function updateGeneratePaymentButton() {
        var anyCheckboxChecked = selectedFarmersData.length > 0;
        $("#GeneratePayment").prop("disabled", !anyCheckboxChecked);
    }
});

 /*Milkcollection Invoice Script End*/
	
	
	
	
	

	/*Bonus To Farmer Script Start*/
			var fDate;
			var tDate;
			var selectedFarmerIds = [];
			var selectedFarmersData = [];
		
			$("#getFarmerRecordsBonus").on("click", function () {
				fDate = $("#fromDate").val();
				tDate = $("#toDate").val();
				var bonusAmountPerLiter = $("#bonusAmountPerLiter").val();
				var milkType = $('input[name="milkType"]:checked').val();
		
				$.ajax({
					url: 'http://localhost:6161/bonusToFarmer/' + fDate + '/' + tDate + '/' + milkType,
					type: 'GET',
					dataType: 'json',
					success: function (result) {
						console.log(result);
						$("#file-export tbody").empty();
						for (var i = 0; i < result.length; i++) {
							var farmer = result[i];
							var newRow = '<tr class="gridjs-tr">' +
								'<td>' + '<input type="checkbox" id="checkbox-' + farmer.farmerId + '" data-farmer-id="' + farmer.farmerId + '"> ' + '</td>' +
								'<td>' + farmer.farmerName + '</td>' +
								'<td>' + farmer.milkQuantity + '</td>' +
								'<td>' + farmer.milkQuantity * bonusAmountPerLiter + '</td>' +
								'<input type="hidden" class="branchId" value="' + farmer.branchId + '">' +
								'</tr>';
							$("#file-export tbody").append(newRow);
						}
					},
					error: function (error) {
						console.error('Error fetching data:', error);
					}
				});
			});
		
			$("#submitSelectedRecords").on("click", function (event) {
				event.preventDefault();
				saveSelectedFarmersToDatabase();
			});
		
			function saveSelectedFarmersToDatabase() {
				var totalQuantity = 0;
				var totalBonusAmount = 0;
				var selectedBranchId = null;
				
				selectedFarmersData = [];
				var selectedFarmerIds = [];
		
				$('input[type="checkbox"]:checked').each(function () {
					var farmerId = $(this).data('farmer-id');
					selectedFarmerIds.push(farmerId);
		
					var row = $(this).closest('tr');
					var farmerName = row.find('td:eq(1)').text();
					var quantity = parseFloat(row.find('td:eq(2)').text());
					var bonusAmount = quantity * parseFloat($("#bonusAmountPerLiter").val());
					var branchId = parseInt(row.find('.branchId').val());
					selectedBranchId = branchId;
				    totalQuantity+ = quantity;
					 totalBonusAmount+ = bonusAmount;
		
					var farmerData = {
						farmerId: farmerId,
						farmerName: farmerName,
						totalQuantity: quantity,
						totalBonusAmount: bonusAmount,
						branchId: branchId
					};
					 					
					selectedFarmersData.push(farmerData);
					

							
				});
		
				var fromDate=fDate;
				var toDate=tDate; 
				var milkType = $('input[name="milkType"]:checked').val();
			    var bonusDate = new Date();
			    var formattedBonusDate = bonusDate.toISOString().split('T')[0];
		
				var requestDto = {
					selectedFarmerIds: selectedFarmerIds,
					fromDate: fromDate,
					toDate: toDate,
					bonusDate:formattedBonusDate,
					bonusAmountPerLiter: $("#bonusAmountPerLiter").val(),
			    	totalQuantity: totalQuantity,
					totalBonusAmount:totalBonusAmount,
					branchId: selectedBranchId,
					milkType: milkType
				};

				console.log('Request DTO:', requestDto);
		
				$.ajax({
					url: 'http://localhost:6161/bonusToFarmer/selectedFarmers',
					type: 'POST',
					contentType: 'application/json',
					data: JSON.stringify(requestDto),
					success: function (response) {
						console.log('Selected farmers saved successfully:', response);
					},
					error: function (error) {
						console.error('Error saving selected farmers:', error);
					}
				});
			}

			$('#selectAll').change(function () {
			    $(':checkbox').prop('checked', this.checked);
			    if (this.checked) {
			        // If "Select All" checkbox is checked, collect IDs of all checkboxes
			        selectedFarmerIds = []; // Reset selected IDs array
			        $(':checkbox').not(this).each(function () {
			            var farmerId = $(this).data("farmer-id");
			            if (farmerId !== undefined) {
			                selectedFarmerIds.push(farmerId);
			            }
			        });
			    } else {
			        // If "Select All" checkbox is unchecked, clear selected IDs array
			        selectedFarmerIds = [];
			    }
			});

	        $("#file-export-bonus").on("change", ":checkbox", function () {
	    		 	var farmerId = $(this).data("farmer-id");
	    		 	if (this.checked) {
	    				selectedFarmerIds.push(farmerId);
	    		 	} else {
	    		 		selectedFarmerIds = selectedFarmerIds.filter(id =>id !== farmerId);
	    		 	}
	    		 });
	    	
	    		 $("#pdfFormBonus").submit(function (event) {
	    		 	event.preventDefault();
	    			var encodedFarmerIds = selectedFarmerIds.map(function (id) {
	    		 		return encodeURIComponent(id);
	    		 	}).join(',');
	    		 	var url = "/generatePdfBonus?" +
	    		 		"&encodedFarmerIds=" + encodedFarmerIds;
	    		 	$("#pdfIframeBonus").attr("src", url);
	    		 });
	    	
/*Bonus To Farmer Script end*/
	    		 
 /*Milkcollection Report Script Start*/
	var currentDate = new Date();
    var formattedDate = currentDate.toISOString().slice(0, 10);
    var FlagValue="all";
    $("#fromDate").val(formattedDate);
    $("#toDate").val(formattedDate);
    $('input[name="farmer"]').change(function() {
     if ($(this).val() === 'farmerwise') {
        $('#farmerSelect').show();
         $('#farmerSelect').change(function() {
            var selectedFarmer = $(this).val();
            console.log('Selected Farmer:', selectedFarmer);
            FlagValue=selectedFarmer;
        });    
      } else {
        $('#farmerSelect').hide();
         FlagValue="all";
      }
    });
    
    var fromDate,toDate,milkType,Shift; 
   $("#getMilkCollectionRecordsDatewise,#getMilkCollectionRecordsFarmerwise").on("click", function() {
    var clickedButtonId = $(this).attr("id");
      console.log(clickedButtonId)
    if (clickedButtonId === "getMilkCollectionRecordsDatewise") {
       console.log("Datewise button clicked");
         fromDate = $("#fromDate").val();
    	 toDate = $("#toDate").val();
    	  milkType = document.querySelector('input[name="milkType"]:checked').value;
    	  Shift= $("#shiftDropdown").val();
    } else if (clickedButtonId === "getMilkCollectionRecordsFarmerwise") {
		
        console.log("Farmerwise button clicked");
         fromDate = $("#fromDateFarmer").val();
      	 toDate = $("#toDateFarmer").val();
      	  milkType = document.querySelector('input[name="milkTypefarmer"]:checked').value;
      	  Shift= $("#shiftDropdownFarmer").val();
    }
   
    
    
	 $.ajax({
        url: 'http://localhost:6161/milkCollection/getMilkCollectionDataBy/' + fromDate + '/' + toDate + '/' + milkType + "/" + Shift + "/" + FlagValue,
        type: 'GET',
        dataType: 'json',
        success: function(result) {
            $("#file-export tbody").empty();
            var totalMilkQuantity = 0;
            var totalMilkAmount = 0;
			 for (var i = 0; i < result.length; i++) {
                var farmer = result[i];
                var newRow = '<tr class="gridjs-tr">' +
                    '<td>' + farmer.farmerName + '</td>' +
                    '<td>' + farmer.dateOfMilkCollection + '</td>' +
                    '<td>' + farmer.shift + '</td>' +
                    '<td>' + farmer.animalType + '</td>' +
                    '<td>' + farmer.milkFat + '</td>' +
                    '<td>' + farmer.milkSNF + '</td>' +
                    '<td>' + farmer.milkRate + '</td>' +
                    '<td>' + farmer.milkQuantity + '</td>' +
                    '<td>' + farmer.totalMilkAmount + '</td>' +
                    '</tr>';
                $("#file-export tbody").append(newRow);
			    totalMilkQuantity += parseFloat(farmer.milkQuantity);
                totalMilkAmount += parseFloat(farmer.totalMilkAmount);
            }
            var totalRow = '<tr class="gridjs-tr">' +
                '<td colspan="7">Total:</td>' +
                '<td>' + totalMilkQuantity.toFixed(2) + '</td>' +
                '<td>' + totalMilkAmount.toFixed(2) + '</td>' +
                '</tr>';
            $("#file-export tbody").append(totalRow);
        },
        error: function(error) {
            console.error('Error fetching data:', error);
        }
    });
});


/*Milkcollection Report Script End*/

/*Payment Report Script Start*/
	var currentDate = new Date();
    var formattedDate = currentDate.toISOString().slice(0, 10);
    $("#fromDate").val(formattedDate);
    $("#toDate").val(formattedDate);
    var flag="all";
     $('input[name="farmer"]').change(function() {
		console.log($(this).val())
     if ($(this).val() === 'farmerwise') {        
		$('#farmerSelect').show();
         $('#farmerSelect').change(function() {
          var selectedFarmer = $(this).val();
            console.log('Selected Farmer:', selectedFarmer);
            flag=selectedFarmer;
        });    
      } else {
        $('#farmerSelect').hide();
      }
    });
	$("#getPaymentInvoiceRecords").on("click", function() {
    var fromDate = $("#fromDate").val();
    var toDate = $("#toDate").val();
    var milkType = document.querySelector('input[name="milkType"]:checked').value;
	$.ajax({
            url: 'http://localhost:6161/paymentToFarmer/datewise/' + fromDate + '/' + toDate + '/' + milkType+"/"+flag,
            type: 'GET',
            dataType: 'json',
            success: function(result) {
                $("#file-export tbody").empty(); // Clear existing table rows
               var totalCollectedMilk = 0;
            var totalAmount = 0;
            var totalFeedDeduction = 0;
            var totalAdvanceDeduction = 0;
                for (var i = 0; i < result.length; i++) {
                    var farmer = result[i];
                // Calculate totals
                totalCollectedMilk += parseFloat(farmer.total_collected_milk);
                totalAmount += parseFloat(farmer.amount);
                totalFeedDeduction += parseFloat(farmer.feed_deduction);
                totalAdvanceDeduction += parseFloat(farmer.advance_deduction);
                    var newRow = '<tr class="gridjs-tr">' +
                        '<td>' + farmer.farmerName + '</td>' +
                        '<td>' + farmer.invoice_date + '</td>' +
                        '<td>' + farmer.total_collected_milk + '</td>' +
                        '<td>' + farmer.amount + '</td>' +
                        '<td>' + farmer.feed_deduction + '</td>' +
                        '<td>' + farmer.advance_deduction + '</td>' +
                        '</tr>';
                    $("#file-export tbody").append(newRow);
                }
                 // Append total row
            var totalRow = '<tr class="gridjs-tr total-row">' +
                 '<td colspan="2">Total:</td>' +
                '<td>' + totalCollectedMilk.toFixed(2) + '</td>' +
                '<td>' + totalAmount.toFixed(2) + '</td>' +
                '<td>' + totalFeedDeduction.toFixed(2) + '</td>' +
                '<td>' + totalAdvanceDeduction.toFixed(2) + '</td>' +
                '</tr>';
            $("#file-export tbody").append(totalRow);
            },
            error: function(error) {
                console.error('Error fetching data:', error);
            }
        });

});
/*Payment Report Script end*/

		
	
 /* feedStock Script start*/   
	    		 
	    		 $("#file-export-feed tbody").empty();
	    	  		function addRecordToTable() {
	    	  		    var newRow = $('<tr>');
	    	  		    newRow.append('<td>' + $('#supplierId option:selected').text() + '</td>');
	    	  		    newRow.append('<input type="hidden" name="supplierId" value="' + $('#supplierId').val() + '">');
	    	  		    newRow.append('<td>' + $('#dateOfPurchase').val() + '</td>');
	    	  		    newRow.append('<td>' + $('#feedCompanyId option:selected').text() + '</td>');
	    	  		    newRow.append('<input type="hidden" name="feedCompanyId" value="' + $('#feedCompanyId').val() + '">');
	    	  		    newRow.append('<td>' + $('#feedTypeId option:selected').text() + '</td>');
	    	  		    newRow.append('<input type="hidden" name="feedTypeId" value="' + $('#feedTypeId').val() + '">');
	    	  		    newRow.append('<td>' + $('#feedStockCostPerUnit').val() + '</td>');
	    	  		    newRow.append('<td>' + $('#feedStockQuantity').val() + '</td>');
	    	  		    newRow.append('<td>' + $('#feedStockTotalAmount').val() + '</td>');
	    	  		    newRow.append('<td>' + $('textarea[name="remark"]').val() + '</td>');
	    	  		  newRow.append('<td><button class="btn btn-danger btn-sm deleteBtn">Delete</button></td>');

	    	  		   // newRow.append('<td><button class="btn btn-danger deleteBtn">Delete</button></td>');
	    	  		    
	    	  		    $('#file-export-feed tbody').append(newRow);
	    	  		    
	    	  		    $('#feedStockForm')[0].reset();
	    	  		}


	    	  	    
	    	  	    $('#addRecordBtn').click(function(event) {
	    	  	        event.preventDefault(); 
	    	  	        addRecordToTable(); 
	    	  	    });

	    	  	    
	    	  	    $('#file-export-feed').on('click', '.deleteBtn', function() {
	    	  	        $(this).closest('tr').remove(); 
	    	  	        
	    	  	        if ($('#file-export-feed tbody tr').length === 0) {
	    	  	            $('#submitButton').hide();
	    	  	        }
	    	  	    });

	    	  	   
	    	  	    function saveRecordsToServer() {
	    	  	        var records = [];

	    	  	       
	    	  	        $('#file-export-feed tbody tr').each(function() {
	    	  	        	var record = {
	    	  	                    supplierId: $(this).find('input[name="supplierId"]').val(),
	    	  	                    dateOfPurchase: $(this).find('td:eq(1)').text(),
	    	  	                    feedCompanyId: $(this).find('input[name="feedCompanyId"]').val(),
	    	  	                    feedTypeId: $(this).find('input[name="feedTypeId"]').val(),
	    	  	                    feedCostPerUnit: $(this).find('td:eq(4)').text(),
	    	  	                    quantity: $(this).find('td:eq(5)').text(),
	    	  	                    totalAmount: $(this).find('td:eq(6)').text(),
	    	  	                    remark: $(this).find('td:eq(7)').text()
	    	  	                };
	    	  	            records.push(record);
	    	  	        });
	    	              console.log(records)

	    	  	        $.ajax({
	    	  	            type: 'POST',
	    	  	            url: '/feedStock',
	    	  	            contentType: 'application/json',
	    	  	            data: JSON.stringify(records),
	    	  	            
	    	  	            success: function(response) {
	    	  	                console.log(response);
	    	  	                window.location.href = '/feedStock';
	    	  	            },
	    	  	            error: function(xhr, status, error) {
	    	  	                console.error(xhr.responseText); 
	    	  	            }
	    	  	        });
	    	  	    }

	    	  	   
	    	  	    $('#submitButton').click(function(event) {
	    	  	        event.preventDefault(); 
	    	  	        saveRecordsToServer(); 
	    	  	    });
	
  /* feedStock Script end*/   




/*Feed Report Script Start*/
 $('#myTabs a').click(function (e) {
                 e.preventDefault()
                $(this).tab('show')   
                 $("#file-export tbody").empty(); 
                  var currentDate = new Date();
				    var formattedDate = currentDate.toISOString().slice(0, 10);
				    $("#fromDate").val(formattedDate);
				    $("#toDate").val(formattedDate);
				     $('#farmerSelect').val(''); 
     });
     var flag="all";
     $('input[name="farmer"]').change(function() {
		if ($(this).val() === 'farmerwise') {
		$('#farmerSelect').show();
         $('#farmerSelect').change(function() {
          var selectedFarmer = $(this).val();
            flag=selectedFarmer;
        });    
      } else {
        $('#farmerSelect').hide();
     	 flag="all";
      }
    });
     $("#feedCompanyList").on("change", function() {
         var selectedFeedCompanyId = $("#feedCompanyList").val();
        flag = selectedFeedCompanyId+"fc";
    });
      var currentDate = new Date();
    var formattedDate = currentDate.toISOString().slice(0, 10);
    $("#fromDate").val(formattedDate);
    $("#toDate").val(formattedDate);
    var fromDate,toDate;
   $("#getFeedRecordsDatewise, #getFeedRecordsFarmerwise,#getFeedRecordsCompanywise").on("click", function () {
	    var clickedButtonId = $(this).attr("id");
    if (clickedButtonId === "getFeedRecordsDatewise") {
         fromDate = $("#fromDate").val();
    	 toDate = $("#toDate").val();
    } else if (clickedButtonId === "getFeedRecordsFarmerwise") {
        fromDate = $("#fromDateFarmer").val();
      	 toDate = $("#toDateFarmer").val();
    }
    else if(clickedButtonId === "getFeedRecordsCompanywise"){
		 fromDate = $("#fromDateComp").val();
      	 toDate = $("#toDateComp").val();
	}
    $.ajax({
        url: 'http://localhost:6161/feedToFarmers/datewiseFeed/' + fromDate + '/' + toDate + "/"+flag,
        type: 'GET',
        dataType: 'json',
        success: function (result) {
            $("#file-export tbody").empty(); // Clear existing table rows
			 var totalQuantity = 0;
            var totalAmount = 0;
			for (var i = 0; i < result.length; i++) {
                var farmer = result[i];
                var newRow = '<tr class="gridjs-tr">' +
                    '<td>' + farmer.dateOfPurchase + '</td>' +
                    '<td>' + farmer.farmerName + '</td>' +
                    '<td>' + farmer.feedTypeName + '</td>' +
                    '<td>' + farmer.feedCompanyName + '</td>' +
                    '<td>' + farmer.feedRate + '</td>' +
                    '<td>' + farmer.quantity + '</td>' +
                    '<td>' + farmer.totalAmount + '</td>' +
                    '</tr>';
				 $("#file-export tbody").append(newRow);
			    totalQuantity += parseFloat(farmer.quantity);
                totalAmount += parseFloat(farmer.totalAmount);
            }
			 var totalRow = '<tr class="gridjs-tr">' +
                '<td colspan="5">Total</td>' +
                '<td>' + totalQuantity.toFixed(2) + '</td>' +
                '<td>' + totalAmount.toFixed(2) + '</td>' +
                '</tr>';
		 $("#file-export tbody").append(totalRow);
        },
        error: function (error) {
            console.error('Error fetching data:', error);
        }
    });
});

/*Feed Report Script End*/



/*Advance Report Script Start*/

 var flag="all";
     $('input[name="farmer"]').change(function() {
		if ($(this).val() === 'farmerwise') {
		$('#farmerSelect').show();
         $('#farmerSelect').change(function() {
          var selectedFarmer = $(this).val();
            flag=selectedFarmer;
        });    
      } else {
        $('#farmerSelect').hide();
     	 
      }
    });
     var fromDate,toDate;
       
$("#getAdvanceRecordsDatewise,#getAdvanceRecordsFarmerwise").on("click", function () {
	   fromDate = $("#fromDate").val();
       toDate = $("#toDate").val();
      var clickedButtonId = $(this).attr("id");
      console.log(clickedButtonId)
    if (clickedButtonId === "getAdvanceRecordsDatewise") {
       console.log("Datewise button clicked");
         fromDate = $("#fromDate").val();
    	 toDate = $("#toDate").val();
    } else if (clickedButtonId === "getAdvanceRecordsFarmerwise") {
        console.log("Farmerwise button clicked");
         fromDate = $("#fromDateFarmer").val();
      	 toDate = $("#toDateFarmer").val();
      	 console.log("From:"+fromDate+ "To:"+toDate)
    }
   $.ajax({
        url: 'http://localhost:6161/advanceToFarmer/datewise/' + fromDate + '/' + toDate + "/"+flag,
        type: 'GET',
        dataType: 'json',
        success: function (result) {
            $("#file-export tbody").empty(); // Clear existing table rows
			for (var i = 0; i < result.length; i++) {
                var farmer = result[i];
                var newRow = '<tr class="gridjs-tr">' +
                    '<td>' + farmer.dateOfAdvance + '</td>' +
                    '<td>' + farmer.farmerName + '</td>' +
                    '<td>' + farmer.amount + '</td>' +
                    '<td>' + farmer.remainingAmount + '</td>' +
                    '<td>' + farmer.remark + '</td>' +
                    '</tr>';
					 $("#file-export tbody").append(newRow);
			 }
		},
        error: function (error) {
            console.error('Error fetching data:', error);
        }
    });
    
});
/*Advance Report Script End*/


/*Bonus Report Script Start*/

var flag="all";
    $('input[name="farmer"]').change(function() {
		if ($(this).val() === 'farmerwise') {
		$('#farmerSelect').show();
        $('#farmerSelect').change(function() {
         var selectedFarmer = $(this).val();
           flag=selectedFarmer;
       });    
     } else {
       $('#farmerSelect').hide();
    	 
     }
   });
    var fromDate,toDate;
      
$("#getBonusRecordsDatewise,#getBonusRecordsFarmerwise").on("click", function () {
	   fromDate = $("#fromDate").val();
      toDate = $("#toDate").val();
     var clickedButtonId = $(this).attr("id");
     console.log(clickedButtonId)
   if (clickedButtonId === "getBonusRecordsDatewise") {
      console.log("Datewise button clicked");
        fromDate = $("#fromDate").val();
   	 toDate = $("#toDate").val();
   } else if (clickedButtonId === "getBonusRecordsFarmerwise") {
       console.log("Farmerwise button clicked");
        fromDate = $("#fromDateFarmer").val();
     	 toDate = $("#toDateFarmer").val();
     	 console.log("From:"+fromDate+ "To:"+toDate)
   }
  $.ajax({
       url: 'http://localhost:6161/bonusToFarmer/datewise/' + fromDate + '/' + toDate + "/"+flag,
       type: 'GET',
       dataType: 'json',
       success: function (result) {
           $("#file-export tbody").empty(); // Clear existing table rows
			for (var i = 0; i < result.length; i++) {
               var farmer = result[i];
               var newRow = '<tr class="gridjs-tr">' +
                   '<td>' + farmer.bonusDate + '</td>' +
                   '<td>' + farmer.farmerName + '</td>' +
                   '<td>' + farmer.milkType + '</td>' +
                   '<td>' + farmer.bonusAmountPerLiter + '</td>' +
                   '<td>' + farmer.totalQuantity + '</td>' +
                   '<td>' + farmer.totalBonusAmount + '</td>' +
                   '</tr>';
					 $("#file-export tbody").append(newRow);
			 }
		},
       error: function (error) {
           console.error('Error fetching data:', error);
       }
   });
   
});
/*Bonus Report Script End*/



/*display Milk Collection  Script start*/
var currentDate = new Date();
var formattedDate = currentDate.toISOString().slice(0, 10);
$("#selectedDate").val(formattedDate);

$("#myTabs a").click(function (e) {
    e.preventDefault();
    $(this).tab('show');
});

$("#getMilkCollectionDatewise").click(function () {
    var selectedDate = $("#selectedDate").val();
    var milkType = $("input[name='milkType']:checked").val();
    var shift = $("#shiftDropdown").val(); 
    $.ajax({
        type: "GET",
        url: "/milkCollection/getMilkCollectionDataBy/" + selectedDate + "/" + milkType + "/" + shift,
        success: function (data) {
            
            var totalMilkQuantity = 0;
            var totalMilkAmount = 0;

            $.each(data, function(index, milkCollection) {
                var row = "<tr>" +
                    "<td>" + milkCollection.farmerName + "</td>" +
                    "<td>" + milkCollection.dateOfMilkCollection + "</td>" +
                    "<td>" + milkCollection.shift+ "</td>" +
                    "<td>" + milkCollection.animalType + "</td>" +
                    "<td>" + milkCollection.milkFat + "</td>" +
                    "<td>" + milkCollection.milkSNF + "</td>" +
                    "<td>" + milkCollection.milkRate + "</td>" +
                    "<td>" + milkCollection.milkQuantity + "</td>" +
                    "<td>" + milkCollection.totalMilkAmount + "</td>" +
                    "</tr>";
                $("#file-export-datewise tbody").append(row);
                totalMilkQuantity += parseFloat(milkCollection.milkQuantity);
                totalMilkAmount += parseFloat(milkCollection.totalMilkAmount);
            });
            var totalRow = '<tr class="gridjs-tr">' +
            '<td colspan="7">Total:</td>' +
            '<td>' + totalMilkQuantity.toFixed(2) + '</td>' +
            '<td>' + totalMilkAmount.toFixed(2) + '</td>' +
            '</tr>';
        $("#file-export-datewise tbody").append(totalRow);
        
        },
        error: function (xhr, status, error) {
            console.error("Error:", status, error);
        }
    });
});

/*display Milk Collection  Script end*/


 /*Milk Collection Script Start*/

		        var milkQuantity = $("#milkQuantity").val();
		        var milkFat = $("#milkFat").val();
		        var milkSNF = $("#milkSNF").val();
		        var animalType = document.querySelector('input[name="animalType"]:checked').value;
		
		        if (animalType && milkFat && milkSNF) {
		            $.ajax({
		                url: 'http://localhost:6161/milkRate/type/' +encodeURIComponent(animalType) + '/fat/' + encodeURIComponent(milkFat) + '/snf/' + encodeURIComponent(milkSNF),
		                type: 'GET',
		                dataType: 'json',
		                success: function (result) {
		                    $("#milkRate").val(result);
		                    $("#totalMilkAmount").val(milkQuantity * result);
		                },
		                error: function (error) {
		                    console.error('Error fetching data:', error);
		                }
		            });

		        }

		        
		    

		
		    updateMilkRateAndAmount();
		
		    $('input[name="animalType"]').on('change', function () {
		        updateMilkRateAndAmount();
		    });
		
		    $('#milkFat, #milkSNF').on('keyup', function () {
		        updateMilkRateAndAmount();
		    });
		    
		     $('#milkQuantity').on('keyup', function () {
				 
			       var milkQuantity = $("#milkQuantity").val();
			       var milkRate = $("#milkRate").val();
			       
			       if(milkRate !== 0 || milkRate !== "" || milkRate !== null ){
					   $("#totalMilkAmount").val(milkQuantity*milkRate);
				   }
			   
		       });

	   

 /*Milk Collection Script End*/
		 





        /* Start Farmer Records Active and InActive*/
        function getFarmers(status) {
            var url = '/farmers'; 
            if (status === 'active') {
                url += '/active';
                document.getElementById('statusDropdown').innerHTML = 'Active';
            } else if (status === 'inactive') {
                url += '/InActiveFarmers/inActive';
                
                document.getElementById('statusDropdown').innerHTML = 'inactive';
                
                setTimeout(function() {
                    if (document.getElementById('statusDropdown').innerHTML === 'inactive') {
                        document.getElementById('statusDropdown').innerHTML = 'Active';
                    }
                },90000);
            } else {
                console.error('Invalid status');
                return;
            }
            
            $.ajax({
                type: 'GET',
                url: url,
                success: function(data) {
                    $('#file-export tbody').html(data);
                },
                error: function(xhr, status, error) {
                    console.error(xhr.responseText);
                }
            });
        }  
    
        /* End Farmer Records Active and InActive*/
      

