<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/list.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/adminform.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript">
	$(
			function() {
				$("#hmnbrdDstnct").val("${vo.hmnbrdDstnct}").attr("selected",
						"selected");
				$("#orgnzDstnct").val("${vo.orgnzDstnct}").attr("selected",
						"selected");

				$("textarea.autosize").on(
						'keydown keyup',
						function() {
							$(this).height(1).height(
									$(this).prop('scrollHeight') + 12);
						});
			})
</script>

<style>
textarea.autosize {
	min-height: 50px;
}
</style>
</head>
<body>

	<c:import url="/WEB-INF/views/include/header.jsp" />

	<div class="container">
		<!-- ///// filter (대분류) //////-->
		<div class="row">
			<a id="gradBtn" class="btn btn-info"
				href="${pageContext.servletContext.contextPath }/organz/list">기관
				목록으로 가기</a>
		</div>
		<div class="row">
			<c:forEach items="${fileList }" var="list" varStatus="status">
				<a id="down"
					href="${pageContext.servletContext.contextPath }/download?no=${list.apndngFileNo}">${list.apndngFileNm }</a>
			</c:forEach>
		</div>

		<hr class="nav-line">

		<div class="row">


			<form class="updateform" id="updateform" name="updateform"
				method="post"
				action="${pageContext.servletContext.contextPath }/organz/update">
				<input type="hidden" id="type" name="type" value="대학원"> 
				<input type="hidden" id="orgnzNo" name="orgnzNo" value="${vo.orgnzNo }">

				<div class="form-group">

					<label>기관구분:</label> <select id="hmnbrdDstnct" name="hmnbrdDstnct">
						<option value="국내">국내</option>
						<option value="국외">국외</option>
					</select> <input type="text" class="form-control" id="orgnzDstnct"
						name="orgnzDstnct" value="${vo.orgnzDstnct }" readonly> <br>
					<br> <label>기관명:</label> <input type="text"
						class="form-control" id="orgnzNm" name="orgnzNm"
						value="${vo.orgnzNm }"> <label>기관영문명:</label> <input
						type="text" class="form-control" id="engOrgnzNm" name="engOrgnzNm"
						value="${vo.engOrgnzNm }"> <label>홈페이지주소:</label> <input
						type="text" class="form-control" id="hmpageUrl" name="hmpageUrl"
						value="${vo.hmpageUrl }"> <label>전화번호:</label> <input
						type="text" class="form-control" id="telNo" name="telNo"
						value="${vo.telNo }"> <label>팩스번호:</label> <input
						type="text" class="form-control" id="faxNo" name="faxNo"
						value="${vo.faxNo }"> <label>주소:</label> <input
						type="text" class="form-control" id="addr" name="addr"
						value="${vo.addr }"> <label>상세주소:</label> <input
						type="text" class="form-control" id="detailAddr" name="detailAddr"
						value="${vo.detailAddr }">

					<div class="form-group">
						<label for="inputlg"> ▣ 부모번호</label> <input
							class="form-control input-lg" id="orgnzNo1" name="prntsOrgnzStr"
							type="text" value="${vo.prntsOrgnzNo }" readonly>
					</div>

					<c:choose>
						<c:when test="${vo.orgnzDstnct=='대학원' }">
							<div class="form-group">
								<label for="inputlg"> ▣ 부모기관명</label> <input
									class="form-control input-lg" id="organzinput" name="orgnzFullNm" type="text"
									value="${vo.orgnzFullNm }" readonly> <input
									type="button" value="기관검색하기" onclick="openOrganzSearch('대학교')">
							</div>
						</c:when>
						<c:when test="${vo.orgnzDstnct=='학과' }">
							<div class="form-group">
								<label for="inputlg"> ▣ 부모기관명</label> <input
									class="form-control input-lg" id="organzinput" name="orgnzFullNm" type="text"
									value="${vo.orgnzFullNm }" readonly> <input
									type="button" value="기관검색하기" onclick="openOrganzSearch('대학원')">
							</div>
						</c:when>
						<c:otherwise></c:otherwise>
					</c:choose>


				</div>

				<button type="submit" class="btn btn-primary btn-lg">수정</button>
			</form>

		</div>

	</div>

	<c:import url="/WEB-INF/views/include/footer.jsp" />
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/js/bootstrap.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/js/search.js"></script>
</body>
</html>