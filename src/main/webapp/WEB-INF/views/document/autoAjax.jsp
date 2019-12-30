<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file = "../common/header.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
ul{
background-color : #eee;
cursor :pointer;
}

li{
	padding: 12px;
}
</style>
</head>
<body>

<div class="block full">
<div class="block-title">
<h2>Block Title</h2>
</div>


<div class="container" style="width:500px;">
	<h3 align="center"> Autocomplete textbox using jQuery, PHP and MySQL</h3><br>
	<label>Enter Country Name</label>
	<input type="text" name="country" id="country" aSearch    class="form-control" placeholder="EnterCountry Name"> 
	<div id="countryList" aSearchList></div>
</div>


</div>





<script>
	$(document).ready(function(){
		
		$("#country").keyup(function(){
			var query = $(this).val();
			
			if(query != ''){
				$.ajax({
					url : "/approval/search",
					method : "post",
					data : { "query" : query},
					dataType : 'json',
					success : function(data){
						searchList(data);
					}
				});
			}
			
		});

		$(document).on('click', 'li', function(){
			$('#country').val($(this).text());
			$('#countryList').fadeOut();
		});
		
		
	});
</script>
<script>
function searchList(data){
	
	var output = '';
		
		
	$.each(data, function(index, list){	
		output += "<li>" + list.name + "</li>";
		
	$("#countryList").fadeIn();
	$("#countryList").html(output);
	});

}

</script>
</body>
</html>