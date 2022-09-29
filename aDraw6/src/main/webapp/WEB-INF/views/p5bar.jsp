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
<!--fontawesome icon-->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" 
	integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
<!--google icon -->
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<style>
#canvas1 {
	width: 100%;
	min-height:350px;
	max-width: 750px;
	border:1px solid grey;
}
</style>
</head>
<body>

 
 	<h4 class="mt-5">이용 유저 연령대</h4>
 
<div>
	<canvas id="canvas1"></canvas>
</div>




<script>
$(document).ready(function(){
	let chartLabels = [];
	let chartData1 = [];
	let chartData2 = [];
	
	let barChartData = {
		labels : chartLabels,	//그래프의 기본축인 x 또는 y축에 사용하는 값
		datasets : [
			{
				label : "남성",
				fillColor : "rgba(220,220,220,0.2)",
				strokeColor : "rgba(220,220,220,1)",		
				pointColor : "rgba(220,220,220,1)",
				pointStrokeColor : "#fff",
				pointHighlightFill : "#fff",
				pointHighlightStroke : "rgba(220,220,220,1)",
				data : chartData1,
				order : 1,
				backgroundColor: [					
					"#B8DFD8",
					"#B8DFD8",
					"#B8DFD8",
					"#B8DFD8"
				]
			},
			{
				label : "여성",
				fillColor : "rgba(151,187,205,0.2)",
				strokeColor : "rgba(151,187,205,1)",				
				pointColor : "rgba(151,187,205,1)",
				pointStrokeColor : "#fff",
		        pointHighlightFill : "#fff",
		        pointHighlightStroke : "rgba(151,187,205,1)",
		        data : chartData2,
		        order : 2,
		        backgroundColor: [		        	
		        	"#FFDEDE",
		        	"#FFDEDE",
		        	"#FFDEDE",
		        	"#FFDEDE"
		        ]
			}
		]
	};
	
	function createChart() {
		let ctx = document.getElementById("canvas1").getContext("2d");
		new Chart(ctx,{
			//type: 'horizontalBar', //수평막대그래프 축은 xAxes로 변경
			type : 'bar', //수직막대 그래프 축은 yAxes
			data : barChartData,			
			options : {				
				scales : {
					yAxes : [
						{							
							ticks : { 
								beginAtZero : true				
							}							
						}
					] 					
				}
			}
		});
	}
	
	$.ajax({
		type : 'POST',
		url : 'p5View1',
		data : {
			cmd : 'chart',
			subcmd : 'line',
			${_csrf.parameterName}: "${_csrf.token}"
		},
		dataType : 'json',
		success : function(result) {
			$.each(result.datas, function(index, obj){
				chartLabels.push(obj.userAge); 
				chartData1.push(obj.userM);
				chartData2.push(obj.userW);
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