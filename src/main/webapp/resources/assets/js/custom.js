 $(document).ready(function() {

 	/*Feed Distribution Script Start*/

 	function calculateTotalFeedAmount() {

 		var feedQuantity = $("#feedQuantity").val();
 		var feedCostPerUnit = $("#feedCostPerUnit").val();
 		$("#FeedTotalAmount").val(feedQuantity * feedCostPerUnit);


 	};

 	$('#feedQuantity, #feedCostPerUnit').on('keyup', function() {
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

 	$("#routeName").on("change", function() {

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

    $("#getInvoiceRecords").on("click", function() {
        fromDate = $("#fromDate").val();
        toDate  = $("#toDate").val();
         milkType = document.querySelector('input[name="milkType"]:checked').value;

        $.ajax({
            url: 'http://localhost:6161/paymentToFarmer/datewise/' + fromDate + '/' + toDate + '/' + milkType,
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



/*Bonus To Farmer Script Start*/
	$(document).ready(function () {
		var fDate;
		var tDate;
		var selectedFarmerIds = [];
		var selectedFarmersData = [];
	
		$("#getFarmerRecordsBonus").on("click", function () {
			fDate = $("#fromDate").val();
			tDate = $("#toDate").val();
			var bonusFlag = $(this).data("flag");
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
				var milkQuantity = parseFloat(row.find('td:eq(2)').text());
				var bonusAmount = milkQuantity * parseFloat($("#bonusAmountPerLiter").val());
				var branchId = parseInt(row.find('.branchId').val());
				selectedBranchId = branchId;
	
				var farmerData = {
					farmerId: farmerId,
					farmerName: farmerName,
					milkQuantity: milkQuantity,
					bonusAmount: bonusAmount,
					branchId: branchId
				};
	
				selectedFarmersData.push(farmerData);
				totalQuantity += milkQuantity;
				totalBonusAmount += bonusAmount;
			});
	
			var fromDateObject = new Date(fDate);
			var toDateObject = new Date(tDate);
			var milkType = $('input[name="milkType"]:checked').val();
	
			var requestDto = {
				selectedFarmerIds: selectedFarmerIds,
				fromDate: fromDateObject,
				toDate: toDateObject,
				bonusAmountPerLiter: $("#bonusAmountPerLiter").val(),
				totalQuantity: totalQuantity,
				totalBonusAmount: totalBonusAmount,
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
    	

	});
 /*Bonus To Farmer Script end*/


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
        
        
        
        
        
        
	

