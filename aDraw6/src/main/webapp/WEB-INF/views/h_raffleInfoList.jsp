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
.raffle_info_delete_btn {
	width:16px;
	height:16px;	
	margin: 0 10px 0 0;
	padding:0 0 2px 0;
	float:right;
	text-align:center;
	font-size:10px;
	background:#92B4EC;
	border-color:#92B4EC;
}
</style>
</head>
<body>

<c:forEach items="${riList}" var="dto">
	<div class="container" id="raffle_info_icon">
		<a href="${dto.storeUrl}"><img src="${dto.logo}" id="raffle_info_icon_img"></a>
		<sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_MANAGE')">
			<a href="raffleInfoDelete?id=${dto.id}&ruCode=${dto.ruCode}" class="raffle_info_delete_btn btn btn-light">X</a>
			<span id="buttonSpan" class="d-none">${dto.id}</span>
		</sec:authorize>
		<div id="raffle_info_icon_name">${dto.store}</div>
		<div id="raffle_info_icon_startdate">${dto.startDate} ${dto.startTime} ~</div>
		<div id="raffle_info_icon_enddate">${dto.endDate} ${dto.endTime}</div>
		<div id="raffle_info_icon_status">응모중</div>						
	</div>	
</c:forEach>
					
</body>
</html>