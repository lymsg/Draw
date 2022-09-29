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
</head>
<body>


		<form action="hUpDown" method="post" id="hForm" class="d-inline-block">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
			<input type="hidden" name="hiBoardNum" value="${p2View.iBoardNum }"/>
			<input type="hidden" name="hiId" value="${p2View.iId}" />
			<input type="text" name="hiImagePath" value="${p2View.iImagePath}" />
			<input type="hidden" id="hId" name="hId" value="${user_id}"/>
			<button type="submit" id="hBtn" class="btn btn-md btn-outline-warning"><i class="fas fa-heart"></i></button>
		</form>


</body>
</html>

<script>


$(document).ready(function(){
	
	$("#hForm").submit(function(event){
		event.preventDefault();
		$.ajax({
			url:"p2hUpDown",
			type:"post",
			data:$("#hForm").serialize(),
			success : function(data) {
				if($("#hBtn").attr("class") == "btn btn-md btn-outline-warning"){
					hBtnC1();
				}
				else{
					hBtnC2();
				}
			},
			error : function(){
				alert("서버에 접속을 실패하였습니다..");
			}
		});
	});
	
	function hBtnC1(){
	//	$("#hBtn").attr("onclick","hBtnC2()");
		alert("좋아요 +1");
		$("#hBtn").attr("class","btn btn-md btn-warning");
	}
	function hBtnC2(){
	//	$("#hBtn").attr("onclick","hBtnC1()");
		alert("좋아요 -1");
		$("#hBtn").attr("class","btn btn-md btn-outline-warning");
	}
});

</script>