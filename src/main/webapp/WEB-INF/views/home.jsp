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
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/bootstrap.css">
<link
	href="${pageContext.request.contextPath}/resources/css/higrad-signup.css"
	rel="stylesheet">
</head>
<body>

	<c:import url="/WEB-INF/views/include/header.jsp" />
	<div class="container">
		<Br>

		<h2>하이그래드넷에 오신 것을 환영합니다!!</h2>
		



		<br>

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