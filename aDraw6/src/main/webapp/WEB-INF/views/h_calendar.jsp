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

/*캘린더 스타일*/
#calendar{
	width:90%;
	height:auto;
}
.fc-view-harness{
	background: #FDF7E4;
}
.fc-col-header-cell-cushion, .fc-daygrid-day-number {
	color: black;
}
.fc-daygrid-day:hover {
	background: #FFE69A;
}
.fc-event-main-frame{
	background: #92B4EC;
	border: none;
	
}
.fc-event-main-frame:hover{
	background: #719EEC;
	border: none;
}
</style>
</head>
<body>

<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal.username" var="user_id" />		
</sec:authorize>

<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /><!-- security csrf -->

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

<div class="container-fluid row border-bottom pt-2">
	<div class="col-md-3 ml-1" id="sidetitle">
		<Strong>RAFFLE</Strong>
	</div>
	<div class="col-md-9 row">
		<div class="col-md-3"> </div>
		<div class="col-md-7 justify-content-center mt-4">여기에서 내 응모일정을 관리해보세요!</div>
		<div class="col-md-2"> 
		</div>
	</div>	
</div>


<div class="row">

	<div class="col-md-3 pl-5 border-bottom" id="sidemenu">
		<ul>
			<li><a href="h_upcoming">Upcoming</a></li>
			<li><strong><a id="MyRaffleCalendar" href="h_calendar">My Raffle Calendar</a></strong></li>
		</ul>
	</div>
	
	<div class="col-md-7 mt-4">
		<div id='calendar'></div>
	</div>
	
	<div class="col-md-2 mt-3">
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
<!--EL과 c:out은 화면에 보이는 그대로의 값이므로 JS에 문자열 변수를 나타낼시는 ""안에 사용 -->
<!--가능하면 EL만 사용하는 것보다는 c:out이 보안에 강하다 -->
let calendar = null;
//let user_id = "${userId}";
let user_id = '<c:out value="${user_id}"></c:out>';
//$(document).ready(function(){
	$(function(){ //jquery에서 자동 실행 함수
		 let request = $.ajax({ //calendar로 요청한 결과를 저장하는 변수 request(list기능)
			 url : "myRaffleCalendar?cId=${user_id}",
			 type : "get",
			 dataType : "json"
		 });
	     request.done(function(data){ //request수행후 마지막 작업 처리, data는 반환된 값으로 js 객체 배열
	    	 console.log(data);
	    	 let calendarEl = document.getElementById('calendar');	    	 
	    	 calendar = new FullCalendar.Calendar(calendarEl,{
	    		 timeZone : "Asia/Seoul",
	    		 headerToolbar : {
	    			 left: 'prev,next today', 
	    			 center : 'title',
	    			 right : 'dayGridMonth,timeGridWeek,timeGridDay,listWeek'
	    		 },
	    		 navLinks: true,
	    		 editable: true,
	    		 selectable: true,
	    		 droppable: true, 
	    		 eventDrop : function(info) {
	    			 let obj = new Object();
	    			 if(confirm("'"+ info.event.title +"'의 일정을 수정하시겠습니까 ?")) { //confirm창의 확인 클릭시 true
	    				 obj.cTitle = info.event._def.title;
	    				 obj.cStart = info.event._instance.range.start;
                		 obj.cEnd = info.event._instance.range.end;
                		 obj.cAllDay = info.event._instance.range.allDay;
                		 obj.cNo = info.event.extendedProps.cNo; //추가된 속성,fullcalendar데이터베이스의 번호
                		 obj.cId = user_id; //사용자 아이디
                		 obj.oldTitle = info.oldEvent._def.title;
                		 obj.oldStart = info.oldEvent._instance.range.start;
                		 obj.oldEnd = info.oldEvent._instance.range.end;
                		 obj.oldAllDay = info.oldEvent._instance.range.allDay;
                		 console.log(obj);
                		 $(function modifyData(){
                			 $.ajax({
                				 url: "myRaffleCalendarUpdate", 
                				 method: "post",
                				 dataType: "json",
                				 data: JSON.stringify(obj),
                				 contentType: 'application/json',
                				 beforeSend : function(xhr) {
                					 xhr.setRequestHeader('X-CSRF-Token', $('input[name="${_csrf.parameterName}"]').val());
                				 }
                			 });
                		 });
	    			 }
	    			 else {
	    				 info.revert(); //원래창 유지
	    			 }
	    			 calendar.unselect();
	    			 location.reload();	    			 
	    		 },
	    		 
	    		 eventResize: function(info) { //drag기능(수정기능)
	    			 console.log(info);
	    			 var obj = new Object();
	    			 if(confirm("'"+ info.event.title +"' 의 일정을 수정하시겠습니까 ?")) {
	    				 obj.cTitle = info.event._def.title;
	    				 obj.cStart = info.event._instance.range.start;
	    				 obj.cEnd = info.event._instance.range.end; 
                         obj.cAllDay = info.event._instance.range.allDay;
                         obj.cNo = info.event.extendedProps.cNo; //추가된 속성
                         obj.cId = user_id;
                         obj.oldTitle = info.oldEvent._def.title;
                         obj.oldStart = info.oldEvent._instance.range.start;
                         obj.oldEnd = info.oldEvent._instance.range.end;
                         obj.oldAllDay = info.oldEvent._instance.range.allDay;
                         console.log(obj);
                         $(function modifyData(){
                        	 $.ajax({
                        		 url: "myRaffleCalendarUpdate",
                        		 type : "post",
                        		 dataType : "json",
                        		 data : JSON.stringify(obj),
                        		 contentType: 'application/json',
                        		 beforeSend : function(xhr) {
                        			 xhr.setRequestHeader('X-CSRF-Token', $('input[name="${_csrf.parameterName}"]').val());
                        		 }
                        	 });
                         });
	    			 }
	    			 else {
	    				 info.revert(); 
	    			 }
	    			 calendar.unselect();
	    			 location.reload(); //화면 갱신	    			 	    			 
	    		 },
	    		 select: function(arg) { //insert기능(작성 기능)
	    			 var title = prompt('일정명을 기록하고 일정을 선택하세요.');
	    		     if(title) {
	    		    	 calendar.addEvent({
	    		    		 title: title, //입력한 값 title을 title속성에
	    		    		 start: arg.start,
                             end: arg.end,
                             allDay: arg.allDay //boolean
	    		    	 });
	    		    	 console.log(arg);
	    		    	 var obj = new Object();
	    		    	 obj.cNo = 100;
	    		    	 obj.cId = user_id; 
	    		    	 obj.cTitle = title;
	    		    	 obj.cStart = arg.start; 
	    		    	 obj.cEnd = arg.end; 
	    		    	 if(arg.allDay == true ) { //여기서는 boolean이나 DB는 boolean이 없어 문자열로 변환하여 보냄
	    		    		 obj.cAllDay = "true";	    		    		 
	    		    	 }
	    		    	 else {
	    		    		 obj.cAllDay = "false"; 
	    		    	 }
	    		    	 console.log(obj);
	    		    	 $(function saveData(){
	    		    		 $.ajax({
	    		    			 url: "myRaffleCalendarInsert", 
	    		    			 type : "post",
	    		    			 dataType: "json",
	    		    			 data: JSON.stringify(obj),
	    		    			 contentType: 'application/json',
	    		    			 beforeSend : function(xhr) { //obj형태로 보낼시 csrf보장
	                                	  xhr.setRequestHeader('X-CSRF-Token', $('input[name="${_csrf.parameterName}"]').val());
	                             }            
	    		    		 });
	    		    	 });	    		    	 
	    		     }
	    		     else {
	    		    	 
	    		     }
	    		     calendar.unselect();
	    		     location.reload(); //화면 갱신               	  	       
	    		 },
	    		 eventClick: function(info) { //작성된 일정을 클릭하는 기능으로 제거(delete)기능
	    			 if(confirm("'"+ info.event.title +"' 일정을 삭제하시겠습니까 ?")) {
	    				 info.event.remove();
	    				 console.log(info.event);  
	    				 var obj = new Object();
                         obj.cTitle = info.event._def.title;
                         obj.cStart = info.event._instance.range.start;
                         obj.cEnd = info.event._instance.range.end; 
                         obj.cId = user_id;
                         obj.cNo = info.event.extendedProps.cNo; //추가된 속성
                         console.log(obj);
                         $(function deleteData(){
                        	 $.ajax({
                        		 url:  "myRaffleCalendarDelete",
                        		 type : "post",
                        		 dataType: "json",
                                 data: JSON.stringify(obj),
                                 contentType: 'application/json',
                                 beforeSend : function(xhr) { //obj형태로 보낼시 csrf보장
                               	  	xhr.setRequestHeader('X-CSRF-Token', $('input[name="${_csrf.parameterName}"]').val());
                                 }  
                        	 });
                         });
	    			 } 
	    			 else {
	    				  
	    			 }
	    			 calendar.unselect();
	    			 location.reload(); //화면 갱신
               	  	
	    		 },
	    		 locale : 'ko',
	    		 events : data //받은 결곽값(js객체 배열 값)을 저장하는 객체
	    	 });
	    	 calendar.render();
	     });
	});
//});
</script>

</body>
</html>