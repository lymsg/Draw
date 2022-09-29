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

<meta id="_csrf" name="_csrf" content="${_csrf.token}"/> 
<title>Draw comment</title>

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
a, a hover {
	color : #000000;
	text-decoration : none;
}
#commentDate {
	color : #92B4EC;
	font-size: 12px;
}
#p2cmt, #ment1, #ment2{
	width: 100%;
	max-width: 750px;
	padding:0;
	margin: auto;
}
#mentbox {
	border-radius : 100px;
	background-color:white;
	width : 90%;
	min-height: 60px;
}
#mentbox p{
	line-height: 60px;
}
#ment3 {
	color: white;
}
</style>

</head>
<body>

<!-- -------------- 제일기본으로 하던 덧글창-->


<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal.username" var="user_id" />		
</sec:authorize>


<!-- <div id="ment1" style="margin-bottom: 0px;" class="collapse"> -->
		<div class="container mb-2" style="border: 1px solid; border-color: #92B4EC; margin-bottom:5px;">
	
			<div class="row m-2 mt-1">
				<div class="d-inline-block ml-2 mt-4"><h5>${user_id }</h5></div>
			</div>
			
			<div class="container">
				<form id="mentForm" action="p2mentWrite" method="post"> 
						<div class="row ml-0 mt-0 mb-2">
							<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
							<input type="hidden" name="iBoardNum" value="${p2View.iBoardNum }" style="color:blue;"/>
							<input type="hidden" name="cmIBNum" value="${p2View.iBoardNum }" style="color:blue;"/>
							<input type="hidden" name="cmId" value="${user_id }" style="color:blue;" />
							<textarea name="cmText" rows="3" placeholder="답글을 입력해주세요.." style="width:100%; margin:auto;"></textarea>
						</div>
						<div class="row ml-3">
							<input type="hidden"/>
						</div>
					<div class="row mr-0 mt-2">
						<button type="submit" class="btn btn-outline-primary mb-3" style="background-color:#F0F8FF;">답글작성</button>
					</div>
				</form>
			</div>
		
			<div id="mentList">
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
									<a class="btn btn-basic mb-3 deleteBtn" id="deleteBtn" href="p2mentDelete?cmNum=${dtos.cmNum }&iBoardNum=${p2View.iBoardNum }&iId=${user_id}">삭제</a>
									<!-- href="p2ccment?cmNum=${dtos.cmNum }" -->
								</div>
								
							</div>
						</div>
					
				</c:forEach>
			</div>
			
		</div>


</body>
</html>

<script>
$(document).ready(function(){
	
	$("#mentForm").submit(function(event){
		event.preventDefault();
		$.ajax({
			url:"p2mentWrite",
			type:"post",
			data:$("#mentForm").serialize(),
			success : function(data){
				$("#mentList").html(data);
			},
			error : function() {
				alert("페이지를 불러오지 못했습니다..");
			}
		});
	});
	

	
	$(".deleteBtn").click(function(){
		event.preventDefault();
		let ret = confirm("답글을 삭제하시겠습니까?");
		if(ret == true) {
			url=$(".deleteBtn").attr("href");
			location = url;
			alert("답글을 삭제했습니다");
		}
	});
});


</script>
