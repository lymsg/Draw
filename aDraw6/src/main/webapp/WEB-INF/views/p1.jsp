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
<title>신발 자랑은 DRAW SNS에서!</title>
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

/**/

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
mainDiv {
	margin: 0px;
	padding: 0px;
}
.navbar-nav {
	display: flex;
	aling-items : center;
	padding: 0;
	list-style-type: none;
}
form {
	display : flex;
	justify-content : space-between;
}
#search {
	padding:2px;
}

#img1 {
	width: 100px;
	height:100px;
}
#div1, #div11, #div2, #div3 {
	padding-top: 30px;
	max-width: 1280px;
	margin : auto;
}
#flex2, #search2 {
	display: flex;
	flex-flow: row wrap;
/*	grid-template-colums: 1fr 1fr 1fr 1fr;*/
	justify-content: space-around;
	margin:0px;
	flex-wrap:wrap;
}
#flex2 img, #search2 img {
	width: 100%;
	height: 100%;
	padding: 5px;
	margin :0;
	max-width: 279px;
	max-height: 376px;
	object-fit : cover;
	object-position:center center;
}
a, a hover, h5 {
	color : #000000;
	text-decoration : none;
	display: inline;
}
.card {
	padding: 0;
	max-width: 279px;
	max-height: 376px;
/*		background-size: cover;
	background-position: center;*/
	display: flex;
	flex-flow: wrap;
}
.card img {
	width: 100%;
	height: 100%;
	object-fit : cover;
	object-position:center center;
}
#Dnav {
	background-color:#92B4EC;
	width: 100%;
	max-width: 1280px;
}
.nav-link {
	color : white;
}
</style>


</head>
<body>

<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal.username" var="user_id" />		
</sec:authorize>



	<nav class="navbar navbar-expand-md bg-basic container shadow-sm mb-2" id="Dnav">
		<a class="navbar-brand" href="home">
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
<div class="container mb-1" id="div1">


	<div class="container p-0" id="div11">
		<form id = "searchForm" class="form-inline" action="#">
			<span class="txt"></span>
			<span type="button" class="btn btn-warning" id="search" disabled>&nbsp;&nbsp;<i class="fa fa-search">&nbsp;&nbsp;</i>
			<input type="text" id="searchInput" class="form-control mr-sm-2" placeholder="유저/상품 검색"></span>
		</form>
	</div>	
	
	
		<div class="container">
			<h4 class="mt-2">오늘의 추천 유저</h4>
		</div>
		<div class="container pt-3" id="div2" style="display: flex; justify-content:space-around; flex-flow :raw wrap; margin: 5px;">
		
			<c:forEach items="${p1rUserView}" var="dtos">
				<div class="container-fluid d-flex col-md-2">
					<a href="p3rUser?iId=${dtos.iId }">
						<img id="img1" class="rounded-circle m-auto" src="images/snsProfile/${dtos.iProfilePath }"/>
						<div class="container row p-0 m-0">
							<label for="img1" class="mt-1 m-auto p-0"><h6>${dtos.iId }</h6></label>
						</div>
					</a>
				</div>
			</c:forEach>
		
		</div>
		
		<hr>
	
	
<!-- -------------------- -->	
	<div class="container pt-3">
		<h4>오늘의 인기 아이템</h4>
	</div>
	<div class="container-fluid p-2" id="div3">	
		<div class="row d-flex flex-row">
		
			<div class="col-md-3 d-flex">
				<div class="card-deck">
				    <div class="card shadow-sm" style="width:150%;">
					      <div class="embed-responsive embed-responsive-4by3">
					        <img src="images/modelImage/CZ6501-100.png" class="card-img-top embed-responsive-item" alt="추천신발">
					      </div>
					      <div class="card-body">
					      	<h5 class="card-subtitle">Nike x Kasina Dunk Low 80's Bus</h5>
					      	<p class="card-text">나이키 x 카시나 덩크 로우 80's 버스</p>
<!-- 							<a id="p1item" href="p1item?iModelName=CZ6501-100" type="btn" class="stretched-link"></a> -->
					      </div>
				    </div>
				 </div>
			 </div>
			 <div class="col-md-3 d-flex">
				<div class="card-deck">
				    <div class="card shadow-sm" style="width:150%;">
					      <div class="embed-responsive embed-responsive-4by3">
					        <img src="images/modelImage/DD1877-001.png" class="card-img-top embed-responsive-item" alt="추천신발">
					      </div>
					      <div class="card-body">
					      	<h5 class="card-subtitle">Nike x Sacai Blazer Low Classic Green</h5>
					      	<p class="card-text">나이키 x 사카이 블레이저 로우 클래식 그린</p>
					      </div>
				    </div>
				 </div>
			</div>
			<div class="col-md-3 d-flex">
				<div class="card-deck">
				    <div class="card shadow-sm" style="width:150%;">
					      <div class="embed-responsive embed-responsive-4by3">
					        <img src="images/modelImage/CZ0790-801.png" class="card-img-top embed-responsive-item" alt="추천신발">
					      </div>
					      <div class="card-body">
					      	<h5 class="card-subtitle">Jordan 1 Low OG Starfish</h5>
					      	<p class="card-text">조던 1 로우 OG 스타피쉬</p>
					      </div>
				    </div>
				 </div>
			</div>
			<div class="col-md-3 d-flex">
				<div class="card-deck">
				    <div class="card shadow-sm" style="width:100%;">
					      <div class="embed-responsive embed-responsive-4by3">
					        <img src="images/modelImage/1019271-BBLC.png" class="card-img-top embed-responsive-item" alt="추천신발">
					      </div>
					      <div class="card-body">
					      	<h5 class="card-subtitle">Hoka One One Bondi 6 Black - Wide</h5>
					      	<p class="card-text">호카 오네 오네 본디 6 블랙 - 와이드</p>
					      </div>
				    </div>
				 </div>
			</div>
			 
			 
			 
			 
		</div>
		</div>
			<hr>		
<br>


<!-- -----image--------------------------------------------- -->
	
	<div class="container">
		<h5><a type="btn" id="p1new" href="p1new">실시간</a>&nbsp;/&nbsp;</h5>
		<h5><a type="btn" id="p1hot" href="p1hot">인기</a></h5>
	</div>
	<div id="here" class="container">
	
			<div class="row" id="flex2">
				<c:forEach items="${iView1}" var="dtos">
				<div class="col-md-3 d-inline-block">
							<a href="p2?iBoardNum=${dtos.iBoardNum}&iId=${dtos.iId}&hId=${user_id}">
								<img class="rounded" src="images/boardImage/${dtos.iImagePath}" alt="이클립스를refresh해주세요">
							</a>
				</div>
				</c:forEach>
			</div>
			
			
	</div>
</div>


<script>
$(document).ready(function(event){
	
	$("#alert1").click(function(){
		alert("준비중입니다!");
	});
	
	
	$("#searchInput").on("focus",function(){
		$.ajax({
			url : "p1search",
			type: "get",
			data: "",
			success : function(data){
				$("#div1").html(data);
			},
			error : function() {
				$("#div1").text("페이지를 불러오지 못했습니다..");
			}
		});
	});
	
	
	var pImg = document.getElementById("img1").src
	var srcNull = "https://localhost:8443/draw/images/snsProfile/";
	if(pImg == srcNull) {
		$("#img1").attr("src","images/snsProfile/avatar3.png");
	}
	if(pImg == null){
		$("#img1").attr("src","images/snsProfile/avatar3.png");
	}

	
	$("#p1new").click(function(event){
		event.preventDefault();
		$.ajax({
			url: $("#p1new").attr("href"),
			type: "get",
			data: "",
			success : function(data){
				$("#here").html(data);
			},
			error : function() {
				$("#here").text("페이지를 불러오지 못했습니다..");
			}
		});
		
	});
	
	$("#p1hot").click(function(event){
		event.preventDefault();
		$.ajax({
			url: $("#p1hot").attr("href"),
			type: "get",
			data: "",
			success : function(data){
				$("#here").html(data);
			},
			error : function() {
				$("#here").text("페이지를 불러오지 못했습니다..");
			}
		});
		
	});
	
	$("#p1item").click(function(event){
		event.preventDefault();
		$.ajax({
			url: $("#p1item").attr("href"),
			type: "get",
			data: "",
			success : function(data){
				$("#here").html(data);
			},
			error : function() {
				$("#here").text("페이지를 불러오지 못했습니다..");
			}
		});
	});

	
});

</script>




</body>
</html>

