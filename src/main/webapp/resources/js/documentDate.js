/**
 * 
 */
console.log("Document Common!!,,,,!!!!!!!!!!!!!!!!!");

$(function() {
	  $('input[name="dcontent3"]').daterangepicker({
	    singleDatePicker: true,
	    showDropdowns: true
	  }, function(start, end, label) {
		  
	  });
	  
	  
	  $('input[name="dcontent3"]').on('apply.daterangepicker', function(ev, picker) {
	      $(this).val(picker.startDate.format('YY/MM/DD'));
	  });
	});
		 
/*$(function() {
	  $('a[name="daterange"]').daterangepicker({
		  autoUpdateInput: false,
		  opens: 'left'
	    
	  }, function(start,label) {
	    console.log("selected date " + start.format('YYYY-MM-DD'));
	    var output = start.format('YYYY-MM-DD');
	    $("#dateSelect").html(output);
	    
	  });
	});

                                    
 	function dateSelect(){
 		var d = document.getElementById("dateSelect").value;
 		$("#dateSelect").val('d');
 		document.getElementById("dateSelect").innerHTML = "선택 날짜 : " + d;
 	}*/
         	
             	
             	
           
             
             
             
             
