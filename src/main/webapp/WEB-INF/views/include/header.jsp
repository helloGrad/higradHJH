<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta name="google-signin-client_id"
	content="31840955156-0oh8u23d3t24v4rguka78knp12vo9jm4.apps.googleusercontent.com">
<script src="https://apis.google.com/js/platform.js" async defer></script>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/bootstrap.css">
<link
	href="${pageContext.request.contextPath}/resources/css/higrad-signup.css"
	rel="stylesheet">

<title>하이그래드넷</title>
</head>

<nav class="navbar navbar-default navbar-fixed-top">
	<div class="container">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target="#myNavbar">
				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="${pageContext.servletContext.contextPath }/">하이그래드넷</a>
		</div>
		<div class="collapse navbar-collapse" id="myNavbar">
			<ul class="nav navbar-nav navbar-right">
				<li><a href="${pageContext.servletContext.contextPath }/noti/list">모집공고관리</a></li>
				<li><a href="${pageContext.servletContext.contextPath }/organz/list">기관정보관리</a></li>
				<li><a href="conference.html">학회</a></li>
				<li><a href="counseling.html">상담실</a></li>
				<li><a href="community.html">커뮤니티</a></li>
				<c:choose>
					<c:when test="${empty authUser }">
						<li><a
							href="${pageContext.servletContext.contextPath }/user/login">로그인</a>
						<li>
					</c:when>
					<c:otherwise>
						<li>${authUser.nknm }님안녕하세요^^;</li>
						<li><a
							href="${pageContext.servletContext.contextPath }/user/logout" id="logout">로그아웃</a>
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


