<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/list.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/adminform.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
</head>
<body>

	<c:import url="/WEB-INF/views/include/header.jsp" />

	<div class="container">
		<hr class="nav-line">
		<div class="row">
			<div class="col-md-12">
				<c:if test="${fn:length(resrchAcrsltList) == 0 }">
				연구실적 정보가 없습니다. <br>
					<br>
					<a
						href="${pageContext.servletContext.contextPath }/organz/insertform?type=연구실">연구실적
						입력하러 가기</a>
				</c:if>
				<c:forEach items="${resrchAcrsltList }" var="resrchAcrsltList"
					varStatus="status">

					<a
						href="${pageContext.servletContext.contextPath }/organz/resrchdetail?no=${resrchAcrsltList.resrchAcrsltNo}">${resrchAcrsltList.resrchYycl}/${resrchAcrsltList.acrsltDstnct}</a>
					<br>

				</c:forEach>
			</div>
		</div>
	</div>

	<c:import url="/WEB-INF/views/include/footer.jsp" />
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/js/bootstrap.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/js/organzjs/organzlist.js"></script>


</body>
</html>