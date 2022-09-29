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
/*댓글창*/
#replyContainer {
	background:#E9F2FF;
	border-style:none;
	border-radius:5px;
}
#reply_title {
	padding: 10px 5px;
	font-weight: bold;
	color: #5D5B5A;
}
#reply_list {
	border-top: solid;
	border-color: #B5B2B1;
	border-width: 1px;
}
#reply_profile_img1 {
	width: 70px;
    height: 70px; 
    border-radius: 10%;
    overflow: hidden;
    margin-right:5px;
	float:left;
}
#profile_img1 {
 	width: 100%;
    height: 100%;
    object-fit: cover;
}
span#rDate {
	color:grey;
}
.reply_Delete {
	text-decoration:none;
	text-decoration:underline;
	color:grey;
}
input#uname {
	border-style:none;
}
</style>
</head>
<body>
<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal.username" var="user_id" />		
</sec:authorize>


<c:forEach items="${rrList}" var="rrdto">
	<div class="row py-2 px-0" id="reply_list">
		<div class="col-md-1">
			<div class="col-md-12">									
				<div id="reply_profile_img1"><img src="image/profile.png" alt="프로필사진" id="profile_img1"></div>	<!-- 나중에 프로필사진 연동으로 바꾸기 -->							
			</div>						
		</div>
		<div class="col-md-11">
			<div class="col-md-12 mb-2">
				<span class="spanuser">${rrdto.rUserId}</span> &nbsp;&nbsp;&nbsp;
				<span id="rDate">${rrdto.rDate}</span>&nbsp;&nbsp;&nbsp;
				<span><a id="${rrdto.rUserId}" href="replyDelete?rId=${rrdto.rId}&ruCode=${ruDetails.ruCode}&user_id=${user_id}&rUserId=${rrdto.rUserId}" class="reply_Delete">댓글삭제</a></span>
			</div>					
			<div class="col-md-12 mb-2">						
				${rrdto.rContent}			
			</div>
		</div>	
	</div>
</c:forEach>


<script>
$(function(){
   
   let id = '<c:out value="${user_id}" />';
   
   $(".reply_Delete").click(function(event){
	   event.preventDefault();
	   let qwe = $(event.target);	   
       let x = qwe.attr("id");     
       let url = qwe.attr("href");
       if(x == id){
          $.ajax({
        	  url: url,
        	  type: "get",
        	  data: "",
        	  success: function(data){
        		  alert("댓글이 삭제되었습니다.");
        		  $("#replyRegion").html(data);
        	  },
        	  error: function(){
        		 alert("서버 접속 실패");
        	  }
          });
       }
       else {
          alert("댓글 삭제 권한이 없습니다.");
       };
   });
});
</script>

</body>
</html>