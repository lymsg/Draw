<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %> 
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>    
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<!-- RWD -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- MS -->
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE8,IE=EmulateIE9"/> 
<title>JSP</title>
<!--bootstrap-->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<!--jquery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<!--propper jquery -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<!--latest javascript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<style>
#canvas2 {
	width: 100%;
	min-height:350px;
	max-width: 750px;
	border:1px solid grey;
}
</style>
</head>
<body>

 
 <h4 class="mt-5">선호하는 브랜드 TOP5</h4>

<div>
	<canvas id="canvas2"></canvas>
</div>

<script>
$(document).ready(function(){
	var chartLabels = [];
	var chartData1 = [];
	
	let pieChartData = {
		labels : chartLabels,
		datasets : [
			{
				label : "",
				fillColor : "rgba(220,220,220,0.2)",
				strokeColor : "rgba(220,220,220,1)",
				pointColor : "rgba(220,220,220,1)",
				pointStrokeColor : "#fff",
				pointHighlightFill : "#fff",
				pointHighlightStroke : "rgba(220,220,220,1)",
				data : chartData1,
				order : 1,
				backgroundColor: [					
					"#AEE6E6",
	                "#FFD5CD",
	                "#7FB77E",
	                "#FDF5CA",
	                "#FFA45B"
				]
			},
		]
	};
	
	function createChart() {
		let ctx = document.getElementById("canvas2").getContext("2d");
		new Chart(ctx,{
			//type: 'pie',
			type : 'doughnut',
			data :  pieChartData,
			options : {
				responsive: true
			}
		});
	}
	
	$.ajax({
		type : 'POST',
		url : 'p5View2',
		data : {
			cmd : 'chart',
			subcmd : 'line',
			${_csrf.parameterName}: "${_csrf.token}"
		},
		dataType : 'json',
		success : function(result) {
			$.each(result.datas, function(index, obj){
				chartLabels.push(obj.brandName);
				chartData1.push(obj.bPercent);
			});
			createChart();
		},
		error : function() {
			$("#here").text("서버접속 실패!.");
		}
	});
});
</script>	

</body>
</html>