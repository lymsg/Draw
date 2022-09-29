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
<title>auc</title>
<!--bootstrap-->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<!--jquery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<meta id="_csrf" name="_csrf" content="${_csrf.token}"/>
<!--propper jquery -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<!--latest javascript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<!--fontawesome icon-->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" 
	integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
<!--google icon -->
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<script src="js/jquery.twbsPagination.js"></script>
</head>
<body>
<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal.username" var="user_id" />		
</sec:authorize>

<c:forEach items="${list}" var="dto" varStatus="status">

					<div id ="product" class="container mt-10">
						<div class="media border p-3">
							<img src="upimage/${ dto.image }" alt="이미지 업로딩 실패" class="mr-3 mt-3 rounded border" style="width:200px;"/>
								<div class="media-body">
									<c:if test="${not empty dto.pbuyer}">
										<div class="text-white text-center" style="background-color: #FFE69A;">${dto.pbuyer}님이 상회입찰중</div>
									</c:if><br/>
									<h4>${ dto.brand }</h4>
									
									<h2><b>${dto.name }</b></h2><br/>
									   <small><i>등록일자 : ${dto.pdate } </i></small><br/>
									   <i><h4>남은 경매일 :${ dto.limit }일</h4></i><br/>
									   <b>현재 입찰가 : ${dto.price} 원</b>
									   
									   <sec:authorize access="isAnonymous()">
									   <p><a class="btn float-right text-white"
									   style="background-color: #92B4EC;" id="anonyauc">경매참여</a></p>
									   </sec:authorize>
									   
									   <sec:authorize access="isAuthenticated()">
									   <p><a class="auc-produc btn float-right text-white"
									    data-nameid="${dto.name}" data-priceid="${dto.price}" data-limitid="${ dto.limit }" data-imageid="upimage/${dto.image }"
									    data-buyerid="${dto.pbuyer}"
									   style="background-color: #92B4EC;" data-toggle="modal" data-target="#myModal2">경매참여</a></p>
									   </sec:authorize>
								</div>
									   
						</div>
						<br/><br/>
					</div>
			</c:forEach>
		
		
</body>
</html>