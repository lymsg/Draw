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

<c:forEach items="${p2cmView}" var="dtos">
		
		<div class="container mb-2" style="background-color: rgba(146,180,236,0.6); margin-bottom:5px;">
			<div class="row m-2 mt-1">
				<div class="d-inline-block ml-2 mt-4"><h5><a href="p3IList?iId=${dtos.cmId }">${dtos.cmId }</a></h5></div>
			</div>
			<div class="container">
			
					<div id="mentbox" class="row ml-0 mt-2 mb-2" style="color:black;">
						<p>${dtos.cmText }</p>
					</div>
					<div class="row ml-3">
						<span><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${dtos.cmDate }" /></span>
					</div>
				<div class="row mr-0 mt-2">
					<a class="btn btn-basic mb-3 deleteBtn" id="deleteBtn" href="p2mentDelete?cmNum=${dtos.cmNum }&iBoardNum=${p2View.iBoardNum }">삭제</a>
					<!-- href="p2ccment?cmNum=${dtos.cmNum }" -->
				</div>
				
			</div>
		</div>
	
</c:forEach>

</body>
</html>