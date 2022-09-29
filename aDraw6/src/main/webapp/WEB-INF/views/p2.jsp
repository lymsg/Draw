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
<title>${p2View.iId}님의 페이지</title>

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
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
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
#Dnav {
	background-color:#92B4EC;
	width: 100%;
	max-width: 1280px;
}
.nav-link {
	color : white;
}
h3#ht {
	color: white;
	text-shadow: 1px 1px 2px black;
}
.navbar-nav {
	display: flex;
	aling-items : center;
	padding: 0;
	list-style-type: none;
}

#margin {
	height: auto;
}

/*div {
	border: 1px solid black;
}*/

.card-header img, #commentImg {
	display : inline-block;
	width: 50px;
	height: 50px;
	margin : 8px 10px;
}
.card, #comment {
	width: 100%;
	max-width: 750px;
	padding:0;
	margin: auto;
	display: flex;
}
.card-header {
	padding:0;
	margin: 0px;
}
.card body {
	padding: 0;
	margin: 0;
}
.card-img-top {
	display : flex;
	justify-content :center;
	padding : 1px;
	width: 100%;
    height: auto;
	margin: auto;
}
.fas {
	font-size:18px;
}
.label {
	width:288px;
	margin:0;
	padding:0;
}
#modelImg {
	display : inline-block;
	max-width: 128px;
	max-height: 128px;
	min-width: 60px;
	min-height: 60px;
	margin-left : 0px;
}
#divRow {
	display: grid;
}
#text1 {
	margin: 8px 10px 8px 20px;
}
#div1 {
	padding-top: 30px;
	max-width: 1280px;
	margin : auto;
}
a, a hover {
	color : #000000;
	text-decoration : none;
}
#p2cmtPlace{
	width: 100%;
	max-width: 750px;
	padding:0;
	margin: auto;
}


</style>
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
<!-- -----main--------------------------------------------- -->
<div class="container mb-4 bg-white" id="div1">

	
		<div class="card p-0">
		
			<div class="card-header">
				<div class="row col-md-12 m-3">
					<a href="p3IList?iId=${p2View.iId}">
						<img src="images/snsProfile/${p2PView.iProfilePath }" class="rounded-circle m-auto" id="profileImg" alt="프로필이미지" />
					</a>
					<p id="text1">${p2View.iText}</p>
				</div>
			</div>
			
			<div class="card-body p-0 m-auto">
				<img class="card-img-top" src="images/boardImage/${p2View.iImagePath}" alt="Card image">
				
				<div class="container pt-3 row">
				
					<div class="container col-md-5 d-flex flex-column border">
						<div class="col">
							<img src="" alt="모델사진" id="modelImg" name="model" class="rounded d-inline-block"/>
						</div>
						<div class="col flex-row">
								<p class="d-inline-block col" >${p2View.iModelName}</p>
						</div>
					</div>
					
					<div class="container mt-3 col-md-7 justify-content-end">
						
						<span><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${p2View.iDate}"/></span>&nbsp;
						
						<span id="heartBtn">
							<form action="hUpDown" method="post" id="hForm" class="d-inline-block">
								<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
								<input type="hidden" name="hiBoardNum" value="${p2View.iBoardNum }"/>
								<input type="hidden" name="hiId" value="${p2View.iId}" />
								<input type="hidden" name="hiImagePath" value="${p2View.iImagePath}" />
								<input type="hidden" id="hId" name="hId" value="${user_id}"/>
								<button type="submit" id="hBtn" class="btn btn-md btn-outline-warning"><i class="fas fa-heart"></i></button>
							</form>
						</span>
						
							<button id="btnComment" href="p2ccmentLoad?iBoardNum=${p2View.iBoardNum }" type="button" class="btn btn-md btn-warning" data-toggle="collapse" data-target="#p2cmtCollapse">
						답글</button>
						
						<a class="btn btn-md btn-outline-warning" id="modi-btn" href="p4modifyView?iBoardNum=${p2View.iBoardNum}">수정</a>
					</div>
				</div>
			</div>
			
		</div>

</form>

	
		
		
<!-- ---- 덧글창 ------------------------------------- -->		
		
		<div id="p2cmtCollapse">
			<div id="p2cmtPlace" class="container row p-0"></div>
		</div>	
		<br>
		<br>
		<br>
	

<script>
$(document).ready(function(){
//	let hc = document.getElementById("dlrj").innerHTML;
//	alert(hc);

	if(${p2h.hNum} != null || ${p2h.hNum} != "") {
		$("#hBtn").attr("class","btn btn-md btn-warning");
	}
});
</script>
	
<script>
$(document).ready(function(){
	$("#hBtn").click(function(){
		event.preventDefault();
		$.ajax({
			url:"p2heartBtn";
			type:"get",
			data:"",
			success : function(data){
				$("#heartBtn").html("url");
			},
			error : function(){
				alert("실패~");
			}
		});
	});
});
</script>	
	
<script>
$(document).ready(function(event){
	//좋아요버튼
	$("#hForm").submit(function(event){
		event.preventDefault();
		$.ajax({
			url:"p2hUpDown",
			type:"post",
			data:$("#hForm").serialize(),
			success : function(data) {
				if($("#hBtn").attr("class") == "btn btn-md btn-outline-warning"){
					hBtnC1();
				}
				else{
					hBtnC2();
				}
			},
			error : function(){
				alert("서버에 접속을 실패하였습니다..");
			}
		});
	});
	function hBtnC1(){
			alert("좋아요 +1");
			$("#hBtn").attr("class","btn btn-md btn-warning");
		}
		function hBtnC2(){
			alert("좋아요 -1");
			$("#hBtn").attr("class","btn btn-md btn-outline-warning");
		}
	
});
</script>



<script>

$(document).ready(function(){

	
	$("#alert1").click(function(){
		alert("준비중입니다!");
	});
	

	let modelPath = '<c:out value="${p2View.iModelName}"/>'
	let mP1 = modelPath.split("&gt;");
	var mP2 = mP1[1];
	if(modelPath != null) {
		let modelImg = document.getElementById("modelImg");
		modelImg.setAttribute("src","images/modelImage/"+mP2+".png");
	}
	
	
let userName = '<c:out value="${user_id}"/>';
let iId = '<c:out value="${p2View.iId}"/>';	
	
	let mBtn = document.getElementById("modi-btn");
	if(userName != iId) {
		mBtn.style.display="none";
	}


//답글불러오기	
	$("#btnComment").click(function(){
		event.preventDefault();
		$.ajax({
			url: $("#btnComment").attr("href"),
			type: "get",
			data: "",
			success : function(data){
				$("#p2cmtPlace").html(data);
			},
			error : function() {
				$("#p2cmtPlace").text("서버상의 문제로 페이지를 불러오지 못했습니다..");
			}
		});
	});
	
	$(".deleteBtn").click(function(){
		event.preventDefault();
		let ret = confirm("답글을 삭제하시겠습니까?");
		if(ret == true) {
			url=$(".deleteBtn").attr("href");
			location = url;
			alert("답글을 삭제했습니다");
		}
	});
});
</script>	
	
</body>
</html>