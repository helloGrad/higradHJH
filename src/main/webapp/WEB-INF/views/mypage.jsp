<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>

	<c:import url="/WEB-INF/views/include/header.jsp" />
		<Br>

		<h2>마이페이지 입니다. </h2>
		<br>	

		
		<a href="${pageContext.servletContext.contextPath }/user/mbinfo">맞춤정보</a>
		<br> <br> <br> 
		<a href="${pageContext.servletContext.contextPath }/admin/list">정보입력</a>
		



</body>
</html>