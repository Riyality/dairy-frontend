$(document).ready( function() {
	/*all Contact Number script start*/
			$("#contactNumber").on("keyup", function() {
				var number = $("#contactNumber").val();
				var regex = /[^0-9]/g;

				 var formattedNumber = number.replace(regex, '');

				    formattedNumber = formattedNumber.slice(0, 10);

				    $("#contactNumber").val(formattedNumber);
				  	  
			});
	/*all Contact Number  script end*/
	/*all person name script start*/
			$("#name").on("keyup", function() {
				var personName = $("#name").val();
			    var regex = /[^a-zA-Z\s]/g; 
			    if (personName.match(regex)) {
			        $("#name").val(personName.replace(regex, ''));
			    }
			});
	/*all person name script end*/
	/*equipment script start*/		
		 	$("#equipmentQuantity,#equipmentPrice,#equipmentTotalAmount").on("keyup", function() {
				var value = $(this).val().trim();
				var regex = /^0+|[^0-9.]/g;
				
				 if (value.match(regex)) {
				        $(this).val(value.replace(regex, ''));
				    }
				 calculateTotalAmount();
			});

		 	function calculateTotalAmount() {
		 	    var equipmentQuantity = $("#equipmentQuantity").val();
		 	    var equipmentPrice = $("#equipmentPrice").val();

		 	    if ($.isNumeric(equipmentQuantity) && parseFloat(equipmentQuantity) >= 0 &&
		 	        $.isNumeric(equipmentPrice) && parseFloat(equipmentPrice) >= 0) {
		 	        var totalAmount = parseFloat(equipmentQuantity) * parseFloat(equipmentPrice);
		 	        $("#equipmentTotalAmount").val(totalAmount.toFixed(2));
		 	    } else {
		 	        $("#equipmentTotalAmount").val('');
		 	    }
		 	}
  /*equipment script end*/
	/*bank account number script start*/
			$("#accountNumber").on("keyup", function() {
		        var value = $(this).val().trim();
		        var regex = /^0+|[^0-9.]/g;
		        if (value.match(regex)) {
			        $(this).val(value.replace(regex, ''));
			    }
		    });
	/*bank account number  script end*/		
	/*main branch script start*/

			$("#protein,#avgFat,#avgSnf,#RvgRate,#totalMilkQuantity").on("keyup", function() {
				var value = $(this).val().trim();
				var regex = /^0+|[^0-9.]/g;
				
				 if (value.match(regex)) {
				        $(this).val(value.replace(regex, ''));
				    }
				 calculateTotalAmountOfMainBranch();
			});
				
			function calculateTotalAmountOfMainBranch() {
				var milkQuantity = $("#totalMilkQuantity").val();
				var milkRate = $("#RvgRate").val();

				if ($.isNumeric(milkQuantity) && parseFloat(milkQuantity) >= 0
						&& $.isNumeric(milkRate) && parseFloat(milkRate) >= 0) {
					var totalAmount = parseFloat(milkQuantity)* parseFloat(milkRate);
					$("#totalAmountMainBranch").val(totalAmount.toFixed(2));
				} else {
					$("#totalAmountMainBranch").val('');
				}
			}
		/*main branch script end*/
			
	/*advance to farmer script start*/	
			$("#AdvanceAmount").on("keyup", function() {
				var value = $("#AdvanceAmount").val();
				var regex = /^0+|[^0-9.]/g;

				if (!value.match(regex)) {
					$("#AdvanceAmount").val(value);
				} else {
					$("#AdvanceAmount").val("");
				}
			});
	/*advance to farmer script end*/
			
	/* farmer animal mapping script start*/
			$("#count").on("keyup", function() {
				var value = $("#count").val();
				var regex = /^0+|[^0-9.]/g;

				if (!value.match(regex)) {
					$("#count").val(value);
				} else {
					$("#count").val("");
				}
			});	
	/* farmer animal mapping script end*/
	/* milk rate  script start*/		
			$("#fatFrom, #fatTo, #snfFrom, #snfTo").on("keyup", function() {
		        var value = $(this).val().trim();
		        var regex = /^0+|[^0-9.]/g;
		        
		        if (value.match(regex)) {
			        $(this).val(value.replace(regex, ''));
			    }
		    });
	/* milk rate  script end*/	
	/* milk collection  script start*/	
			$("#milkQuantity, #milkFat, #milkSNF, #milkRate").on("keyup", function() {
		        var value = $(this).val().trim();
		        var regex = /^0+|[^0-9.]/g;
		        if (value.match(regex)) {
			        $(this).val(value.replace(regex, ''));
			    }
		    });
			
	/* milk collection  script end*/	
   /* feed to farmer  script start*/	
			$("#feedQuantity", "#feedCostPerUnit", "#FeedTotalAmount").on("keyup", function() {
		        var value = $(this).val().trim();
		        var regex = /^0+|[^0-9.]/g;
		        
		        if (value.match(regex)) {
			        $(this).val(value.replace(regex, ''));
			    }
		    });
   /*feed to farmer  script end*/
	/* dairy manger script start*/		
			$("#DairyMangementbalnce, #DairyMangementAmount").on("keyup", function() {
		        var value = $(this).val().trim();
		        var regex = /^0+|[^0-9.]/g;
		        
		        if (value.match(regex)) {
			        $(this).val(value.replace(regex, ''));
			    }
		    });
	/* dairy manger  script end*/	
	/* bonus to farmer script start*/		
			$("#bonusAmountPerLiter").on("keyup", function() {
		        var value = $(this).val().trim();
		        var regex = /^0+|[^0-9.]/g;
		        
		        if (value.match(regex)) {
			        $(this).val(value.replace(regex, ''));
			    }
		    });
	/* bonus to farmer script end*/	
	/* payment to farmer script start*/		
			$("#advancePercentage").on("keyup", function() {
		        var value = $(this).val().trim();
		        var regex = /^0+|[^0-9.]/g;
		        
		        if (value.match(regex)) {
			        $(this).val(value.replace(regex, ''));
			    }
		    });
	/* payment to farmer script end*/	
			
	/*feedStock script start*/		
		 	$("#feedStockCostPerUnit,#feedStockQuantity,#feedStockTotalAmount").on("keyup", function() {
				var value = $(this).val().trim();
				var regex = /^0+|[^0-9.]/g;
				
				 if (value.match(regex)) {
				        $(this).val(value.replace(regex, ''));
				    }
				 calculateTotalAmount();
			});

		 	function calculateTotalAmount() {
		 	    var feedStockQuantity = $("#feedStockQuantity").val();
		 	    var feedStockCostPerUnit = $("#feedStockCostPerUnit").val();

		 	    if ($.isNumeric(feedStockQuantity) && parseFloat(feedStockQuantity) >= 0 &&
		 	        $.isNumeric(feedStockCostPerUnit) && parseFloat(feedStockCostPerUnit) >= 0) {
		 	        var totalAmount = parseFloat(feedStockQuantity) * parseFloat(feedStockCostPerUnit);
		 	        $("#feedStockTotalAmount").val(totalAmount.toFixed(2));
		 	    } else {
		 	        $("#feedStockTotalAmount").val('');
		 	    }
		 	}
  /*feedStock script end*/
	});
