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
<title>Front Sample</title>
<!--bootstrap-->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<!--jquery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<!--propper jquery -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<!--latest javascript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<!--bootstrap-->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">

<!-- full calendar용 api라이브러리 -->	
<script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.11.2/main.min.js'></script>
<script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/locales-all.min.js'></script>
<link href='https://cdn.jsdelivr.net/npm/fullcalendar@5.11.2/main.min.css' rel='stylesheet'/>

<!--fontawesome icon-->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" 
	integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
<!--google icon -->
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">

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

/*검색창 스타일*/
#searchdiv {
	display: flex;
  	justify-content: flex-end;
}
#searchbox {	
	border: 1px solid #789EDF;	
}
#searchinput {
	font-size: 16px;
	width: 190px;
	padding: 10px;
	border: 0px;
	outline: none;
	float: left;	
}
#searchbtn {
	height:100%;
	border: 0px;
	background: #789EDF;
	outline: none;
	float: right;
	color: #ffffff;
}
/*아이템 스타일*/
#item {
	width: 320px;
	height: 381px;
	background:#fcefc5;
	border:none;
}
#item:hover{
	background:#FFE69A;
}
.card_date {
	float: left;
}
.raffleListDelete_btn {
	width:25px;
	height:25px;
	padding: 0;
	float:right;
	font-size:16px;
	background:#92B4EC;
	border-color:#92B4EC;
}
.card_img {
	text-align: center;
	vertical-align:middle;
	width:250px;
	height:180px;
	overflow:hidden;
	margin:0 auto;
}
.card_img > a > img {
	width:100%;
	height:auto;
	object-fit:cover;
	transform: translate(0%, -15%);
}
.card_name {
	text-align: center;
	font-weight: bold;
	font-size: 20px;
}
.card_name > span >a {
	text-decoration:none;
	color: black;
}
.card_name>a:hover {
	color:#505050;
}
.card_onoffline {
	text-align: center;
	font-size: 15px;
	color: #555555;	
}
.card_like {
	box-sizing: content-box;
	position:relative;
	margin-bottom: 15px;
	float: right;
	height: 35px;
	cursor: pointer;
}
.material-icons {
	font-size: 35px;
	color: black;
	text-decoration:none;
	position: relative;
}
.material-icons:hover {
	font-size: 40px;
	color: black;
	text-decoration:none;
}
/*관리자 버튼*/
#raffleCardUpload{
	font-weight: bold;
	background: #92B4EC;
}
/*모달 스타일*/
#modal_label {
	font-size:9px;
	color: grey;	
	float: right;
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
	 		<sec:authorize access="hasRole('ROLE_ADMIN')">
		 		<li>
			 	 	<a id="adminView" href="adminView">Admin</a> 
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

<div id="mainRegion">
	<div class="container-fluid row border-bottom pt-2">
		<div class="col-md-3 ml-1" id="sidetitle">
			<Strong>RAFFLE</Strong>
		</div>
		<div class="col-md-7 row justify-content-center mt-4">
			<div>발매 예정</div>
		</div>	
		<div class="col-md-2">
			<!---------------------- 검색 ------------------------->
			<div class="mt-1" id="searchdiv">
				<div id="searchbox">
					<input type="text" id="searchinput" placeholder="신발명을 검색하세요">
					<button type="submit" id="searchbtn"><i class="fa fa-search"></i></button>
				</div>
			</div>
		</div>
	</div>

	<div class="row">	
		<div class="col-md-3 pl-5 border-bottom" id="sidemenu">
			<ul>
				<li><strong><a href="h_upcoming">Upcoming</a></strong></li>
				<li><a id="MyRaffleCalendar" href="h_calendar">My Raffle Calendar</a></li>
			</ul>
			<sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_MANAGE')">
				<ul>
					<li>
						<button id="raffleCardUpload" class="btn btn-light" data-toggle="modal" data-target="#Upload_Modal">upload(관리자기능)</button>
					</li>
				</ul>
			</sec:authorize> 
		</div>	
		
		<div class="col-md-7 mt-3">
			<div class="card-columns row" id="cardRegion">
				<c:forEach items="${raffleList}" var="dto">		
					<div class="card" id="item">
						<div class="card-body">
							<div class="card_date">
								<p>${dto.ruDate}</p>
							</div>
							<sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_MANAGE')">
								<a class="raffleListDelete_btn btn btn-light" href="raffleListDelete?ruId=${dto.ruId}">X</a>
							</sec:authorize>
							<div class="card_img">
								<a href="h_raffle?ruId=${dto.ruId}&ruCode=${dto.ruCode}">
									<img src="upimage/${dto.ruImage}" alt="신발사진">
								</a>
							</div>
							<div class="card_name mb-2">
								<span><a href="h_raffle?ruId=${dto.ruId}&ruCode=${dto.ruCode}" >${dto.ruName}</a></span>
							</div>
							<div class="card_onoffline">
								${dto.ruOnoffline}
							</div>
							<div class="card_like">								
								<a class="material-icons" href="addtoCalendar?cId=${user_id}&cTitle=${dto.ruName}&cStart=${dto.ruDate}&cEnd=${dto.ruDate}&sStart=${dto.ruDate}&sEnd=${dto.ruDate}" >event_available</a>
							</div>													
						</div>			
					</div>
				</c:forEach>		
			</div>
		</div>	
		
		<div class="col-md-2 mt-3 row">
			<div id="demo" class="carousel slide" data-ride="carousel" >

				  <!-- Indicators -->
				  <ul class="carousel-indicators">
				    <li data-target="#demo" data-slide-to="0" class="active"></li>
				    <li data-target="#demo" data-slide-to="1"></li>
				  </ul>
				  
				  <!-- The slideshow -->
				  <div class="carousel-inner">
				    <div class="carousel-item active">
				      <img src="media/d_banner3.png" alt="사진없음" width="250" height="100%">
				    </div>
				    <div class="carousel-item">
				      <img src="media/d_banner4.png" alt="사진없음" width="250" height="100%">
				    </div>
				  </div>
				  
				  <!-- Left and right controls -->
				  <a class="carousel-control-prev" href="#demo" data-slide="prev">
				    <span class="carousel-control-prev-icon"></span>
				  </a>
				  <a class="carousel-control-next" href="#demo" data-slide="next">
				    <span class="carousel-control-next-icon"></span>
				  </a>
			</div>
		</div>
		
	</div>
</div>

<!---------------------- 모달 ------------------------->
<div id="Upload_Modal" class="modal fade">
	<div class="modal-dialog modal-dialog-centered">
		<div class="modal-content">
			<div class="modal-header">				
				<h4 class="modal-title text-center">RAFFLE UPLOAD</h4>
				<button class="close" data-dismiss="modal" aria-hidden="true">x</button>
			</div>			
			<div class="modal-body">
			
				<div class="d-flex text-center">
					<label id="modal_label"><a style="color:red;">&ast;</a>&nbsp;는 필수항목 입니다.</label>
				</div>
				<form action="raffleUpload?${_csrf.parameterName}=${_csrf.token}" method="post" enctype="multipart/form-data">
					<div class="form-group">
						<label for="mDate"><a style="color:red;">&ast;</a>응모일: </label>
						<input type="date" class="form-control" id="mDate" name="cDate" required>
					</div>
					<div class="form-group">
						<label for="mName"><a style="color:red;">&ast;</a>신발명(한글&영문): </label>
						<input type="text" class="form-control" id="mName" placeholder="ex. 나이키 덩크 로우 빈티지 그린 우먼스" name="cName" required>
						<input type="text" class="form-control" id="mName" placeholder="ex. Nike Dunk Low Vintage Green WMNS" name="cNameEng" required>
					</div>
					<div class="form-group">
						<label for="mStory"><a style="color:red;">&ast;</a>설명:</label>
						<textarea class="form-control" id="mStory" name="cStory" placeholder="신발에 대한 설명을 적어주세요." required></textarea>
					</div>
					<div class="form-group">
						<label for="mCode"><a style="color:red;">&ast;</a>제품 코드:</label>
						<input type="text" class="form-control" id="mCode" placeholder="ex. DQ8580-100" name="cCode" required>
					</div>
					<div class="form-group">
						<label for="mReleaseDate"><a style="color:red;">&ast;</a>발매일:</label>
						<input type="date" class="form-control" id="mReleaseDate" name="cReleaseDate" required>
					</div>
					<div class="form-group">
						<label for="mPrice"><a style="color:red;">&ast;</a>가격:</label>
						<input type="text" class="form-control" id="mPrice" placeholder="ex. 129000" name="cPrice" required>
					</div>
					<div class="form-group">
						<label for="mImage"><a style="color:red;">&ast;</a>썸네일이미지: </label><br/>
						<div class="form-control" style="width:100%; height:auto;">								
							<input type="file" id="mImage" placeholder="신발 사진을 업로드해주세요" name="cImage" onchange="thumbnail(event)" required> <br/>
						 	<div class="text-center" id="thumbnail_container"></div>
						</div>
					</div>	
				<!--  -->	
					<div class="form-group">
						<label for="mImage1">다른 이미지가 더 있으면 첨부해주세요: </label><br/>
						<div class="form-control" style="width:100%; height:auto;">								
							<input type="file" id="mImage1" placeholder="신발 사진을 업로드해주세요" name="cImage1" multiple="multiple"> <br/>
						 	<div class="text-center" id="thumbnail_container"></div>
						</div>
					</div>
				<!--  -->		
					<div class="form-group">
						<label><a style="color:red;">&ast;</a>응모방식: </label>
						<div class="form-control">
							<div class="form-check-inline">
								<label class="form-check-label" for="radio1">
									<input type="radio" class="form-check-input" id="radio1" name="cOnoffline" value="온라인 응모" checked>온라인 응모
								</label>
							</div>&nbsp;&nbsp;							
							<div class="form-check-inline">
								<label class="form-check-label" for="radio2">
									<input type="radio" class="form-check-input" id="radio2" name="cOnoffline" value="오프라인 응모">오프라인 응모
								</label>
							</div>
						</div>
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


<script>
function thumbnail(event) {
	var reader = new FileReader();
	reader.onload = function(event){
		var img = document.createElement("img");
		img.setAttribute("src", event.target.result);
		img.setAttribute("class", "col-lg-12");
		document.querySelector("div#thumbnail_container").appendChild(img);
	};
	reader.readAsDataURL(event.target.files[0]);
}
</script>	

<script>
$(function(){	
	$("a.raffleListDelete_btn").click(function(evnet){
		event.preventDefault();
		let eco = $(event.target);
		let url1 = eco.attr("href");
		$.ajax({
			url: url1,
			type: "get",
			data: "",
			success: function(data){
				$("#cardRegion").html(data);
			},
			error: function(){
				alert("서버 접속 실패");
			}
		});
	});
});
</script>
<script>
$(function(){
	$(".material-icons").click(function(event){
		event.preventDefault();
		
		let mi = $(event.target);
		url = mi.attr("href");		
		
		$.ajax({
			url: url,
			type: "get",
			data: ""
		});
		alert("래플 일정이 My Raffle Calendar에 추가 되었습니다.");
	});
});
</script>

<script>
$("#searchinput").on("keyup", function(){
	var value = $(this).val().toLowerCase();
	$("#cardRegion #item").filter(function(){
		$(this).toggle($(this).text().toLowerCase().indexOf(value) > -1);
	});
});
</script>
</body>
</html>