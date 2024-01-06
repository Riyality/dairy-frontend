 $(document).ready(function(){
			
			$("#equipmentQuantity").on("blur", function(){
				
				var equipmentQuantity = $("#equipmentQuantity").val();
			    var equipmentPrice = $("#equipmentPrice").val();
				$("#equipmentTotalAmount").val(equipmentQuantity*equipmentPrice);
				
			});
			
			$("#equipmentPrice").on("blur", function(){
				
				 var equipmentQuantity = $("#equipmentQuantity").val();
			     var equipmentPrice = $("#equipmentPrice").val();
				$("#equipmentTotalAmount").val(equipmentQuantity*equipmentPrice);
				
			});
			
			
			$("#feedCompanyList").on("change",function(){
				
				var id = $("#feedCompanyList").val();
				
				$.ajax({
			    url: 'http://localhost:6161/feedStock/getFeedTypeByFeedCompanyId/{id}',
			    type: 'GET',
			    dataType: 'json',
			    success: function(response) {
			        // Handle the JSON response here
			        console.log(response);
			    },
			    error: function(error) {
			        console.error('Error fetching data:', error);
			    }
			});
			})

			
			
			
			
		});
		