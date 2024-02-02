 $(document).ready(function(){
	 
	      /*Feed Distribution Script Start*/
		
		    function calculateTotalFeedAmount() {
				 
			       var feedQuantity = $("#feedQuantity").val();
			       var feedCostPerUnit = $("#feedCostPerUnit").val();
			       $("#FeedTotalAmount").val(feedQuantity*feedCostPerUnit);
				   
			       };
		       
		        $('#feedQuantity, #feedCostPerUnit').on('keyup', function () {
			        calculateTotalFeedAmount();
			    });
	 
	 		/*Equipment Script Start*/
			
			$("#equipmentQuantity").on("blur", function(){
				
				var equipmentQuantity = $("#equipmentQuantity").val();
			    var equipmentPrice = $("#equipmentPrice").val();
				$("#equipmentTotalAmount").val(equipmentQuantity*equipmentPrice);
				
			});
	      
	      /*Feed Distribution Script End*/
	      
	          /*Equipment Script Start*/
			
			$("#equipmentPrice").on("blur", function(){
				
				 var equipmentQuantity = $("#equipmentQuantity").val();
			     var equipmentPrice = $("#equipmentPrice").val();
				$("#equipmentTotalAmount").val(equipmentQuantity*equipmentPrice);
				
			});
			
			/*Equipment Script End*/
						
			/*Feed Company Script Start*/
			
			$("#feedCompanyList").on("change",function(){
			
						var id = $("#feedCompanyList").val();
						
						$.ajax({
					    url: 'http://localhost:6161/feedStock/getFeedTypeByFeedCompanyId/'+id,
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
			
			$("#milkCollectionByDate").on("change",function(){
				
						var date = $("#milkCollectionByDate").val();
						
						$.ajax({
					    url: 'http://localhost:6161/milkCollection/selectedDateForMilkData/'+date,
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

	    $("#routeName").on("change",function(){
		
			var id = $("#routeName").val();
		
				$.ajax({
					        url: 'http://localhost:6161/milkCollection/' + id, 
					        type: 'GET',
					        dataType: 'json',
					        success: function (result) {
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
					        error: function (error) {
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

	     
	      
	    
			
		});
		
		  /*Milk Collection Script End*/
		  
		  
		  
		  /*Payment To Farmer Script Start*/
		  
	   	var fDate
        var tDate;
        $(document).ready(function () {
               
            $("#getFarmerRecords").on("click", function () {
              
                fDate=fromDate
                var fromDate = $("#fromDate").val();
                var toDate = $("#toDate").val();
                fDate=fromDate
                tDate=toDate
                var milkType = document.querySelector('input[name="milkType"]:checked').value;

                $.ajax({
                    url: 'http://localhost:6161/paymentToFarmer/' + fromDate + '/' + toDate + '/' + milkType,
                    type: 'GET',
                    dataType: 'json',
                    success: function (result) {
                        console.log(result)
                        $("#file-export tbody").empty(); // Clear existing table rows
                        for (var i = 0; i < result.length; i++) {
                            var farmer = result[i];                           
                            var newRow = '<tr class="gridjs-tr">' +
                                '<td>' + '<input type="checkbox"  data-farmer-id="' + farmer.farmerId + '"> ' + '</td>'+
                                '<td>' + farmer.farmerName + '</td>' +                             
                                '<td>' + farmer.milkQuantity + '</td>' +
                                '<td>' + farmer.totalMilkAmount + '</td>' +
                                '<td>' + '<button type="button" id="eyeButton" data-farmer-id="' + farmer.farmerId + '" data-bs-toggle="modal" data-bs-target="#milkList"><b>i</b></button>' + '</td>' +
                                '</tr>';   
                                $("#file-export tbody").append(newRow);
                        }
                    },
                    error: function (error) {
                        console.error('Error fetching data:', error);
                    }
                });
            });
                $("#file-export").on("click", "#eyeButton", function () {
                var farmerId = $(this).data("farmer-id");
                $.ajax({
                    url: 'http://localhost:6161/paymentToFarmer/getMilkCollectionDataBy/'+farmerId,
                    type: 'GET',
                    dataType: 'json',
                    success: function (result) {
                      
                        $("#file-export2 tbody").empty();
                            var prevDate = null;
                            for (var i = 0; i < result.length; i++) {
                                var farmer = result[i];
                                var formattedDate = new Date(farmer.dateOfMilkCollection).toISOString().split('T')[0];
                                var newRow = '<tr class="gridjs-tr">';
                                if (prevDate === formattedDate) {
                                    newRow += '<td></td>';  // Empty cell for rowspan
                                } else {
                                    newRow += '<td>' + formattedDate + '</td>';  // Show the date only once
                                }
                                // Add other columns as needed
                                newRow += '<td>' + farmer.shift + '</td>' +
                                    '<td>' + farmer.milkQuantity + '</td>' +
                                    '<td>' + farmer.milkFat + '</td>' +
                                    '<td>' + farmer.milkSNF + '</td>' +
                                    '<td>' + farmer.totalMilkAmount + '</td>' +
                                    '</tr>';
                                $("#file-export2 tbody").append(newRow);
                                document.getElementById("farmerName").innerHTML = farmer.farmerName;
                                prevDate = formattedDate;// Update prevDate for the next iteration
                            }
                    },
                    error: function (error) {
                        console.error('Error fetching data:', error);
                    }
                });
                });  
                function generatePdf(selectedFarmerIds) {
            	var encodedId = encodeURIComponent(selectedFarmerIds);
				$("#pdfIframe").attr("src", "/generatePdf?farmerId=" + encodedId+"&fromDate="+fDate+"&toDate="+tDate );
			}
			$("#pdfForm").submit(function (event) { 
			    generatePdf(selectedFarmerIds);
			    event.preventDefault();
			});
		    var selectedFarmerIds = [];
		    $("#file-export").on("change", ":checkbox", function () {
		    var farmerId = $(this).data("farmer-id");		
		    if (this.checked) {
		        selectedFarmerIds.push(farmerId); // Add the selected farmer ID to the array
		    } else {
		        selectedFarmerIds = selectedFarmerIds.filter(id => id !== farmerId);// Remove the unselected farmer ID from the array
		    }
		  	});
	                
 			});
		 /*Payment To Farmer Script Start*/ 
		