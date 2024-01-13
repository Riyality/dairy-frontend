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
			       
			        console.log(response);
			    },
			    error: function(error) {
			        console.error('Error fetching data:', error);
			    }
			});
			})


		var farmerId;

		if(farmerId != null || farmerId != ""){
			farmerData(farmerId);
		}



	    $("#routeName").on("change",function(){
			
			var id = $("#routeName").val();
			
			farmerData(id);
					
			});
			
		   $("#milkForm").on("click",function(){
			   alert("hhjhjh")
			   alert(farmerId)
			   
			 });
			
			function farmerData(id){
				
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
			                                    	 <a href="http://localhost:6161/milkCollection/${value.id }">
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
			}
			
			
		});
		