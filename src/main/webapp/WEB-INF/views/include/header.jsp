<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="google-signin-client_id"
	content="31840955156-0oh8u23d3t24v4rguka78knp12vo9jm4.apps.googleusercontent.com">
<script src="https://apis.google.com/js/platform.js" async defer></script>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/modalLogin.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/bootstrap.css">
	<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/bootstrap-social.css">
<link
	href="${pageContext.request.contextPath}/resources/css/higrad-signup.css"
	rel="stylesheet">
<title>하이그래드넷</title>
<script type="text/javascript">
$(function(){
	
	$("#naverLogin2").click(function(){
		console.log("123");
		$("#naverLogin").click();
	})
	
	$("#modalLogin").click(function(){
		console.log("모달");
		$("#myModal").modal();
		
		
	})
	
	$("#naverLogin").hover(function(){
		$("#naverLogo").css("background-image",'url("${pageContext.request.contextPath}/resources/images/logo-hover.png")');
		$("#naverLogo").css("background-size",'cover');
	}, function(){
		$("#naverLogo").css("background-image",'url("${pageContext.request.contextPath}/resources/images/logo.png")');
		$("#naverLogo").css("background-size",'cover');
	})
	
	$('#naverLogin').click(function(){
		console.log("클릭");
		$("#naver_id_login").click();
	})
		
})

</script>
<style type="text/css">
.modal-header{
background-color: #286090;
background-size: cover;
}

#naverLogo{
background-image: url("${pageContext.request.contextPath}/resources/images/logo.png");
background-size: cover;
}
#naverLogin:hover{
background-color:#1BAA25;
}

#naverLogin, #naverLogin2{
background: #1ec800
}

#snsTitle{
text-align: center;
}

 #loginTitle{
text-align: center;
}

.btn{
/*border-radius: 0px; !important;*/
margin-bottom: 10px;
}

.modal-content{
height:580px;
/*border-radius: 0px; !important;*/
background-color: #EFEFEF;
vertical-align: middle;

/*font-family: 'Nanum Barun Gothic', sans-serif;*/
}
.modal-body{
vertical-align: middle;
}
h5.modal-title {
font-weight: bold;
}

hr{
	border-top: 1px solid #111111
}

/*#myModal.modal{
     text-align: center;
}
#myModal.modal::before {
     content: "";	  
     display: inline-block;
     height: 100%;	 
     margin-right: -4px;
     vertical-align: middle;
}
#myModal .modal-dialog {	
     display: inline-block;	
     text-align: left;	
     vertical-align: middle;
}*/

@media screen and (max-width: 1000px) {
      .modal-content {
         width: 100%;
         height: 550px;
         overflow: hidden;
         margin: 0;
         padding: 0;
      }
   }

#test {
 float:left;
}


</style>
</head>
<div id="myModal" class="modal fade" role="dialog">
  <div class="modal-dialog modal-sm">

    <div class="modal-content" style="border: 1px solid #000000">
       <!--<div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" style="color: white">&times;</button>
         <h4 class="modal-title" style="color: white" >로그인</h4>
      </div>-->
      <div class="modal-body">
      <button type="button" class="close" data-dismiss="modal">&times;</button>
      <h5 id="loginTitle" class="modal-title">일반 로그인</h5>
      
      <br>
         <form id="login-form" role="form" method="post"
					action="">
					
            <div class="form-group">
              <!--  <label id='test' for="email">이메일</label> -->
              <input type="text" class="form-control" id="email" name="email" placeholder="이메일 입력">
              <div id='emailMsg' class="text-danger"></div>
            </div>
            <div class="form-group">
              <!--  <label for="pw">비밀번호</label>-->
              <input type="password" class="form-control" id="pwd" name="pwd" placeholder="비밀번호 입력">
              <div id="passwdMsg" class="text-danger"></div>
            </div>
            <div id="loginMsg" class="text-danger"></div>
            <button type="submit" class="btn btn-primary btn-block">로그인</button>
          </form>
          <hr>
          <h5 id="snsTitle" class="modal-title">SNS 로그인</h5>
          <br>
         <button id="facebookLogin" class="btn btn-block btn-social btn-facebook">
    		<span class="fa fa-facebook"></span> Facebook 아이디로 로그인
  		</button>
  		
  		<div id="naver_id_login"></div>
  		
  		
  		<button id="naverLogin2" class="btn btn-block btn-social" style='color:white;'>
    		<span id="naverLogo" class="fa"></span> Naver 아이디로 로그인
  		</button>
      </div>
      <!--  <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>-->
    </div>

  </div>
</div>

<nav class="navbar navbar-default navbar-fixed-top">
	<div class="container">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target="#myNavbar">
				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand"
				href="${pageContext.servletContext.contextPath }/">하이그래드넷</a>
		</div>
		<div class="collapse navbar-collapse" id="myNavbar">
			<ul class="nav navbar-nav navbar-right">
				<c:choose>
					<c:when test = "${empty authUser }">
					</c:when>
					<c:otherwise>
						<li><a>${authUser.nknm }님 반갑습니다</a></li>
					</c:otherwise>
				</c:choose>
				<li><a
					href="${pageContext.servletContext.contextPath }/noti/list">모집공고관리</a></li>
				<li><a
					href="${pageContext.servletContext.contextPath }/organz/list">기관정보관리</a></li>
				<li><a href="conference.html">학회</a></li>
				<li><a href="counseling.html">상담실</a></li>
				<li><a href="community.html">커뮤니티</a></li>
				<c:choose>
					<c:when test="${empty authUser }">
						<!--  <li><a
							href="${pageContext.servletContext.contextPath }/user/login">로그인</a>
						<li>-->
						<li id = "modalLogin">
						<a>로그인</a>
						<li>
					</c:when>
					<c:otherwise>
						<li><a
							href="${pageContext.servletContext.contextPath }/user/logout"
							id="logout">로그아웃</a>
						<li>
						<li><a
							href="${pageContext.servletContext.contextPath }/user/mypage">마이페이지</a>
						<li>
					</c:otherwise>
				</c:choose>

			</ul>
		</div>
	</div>
	
</nav>