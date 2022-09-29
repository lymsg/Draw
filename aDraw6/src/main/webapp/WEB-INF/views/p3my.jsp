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
<title>DRAW ${p3View.iId}님의 페이지</title>


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
body, button, dd, div, dl, dt, fieldset, figcaption, figure, form, h1, h2, h3, h4, h5, h6, input, legend, li, ol, p, select, table, td, textarea, th, ul {
    margin: 0;
    padding: 0;
}
html, body {
	height: 100%;
	margind: 0;
	padding: 0;
}
#margin {
	height: auto;
}
h3#ht {
	color: white;
	text-shadow: 1px 1px 2px black;
}
.fas {
	font-size:18px;
}
#profileImg{
	width: 100px;
	height: 100px;
}
#div1 {
	padding-top: 30px;
	max-width: 1280px;
	margin : auto;
}
#grid2, #grid3 {
	display: flex;
/*	grid-template-colums: 1fr 1fr 1fr 1fr;*/
	justify-content: space-around;
	margin:0px;
}
#grid2 img {
	didplay: flex;
	width: 80px;
	height: 80px;
	padding: 5px;
}
#grid3 img {
	width: 160px;
	height: 160px;
	height: auto;
	padding: 5px;
}
#flex2 {
	display: flex;
/*	grid-template-colums: 1fr 1fr 1fr 1fr;*/
	justify-content: space-around;
	margin:0px;
}
#flex2 img {
	width: 100%;
	height: 100%;
	padding: 5px;
	margin :0;
	max-width: 279px;
	max-height: 376px;
	object-fit : cover;
	object-position:center center;
}
.list-group-item{
	text-color: white;
	text-align: center;
}
#div2 {
	height : 250px;
	width : 80%;
	margin : auto;
	padding : 5%;
}
a, a hover {
	color : #000000;
	text-decoration : none;
}
#Dnav {
	background-color:#92B4EC;
	width: 100%;
	max-width: 1280px;
}
.nav-link {
	color : white;
}
.swiper li {
	width:130px;
	height:120px;
	list-style: none;
	background-size: cover;
	background-position: center;
	display: inline-block;
	border-radius: 5px;
	margin-right: 10px;
}
.swiper {
	white-space: nowrap;
	overflow-x : scroll;
	padding: 15px 10px;
	swiper-scrollbar: none;
}

</style>

<%
String username = (String)request.getAttribute("username");
session.setAttribute("loginName", username);
%>
</head>
<body>

<!-- -----main--------------------------------------------- -->




<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal.username" var="user_id" />		
</sec:authorize>

	<nav class="navbar navbar-expand-md bg-basic container shadow-sm mb-2" id="Dnav">
		<a class="navbar-brand">
			<img src="images/LogoW.png" alt="Logo" style="width:110px; height:50px;">
		</a>
		<!-- 컬랩스용 버튼 -->
		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
			<span class="navbar-toggler-icon"></span>
		</button>
		
		
		<div class="collapse navbar-collapse" id="collapsibleNavbar">
		
			<ul class="navbar-nav">
				 <li class="nav-item">
				 	<a class="nav-link" href="home">
				 		<i class="fas fa-home" style="font-size:30px; color:white;"></i>
				 	</a>
				 </li>
				 <li class="nav-item">
				 	<h4><a class="nav-link" href="sns">SNS</a></h4>
				 </li>				
				 <li class="nav-item">
				 	<h4><a class="nav-link" href="p5">Survey</a></h4>
				 </li>
				 <li class="nav-item">
				 	<h4><a class="nav-link" href="#" id="alert1">Event</a></h4>
				 </li>
				 
			<sec:authorize access="isAuthenticated()">
				 <li class="nav-item">
				 	<h4><a class="nav-link" href="p3my">My</a></h4>
				 </li>
			</sec:authorize>	
			</ul>
			
			<ul class="navbar-nav ml-auto">
				 <li class="nav-item">
				 <sec:authorize access="isAnonymous()">
				 	<a class="btn btn-outline-primary bg-white" data-toggle="modal" data-target="#loginModal">
				 		로그인
				 	</a>
				 </sec:authorize>
				 <sec:authorize access="isAuthenticated()">
				 	<a class="btn btn-outline-primary bg-white" id="logoutView" href="logoutView">
				 		로그아웃
				 	</a>
				 </sec:authorize>	 	
			 	</li>
			</ul>
			
		</div>	
	</nav>

<!-- 로그인관련 모달 -->
<div id="loginModal" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
    
      <div class="modal-header">
        <h4 class="modal-title">로그인</h4>
      </div>
      
      
      <div class="modal-body">
      	<form id="frm2" name="frm2" method="post" action="login">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		
		<div class="form-group">
			<label for="uId">아이디</label>
			<input type="text" class="form-control" name="pid" placeholder="아이디 입력" 	id="uId" required/>			
		</div>
		<div class="form-group">
			<label for="uPw">비밀번호</label>
			<input type="password" class="form-control" name="ppw" id="uPw"	placeholder="비밀번호 입력" required/>
		</div>
		
		<div class="form-group form-check">
			<input type="checkbox" class="form-check-input" id="rememberMe" name="remember-me">
			<label class="form-check-label" for="rememberMe" aria-describedby="rememberMeHelp">remember-me</label>			
		</div>
      </div>
		
		
		<div class="modal-footer">
			<button type="submit" class="btn btn-warning">로그인</button>&nbsp;&nbsp;&nbsp;
			<button type="button" class="btn btn-outline-warning btn-default" data-dismiss="modal">취소</button>&nbsp;&nbsp;&nbsp;
		</div>
		
		</form>
      
    </div>

  </div>
</div>


<!-- 메인상단 -->


<div class="container mb-4 bg-white" id="div1">
	<div class="container row" id="div2">
	
			<div class="container col">
			<img src="images/snsProfile/${p3View.iProfilePath}" alt="프로필이미지(이클립스refresh해주세요)" value="${p3View.iProfilePath}" class="rounded-circle" id="profileImg">
			</div>
			
			<div class="container col">
				<div><i class="fas fa-heart"></i>&nbsp;&nbsp;<p6>${p3View.iTotalHeart}</p6></div>
				<div id="txet1" class="mb-1 mt-1"><h5>${p3View.iId}</h5></div>
				<div id="txet1"><h6>${p3View.iIntroduce}</h6></div>
				<div class="mt-2">
					<button id="myModal" class="btn btn-warning" data-toggle="modal" data-target="#myModal1"><i class="fas fa-plus"></i></button>
				</div>
			</div>
	</div>
	
	
	
	
	<div class="container p-0" id="div2">
		<hr>
		<h4 id="txet1">${p3View.iId}님이 좋아합니다.</h4>

			<ul class="swiper">
				<c:forEach items="${p3IHeartList}" var="dtos">
					<a href="p2?iBoardNum=${dtos.hiBoardNum}&iId=${dtos.hiId}&hId=${user_id}">
						<li style="background-image:url('images/boardImage/${dtos.hiImagePath}')"/></li>
					</a>
					
				</c:forEach>
			</ul>
		<hr>
	</div>
	
<br>
<br>

	<div class="container">

		<div class="container-fluid pt-3 row" id="flex2">
<!-- 		<div class="col-md-3">	 -->
			<c:forEach items="${p3IList}" var="dtos">
				<div class="col-md-3 d-inline-block">
					<a href="p2?iBoardNum=${dtos.iBoardNum}&iId=${dtos.iId}">
						<img class="rounded" src="images/boardImage/${dtos.iImagePath}" alt="이클립스를refresh해주세요">
					</a>
				</div>
			</c:forEach>
		</div>
	
	</div>
</div>

<!-- 모달관련 -->
	<div class="modal fade" id="myModal1">
		<div class="modal-dialog modal-md modal-dialog-centered modal-dialog-scrollable">

			<div class="modal-content">			
					<div class = "list-group list-group-lg">
						<a href = "p4WriteIView" class="list-group-item list-group-item-action list-group-item-warning">새게시글 쓰기</a>
						<a class="list-group-item list-group-item-action list-group-item-warning" data-toggle="modal" data-target="#myModal2">프로필 이미지 수정</a>
						<a class="list-group-item list-group-item-action list-group-item-warning" data-toggle="modal" data-target="#myModal3">프로필 자기소개 수정</a>
						
						<a type="button" class="close btn" data-dismiss="modal">닫기</a>
					</div>
			</div>
		</div>
	</div>
	
	
	<div class="modal fade" id="myModal2">
		<div class="modal-dialog modal-lg modal-dialog-centered modal-dialog-scrollable">

			<div class="modal-content">			
					<div class = "modal-body list-group-lg">
						<form action="p3myPModi?${_csrf.parameterName }=${_csrf.token }" method="post" enctype="multipart/form-data">
							<input type="text" class="d-none" name="iId" value="${p3View.iId}" required />
							
							<div class="m-1 mb-3"><h4>프로필 이미지를 수정합니다</h4></div>
							<hr>
							<div class="container" style="display:flex; justify-content:space-around;">
								<img src="images/snsProfile/${p3View.iProfilePath}" id="profileImg" class="rounded-circle" style="width:100px; height:100px;">
								<div class="d-inline-block" id="profileImg1"></div>
							</div>
							
					<div class="m-3">
						<div class="form-group d-inline-block">	
							<label for="myImage">프로필 사진 변경</label>
							<input type="file" id="myImage" name="iProfilePath" class="form-control mt-0" onchange="profileImg1(event)"/>
						</div>
					</div>
					
						<hr>
						<input type="submit" class="btn btn-basic" value="프로필 수정"/>
						<a type="button" class="close btn" data-dismiss="modal">닫기</a>
						</form>
					</div>
			</div>
		</div>
	</div>
	
	
	<div class="modal fade" id="myModal3">
		<div class="modal-dialog modal-lg modal-dialog-centered modal-dialog-scrollable">

			<div class="modal-content">			
					<div class = "modal-body list-group-lg">
						<form action="p3myModi?${_csrf.parameterName }=${_csrf.token }" method="post" enctype="multipart/form-data">
							<input type="text" class="d-none" name="iId" value="${p3View.iId}" required />
							
							<div class="m-1 mb-3"><h4>프로필 자기소개를 수정합니다</h4></div>
							<hr>
					<div class="m-3">
						<div class="form-group">
							<label for="introduce">한줄소개 변경</label>
							<input type="text" id="introduce" name="iIntroduce" class="form-control mt-0" value="${p3View.iIntroduce}"/>
							<input type="hidden" name="iTotalHeart" class="form-control mt-0" value="${p3View.iTotalHeart}"/>
						</div>
					</div>
					
						<hr>
						<input type="submit" class="btn btn-basic" value="프로필 수정"/>
						<a type="button" class="close btn" data-dismiss="modal">닫기</a>
						</form>
					</div>
			</div>
		</div>
	</div>


<script>


var userId = '<c:out value="${user_id}"/>';
var loginId = '<c:out value="${p3View.iId}"/>';


$(document).ready(function(){
	$("#alert1").click(function(){
		alert("준비중입니다!");
	});
	
	
	
	var pImg = document.getElementById("profileImg").src
	var srcNull = "https://localhost:8443/draw/images/snsProfile/";
	if(pImg == srcNull) {
		$("#profileImg").attr("src","images/snsProfile/avatar3.png");
	}
	if(pImg == null){
		$("#profileImg").attr("src","images/snsProfile/avatar3.png");
	}
			
});


function profileImg1(event) {
	let image = new FileReader();
	image.onload = function(event) {
		let img = document.createElement("img");
		img.setAttribute("src", event.target.result);
		img.setAttribute("style", "height:100px;");
		img.setAttribute("style", "width:100px;");
		img.setAttribute("class", "rounded-circle");
		document.querySelector("div#profileImg1").appendChild(img);
	};
	image.readAsDataURL(event.target.files[0]);
}



</script>

</body>
</html>


