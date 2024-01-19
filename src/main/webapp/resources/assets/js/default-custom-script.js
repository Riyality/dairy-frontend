	
	 $(document).ready(function(){
	
	/*Set Default Shift Script Start*/
			
		   		function setDefaultShift() {
					   
			        var now = new Date();
			        var hours = now.getHours();
			        var isAfterNoon = hours >= 12;
			
			        document.getElementById(isAfterNoon ? 'milkShift_2' : 'milkShift_1').checked = true;
		        
		         }
			    
			/*Set Default Shift Script End*/
			
			/*Set Default Milk Collection Date Script Start*/
			
			 function setDefaultDate() {
				 
			        var today = new Date();
			        var year = today.getFullYear();
			        var month = ('0' + (today.getMonth() + 1)).slice(-2);
			        var day = ('0' + today.getDate()).slice(-2);
			        var hours = ('0' + today.getHours()).slice(-2);
			        var minutes = ('0' + today.getMinutes()).slice(-2);
			
			        var formattedDateAndTime = year + '-' + month + '-' + day + 'T' + hours + ':' + minutes;
			
			        document.getElementById('dateOfMilkCollection').value = formattedDateAndTime;
			    }
			    
			    /*Set Default Milk Collection Date Script End*/
			    
			   function onLoad() {
				   
				    setDefaultDate();
				    setDefaultShift();
				}
			    window.onload = onLoad;
			 
			 });   
			    