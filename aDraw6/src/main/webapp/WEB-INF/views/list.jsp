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
<title>auc</title>
<!--bootstrap-->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<!--jquery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<meta id="_csrf" name="_csrf" content="${_csrf.token}"/>
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
<script>
    //이미지미리보기
    function readURL(input) {
		if (input.files && input.files[0]) {
		var reader = new FileReader();
		reader.onload = function(e) {
			document.getElementById('preview').src = e.target.result;
		};
		reader.readAsDataURL(input.files[0]);
	} else {
		document.getElementById('preview').src = "";
		}
	}
      
    	/* $(document).on('hidden.bs.modal', function (event) {		
    	if ($('.modal:visible').length) {			
    		$('body').addClass('modal-open');		
    		}	
    	}); */
    
    /* function sortclick(button_id){ //정렬버튼텍스트
    	
    		
    		 switch(button_id)
    		{
    			case 'newsort':
    			{	
    				document.getElementById("sortmain").innerText = "최신순";
    				break;
    			}
    			case 'oldsort':
    			{
    				document.getElementById("sortmain").innerText = "오래된순";
    				break;
    			}
    			case 'lpricesort':
    			{
    				document.getElementById("sortmain").innerText = "가격낮은순";
    				break;
    			}
    			case 'hpricesort':
    			{
    				document.getElementById("sortmain").innerText = "가격높은순";
    				break;
    			}
    		} 
    	} */
    	 /* TimerTask task = new TimerTask() {
    	    public void run() {
    	        System.out.println(new Date() + " : Executing the task from "
    	                + Thread.currentThread().getName());
    	    }
    	};

    	Timer timer = new Timer("Timer");
    	long delay = 3000L;
    	System.out.println(new Date() + " : Scheduling....");
    	timer.schedule(task, delay); */ 
</script>
<style>
.carousel-inner img {
    width: 100%;
  }
.carousel .item {
  height: 200px;
}

.item img {
    position: absolute;
    top: 0;
    left: 0;
    min-height: 300px;
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
	list-style: none;
}
</style>

</head>
<body style="background-color:white">

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
	
	<!-- <div class="modal fade" id="myModal3">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header">
					<h2 class="modal-title text-center" style="text-shadow:2px 2px 4px darkgrey;"><b>Login</b></h2>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>            				
				<div class="modal-body">
					<form action="login.do" method="post">
						<div class="form-group mt-3">
							<label for="email"><b>이메일</b></label>
 							<input type="email" id="id" class="form-control" placeholder="email@-" name="id"/>
						</div>
						<div class="form-group mt-3">
							<label for="email"><b>비밀번호</b></label>
							<input type="password" id="pwd" class="form-control" placeholder="password-" name="pswd"/>
						</div>
  						<div class="form-group form-check mt-3">
							<label class="form-check-label">
								<input class="form-check-input" type="checkbox" name="rememeber"><b>이메일/비밀번호 저장하기</b>
							</label>
						</div>
						<div class="form-group">
							<button type="button" class="top_Btn1" data-toggle="modal" data-target="#myModal">로그인</button>
						</div>
						<div class="modal-footer">
							<a href="#">이메일 찾기</a> |
							<a href="#">비밀번호 찾기</a> |
							<a href="k_joinForm.jsp">회원가입</a>
						</div>									
					</form>
				</div>
			</div>
		</div>
	</div>	 -->

	<div class="header-body">
		<a href="home">			
			<img src="media/logo.png" alt="Logo">
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
	

<div class="container mt-3" >
	
	<div class="row">
	
		<div class="col-md-2 mt-5">
      		 
      		 <ul class="nav nav-pills flex-column">
      		 	<h3><b>Products.</b></h3>
      		 	<div class="btn-group-vertical p-3 border rounded" border-style="border-color:#92B4EC;">
      		 		<div class="btn-group">
					<button type="button" class="btn text-white" style="background-color: #92B4EC;"><b>Shoes</b></button>
				    <button type="button" class="btn dropdown-toggle dropdown-toggle-split text-white" style="background-color: #92B4EC;" data-toggle="dropdown">
				    </button>
				    <div class="dropdown-menu">
				    	<a class="dropdown-item" href="list"><h3>Hot&amp;New</h3></a>
				    	<a id="nikeView" name="nView" class="dropdown-item" href="nikeView">Nike</a>
				    	<a id="adidasView" class="dropdown-item" href="adidasView">Adidas</a>
				    	<a id="newbalView" class="dropdown-item" href="newbalView">NewBalance</a>
				    	<a id="underarmView" class="dropdown-item" href="underarmView">UnderArmour</a>
				    </div>
				    </div>
				    <div class="btn-group">
				    <button type="button" class="btn text-white" style="background-color: #92B4EC;"><b>Etc</b></button>
				    <button type="button" class="btn dropdown-toggle dropdown-toggle-split text-white" style="background-color: #92B4EC;" data-toggle="dropdown">
				    </button>
				    </div>
				
				</div>
				<sec:authorize access="isAnonymous()">
				<a class="btn text-white mt-4" style="background-color: #FFE69A;" id="anonysell"><b>판매등록</b></a>
      		 	</sec:authorize>
				<sec:authorize access="isAuthenticated()">
				<a class="btn text-white mt-4" style="background-color: #FFE69A;" data-toggle="modal" data-target="#myModal"><b>판매등록</b></a>
      		 	</sec:authorize>
      		 	<!-- <p>Shoes</p>
      		 	<li class="nav-item">
      		 		 <a class="nav-link text-secondary" href="list"><h3>Hot&amp;New</h3></a>
      		 	</li>
      		 	
      		 	<li class="nav-item">
      		 		 <a id="nikeView" class="nav-link text-secondary" href="nikeView">Nike</a>
      		 	</li>
      		 	<li class="nav-item">
      		 		<a id="adidasView" class="nav-link text-secondary" href="adidasView">Adidas</a>
      		 	</li>
      		 	<li class="nav-item">
      		 		<a id="newbalView" class="nav-link text-secondary" href="newbalView">NewBalance</a>
      		 	</li>
      		 	<li class="nav-item">
      		 		<a id="underarmView" class="nav-link text-secondary" href="underarmView">UnderArmour</a>
      		 	</li> -->
      		 </ul>
		</div>
		
		
		<!-- 상품창 -->
		<div class="col-md-7" >
		<div class="dropdown float-sm-right border rounded mt-5">
			<button type="button" id="sortmain" style="background-color:white" class="btn dropdown-toggle" data-toggle="dropdown" >
			${sortmainval}
			
			</button>
			<div class="dropdown-menu">
			    <a class="dropdown-item" id="newsort" href="newsort" >최신순</a>
			    <a class="dropdown-item" id="oldsort" href="oldsort" >오래된순</a>
			    <a class="dropdown-item" id="lpricesort" href="lpricesort">가격낮은순</a>
			    <a class="dropdown-item" id="hpricesort" href="hpricesort">가격높은순</a>
  			</div>
		</div>
		
		<!-- 상품리스트 -->
		<div id="productwall">
		<h1><b>인기 &amp; 최신 상품</b></h1>
		<br/><br/>
			<div id="productRegion">
			<c:forEach items="${list}" var="dto" varStatus="status">

					<div id ="product" class="container mt-10">
						<div class="media border p-3">
							<img src="upimage/${ dto.image }" alt="이미지 업로딩 실패" class="mr-3 mt-3 rounded border" style="width:200px;"/>
								<div class="media-body">
									<c:if test="${not empty dto.pbuyer}">
										<div class="text-white text-center" style="background-color: #FFE69A;">${dto.pbuyer}님이 상회입찰중</div>
									</c:if><br/>
									<h4>${ dto.brand }</h4>
									
									<h2><b>${dto.name }</b></h2><br/>
									   <small><i>등록일자 : ${dto.pdate } </i></small><br/>
									   <i><h4>남은 경매일 :${ dto.limit }일</h4></i><br/>
									   <b>현재 입찰가 : ${dto.price} 원</b>
									   
									   <sec:authorize access="isAnonymous()">
									   <p><a class="btn float-right text-white"
									   style="background-color: #92B4EC;" id="anonyauc">경매참여</a></p>
									   </sec:authorize>
									   
									   <sec:authorize access="isAuthenticated()">
									   <p><a class="auc-produc btn float-right text-white"
									    data-nameid="${dto.name}" data-priceid="${dto.price}" data-limitid="${ dto.limit }" data-imageid="upimage/${dto.image }"
									    data-buyerid="${dto.pbuyer}"
									   style="background-color: #92B4EC;" data-toggle="modal" data-target="#myModal2">경매참여</a></p>
									   </sec:authorize>
								</div>
									   
						</div>
						<br/><br/>
					</div>
			</c:forEach>
			</div>
			</div>
			
			<nav aria-label="Page navigation">
			<ul class="pagination justify-content-center" id="pagination"
				style="margin: 20px 0">
			</ul>
			</nav>
			</div>
			
			<!-- 캐러셀창 -->
			<div class="col-md-3" >
			<div id="demo" class="carousel slide" data-ride="carousel" style="margin-top:100px">

				  <!-- Indicators -->
				  <ul class="carousel-indicators">
				    <li data-target="#demo" data-slide-to="0" class="active"></li>
				    <li data-target="#demo" data-slide-to="1"></li>
				  </ul>
				  
				  <!-- The slideshow -->
				  <div class="carousel-inner">
				    <div class="carousel-item active">
				      <img src="media/d_banner3.png" alt="사진없음" width="300" height="600">
				    </div>
				    <div class="carousel-item">
				      <img src="media/d_banner4.png" alt="사진없음" width="300" height="600">
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



<!-- Sell Modal폼 -->

<div  id="myModal" class="modal fade">
	<div class="modal-dialog">
		<div class="modal-content">
			<!-- Modal 헤더 -->
			<div class="modal-header">
	          <h4 class="modal-title">판매 등록 요청</h4>
	          <button type="button" class="close" data-dismiss="modal">×</button>
	        </div>
	        <!-- Modal 바디 -->
	        <form action="sell?${_csrf.parameterName}=${_csrf.token}" method="POST" enctype="multipart/form-data">
	        <div class="modal-body">
	        	브랜드이름 :
	        	<select class="form-control float-center " style="width:100px" id="brand" name="brand">
					<option value="Nike">나이키</option>
					<option value="Adidas">아디다스</option>
					<option value="NewBalance">뉴발란스</option>
					<option value="UnderArmour">언더아머</option>
				</select>
				제품 상세 이름 :
				<input type="text" class="from-control" id="name" name="name"><br/>
				제품 사진첨부:
				<input type="file" class="form-control-file border" id="image" name="image" onchange="readURL(this);"><br/>
				<img id="preview" width=200px height=200px/><br/>
				시작 입찰가 : 
				<input type="text" class="from-control" id="price" name="price">원<br/>
				판매기한:<br/>
				경매시작일로부터
				<select class="form-control float-center " style="width:75px" id="sel1" name="limit">
					<option>1</option>
					<option>2</option>
					<option>3</option>
					<option>4</option>
				</select>일까지
				
			</div>	
			<!-- Modal footer -->
	        <div class="modal-footer">
	        	<button type="submit" class="btn btn-primary" data-toggle="modal" onclick="alert('판매등록을 요청하였습니다')">등록요청</button>
	         	<button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
	        </div>					
			</form>
		</div>
	</div>
</div>

<!-- 경매 모달창 -->
<div  id="myModal2" class="modal fade">
	<div class="modal-dialog">
		<div class="modal-content">
			<!-- Modal 헤더 -->
			<div class="modal-header">
	          <h4 class="modal-title">경매/입찰</h4>
	        </div>
	        <!-- Modal 바디 -->
	        <div class="modal-body">
	        
	        	
	        	<form id="form1" action="modify?${_csrf.parameterName}=${_csrf.token}" method="POST" enctype="multipart/form-data"> 
	        	<div id="img" >
	        	<img src="#" id="imgId" name="imgId" class="mr-3 mt-3 rounded border" style="width:200px;" alt="이미지 업로딩 실패" /> 
	        	</div>
	        	<br/>
	        	
	        	<label for="pnameId"> 
	        	제품이름 : 
	        	<input type="text" id="pnameId" name="pnameId" class="body-contents" style="border:none" readonly/>
	        	</label>
	        	<br/>
	        	
	        	<label for="plimId"> 
	        	남은경매일 : 
	        	<input type="text" id="plimId" class="body-contents text-center" style="border:none; width:40px;" readonly/>일
	        	</label>
	        	<br/>
	        	
	        	<label for="priId">
	        	현재 입찰가 :  
	        	<input type="text" id="priId" class="body-contents" style="border:none" readonly/>
	        	원
	        	</label>
	        	<br/>
	        	
	        	<input type="hidden" id="curIdhidden" name="curIdhidden" class="body-contents" value="${user_id}"/>
	        	<label for="buyerId">
	        	현재 상회입찰자 ID :  
	        	<input type="text" id="buyerId" class="body-contents" style="border:none" readonly/>
	        	</label>
	        	<br/>
	        	
	        	
	        	<button type="button" id="onDisplay" class="btn text-white btn-sm" style="background-color: #FFE69A;" >
	        	입찰
	        	</button>
	        	<br/><br/>
	        	
	        	<div id="divDisplay" style="display:none" class="divdisplay">
	        	
	        	고객님의 입찰가 : 
	        	<input type="text" id="priId2" name="priId2" class="div-contents" readonly>원</input><br/>
	        	<button type="button" id="plusbtn" class="btn text-white btn-sm" style="background-color: #92B4EC;" >
	        	입찰가 한번 올리기(+현재입찰가의10%)
	        	</button>
	        	<button type="button" id="selfbtn" class="btn text-white btn-sm" style="background-color: #92B4EC;" >
	        	직접입력
	        	</button>
	        	<br/>
	        	<button type="submit" id="cnfmbtn" class="btn text-white btn-sm" style="background-color: #FFE69A;" onclick="stored()">
	        	입찰하기
	        	</button>
	        	
	        	</div>
	        	
	        	<div id="chart" class="mr-3 mt-3 rounded border" style="width:200px;">
	        	차트구역
	        	</div>
	        	</form>
	        	
	        
	        	
				
				
			</div>	
			<!-- Modal footer -->
	        <div class="modal-footer">
	         	<button id="closebtn" type="button" class="btn close" data-dismiss="modal">Close</button>
	        </div>					
			
		</div>
	</div>
</div>

<!-- footer -->
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
		
$(document).ready(function(){
	
	//로그인안한상태에서 판매등록 누를시
	$("#anonysell").click(function(){
		alert("로그인이 필요한서비스입니다");
	});
	//로그인안한상태에서 경매참여 누를시
	$("#anonyauc").click(function(){
		alert("로그인이 필요한서비스입니다");
	});
	
	window.pagObj = $("#pagination").twbsPagination(
			{
				totalPages : 10, //총 페이지 수
				visiblePages : 4, //가시 페이지 수
				onPageClick : function(event, page) {
					console.info(page + ' (from options)');
					$(".page-link").on("click",function(event) { //클래스page-link는 BS4의 pagination의 링크 a
								event.preventDefault();
								let peo = $(event.target);
								let pageNo = peo.text();
								let purl;
								let pageA;
								let pageNo1;
								let pageNo2;

								if (pageNo != "First"&& pageNo != "Previous"&& pageNo != "Next"&& pageNo != "Last") {
									purl = "aplist?pageNo=" + pageNo;
								} else if (pageNo == "Next") {
									pageA = $("li.active > a"); //li에 actvive클래스가 있고 a에 페이지 번호가 있음
									pageNo = pageA.text(); //페이지 번호
									pageNo1 = parseInt(pageNo); //페이지번호를 1더해야 하므로 정수로 변환
									pageNo2 = pageNo1 + 1;
									purl = "aplist?pageNo=" + pageNo2;
								} else if (pageNo == "Previous") {
									pageA = $("li.active > a"); //li에 actvive클래스가 있고 a에 페이지 번호가 있음
									pageNo = pageA.text(); //페이지 번호
									pageNo1 = parseInt(pageNo); //페이지번호를 1더해야 하므로 정수로 변환
									pageNo2 = pageNo1 - 1;
									purl = "aplist?pageNo=" + pageNo2;
								} else if (pageNo == "First") {
									purl = "aplist?pageNo=" + 1;
								} else if (pageNo == "Last") {
									purl = "aplist?pageNo=" + 10;
								} else {
									return;
								}

								$.ajax({
									url : purl,
									type : "get",
									data : "",
									success : function(data) {
										
										$("#productRegion").html(data);
									},
									error : function() {
										alert("서버 접속 실패");
									}
								}); //ajax
							}); //on-click
				} //onPageClick 
			})//window.pagObj
	.on('page', function(event, page) { //chaining
		console.info(page + ' (from event listening)');
	});

	
	//경매참여버튼 누를시 ajax로 넘어가는 데이터
	$(".auc-produc").click(function () {
		var pnamId = $(this).data('nameid');
	    $("#pnameId.body-contents").val(pnamId); 
		
	    var ppriId = $(this).data('priceid');
	    $("#priId.body-contents").val(ppriId);
	    $("#priId2.div-contents").val(ppriId);
	  
	    var plimId = $(this).data('limitid');
	    $("#plimId.body-contents").val(plimId);
	    
	    var pimgId = $(this).data('imageid');
	    $("#imgId").attr("src",pimgId);
	    
	    var pbuyerId = $(this).data('buyerid');
	    $("#buyerId").val(pbuyerId);
	    
	    var curbuyerId = $("#curIdhidden").val();
	    
	    
	    
	});
	
	$("#onDisplay").click(function(){
		if($("#divDisplay").css("display")=="none"){
			$("#divDisplay").show();
		}
	});
	
	$("#closebtn").click(function(){
		
			$("#divDisplay").hide();
			$("#priId2").attr('readonly',true);
		
	});
		
	// 현재입찰가의 10%만큼 증가 버튼
	$("#plusbtn").click(function(){
		
		
		var curpri = parseInt($("#priId").val());
		var incpri = parseInt(curpri*1.1);

		$("#priId2.div-contents").val(incpri);
	});
	
	$("#selfbtn").click(function(){
		
		$("#priId2").attr('readonly',false);
		$("#priId2").select();
	
	});
	// 입찰하기 버튼 클릭시
	$("#cnfmbtn").click(function(){
		
		var curpri2 = parseInt($("#priId").val());
		var incpri2 = parseInt(curpri2*1.1);
		var pluspri = parseInt($("#priId2").val());
		var pbuyerId2 = $("#buyerId").val();
		var curbuyerId2 = $("#curIdhidden").val();
		
		//구매자가 현재 상위입찰자인 경우
		if(pbuyerId2 == curbuyerId2){ 
				alert("이미 상회입찰중입니다")
				return false;
			}
		else{
			
			if(incpri2 <= pluspri){
				
				if(confirm(pluspri+"원 가격으로 입찰하시겠습니까?") == true){
					
				   	 alert("입찰했습니다");    
					
				}    
				else{
			        	return false;    
				}
			}//입찰설정가가 현재입찰*10%보다 낮을경우
			else{
				alert("현재입찰가보다 높은 가격으로 설정해주세요.(최소 현재입찰가의 +10%)");
				return false;
			}
		}
		/* if( incpri =< curpri){
			
			alert("입찰완료했습니다.");
		}
		else
			alert("현재입찰가보다 높은 가격을 설정해주세요.(최소 현재입찰가의 +10%)"); */
	
	});
	
	/* $("#newsort").click(function(){
		$("#sortmain").html('최신순');
	
	}); */
	
	/*  $("#nikeView").click(function(event){
		
		event.preventDefault();
		$.ajax({
			url : $("#nikeView").attr("href"),
			type : "GET",
			date : "",
			success : function(data) {				
				$("#productwall").html(data);
			},
			error : function() {
				$("#mbody").text("서버와의 접속 실패입니다.");
				$("#modal").trigger("click");
			}			
		});
	});
	
	$("#adidasView").click(function(event){
		
		event.preventDefault();
		$.ajax({
			url : $("#adidasView").attr("href"),
			type : "GET",
			date : "",
			success : function(data) {				
				$("#productwall").html(data);
			},
			error : function() {
				$("#mbody").text("서버와의 접속 실패입니다.");
				$("#modal").trigger("click");
			}			
		});
	});
	
	$("#newbalView").click(function(event){
		
		event.preventDefault();
		$.ajax({
			url : $("#newbalView").attr("href"),
			type : "GET",
			date : "",
			success : function(data) {				
				$("#productwall").html(data);
				
			},
			error : function() {
				$("#mbody").text("서버와의 접속 실패입니다.");
				$("#modal").trigger("click");
			}			
		});
	});
		
	$("#underarmView").click(function(event){
		
		event.preventDefault();
		$.ajax({
			url : $("#underarmView").attr("href"),
			type : "GET",
			date : "",
			success : function(data) {				
				$("#productwall").html(data);
			},
			error : function() {
				$("#mbody").text("서버와의 접속 실패입니다.");
				$("#modal").trigger("click");
			}			
		});
	});  */
	
	
	
		
	
		
	
});
</script>



</body>
</html>