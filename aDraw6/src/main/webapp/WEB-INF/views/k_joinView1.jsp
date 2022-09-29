<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
.header-body {
	width:100%;
	height:100%;
	text-align:center;
	background: #BBD3FC;
}
.header-body img {
	height:200px;
	width:auto;	
}

.wrap {
  width: 100%;
  height: auto;
  display: flex;
  align-items: center;
  justify-content: center;
}

.login {
  width: 600px;
  height: auto;
  background: #FFE69A;
  border-radius: 20px;
  display: flex;
  justify-content: center;
  align-items: center;
  flex-direction: column;
  margin-bottom: 50px;
  padding-bottom: 50px;
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
  width: 30%;
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
</head>
<body>

<div class="header-body">
	<a href="home">			
		<img src="images/Logo.png" alt="Logo">
	</a>
	<div class="text-center">
		<div class="text mb-4">		
			JOIN
		</div>
	
		<div class="wrap mt-4">
			<div class="login">
				<form action="join" method="post" id="frm1" name="frm1" class="justify-content-center" style="width:100%; margin-left:120px;">
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
					<div class="join">
						<h4>ID</h4>
						<input type="text" class="form-control" name="pid" placeholder="아이디 입력" 	id="uId" required/>
					</div>
					<div class="join">
						<h4>Password</h4>
						<input type="password" class="form-control" name="ppw" id="uPw"	placeholder="비밀번호 입력" required/>
					</div>   
					<div class="join">
						<h4>e-mail</h4>
						<input type="email" class="form-control" name="pemail" id="uEmail" placeholder="이메일 입력" required/>			
					</div> 
					<div class="join">
						<h4>이름</h4>
						<input type="text" class="form-control" name="pname" id="uName" placeholder="이름 입력" required/>
					</div> 
					<div class="join">
						<h4>핸드폰</h4>
						<input type="text" class="form-control" name="pphone" id="uPhone" placeholder="이름 입력" required/>
					</div> 
				 	<div class="submit">
				  	   <input type="submit" value="submit">
				  	   <input type="reset" value="cancle">
					</div>
				</form>	
				<br/>
				<a href="loginView" style="font-weight: bold; color:grey;">로그인 하러가기</a>
			</div>
		</div>
	</div>		       
</div>            
		            
<script>
$(document).ready(function(){
	$("#frm1").submit(function(event){
		event.preventDefault();
		$.ajax({
			url : $("#frm1").attr("action"),
			type : $("#frm1").attr("method"),
			data : $("#frm1").serialize(),
			success : function(data){
				if(data.search("join_success") > -1) {
					alert("가입을 축하합니다! 로그인창으로 돌아가서 로그인하세요.");			
				}
				else {
					alert("동일한 ID 존재로 실패!");					
				}
			},
			error : function() {
				alert("서버와의 접속실패!");				
			}
		});
	});
});

</script>
</body>
</html>