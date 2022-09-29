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
<title>DRAW SNS 이미지게시글을 수정/삭제합니다</title>

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
<link rel="stylesheet" href="main.css">
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
/*
div {
	border: 1px solid black;
}*/
#div1 {
	padding-top: 30px;
	max-width: 1280px;
	margin : auto;
}
#div2 {
	margin: 5px;
	padding: 10 40px;
}
#title {
	padding: 20px 30px;
	margin: 0;
}
#textarea {
	display: block;
	min-width: 340;
	height:100px;
	padding-bottom: 10px;
}
text {
	width:auto;
}
#imgAttach {
	padding: 10px;
	height: 400px;
}
#imgAttach h5 {
	text-align: center;
}
#tagInsert {
	display: block;
	padding: 10px;
	margin-top: 15px;
	width:auto;
}
#Dnav {
	background-color:#92B4EC;
	width: 100%;
	max-width: 1280px;
}
.nav-link {
	color : white;
}
.form-control-file{
	padding: 0px;
	margin: 0px;
	height: 380px;
	border: 1px solid lightGrey;
}
#div1 {
	width: 100%;
	max-width: 750px;
	padding:0;
	margin: auto;
}
.alert-box {
	background-color: aliceblue;
	padding: 15px;
	border-radius: 5px;
	display: none;
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

<div class="container mb-4 bg-white" id="div1">

	<h3 id="title">게시글 수정</h3>
	<div id="div2" class="form-group">
		<form action="p4modify?${_csrf.parameterName }=${_csrf.token }" method="POST">
			
			<input type="hidden" name="iBoardNum" id="iBoardNum" value="${p4modifyView.iBoardNum }"/>
			<br>
			<input type="text" name="iId" id="iId" placeholder="${p4modifyView.iId }" value="${p4modifyView.iId }" class="form-control"  readonly required/>
			<br>
			<textarea rows="3" name="iText" id="iText" class="form-control" placeholder="문구를 입력해주세요...(최대 150자)" maxlength="100" required>${p4modifyView.iText }</textarea>
			<br>
			<div>
				<div class="col-md-3">
	 				<img id="imgAttach" src="images/boardImage/${p4modifyView.iImagePath }" alt="등록된 이미지"/>
	 			</div>
	 			<div class="alert-box"></div>
			</div>
			
			<br>
<%--			<input type="text" name="iModelName" id="iModelName" class="form-control" value="${p4modifyView.iModelName }" placeholder="모델명을 적어주세요" required/> --%>
				<select name="iModelName" class="form-group">
					<option name="iModelName" value="나이키 x 사카이 블레이저 로우 클래식 그린</br>DD1877-001" class="form-control" >나이키 x 사카이 블레이저 로우 클래식 그린(DD1877-001)</option>
					<option name="iModelName" value="나이키 x 슈프림 샥스 라이드 2 SP 레드</br>DN1615-600" class="form-control" >나이키 x 슈프림 샥스 라이드 2 SP 레드(DN1615-600)</option>
					<option name="iModelName" value="조던 1 로우 골프 화이트 앤 유니버시티 블루</br>DD9315-100" class="form-control" >조던 1 로우 골프 화이트 앤 유니버시티 블루(DD9315-100)</option>
					<option name="iModelName" value="나이키 x 카시나 덩크 로우 80s 버스</br>CZ6501-100" class="form-control" >나이키 x 카시나 덩크 로우 80s 버스(CZ6501-100)</option>
					<option name="iModelName" value="조던 1 로우 OG 스타피쉬</br>CZ0790-801" class="form-control" >조던 1 로우 OG 스타피쉬(CZ0790-801)</option>
					<option name="iModelName" value="조던 1 레트로 하이 OG 블랙 모카</br>555088-105" class="form-control" >조던 1 레트로 하이 OG 블랙 모카(555088-105)</option>
					<option name="iModelName" value="호카 오네 오네 본디 6 블랙 - 와이드</br>1019271-BBLC" class="form-control" >호카 오네 오네 본디 6 블랙 - 와이드(1019271-BBLC)</option>
				</select>		
			<br>
	</div>			
			<br>
			<input type="submit" id="modi" class="btn btn-round btn-warning" value="게시글 수정"/>
			<a type="button" id="delete"  class="btn btn-outline-warning" >삭제</a>
			<a type="button" id="cancle" class="btn btn-outline-warning" >취소</a>
		</form>
	
</div>

<script>
let userName = '<c:out value="${user_id}"/>';
let iId = '<c:out value="${p4modifyView.iId}"/>';


$(document).ready(function(){
	$("#alert1").click(function(){
		alert("준비중입니다!");
	});
	
	
	$("#imgAttach").click(function(){
		$(".alert-box").css("display", "block");
		$(".alert-box").text(${p4modifyView.iHeart }+"명의 사람들이 좋아한 사진으로 다른 이미지로 변경하실 수 없습니다.");
	});
	
	
	$("#modi").submit(function(event){
		event.preventDefault();
		if(userName == iId) {
			let ret = confirm("게시물을 수정하시겠습니까?");
			if(ret == true) {
				$.ajax({
					url:$("#modi").attr("href"),
					type:"post",
					data:$("#modi").serialize(),
					success : function(data) {
						alert("게시글을 수정했습니다");
					},
					error : function(){
						alert("서버상의 문제로 게시글 수정을 실패하였습니다");
					}
				});
			}
		}
		else{
			alert("게시글은 본인만 수정가능합니다.");
			return "p4modifyCancle";
		}
	});

	
	$("#delete").click(function(event){
		event.preventDefault();
		if(userName == iId) {
			let ret = confirm("정말로 삭제하시겠습니까? 삭제된 게시글은 복구하실 수 없습니다.");
			if(ret == true) {
				alert("게시글이 삭제되었습니다.");
				url="p4modifyDelete?iBoardNum=${p4modifyView.iBoardNum }";
				location = url;
			}
		}
		else {
			alert("게시글은 본인만 삭제할 수 있습니다.");
			url="p4modifyCancle";
			location = url;
		}
	});


	$("#cancle").click(function(){
		let ret = confirm("게시글 수정을 취소하시겠습니까? 작성하던 글은 사라집니다.");
		if(ret == true) {
			url="p4modifyCancle";
			location = url;
			alert("게시물 수정이 취소되었습니다.");
		}
	});
	
});
</script>

</body>
</html>
