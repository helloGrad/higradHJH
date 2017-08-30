<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
	pageContext.setAttribute("space", " ");
%>
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

<style>
textarea {
	width: 300px;
	overflow: visible
}
</style>


<script>
	function resize(obj) {
		obj.style.height = "1px";
		obj.style.height = (20 + obj.scrollHeight) + "px";
	}
</script>




</head>
<body>

	<c:import url="/WEB-INF/views/include/header.jsp" />

	<div class="container">
		<div class="row">
			<a id="gradBtn" class="btn btn-info"
				href="${pageContext.servletContext.contextPath }/organz/list">기관
				목록으로 가기</a>
		</div>
		<hr class="nav-line">

		<div class="row">
			<div id="lab" class="col-lg-12">
				<h2>연구실 - 연구실이름/연구내용으로 구분</h2>
				<form class="login-form" id="login-form" name="loginform"
					method="post"
					action="${pageContext.servletContext.contextPath }/organz/update?type=연구실">
					<div class="form-group">

						<input type="hidden" id="orgnzNo" name="orgnzNo"
							value="${organzLabList.orgnzNo }"> 연구실 이름: <input
							type="text" class="form-control" id="orgnzNm" name="orgnzNm"
							value="${organzLabList.orgnzNm }"><br> 연구실 영문명 이름 :
						<input type="text" class="form-control" id="engOrgnzNm"
							name="engOrgnzNm" value="${organzLabList.engOrgnzNm }"> <br>
						기관구분 : <input type="text" class="form-control" id="orgnzDstnct"
							name="orgnzDstnct" value="${organzLabList.orgnzDstnct }" readonly>
						<br> 연구실 url 주소 : <input type="text" class="form-control"
							id="hmpageUrl" name="hmpageUrl"
							value="${organzLabList.hmpageUrl }"> <br> 연구실 전화번호 :
						<input type="text" class="form-control" id="telNo" name="telNo"
							value="${organzLabList.telNo }"> <br> 연구실 팩스번호 : <input
							type="text" class="form-control" id="faxNo" name="faxNo"
							value="${organzLabList.faxNo }"> <br> 주소 : <input
							type="text" class="form-control" id="addr" name="addr"
							value="${organzLabList.addr }"> <br> 세부주소 : <input
							type="text" class="form-control" id="detailAddr"
							name="detailAddr" value="${organzLabList.detailAddr }"> <br>
						<div class="form-group">
							<label for="inputlg"> ▣ 부모기관번호</label> <input
								class="form-control input-lg" id="orgnzNo1"
								name="prntsOrgnzNo" type="text" value="${organzLabList.prntsOrgnzNo }"
								readonly>
						</div>
						<div class="form-group">
							<label for="inputlg"> ▣ 부모기관명</label> <input
								class="form-control input-lg" id="organzinput" type="text" name="orgnzFullNm"
								value="${organzLabList.orgnzFullNm }" readonly> <input
								type="button" value="기관검색하기" onclick="openOrganzSearch('연구실업데이트')">
						</div>
						<br> 교수님 성명: <input type="text" class="form-control"
							id="mapProfNm" name="mapProfNm"
							value="${organzLabList.mapProfNm}"> <br> 연구실 소개:
						<textarea class="form-control" onkeydown="resize(this)"
							onkeyup="resize(this)" id="labIntro" name="labIntro">${organzLabList.labIntro}</textarea>
						<br> 연구원 수(박사/석박사/석사): <input type="text"
							class="form-control" id="rsrchrInfoText" name="rsrchrInfoText"
							value="${organzLabList.rsrchrInfoText}"><br>



						<c:if test="${organzLabList.hmnbrdDstnct == '국내' }">
							국내외 구분: <select name="hmnbrdDstnct">
								<option value=""> 국내외구분</option>
								<option value="국내" selected="selected">국내</option>
								<option value="국외">국외</option>
							</select>
						</c:if>
						<c:if test="${organzLabList.hmnbrdDstnct == '국외' }">
							국내외 구분: <select name="hmnbrdDstnct">
								<option value=""> 국내외구분</option>
								<option value="국내">국내</option>
								<option value="국외" selected="selected">국외</option>
							</select>
						</c:if>


						<br> <br>
					</div>
					<hr>
					<button type="submit" class="form-control">수정</button>
				</form>
				<hr>
			</div>
		</div>


	</div>

	<c:import url="/WEB-INF/views/include/footer.jsp" />
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/js/bootstrap.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/js/search.js"></script>


</body>
</html>