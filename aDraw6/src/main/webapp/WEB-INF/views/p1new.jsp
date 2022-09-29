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
h3#ht {
	color: white;
	text-shadow: 1px 1px 2px black;
}
mainDiv {
	margin: 0px;
	padding: 0px;
}
.navbar-nav {
	display: flex;
	aling-items : center;
	padding: 0;
	list-style-type: none;
}
form {
	display : flex;
	justify-content : space-between;
}
#search {
	padding:2px;
}
#img1 {
	width: 100px;
	height:100px;
}
#div1, #div2, #div3 {
	padding-top: 30px;
	max-width: 1280px;
	margin : auto;
}
#flex2 {
	display: flex;
/*	grid-template-colums: 1fr 1fr 1fr 1fr;*/
	justify-content: space-around;
	margin:0px;
	flex-wrap:wrap;
}
#flex2 img {
	width: 100%;
	height: 100%;
	padding: 5px;
	margin :0;
	max-width: 279px;
	max-height: 376px;
	object-fit : cover;
	object-position:center center;
}
a, a hover, h5 {
	color : #000000;
	text-decoration : none;
	display: inline;
}


</style>
</head>
<body>


			<div class="row" id="flex2">
				<c:forEach items="${iView1}" var="dtos">
				<div class="col-md-3 d-inline-block">
							<a href="p2?iBoardNum=${dtos.iBoardNum}&iId=${dtos.iId}&hId=${user_id}">
								<img class="rounded" src="images/boardImage/${dtos.iImagePath}" alt="이클립스를refresh해주세요">
							</a>
				</div>
				</c:forEach>
			</div>




</body>
</html>