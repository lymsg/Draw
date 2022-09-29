<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<!-- RWD -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- MS -->
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE8,IE=EmulateIE9"/> 
<title>Front Sample</title>
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
.raffleListDelete_btn {
	width:25px;
	height:25px;
	padding: 0;
	float:right;
	font-size:16px;
	background:#92B4EC;
	border-color:#92B4EC;
}
.material-icons {
	font-size: 35px;
	color: black;
	text-decoration:none;
}
.material-icons:hover {
	font-size: 40px;
	color: black;
	text-decoration:none;
}
</style>
</head>
<body>

<c:forEach items="${raffleList}" var="dto">		
	<div class="card" id="item">
		<div class="card-body">
			<div class="card_date">
				<p>${dto.ruDate}</p>
			</div>
			<sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_MANAGE')">
				<a class="raffleListDelete_btn btn btn-light" href="raffleListDelete?ruId=${dto.ruId}">X</a>
			</sec:authorize>
			<div class="card_img">
				<a href="h_raffle?ruId=${dto.ruId}&ruCode=${dto.ruCode}">
					<img src="upimage/${dto.ruImage}" alt="신발사진">
				</a>
			</div>
			<div class="card_name mb-2">
				<span><a href="h_raffle?ruId=${dto.ruId}&ruCode=${dto.ruCode}" >${dto.ruName}</a></span>
			</div>
			<div class="card_onoffline">
				${dto.ruOnoffline}
			</div>
			<div class="card_like">								
				<a class="material-icons" href="addtoCalendar?cId=${user_id}&cTitle=${dto.ruName}&cStart=${dto.ruDate}&cEnd=${dto.ruDate}&sStart=${dto.ruDate}&sEnd=${dto.ruDate}" >event_available</a>
			</div>													
		</div>			
	</div>
</c:forEach>	

</body>
</html>