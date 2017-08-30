<!-- 허규준 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/list.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>


</head>
<body>

	<c:import url="/WEB-INF/views/include/header.jsp" />

	<div class="container">
		<div class="row">

			<div class="col-lg-4 centering">
				<h3>대학원 공고 페이지</h3>
				<c:import url="/WEB-INF/views/noti/include/menu.jsp" />
			</div>
		</div>

		<hr class="nav-line">

		<!-- ////// filter ///////-->
		<div class="row">

			<div id="gradList" class="col-lg-12">
				<c:forEach items="${notiList }" var="list" varStatus="status">
					<div class="col-md-12">
						<h3>
							<a
								href="${pageContext.servletContext.contextPath }/noti/update?no=${list.slctnNotiNo}&tabnm=${list.slctnNotiDstnct}">${list.slctnTitle }</a>
						</h3>
						<hr>
					</div>
				</c:forEach>

			</div>


		</div>
	</div>

	<!--footer-->
	<c:import url="/WEB-INF/views/include/footer.jsp" />
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/js/bootstrap.js"></script>

</body>
</html>