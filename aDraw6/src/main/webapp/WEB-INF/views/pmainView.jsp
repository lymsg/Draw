<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %> 
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>   
<!DOCTYPE html>
<html lang ="ko">
<head>
<meta charset="UTF-8">
<!-- RWD -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- MS -->
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE8,IE=EmulateIE9"/>

<title>Insert title here</title>
<!--bootstrap-->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<!--jquery-->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<!--propper jquery-->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<!--latest javascript-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css"
	integrity="sha384-LZN37F5QGTY3VHGisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
<!-- google icon -->
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">

</head>
<body>
<div class="col-md-10" id="productwall">
		<h1><b>인기 상품</b></h1>
		<br/><br/>
			<c:forEach items="${list}" var="dto">
					<div id ="product" class="container mt-10">
						<div class="media border p-3">
							<img src="media/${ dto.image }" alt="이미지 업로딩 실패" class="mr-3 mt-3 rounded-circle" style="width:100px;"/>
								<div class="media-body">
									<h4>${ dto.name }</h4><br/>
									   <small><i>등록일자 : ${dto.pdate } </i></small><br/>
									   <i><h4>남은 경매시간 :${ dto.limit }일</h4></i><br/>
									   </h4>
									   <p><a class="btn btn-primary float-right" data-toggle="modal" data-target="#myModal2">경매참여</a></p>
								</div>
						</div>
						<br/><br/>
					</div>
			</c:forEach>
			</div>		
</body>
</html>