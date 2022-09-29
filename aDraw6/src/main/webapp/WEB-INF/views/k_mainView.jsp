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
<title>Main</title>
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
.item_link {
	margin-left: auto;
  	margin-right: auto;
}
.header-top {
	width:100%;
	height:20px;
	background: #92B4EC;	
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
	text-align:center;
}
.header-body img {
	height:100px;
	width:auto;	
}
.header-bottom {
	text-align:center;
	border-bottom:2px solid black;
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
			<li>
				<a href="#">마이페이지</a>
			</li>
			<sec:authorize access="isAnonymous()">
			<li>
				<a id="loginView" href="loginView">로그인</a>
			</li>
			</sec:authorize>
			<sec:authorize access="isAuthenticated()">
			<li>
					<a href="logoutView">로그아웃</a>	
			<li>
			</sec:authorize>
			<sec:authorize access="isAnonymous()">
			<li>
				<a id="joinView" href="joinView">회원가입</a>
			</li>
			</sec:authorize>
			<sec:authorize access="isAuthenticated()">
			<li>
		 		 	환영합니다&nbsp;<a href="#">${user_id}</a>님 
		 	</li>
	 		 </sec:authorize>
	 		 <sec:authorize access="hasRole('ROLE_ADMIN')">
	 		 <li>
		 		 	<a id="adminView" href="adminView">Admin</a> 
		 	 </li>
			 </sec:authorize>
		</ul>
	</div>
	

	<div class="header-body">
		<a href="k_mainView">			
			<img src="images/Logo.png" alt="Logo">
		</a>
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
<div id="Region" class="container mt-3">
   <div id="demo" class="carousel slide" data-ride="carousel">
      <ol class="carousel-indicators">
         <li data-target="#demo" data-slide-to="0" class="active"></li>
         <li data-target="#demo" data-slide-to="1"></li>
         <li data-target="#demo" data-slide-to="2"></li>
         <li data-target="#demo" data-slide-to="3"></li>
      </ol>
         <div class="carousel-inner">
             <div class="carousel-item active">
               <img src="images/img00.PNG" alt="slide00"  width="1300" height="500">
             </div>
             <div class="carousel-item">
               <img src="images/img01.PNG" alt="slide01"  width="1300" height="500">
             </div>
             <div class="carousel-item">
               <img src="images/img02.PNG" alt="slide02"  width="1300" height="500">
             </div>
             <div class="carousel-item">
               <img src="images/img03.PNG" alt="slide04"  width="1300" height="500">
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

</body>
</html>