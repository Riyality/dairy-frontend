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
			
		})