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
<meta id="_csrf" name="_csrf" content="${_csrf.token}"/> <!-- 페이지위조요청을 방지를 위한 태그 --> 
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

<script src="js/jquery.twbsPagination.js"></script>



<style>
/*공통스타일*/
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
.top_Btn1 {
	padding: 0;
	border: none;
	background: none;
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
	list-style:none;
}


/*사이드메뉴 스타일*/
#sidetitle {
	text-align:center;
	font-size:40px;
}
#sidemenu ul {
	border-bottom:1px solid #dee2e6;
}
#sidemenu ul li {
	font-size:20px;
	list-style:none;
	margin-left:30%;
	margin-bottom:5px;
}
#sidemenu > ul > li > a{
	text-decoration:none;
	color:black;
}
#sidemenu > ul > li > a:hover {
	color:#424242;
}
#sidemenu > ul > li > strong > a{
	border-bottom:4px solid #FFD24C;
	text-decoration:none;
	color:black;
}
#sidemenu > ul > li > strong > a:hover {
	color:#424242;
}

/*아이템 스타일*/
#shoes_imgandname {
	padding: 0px 70px; 	/*상, 좌우, 하*/
	text-align: center;	
}
#shoes_img {
	width:500px;
	height: auto;
}
.carousel-item {
	background: #F3F2F2;
}
.carousel-control-prev-icon {
   background-image: url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' fill='%23585858' width='8' height='8' viewBox='0 0 8 8'%3e%3cpath d='M5.25 0l-4 4 4 4 1.5-1.5L4.25 4l2.5-2.5L5.25 0z'/%3e%3c/svg%3e")
}
.carousel-control-next-icon {
    background-image: url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' fill='%23585858' width='8' height='8' viewBox='0 0 8 8'%3e%3cpath d='M2.75 0l-1.5 1.5L3.75 4l-2.5 2.5L2.75 8l4-4-4-4z'/%3e%3c/svg%3e");
}
.carousel-indicators li {
   background-color:#585858;
}
#shoes_name1 {
	margin-top: 20px;
	font-size: 28px;
	font-weight: bold;
	color: #373636;
}
#shoes_name2 {
	margin-bottom:18px;
	font-size: 18px;
	color: #979696;
}

#shoes_pricetable {
	padding: 0px 10px;
	text-align: center;	
}
#shoes_story {
	text-align: center;	
	padding: 10px 0px;
}
#shoes_story>div {
	width: 1100px;
	height: auto;
	padding: 30px 100px;
	border-style: solid;
	border-color: #E7E7E7;
	border-width: 1px;
	border-radius: 5px;	
}
#shoes_info	{
	margin-left: 50px;
}
div.col-md-2 {	/*제품코드, 출시일, 가격*/
	font-size:18px;
	color:#5E5E5E;
}
div.col-md-10 {	/*값*/
	font-size:18px;
	font-weight: bold;
}
#raffle_info {
	background:#fcefc5;
	border-style:none;
	border-radius:5px;
	padding-bottom:10px;
}
/*관리자 버튼*/
#raffleInfoUpload{
	height:34px;
	font-size: 16px;
	font-weight: bold;
	background: #92B4EC;
}
/*모달 스타일*/
#modal_label {
	font-size:9px;
	color: grey;	
	float: right;
}
#raffle_info_title{
	margin-bottom:10px;
	height: 44px;
	padding: 5px 20px;
	border-bottom: solid;
	border-color: #B5B2B1;
	border-width: 1px;
	font-weight: bold;
	color: #5D5B5A;
}
#raffle_info_icon {
	width:120px;
	height:auto;
	background:#FFD24C;
	margin-right: 10px;
	padding:10px 0px;
	border-width:1px;
	border-style:solid;	
	border-color:#DFDCDD;
	border-radius:10px;
	float:left;
}
#raffle_info_icon:hover {
	background:#FFE69A;
}
#raffle_info_icon_img {
	width:64px;
	height:64px;
	margin-left: 28px;
}
.raffle_info_delete_btn {
	width:15px;
	height:15px;	
	margin: 0 10px 0 0;
	padding:0 0 2px 0;
	float:right;
	text-align:center;
	font-size:10px;
	background:#92B4EC;
	border-color:#92B4EC;
}
#raffle_info_icon_name {
	padding:0px 0px;
	font-size:12px;
	font-weight: bold;
	text-align:center;	
}
#raffle_info_icon_startdate, #raffle_info_icon_enddate {
	padding:0px 0px;
	font-size:10px;
	text-align:center;	
}
#raffle_info_icon_status {
	margin-top:3px;
	font-size:12px;
	color:#149027;
	font-weight: bold;
	text-align:center;	
}
/*댓글창*/
#replyContainer {
	background:#E9F2FF;
	border-style:none;
	border-radius:5px;
}
#reply_title {
	padding: 10px 5px;
	font-weight: bold;
	color: #5D5B5A;
}
#reply_list {
	border-top: solid;
	border-color: #B5B2B1;
	border-width: 1px;
}
#reply_profile_img1 {
	width: 70px;
    height: 70px; 
    border-radius: 10%;
    overflow: hidden;
    margin-right:5px;
	float:left;
}
#profile_img1 {
 	width: 100%;
    height: 100%;
    object-fit: cover;
}
span#rDate {
	color:grey;
}
.reply_Delete {
	text-decoration:none;
	text-decoration:underline;
	color:grey;
}
input#uname {
	border-style:none;
}
#nav_pagination {

}
.pagination {
	border-top: solid;
	border-color: #B5B2B1;
	border-width: 1px;
	margin: 0;
	padding: 10px 0;
	background: #E9F2FF;
}
#reply_write {
	padding: 10px 0;
	border-radius:5px;
	border-top: solid;
	border-color: #B5B2B1;
	border-width: 1px;
	font-weight: bold;
	background: #BED3F6;	
}
#reply_profile_img {
	width: 100px;
    height: 100px; 
    border-radius: 10%;
    overflow: hidden;
    margin-right:5px;
	float:left;
}
#profile_img {
 	width: 100%;
    height: 100%;
    object-fit: cover;
}
#replyWriteButton {
	width:78px;
	height:63px;
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
	
	

	<div class="header-body">
		<a href="k_mainView">			
			<img src="image/logo.png" alt="Logo">
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

<!---------------------- 본문 ------------------------->
<div class="container mt-5">
	<div class="container">
		<div class="row" style="margin-left:20%;">
			<div id="shoes_imgandname">
			
				<div id="shoes_img" class="carousel slide" data-ride="carousel">
								
					<div class="carousel-inner">
						<div class="carousel-item active">
							<img src="upimage/${ruDetails.ruImage}" width="100%" height="auto">  
						</div>
						<c:forEach items="${rciDetails}" var="rdto">
							<div class="carousel-item">
								<img src="upimage/${rdto.ruImage1}" width="100%" height="auto">  
							</div>
						</c:forEach>					
					</div>
					
					<a class="carousel-control-prev" href="#shoes_img" data-slide="prev">
   						<span class="carousel-control-prev-icon"></span>
 					</a>
  					<a class="carousel-control-next" href="#shoes_img" data-slide="next">
    					<span class="carousel-control-next-icon"></span>
  					</a>
				</div>				
				
				<div id="shoes_name1">${ruDetails.ruName}</div>
				<div id="shoes_name2">${ruDetails.ruNameEng}</div>
			</div>
		</div>
	</div>
	
	<div class="container"id="shoes_story">
		<div class="container shadow mb-4">${ruDetails.ruStory}</div>
		
	</div>
	<div class="container mb-4">
		<div class="row mb-2" id="shoes_info">
			<div class="col-md-2">제품코드 </div>
			<div class="col-md-10">${ruDetails.ruCode}</div>
		</div>
		<div class="row mb-2" id="shoes_info">
			<div class="col-md-2">출시일 </div>
			<div class="col-md-10">${ruDetails.ruReleaseDate}</div>
		</div>
		<div class="row mb-2" id="shoes_info">
			<div class="col-md-2">가격 </div>
			<div class="col-md-10">${ruDetails.ruPrice} &#8361;</div>
		</div>
	</div>
</div>

<div class="container">
	<div class="container" id="raffle_info">
		<div class="row">
			<div class="col-md-12" id="raffle_info_title">
				응모하기&nbsp;&nbsp;
				<sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_MANAGE')">
					<button id="raffleInfoUpload" class="btn btn-light" data-toggle="modal" data-target="#Upload_Modal">응모일정 등록</button>
				</sec:authorize>			
			</div>
			<div class="col-md-12" id="raffle_info_region">				
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
				
			</div>
		</div>
	</div>
</div>

 
<div class="container mt-3">
	<div id="replyContainer">
		<div class="container">
			<div class="col-md-12" id="reply_title">댓글</div>
		</div>	
		<!-- 댓글 작성하기 -->
		<div id="reply_write">		
			<div class="container">
				<form id="replyWrite_form" action="replyWrite" method="post">
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />			
					<div class="row mx-0 px-0">	
						<div class="col-md-2 row pl-4">
							<div class="col-md-12 form-group mx-0 mb-0 pl-4 pr-0">									
								<div id="reply_profile_img"><img src="image/profile.png" alt="프로필사진" id="profile_img"></div>	<!-- 나중에 프로필사진 연동으로 바꾸기 -->							
							</div>						
						</div>
						
						<div class="col-md-10 row mx-0 px-0">
							<div class="col-md-12 mx-0 px-0">
								<div><input type="text" id="uname" name="rUserId" value="${user_id}" placeholder="로그인을 해주세요" readonly/></div>
								<input type="hidden" name="ruId" value="${ruDetails.ruId}" />
								<input type="hidden" name="ruCode" value="${ruDetails.ruCode}" />
							</div>
							<div class="col-md-12 row mx-0 px-0 pt-1">
								<div class="col-md-11 ml-0 pl-0">			
									<textarea class="form-control" id="ucontent" name="rContent" rows="2" cols="200" required>
									</textarea>		
								</div>	
								<div class="col-md-1 px-0">
									<button type="submit" id="replyWriteButton" class="btn btn-light">등록</button>			
								</div>
							</div>	
						</div>								
					</div>				
				</form>		
			</div>
		</div>
		
		<div class="container">
			<!-- 댓글보기 -->
			<div id="replyRegion">
				<c:forEach items="${rrList}" var="rrdto">
					<div class="row py-2 px-0" id="reply_list">
						<div class="col-md-1">
							<div class="col-md-12">									
								<div id="reply_profile_img1"><img src="image/profile.png" alt="프로필사진" id="profile_img1"></div>	<!-- 나중에 프로필사진 연동으로 바꾸기 -->							
							</div>						
						</div>
						<div class="col-md-11">
							<div class="col-md-12 mb-2">
								<span class="spanuser">${rrdto.rUserId}</span> &nbsp;&nbsp;&nbsp;
								<span id="rDate">${rrdto.rDate}</span>&nbsp;&nbsp;&nbsp;
								<span><a id="${rrdto.rUserId}" href="replyDelete?rId=${rrdto.rId}&ruCode=${ruDetails.ruCode}&user_id=${user_id}&rUserId=${rrdto.rUserId}" class="reply_Delete">댓글삭제</a></span>
							</div>					
							<div class="col-md-12 mb-2">						
								${rrdto.rContent}			
							</div>
						</div>	
					</div>
				</c:forEach>
			</div>		
		</div>
	</div>	

	
	<!-- 페이지 표시 -->
	
	<nav aria-label="Page navigation">
		<ul class="pagination justify-content-center" id="pagination">
		</ul>
	</nav>		
	
	
</div>

<!---------------------- 모달 ------------------------->
<div id="Upload_Modal" class="modal fade">
	<div class="modal-dialog modal-dialog-centered">
		<div class="modal-content">
			<div class="modal-header">				
				<h4 class="modal-title text-center">응모 정보</h4>
				<button id="Upload_Modal_close" class="close" data-dismiss="modal" aria-hidden="true">x</button>
			</div>			
			<div class="modal-body">
			
				<div class="d-flex text-center">
					<label id="modal_label"><a style="color:red;">&ast;</a>&nbsp;는 필수항목 입니다.</label>
				</div>
				<form action="raffleInfoUpload"method="post" id="raffleInfo_form">
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
					<input type="hidden" name="ruCode" value="${ruDetails.ruCode}" /> 
					<div class="form-group">
						<label><a style="color:red;">&ast;</a>Brand: </label>
						<div class="form-control">
							<div class="form-check-inline">
								<label class="form-check-label" for="radio1">
									<input type="radio" class="form-check-input" id="radio1" name="logo" value="image/nike.png" checked />Nike&nbsp;
								</label>
							</div>
							<div class="form-check-inline">
								<label class="form-check-label" for="radio2">
									<input type="radio" class="form-check-input" id="radio2" name="logo" value="image/adidas.png" />Adidas&nbsp;
								</label>
							</div>
							<div class="form-check-inline">
								<label class="form-check-label" for="radio3">
									<input type="radio" class="form-check-input" id="radio3" name="logo" value="image/NB.png" />New balance&nbsp;
								</label>
							</div>
							<div class="form-check-inline">
								<label class="form-check-label" for="radio4">
									<input type="radio" class="form-check-input" id="radio4" name="logo" value="image/asics.png" />Asics&nbsp;
								</label>
							</div>
							<div class="form-check-inline">
								<label class="form-check-label" for="radio5">
									<input type="radio" class="form-check-input" id="radio5" name="logo" value="image/stussy.png" />Stussy
								</label>
							</div>
						</div>
					</div>
					
					<div class="form-group">
						<label for="store"><a style="color:red;">&ast;</a>매장명: </label>
						<input type="text" class="form-control" id="store" name="store" placeholder="ex. 나이키 서울라이즈" required />
					</div>
					
					<div class="form-group">
						<label for="storeUrl"><a style="color:red;">&ast;</a>응모 사이트/구글폼의 URL: </label>
						<input type="text" class="form-control" id="storeUrl" name="storeUrl" placeholder="ex. https://grandstage.a-rt.com/product/new?prdtNo=1020093156" required />
					</div>
					
					<div class="form-group">
						<label for="start"><a style="color:red;">&ast;</a>응모 시작일: </label>
						<input type="date" class="form-control" id="start" value="${ruDetails.ruDate}" name="startDate" required /> 
						<input type="time" class="form-control" id="start" value="10:00" name="startTime" required />
					</div>
					
					<div class="form-group">
						<label for="end"><a style="color:red;">&ast;</a>응모 종료일: </label>
						<input type="date" class="form-control" id="end" value="${ruDetails.ruDate}" name="endDate" required />
						<input type="time" class="form-control" id="end" name="endTime" required />
 					</div>
					
					<div class="form-group text-center">
						<button type="submit" class="btn btn-secondary">Upload</button>&nbsp;&nbsp;
						<input type="reset" class="btn btn-secondary" data-dismiss="modal" aria-hidden="true" value="Cancle">
					</div>
				</form>
				
			</div>
		
			<div class="modal-footer text-center">
				업로드 전 내용을 신중히 확인해주세요
			</div>
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


<!-- 응모정보 -->
<script>
$(function(){
	$("#raffleInfo_form").submit(function(event){
		event.preventDefault();
		$.ajax({
			url: $("#raffleInfo_form").attr("action"),
			type: $("#raffleInfo_form").attr("method"),
			data: $("#raffleInfo_form").serialize(),
			success: function(data) {				
				$("#Upload_Modal_close").trigger("click");
				$("#raffle_info_region").html(data);							
			},
			error: function(){
				alert("업로드가 실패했습니다.");
			}			
		});
		alert("업로드에 성공하였습니다.");	
	});
	
	$("a.raffle_info_delete_btn").click(function(){
		event.preventDefault();
		let eeo = $(event.target);
		let url2 = eeo.attr("href");
		$.ajax({
			url: url2,
			type: "get",
			data: "",
			success: function(data){
				$("#raffle_info_region").html(data);
			},
			error: function(){
				alert("응모정보 삭제에 실패했습니다.");
			}
		});
	});
});
</script>

<!-- 댓글 -->
<script>
$(function(){
	$("#replyWrite_form").submit(function(event){
		event.preventDefault();
		$.ajax({
			url: $("#replyWrite_form").attr("action"),
			type: $("#replyWrite_form").attr("method"),
			data: $("#replyWrite_form").serialize(),
			success: function(data){
				$("textarea").val('');
				$("#replyRegion").html(data);
			},
			error: function(){
				alert("댓글작성에 실패했습니다");
			}
		});
	});	
});
</script>
<script>
$(function(){
   
   let id = '<c:out value="${user_id}" />';
   
   $(".reply_Delete").click(function(event){
	   event.preventDefault();
	   let qwe = $(event.target);	   
       let x = qwe.attr("id");     
       let url = qwe.attr("href");
       if(x == id){
          $.ajax({
        	  url: url,
        	  type: "get",
        	  data: "",
        	  success: function(data){
        		  alert("댓글이 삭제되었습니다.");
        		  $("#replyRegion").html(data);
        	  },
        	  error: function(){
        		 alert("서버 접속 실패");
        	  }
          });
       }
       else {
          alert("댓글 삭제 권한이 없습니다.");
       };
   });
});
</script>

<script>
$(function(){
	
	window.pagObj = $("#pagination").twbsPagination({
		
		totalPages: 100,
		visiblePages: 10,
		onPageClick: function(event, page) {
			console.info(page + ' (from options)');
			$(".page-link").on("click",function(event){
				event.preventDefault(); 				
				let peo = $(event.target); 			
				let pageNo = peo.text();				
				let purl;
				let pageA;
				let pageNo1;
				let pageNo2;
				let rCode = '<c:out value="${ruDetails.ruCode}" />';
				
				if(pageNo != "First" && pageNo != "Previous" && pageNo != "Next" && pageNo != "Last") {
					purl = "plist?pageNo=" + pageNo + "&&rCode=" + rCode;
				}
				else if(pageNo == "Next") {
					pageA = $("li.active > a"); //li에 actvive클래스가 있고 a에 페이지 번호가 있음
					pageNo = pageA.text(); //페이지 번호
					pageNo1 = parseInt(pageNo); //페이지번호를 1더해야 하므로 정수로 변환
					pageNo2 = pageNo1 + 1;
					purl = "plist?pageNo=" + pageNo2 + "&&rCode=" + rCode;
				}
				else if(pageNo == "Previous") {
					pageA = $("li.active > a"); //li에 actvive클래스가 있고 a에 페이지 번호가 있음
					pageNo = pageA.text(); //페이지 번호
					pageNo1 = parseInt(pageNo); //페이지번호를 1더해야 하므로 정수로 변환
					pageNo2 = pageNo1 - 1;
					purl = "plist?pageNo=" + pageNo2 + "&&rCode=" + rCode;
				}
				else if(pageNo == "First") {					
					purl = "plist?pageNo=" + 1 + "&&rCode=" + rCode;
				}
				else if(pageNo == "Last") {					
					purl = "plist?pageNo=" + 100 + "&&rCode=" + rCode;
				}
				else {
					return;
				}
				
				$.ajax({
					url: purl,
					type: "get",
					data: "",
					success: function(data){
						$("#replyRegion").html(data);
					},
					error: function(){
						alert("서버 접속 실패");
					}
				});
			});
		}
	})
	.on('page', function(event, page){  //chaining
		console.info(page + ' (from event listening)');	    
	});
});
</script>

</body>
</html>