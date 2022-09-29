<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
</head>
<body>

<c:forEach items="${pagelist}" var="pldto">
	<div class="row py-2" id="reply_list">
		<div class="col-md-1">
			<div class="col-md-12">									
				<div id="reply_profile_img1"><img src="image/profile.png" alt="프로필사진" id="profile_img1"></div>	<!-- 나중에 프로필사진 연동으로 바꾸기 -->							
			</div>						
		</div>
		<div class="col-md-11">
			<div class="col-md-12 mb-2">
				<span class="spanuser">${pldto.rUserId}</span> &nbsp;&nbsp;&nbsp;
				<span id="rDate">${pldto.rDate}</span>&nbsp;&nbsp;&nbsp;
				<span><a href="replyDelete?rId=${pldto.rId}&ruCode=${pldto.rCode}&user_id=${user_id}&rUserId=${pldto.rUserId}" id="reply_Delete">댓글삭제</a></span>
			</div>					
			<div class="col-md-12 mb-2">						
				${pldto.rContent}			
			</div>
		</div>	
	</div>
</c:forEach>
		
		
</body>
</html>