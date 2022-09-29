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
<title>home</title>
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
<script type="text/javascript">
    $(window).on('scroll',function(){
        if($(window).scrollTop()){
            $('.header-top, .header-body, .header-body img, .header-body div, .header-bottom, #Region, .footer').addClass('active');
        }else{
            $('.header-top, .header-body, .header-body img, .header-body div, .header-bottom, #Region, .footer').removeClass('active');
        }
    });
</script> 
<style>

.header-top {
	display: none;
}
.header-top.active {
	width:100%;
	height:20px;
	background: #92B4EC;
	display: block;	
	position:fixed;
	transition:.5s;
}
.header-top ul {
	height:15px;
	list-style: none;
}
.header-top ul li {
	height:15px;
	float: right;
	margin-left: 20px;   
	padding-bottom:20px;
	font-size: 12px;
}
.header-top ul li a {
	color: black;
}

.header-body {
	width:100%;
	height:2000px;
	text-align:center;
	background: linear-gradient(rgb(146, 180, 236), rgba(255,230,154,1));
	/*background: #BBD3FC;*/	
}
.header-body.active {
	width:100%;
	height:auto;
	text-align:center;
	background: #FFFFFF;
	transition:.5s;
}
.header-body img {
	height:200px;
	width:auto;	
}
.header-body img.active {
	height:100px;
	width:auto;	
	transition:.5s;
}
.header-body div.active {
	display:none;
	transition:.5s;
}

.header-bottom {
	display:none;
}
.header-bottom.active {
	text-align:center;
	border-bottom:2px solid black;
	display:block;
}
.header-bottom nav.navbar {
	height: 30px;
}
.header-bottom nav.navbar ul li {
	margin-bottom:12px;
}
.header-bottom nav.navbar ul li a{
	text-decoration:none;
	font-weight: bold;
	color: black;
	padding-bottom:0;	
}
.header-bottom nav.navbar ul li a:hover{
	border-bottom:4px solid black;
}
.footer {
	border-top:1px solid #BBBBBB;	
	font-size:13px;
}

.footer ul li {
	list-style: none;
}

.btn3 {
	background-color : white;
	padding: 0;
	background: none;
} 
.top_Btn1 {
	padding: 0;
	border: none;
	background: none;
}

.top_Btn2 {
	width: 100px;
	margin: auto;
	display: block;
}

.logo {
   font-size : 48px;
}

.logo:hover   {
   text-decoration:none;
}

#demo {
   text-align : center;
   background-color : #F5F5F5;
}

.top_list {
   list-style: none;
}

.top_item {
   float: right;
   margin-left: 20px;
   padding-bottom:20px;
   font-size: 12px;
}


.top_link {
   color: black;
}

.top_link:hover {
   color: black;
   text-decoration:none;
}

.navbar-nav {
   float: right;
   margin-left: 50px;
   padding-bottom:20px;
   
}

.nav-item {
   margin-left : 20px;
   margin-top : 20px;
}

h1 {
   margin-left : 150px;
}

.modal-footer {
	text-align: center;
    justify-content: center;
    text-size : 13px;
}


.modal-header {
	background-color : white;
}

.modal-title {
	margin-left : 193px;
}

body {
	overflow:auto;
}

.card-body {
	text-align : center;
	text-size : 13px;
	color : black;
}

#popular-goods-item {
	display: flex;
}
</style>
</head>
<body>

<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal.username" var="user_id" />		
</sec:authorize>

<div class="header">	

	<div class="header-top">
		<ul id="link">
			<li>
				<a href="#">고객센터</a>
			</li>
			<li>
				<a href="#">장바구니</a>
			</li>
			<sec:authorize access="isAnonymous()">
				<li>
					<a id="loginView" href="loginView">로그인</a>
				</li>
			</sec:authorize>
			<sec:authorize access="isAnonymous()">
				<li>
					<a id="joinView" href="joinView">회원가입</a>
				</li>
			</sec:authorize>
			<sec:authorize access="isAuthenticated()">
				<li>
					<a href="#">마이페이지</a>
				</li>
			</sec:authorize>
			<sec:authorize access="isAuthenticated()">
				<li>
					<a href="logoutView">로그아웃</a>
				</li>
			</sec:authorize>
			<sec:authorize access="isAuthenticated()">
				<li>
		 		 	환영합니다&nbsp;<a href="#">${user_id}</a>님 
		 		</li>
	 		</sec:authorize>
		</ul>
	</div>
	
<style>

.wrap {
  width: 100%;
  height: auto;
  display: flex;
  align-items: center;
  justify-content: center;
}

.login {
  width: 600px;
  height: 400px;
  background: #FFE69A;
  border-radius: 20px;
  display: flex;
  justify-content: center;
  align-items: center;
  flex-direction: column;
}
.login_id, .login_pw, .join {
  margin-top: 20px;
  width: 80%;
}

.login_id input, .login_pw input {
  width: 100%;
  height: 50px;
  border-radius: 30px;
  margin-top: 10px;
  padding: 0px 20px;
  border: 1px solid lightgray;
  outline: none;
}


.login_etc {
  padding: 10px;
  width: 80%;
  font-size: 14px;
  display: flex;
  justify-content: space-between;
  align-items: center;
  font-weight: bold;
}

.submit {
  margin-top: 50px;
  width: 80%;
}
.submit input {
  width: 100%;
  height: 50px;
  border: 0;
  outline: none;
  border-radius: 40px;
  background: linear-gradient(to left, rgb(255, 77, 46), rgb(255, 155, 47));
  color: white;
  font-size: 1.2em;
  letter-spacing: 2px;
}
.text {
	font-size:30px;
	font-weight: bold;
	color: #282211;
}

</style>

	<div class="header-body">
		<a href="home">			
			<img src="images/Logo.png" alt="Logo">
		</a>
		<div class="text-center">
			<div class="text mb-4">		
				한정판 스니커즈 거래와 응모, 후기를 한번에!<br/>
				로그인 후 시작해보세요.
			</div>
			
			<div class="wrap mt-4">
		        <div class="login">
		        	<form method="post" action="login" class="justify-content-center" style="width:100%; margin-left:120px;">
			            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
			            <div class="login_id">
			                <h4>ID</h4>
			                <input type="text" name="pid" id="pid" placeholder="ID">
			            </div>
			            <div class="login_pw">
			                <h4>Password</h4>
			                <input type="password" name="ppw" id="ppw" placeholder="Password">
			            </div>
			            <div class="login_etc">
			                <div class="checkbox">
			                	<input type="checkbox" name="remember-me" id="rememberMe"> Remember Me?
			                </div>
			                <div>
			            		<a id="join" href="joinView" style="font-weight: bold; color:grey;"> 회원이 아니신가요? 가입하러 가기! </a>
			            	</div>
			            </div>   
			            <div class="submit">
			                <input type="submit" value="submit">
			            </div>
		            </form>			       
		        </div>
		    </div>
		</div>		
	</div>

	
	<div class="header-bottom">
		<nav class="navbar navbar-expand-sm justify-content-center">
			<ul class="navbar-nav mx-5">
				<li class="nav-item">
					<a class="nav-link" href="list">SHOP</a> <!-- 영민 -->
				</li>
			</ul>	
			<ul class="navbar-nav mx-5">
				<li class="nav-item">
					<a class="nav-link" href="sns">SNS</a> <!-- 지은 -->
				</li>
			</ul>	
			<ul class="navbar-nav mx-5">
				<li class="nav-item">
					<a class="nav-link" href="h_upcoming">RAFFLE</a> <!-- 세윤 -->
				</li>
			</ul>	
			<ul class="navbar-nav mx-5">
				<li class="nav-item">
					<a class="nav-link" href="Board">NOTICE</a> <!-- 정민 -->
				</li>
			</ul>	
			<ul class="navbar-nav mx-5">
				<li class="nav-item">
					<a class="nav-link" href="About">ABOUT</a>
				</li>
			</ul>	
		</nav>
	</div>
</div>
<!-- ajax 표시 -->
<div class="section flex mt-3">
	<div id="demo" class="carousel slide" data-ride="carousel">
		<ol class="carousel-indicators">
			<li data-target="#demo" data-slide-to="0" class="active"></li>
			<li data-target="#demo" data-slide-to="1"></li>
			<li data-target="#demo" data-slide-to="2"></li>
			<li data-target="#demo" data-slide-to="3"></li>
		</ol>
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img src="images/banner1.png" alt="slide00"  width="100%" height="700">
			</div>
			<div class="carousel-item">
				<img src="images/banner2.png" alt="slide01"  width="100%" height="700">
			</div>
			<div class="carousel-item">
				<img src="images/banner3.png" alt="slide02"  width="100%" height="700">
			</div>
			<div class="carousel-item">
				<img src="images/banner4.png" alt="slide04"  width="100%" height="700">
			</div>
		</div>
		<a class="carousel-control-prev" href="#demo" data-slide="prev">
			<span class="carousel-control-prev-icon" id="id1"></span>
		</a>
		<a class="carousel-control-next" href="#demo" data-slide="next">
			<span class="carousel-control-next-icon" id="id1"></span>
		</a>
	</div>
	<div class="container mt-3">
		<h2 class="popular-goods_head text-center mt-5" style="color:#000000;">POPULAR GOODS</h2>
		<div class="row mb-5">
			
			<c:forEach items="${list}" var="dto" varStatus="status">
				<div class="col-md-4">
					<a href="list">
						<div class="card">
							<img src="upimage/${ dto.image }" alt="이미지 업로딩 실패" class="card-img-top" style="width:200px;"/>
								<div class="card-body">
									<p class="card-text">현입찰가 : ${dto.price }원</p>
									<p class="card-text">브랜드명 : ${dto.brand }</p>
									<p class="card-text">상품명 : ${dto.name }</p>
								</div>
						</div>
					</a>
				</div>
			</c:forEach>
			
		</div>
	</div>
	
	
</div>


<div class="footer mt-5 pt-2">
	<div class="row">
		<div class="col-sm-2">
			<ul><Strong>이용안내</Strong>
				<li>검수기준</li>
				<li>이용정책</li>
				<li>패널티정책</li>
			</ul>
		</div>
		<div class="col-sm-2">
		<ul><strong>고객지원</strong>
				<li>공지사항</li>
				<li>Q&A</li>
				<li>게시판</li>
			</ul>
		</div>
		<div class="col-sm-5"></div>
		<div class="col-sm-3">
			<p><strong>고객센터</strong></p>
			<p>1588-1212</p>
		</div>		
	</div>
</div>

<script>
$(document).ready(function(){
	$("#joinView").click(function(event){
		event.preventDefault();
		$.ajax({
			url : $("#joinView").attr("href"),
			type : "GET",
			date : "",
			success : function(data) {				
				$("#Region").html(data);
			},
			error : function() {
				alert("서버와의 접속 실패");
			}			
		});
	});	
});


</script>

</body>
</html>