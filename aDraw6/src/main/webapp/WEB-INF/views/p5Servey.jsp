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
<title>DRAW SNS FUN</title>
<!--bootstrap-->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<!--jquery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<!--propper jquery -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<!--latest javascript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.6.0/Chart.js"></script>
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
a, a hover, h5 {
	color : #000000;
	text-decoration : none;
	display: inline;
}
#Dnav {
	background-color:#92B4EC;
	width: 100%;
	max-width: 1280px;
}
.nav-link {
	color : white;
}
#bar, #pie {
	display : none;
}
</style>


</head>
<body>

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
      
      <div class="modal-body row">
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
		
		<div class="modal-footer">
			<button type="submit" class="btn btn-warning">로그인</button>&nbsp;&nbsp;&nbsp;
			<button type="button" class="btn btn-outline-warning btn-default" data-dismiss="modal">취소</button>&nbsp;&nbsp;&nbsp;
		</div>
		
		</form>
      </div>
      
    </div>

  </div>
</div>



<!-- 메인상단 -->
<!-- <div class="container mb-4 bg-white" id="div1"> -->
<div class="container mb-1" id="div1">



	<h3 class="mt-5">DRAW 유저 3분기 설문조사 결과</h3>
	<hr/>
	<div id="here" class="container"></div>
	<div id="here2" class="container"></div>
	
	<br>

	<hr/>
	
		<a id="homeBtn" type="button" class="btn btn-warning mb-5" href="sns">SNS홈으로</a>
<%-- 	<sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_MANAGE')">
		<button id="writeServey" type="button" class="btn btn-primary mb-5" href="p5WriteView">통계작성</button>
	</sec:authorize>--%>
		<button type="button" class="btn btn-warning mb-5" id="bar" href="bar">막대bar</button>
		<button type="button" class="btn btn-warning mb-5" id="pie" href="pie">원pie</button>

</div>

<script>
$(document).ready(function(){
	$.ajax({
		url: $("#bar").attr("href"),
		type: "get",
		data: "",
		success : function(data){
			$("#here").html(data);
		},
		error : function() {
			$("#here").text("페이지를 불러오지 못했습니다..");
		}
	});
	
	$.ajax({
		url : $("#pie").attr("href"),
		type : "get",
		data : "",
		success : function(data) {
			$("#here2").html(data);
		},
		error : function() {
			$("#here").text("페이지를 불러오지 못했습니다..");
		}
	});
	
});
</script>

<script>
$(document).ready(function(){
	
	$("#alert1").click(function(){
		alert("준비중입니다!");
	});
	
	$("#bar").click(function(event){
		event.preventDefault();
		$.ajax({
			url: $("#bar").attr("href"),
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


<script>
$(document).ready(function(){
	
	$("#bar").click(function(event){
		event.preventDefault();		
		$.ajax({
			url : $("#bar").attr("href"),
			type : "get",
			data : "",
			success : function(data) {
				$("#here").html(data);
			},
			error : function() {
				$("#here").text("서버접속 실패!.");
			}
		});
	});
	
	$("#pie").click(function(event){
		event.preventDefault();		
		$.ajax({
			url : $("#pie").attr("href"),
			type : "get",
			data : "",
			success : function(data) {
				$("#here").html(data);
			},
			error : function() {
				$("#here").text("서버접속 실패!.");
			}
		});
	});
	
	
	
	
	$("#writeServey").click(function(event){
		event.preventDefault();	
		$.ajax({
			url : "p5WriteView",
			type: "get",
			data: "",
			success : function(data) {
				$("#div1").html(data);
			},
			error : function() {
				alert("서버상의 문제로 실패하였습니다.");
			}
		});
	});
		
	
	
});

</script>
</body>
</html>

