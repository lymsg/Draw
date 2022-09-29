<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<!-- RWD -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- MS -->
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE8,IE=EmulateIE9" />
<meta id="_csrf" name="_csrf" content="${_csrf.token}"/> <!-- 페이지위조요청을 방지를 위한 태그 --> 
<title>공지사항</title>
 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<!--propper jquery -->
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<!--latest javascript -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<!--bootstrap-->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<!--fontawesome icon-->
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.7.0/css/all.css"
	integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ"
	crossorigin="anonymous">
<!--google icon -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">
<script src="js/jquery.twbsPagination.js"></script>

<style>
/*공통스타일*/
.header-top {
	width: 100%;
	height: 20px;
	background: #92B4EC;
}

.header-top ul {
	height: 15px;
	list-style: none;
}

.header-top ul li {
	height: 15px;
	float: right;
	margin-left: 20px;
	padding-bottom: 20px;
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
	text-align: center;
}

.header-body img {
	height: 100px;
	width: auto;
}

.header-bottom {
	text-align: center;
	border-bottom: 2px solid black;
}

.header-bottom nav.navbar {
	height: 30px;
}

.header-bottom nav.navbar ul li {
	margin-bottom: 12px;
}

.header-bottom nav.navbar ul li a {
	text-decoration: none;
	font-weight: bold;
	color: black;
	padding-bottom: 0;
}

.header-bottom nav.navbar ul li a:hover {
	border-bottom: 4px solid black;
}

.footer {
	border-top: 1px solid #BBBBBB;
	font-size: 13px;
}

.footer ul li {
	list-style: none;
}

/*사이드메뉴 스타일*/
#sidetitle {
	text-align: center;
	font-size: 40px;
}

#sidemenu ul {
	border-bottom: 1px solid #dee2e6;
}

#sidemenu ul li {
	font-size: 20px;
	list-style: none;
	margin-left: 30%;
	margin-bottom: 5px;
}

#sidemenu>ul>li>a {
	text-decoration: none;
	color: black;
}

#sidemenu>ul>li>a:hover {
	color: #424242;
}

#sidemenu>ul>li>strong>a {
	border-bottom: 4px solid #FFD24C;
	text-decoration: none;
	color: black;
}

#sidemenu>ul>li>strong>a:hover {
	color: #424242;
}

/*아이템 스타일*/
#shoes_imgandname {
	padding: 0px 70px; /*상, 좌우, 하*/
	text-align: center;
}

#shoes_img {
	width: 500px;
	height: auto;
}

.carousel-item {
	background: #F3F2F2;
}

.carousel-control-prev-icon {
	background-image:
		url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' fill='%23585858' width='8' height='8' viewBox='0 0 8 8'%3e%3cpath d='M5.25 0l-4 4 4 4 1.5-1.5L4.25 4l2.5-2.5L5.25 0z'/%3e%3c/svg%3e")
}

.carousel-control-next-icon {
	background-image:
		url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' fill='%23585858' width='8' height='8' viewBox='0 0 8 8'%3e%3cpath d='M2.75 0l-1.5 1.5L3.75 4l-2.5 2.5L2.75 8l4-4-4-4z'/%3e%3c/svg%3e");
}

.carousel-indicators li {
	background-color: #585858;
}

#shoes_name1 {
	margin-top: 20px;
	font-size: 28px;
	font-weight: bold;
	color: #373636;
}

#shoes_name2 {
	margin-bottom: 18px;
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

#shoes_info {
	margin-left: 50px;
}

div.col-md-2 { /*제품코드, 출시일, 가격*/
	font-size: 18px;
	color: #5E5E5E;
}

div.col-md-10 { /*값*/
	font-size: 18px;
	font-weight: bold;
}

#draw_info {
	background: #fcefc5;
	border-style: none;
	border-radius: 5px;
	padding-bottom: 10px;
}

#draw_info_title {
	margin-bottom: 10px;
	padding: 10px 20px;
	border-bottom: solid;
	border-color: #B5B2B1;
	border-width: 1px;
	font-weight: bold;
	color: #5D5B5A;
}

#draw_icon {
	width: 120px;
	height: 140px;
	background: #FFD24C;
	margin-right: 10px;
	padding: 10px 0px;
	border-width: 1px;
	border-style: solid;
	border-color: #DFDCDD;
	border-radius: 10px;
	float: left;
	text-align: center;
}
/*
#draw_icon {
	width:120px;
	height:140px;
	background:white;
	margin-right:10px;
	padding:10px 0px;
	border-style:solid;
	border-width:1px;
	border-color:#DFDCDD;
	border-radius:10px;
	float:left;
	text-align:center;	
}
*/
#draw_icon:hover {
	background: #FFE69A;
}

#draw_icon_img {
	width: 63px;
	height: 63px;
}

#draw_icon_name {
	margin-top: 4px;
	padding: 0px 0px;
	font-size: 12px;
	font-weight: bold;
}

#draw_icon_time {
	padding: 0px 0px;
	font-size: 9px;
}

#draw_icon_status {
	margin-top: 3px;
	font-size: 12px;
	color: #149027;
	font-weight: bold;
}

#reply_view {
	padding: 5px 5px;
	border-top: solid;
	border-bottom: solid;
	border-color: #B5B2B1;
	border-width: 1px;
	font-weight: bold;
	color: #5D5B5A;
}

#reply_header_username, #reply_header_date, #reply_footer_rereply {
	width: 100px;
	margin-right: 5px;
	float: left;
}

#reply_header_img {
	width: 40px;
	height: 40px;
	border-radius: 70%;
	overflow: hidden;
	margin-right: 5px;
	float: left;
}

#profile_img {
	width: 100%;
	height: 100%;
	object-fit: cover;
}

#reply_body_content {
	padding: 5px;
	text-align: left;
}
</style>

</head>
<body>

	<sec:authorize access="isAuthenticated()">
		<sec:authentication property="principal.username" var="user_id" />
	</sec:authorize>

	<!---------------------- 본문 ------------------------->


<div id="mainRegion" class="container mt-5 p-0">
  
	<div id="submain">
		<h3 class="text-center text-danger multiEffect">공지사항</h3>	
		<table id="searchTable" class="table table-bordered table-hover">
			<thead>
				<tr>
					<th>번호</th>
					<th>작성자</th>
					<th>제목</th>
					<th>작성일</th>
					<th>히트수</th>	
				</tr>
			</thead>	
			<tbody>	
				<c:forEach items="${listContent}" var="dto">
					<tr>
						<td class="bid">${dto.bId}</td>
						<td>${dto.bName}</td> <!-- bName은 user id -->
						<td>
							<c:forEach begin="1" end="${dto.bIndent}">-</c:forEach>
							<a class="contentView" id="contentViewBtn" href="contentView?bId=${dto.bId}">${dto.bTitle}</a>
						</td>
						<td>${dto.bDate}</td> <!-- Timestamp형의 문자열로 출력 -->
						<td>${dto.bHit}</td>
				    </tr>
				</c:forEach>
			</tbody>	
		</table>
	</div>
	<!-- 페이지 표시 -->
	<nav aria-label="Page navigation"> <!-- aria-label은 라벨표시가 안되는것 예방 -->
		<ul class="pagination justify-content-center" id="pagination" style="margin:20px 0">
		</ul>
	</nav>
	<sec:authorize access="hasRole('ROLE_ADMIN')">
		<a id="write" class="btn btn-primary" href="writeView">글작성</a>
	</sec:authorize>
	
</div>

<script>
//페이지 구현
//$(function(){}); 는 $(document).ready(function(){});과 동일

$(function(){	
	window.pagObj = $("#pagination").twbsPagination({
		totalPages: 35, //총 페이지 수
		visiblePages: 10, //가시 페이지 수
		onPageClick : function(event,page) {
			console.info(page + ' (from options)');
			$(".page-link").on("click",function(event){ //클래스page-link는 BS4의 pagination의 링크 a
				event.preventDefault(); 				
				let peo = $(event.target); 			
				let pageNo = peo.text();				
				let purl;
				let pageA;
				let pageNo1;
				let pageNo2;
				
				if(pageNo != "First" && pageNo != "Previous" && pageNo != "Next" && pageNo != "Last") {
					purl = "plist?pageNo=" + pageNo;
				}
				else if(pageNo == "Next") {
					pageA = $("li.active > a"); //li에 actvive클래스가 있고 a에 페이지 번호가 있음
					pageNo = pageA.text(); //페이지 번호
					pageNo1 = parseInt(pageNo); //페이지번호를 1더해야 하므로 정수로 변환
					pageNo2 = pageNo1 + 1;
					purl = "plist?pageNo=" + pageNo2;
				}
				else if(pageNo == "Previous") {
					pageA = $("li.active > a"); //li에 actvive클래스가 있고 a에 페이지 번호가 있음
					pageNo = pageA.text(); //페이지 번호
					pageNo1 = parseInt(pageNo); //페이지번호를 1더해야 하므로 정수로 변환
					pageNo2 = pageNo1 - 1;
					purl = "plist?pageNo=" + pageNo2;
				}
				else if(pageNo == "First") {					
					purl = "plist?pageNo=" + 1;
				}
				else if(pageNo == "Last") {					
					purl = "plist?pageNo=" + 35;
				}
				else {					
					return;					
				}	
				
				$.ajax({
					url : "plist",
					type : "get",
					data : "",
					success : function(data) {
						$("#submain").html(data);						
					},
					error : function() {
						$("#mbody").text("서버접속 실패!.");
						$("#modal").trigger("click");	
					}					
				}); //ajax
			}); //on-click
		} //onPageClick 
	})//window.pagObj
	.on('page', function(event, page){  //chaining
		console.info(page + ' (from event listening)');	    
	});
	
	$("#write").click(function(event){
		event.preventDefault();
		$.ajax({
			url : "writeView",
			type : "get",
			data : "",
			success : function(data) {
				$("#mainRegion").html(data);						
			},
			error : function() {
				$("#mbody").text("서버접속 실패!.");
				$("#modal").trigger("click");	
			}
		});
	});	
	
	$("contentViewBtn").click(function(event){
		event.preventDefault();
		let ceo = $(event.target);
		$.ajax({
			url : ceo.attr("href"),
			type : "get",
			data : "",
			success : function(data){
				$("#mainRegion").html(data);
			},
			error : function() {
				$("#mbody").text("서버접속 실패!.");
				$("#modal").trigger("click");	
			}
		});
	});
});
</script>
</body>
</html>