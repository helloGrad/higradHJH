<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/bootstrap.css">
<link
	href="${pageContext.request.contextPath}/resources/css/higrad-signup.css"
	rel="stylesheet">
<script>
	$(function() {
		$("#tabs").tabs();
	});
</script>
</head>
<body>

	<c:import url="/WEB-INF/views/include/header.jsp" />
	<div class="container">
		<Br>

		<h2>하이그래드넷에 오신 것을 환영합니다!</h2>


		<br>
		<div id="tabs">
			<ul>
				<li><a href="#tabs-1">로그인</a></li>
				<li><a href="#tabs-2">회원가입</a></li>
			</ul>
			<div class="container col-sm-5 signup" style="margin-right: 5em">
				<h3>관리자 페이지에 오신 것을 환영합니다.</h3>

			</div>
			<div id="tabs-1" class="container col-sm-6 signup"
				style="border-left: 1px solid #ccc; padding-left: 10em">
				<h3 >로그인</h3>
				<form class="login-form" id="login-form" name="loginform"
					method="post"
					action="${pageContext.servletContext.contextPath }/user/auth">
					<div class="form-group">
						<label for="email">Email:</label> <input type="email"
							class="form-control" id="email" name="iden"
							placeholder="Enter email">
					</div>
					<div class="form-group">
						<label for="pwd">Password:</label> <input type="password"
							class="form-control" id="pwd" name="pw"
							placeholder="Enter password">
					</div>

					<div class="checkbox">
						<label><input type="checkbox"> remember me </label>
					</div>

					<c:choose>
						<c:when test='${result == "fail" or param.result=="fail"}'>
							<p>로그인에 실패했습니다.</p>
						</c:when>
					</c:choose>

					<button type="submit" class="btn btn-primary btn-lg">로그인</button>
				</form>
			</div>
			<div id="tabs-2" class="container col-sm-6 signup"
				style="border-left: 1px solid #ccc; padding-left: 10em">
				<h3>회원가입</h3>
				<form action="${pageContext.servletContext.contextPath }/user/login"
					method="post" id="join-form">
					<div class="form-group">
						<label for="email">Name:</label> <input type="text"
							class="form-control" id="name" placeholder="Enter name"
							name="mbNm">
					</div>
					<div class="form-group">
						<label for="email">Nickname:</label> <input type="text"
							class="form-control" id="nickname" placeholder="Enter Nickname"
							name="nknm">
						<div id="nickname-check">
							<p></p>
						</div>
					</div>
					<div class="form-group">
						<label>Gender:</label> 
						<br>
						<select id="sex" name="sex">
							<option value="F">Fmale</option>
							<option value="M">Male</option>
						</select>
					</div>
					<div class="form-group">
						<label for="email">Email:</label> <input type="text"
							class="form-control" id="remail" placeholder="Enter email"
							name="iden"><img
							src="${pageContext.request.contextPath}/resources/images/email-check (2).png"
							style="display: none" id="check-image" /> <input type="button"
							id="check-button" value="중복체크" style="display:;">
						<div id="email-check">
							<p></p>
						</div>
					</div>
					<div class="form-group">
						<label for="pwd">Password:</label> <input type="password"
							class="form-control" id="rpwd" placeholder="Enter password"
							name="pw">
						<div id="pwd-check">
							<p></p>
						</div>
					</div>

					<div class="checkbox">
						<label><input type="checkbox" id="agree-prov">
							하이그래드넷 악관에 동의합니다 </label>
						<div id="agree-prov">
							<p></p>
						</div>
					</div>
					<button type="submit" class="btn btn-primary btn-lg">회원가입</button>
				</form>
			</div>
		</div>
	</div>

	<!--//////////////////////// footer ////////////////////////////-->
	<c:import url="/WEB-INF/views/include/footer.jsp" />

	<!--//////////////////////// footer End ////////////////////////////-->

	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/js/bootstrap.js"></script>

	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/js/login.js"></script>

</body>
</html>