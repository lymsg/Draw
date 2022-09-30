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
<style>

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

/*매장사진*/
#shopImage img {
	width: 900px;
	height: 100%;
}
/*지도 스타일*/
#mapContain {
	height : 100%;
	padding: 0 80px;
}
#googleMap {
	width : 100%;
	height : 400px;	
	margin: 0;
	padding : 0;
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

<div class="container mt-4 justify-content-center">
	<div class="row">
		<div class="col-md-12 text-center">
			<strong>Draw Seoul</strong>
		</div>
		<div class="col-md-12 mt-2 text-center" id="shopImage">
			<img src="image/shopImage1.jpg" alt="매장 사진">
		</div>	
	
		<div class="col-md-12 mt-4 row" id="mapContain">
			<div class="col-md-5 mt-4">
				<Strong>STORE HOURS:</Strong><br/>
				MONDAY - FRIDAY<br/>
				11:00AM - 6:00PM<br/><br/>
				SATURDAY - SUNDAY<br/>
				Closed<br/><br/><br/>
				<Strong>ADDRESS: </Strong><br/>
				645-24, SINSA-DONG, GANGNAM-GU <br/>
				SEOUL, KOREA <br/>
				(82) 2 3444 4524 <br/>
			</div>
			<div class="col-md-7">
				<div id="googleMap" class="mb-2"></div>		
				<button id="mapBtn" type="button" class="btn btn-primary d-none " value="Geocode">위치</button>														
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
function initMap() {	
	console.log('Map is initialized.');
	let map; //지도를 표시할 영역
	let address = '645-24, SINSA-DONG, GANGNAM-GU'
	getLocation();
	function getLocation() {
		if(navigator.geolocation) {	
			navigator.geolocation.getCurrentPosition(showPosition);
			//navigator.geolocation.watchPosition(showPosition); 
			//watchPosition(showPosition)은 이동시 사용자의 위치를 계속하여 업데이트 하며 반환
			//getCurrentPosition(showPosition)는 이용자의 위치반환
			//리턴값은 파라메터인 showPosition()함수에 좌표를 반환해 준다
			//clearWatch()는 중단
		}
		else {
			map = $("#googleMap");
			map.text("Geolocation is not supported by this browser.");
		}
	}
	
	function showPosition(position) {
		//watchPosition(showPosition)의 콜백함수
		lati = position.coords.latitude; //위도
		longi = position.coords.longitude;	//경도
		//지도를 표시해줄 객체는 지도를 표시할 객체와 배율,중앙에 보여줄 위치를 파라메터로 하여 생성
		map = new google.maps.Map(document.getElementById('googleMap'),{
			zoom: 16, //배율
			center: new google.maps.LatLng(lati,longi) //중앙위치 LatLng(위도,경도)는 위치를 표시
		});
		//위치를 표시해 주눈 아이콘
		let marker = new google.maps.Marker({
			position: new google.maps.LatLng(lati,longi),
			map: map,			
			title: 'DRAW' //마커에 붙는 글자
		});
		
		$("#mapBtn").trigger("click"); //여기서 trigger 해야만 주소 변환 위치 자동 처리
	}	
	
	
	//Google Geocoding을 사용하며 Google Map API에 포함되어 있으며 번지를 지도위 위치로 변경	 	 
	 
	 $("#mapBtn").click(function(){
		 console.log("mapBtn클릭");
		 let geocoder = new google.maps.Geocoder();	
		 geocodeAddress(geocoder, map);
	 });	 
	
	 function geocodeAddress(geocoder, resultMap) {
		console.log('geocodeAddress 함수 실행');		
		//geocoder.geocode()메서드는 입력받은 주소로 좌표에 맵 마커를 찍는다.
		//파라메터는 입력받은 주소값과 콜백함수,주소는 JSON 객체 형식		
		geocoder.geocode({'address': address},function(result,status){
			 console.log(result);
			 console.log(status);
			  if (status === 'OK')  {
				  resultMap.setCenter(result[0].geometry.location);  //주소에 의해 변경된 위치값을 중앙으로 설정
				  resultMap.setZoom(18); // 맵의 확대 정도를 설정한다.
				  //마커 설정
				  let marker = new  google.maps.Marker({
					  map: resultMap,
					  position: result[0].geometry.location,
					  title: 'DRAW'
				  });
				  console.log('위도(latitude) : ' + marker.position.lat());
                  console.log('경도(longitude) : ' + marker.position.lng());
			  }
			  else {
				  alert('지오코드가 다음의 이유로 성공하지 못했습니다 : ' + status);  
			  }
		 });		
	 }		
}
</script>
<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyA9VWJ3H216lfb5tzzkUIo2AaUYU1nmVew&callback=initMap&v=weekly&channel=2">
</script>

</body>
</html>