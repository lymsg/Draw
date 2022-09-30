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
<title>DRAW</title>
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
a, a hover, h5 {
	color : #000000;
	text-decoration : none;
	display: inline;
}

#search1, #search2 {
/*	visibility:hidden;*/
} 
</style>

</head>
<body>
<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal.username" var="user_id" />		
</sec:authorize>


	<div class="container p-0">
		<form id = "searchForm" class="form-inline" action="#">
			<span class="txt"></span>
			<span type="button" class="btn btn-warning" id="search" disabled>&nbsp;&nbsp;<i class="fa fa-search">&nbsp;&nbsp;</i>
			<input type="text" id="searchInput" class="form-control mr-sm-2" placeholder="유저/상품 검색"></span>
		</form>
	</div>	



	<div class="container">
		<h4 class="mt-5">DRAW 유저 중... <i class="fa fa-search">&nbsp;&nbsp;</i></h4>

		<div class="row" id="search1">
			<c:forEach items="${p1sUserView}" var="dtos">
					<a class="col-md-1 m-4" href="p3rUser?iId=${dtos.iId }" id="searchId">
						<img id="img1" class="rounded-circle m-auto ${dtos.iId }" src="images/snsProfile/${dtos.iProfilePath }"/>
						<div class="container row p-0 m-4">
							<label for="img1" class="mt-1 m-auto p-0"><h6>${dtos.iId }</h6></label>
						</div>
					</a>
			</c:forEach>
		</div>
		
	</div>
<hr/>


	<div class="container">
		<h4 class="mt-2">상품과 관련된 게시물 중... <i class="fa fa-search">&nbsp;&nbsp;</i></h4>
		
		<div class="row" id="search2">
			<c:forEach items="${iView1}" var="dtos">
					<a href="p2?iBoardNum=${dtos.iBoardNum}&iId=${dtos.iId}&hId=${user_id}" id="searchImg">
						<label for="searchImg1" style="display:none; hight:0;">${dtos.iModelName}</label>
						<img class="rounded" id="searchImg1" src="images/boardImage/${dtos.iImagePath}" alt="이클립스를refresh해주세요">
<!-- 						<input type="text" value="${dtos.iModelName}" style="visibility:hidden;"> -->
					</a>
			</c:forEach>
		</div>
		    
	</div>


<!-- 테스트 수정 -->

</body>
</html>


<script>
$("#searchInput").on("keyup", function(){ 
	var value = $(this).val().toLowerCase();
	$("#search1 #searchId").filter(function(){
		$(this).toggle($(this).text().toLowerCase().indexOf(value) > -1);
	});
});
</script>

<script>
$("#searchInput").on("keyup", function(){
	var value = $(this).val().toLowerCase();
	$("#search2 #searchImg").filter(function(){
		$(this).toggle($(this).text().toLowerCase().indexOf(value) > -1);
	});
});
</script>


